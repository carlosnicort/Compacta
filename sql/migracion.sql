-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2025 a las 04:05:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u530590124_compacta_educa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `replicatt_mat_opt`
--

CREATE TABLE `replicatt_mat_opt` (
  `cod_opt` varchar(4) DEFAULT NULL,
  `Atributo` varchar(9) DEFAULT NULL,
  `Valor` varchar(88) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `replicatt_mat_opt`
--

INSERT INTO `replicatt_mat_opt` (`cod_opt`, `Atributo`, `Valor`) VALUES
('opt1', 'Materia1', 'Religión'),
('opt1', 'Materia2', 'Atención Educativa'),
('opt2', 'Materia1', 'Segunda Lengua Extranjera'),
('opt2', 'Materia2', 'Refuerzo de la Competencia en Comunicación Lingüística'),
('opt3', 'Materia1', 'Artes Escénicas y Danza.'),
('opt3', 'Materia2', 'Comunicación Audiovisual.'),
('opt3', 'Materia3', 'Cultura Clásica.'),
('opt3', 'Materia4', 'Digitalización Creativa.'),
('opt3', 'Materia5', 'Emprendimiento Personal y Social.'),
('opt3', 'Materia6', 'Segunda Lengua Extranjera'),
('opt4', 'Materia1', 'Matemáticas A'),
('opt4', 'Materia2', 'Matemáticas B'),
('opt5', 'Materia1', 'Biología y Geología'),
('opt5', 'Materia2', 'Digitalización'),
('opt5', 'Materia3', 'Economía y Emprendimiento'),
('opt5', 'Materia4', 'Expresión Artística'),
('opt5', 'Materia5', 'Física y Química'),
('opt5', 'Materia6', 'Formación y Orientación Personal y Profesional.'),
('opt5', 'Materia7', 'Latín'),
('opt5', 'Materia8', 'Música'),
('opt5', 'Materia9', 'Segunda Lengua Extranjera'),
('opt5', 'Materia10', 'Tecnología.'),
('opt6', 'Materia1', 'Proyecto de Investigación referido a Creaciones Audiovisuales y Plásticas.'),
('opt6', 'Materia2', 'Proyecto de Investigación referido a Creaciones Escénico-Musicales'),
('opt6', 'Materia3', 'Proyecto de Investigación referido a Educación Financiera y Consumo Responsable'),
('opt6', 'Materia4', 'Proyecto de Investigación referido a El Mundo Clásico: Lenguaje, Historia y Patrimonioa.'),
('opt6', 'Materia5', 'Proyecto de Investigación referido a Filosofía. Retórica y Argumentación'),
('opt6', 'Materia6', 'Proyecto de Investigación referido a Investigación Científica e Innovación Tecnológica.'),
('opt6', 'Materia7', 'Proyecto de Investigación referido a Investigación Científica e Innovación Tecnológica.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `replica_tt2matopt`
--

CREATE TABLE `replica_tt2matopt` (
  `cod_nivel` varchar(4) DEFAULT NULL,
  `Atributo` varchar(4) DEFAULT NULL,
  `Valor` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `replica_tt2matopt`
--

INSERT INTO `replica_tt2matopt` (`cod_nivel`, `Atributo`, `Valor`) VALUES
('INF1', 'Mat1', 'opt1'),
('INF2', 'Mat1', 'opt1'),
('INF3', 'Mat1', 'opt1'),
('PRI1', 'Mat1', 'opt1'),
('PRI2', 'Mat1', 'opt1'),
('PRI3', 'Mat1', 'opt1'),
('PRI4', 'Mat1', 'opt1'),
('PRI5', 'Mat1', 'opt1'),
('PRI5', 'Mat2', 'opt2'),
('PRI6', 'Mat1', 'opt1'),
('PRI6', 'Mat2', 'opt2'),
('ESO1', 'Mat1', 'opt1'),
('ESO1', 'Mat2', 'opt2'),
('ESO2', 'Mat1', 'opt1'),
('ESO2', 'Mat2', 'opt2'),
('ESO3', 'Mat1', 'opt1'),
('ESO3', 'Mat2', 'opt2'),
('ESO3', 'Mat3', 'opt3'),
('ESO4', 'Mat1', 'opt1'),
('ESO4', 'Mat2', 'opt4'),
('ESO4', 'Mat3', 'opt5'),
('ESO4', 'Mat4', 'opt5'),
('ESO4', 'Mat5', 'opt5'),
('ESO4', 'Mat6', 'opt6'),
('DIV1', 'Mat1', 'opt1'),
('DIV1', 'Mat2', 'opt3'),
('DIV2', 'Mat1', 'opt1'),
('DIV2', 'Mat2', 'opt6'),
('FPB1', 'Mat1', 'opt1'),
('FPB2', 'Mat1', 'opt1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua1_1`
--

CREATE TABLE `tidua1_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL,
  `T5` varchar(20) DEFAULT NULL,
  `T6` varchar(20) DEFAULT NULL,
  `T7` varchar(20) DEFAULT NULL,
  `T8` varchar(20) DEFAULT NULL,
  `T9` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua2_1`
--

CREATE TABLE `tidua2_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL,
  `T5` varchar(20) DEFAULT NULL,
  `T6` varchar(20) DEFAULT NULL,
  `T7` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua3_1`
--

CREATE TABLE `tidua3_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua4_1`
--

CREATE TABLE `tidua4_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL,
  `T5` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua5_1`
--

CREATE TABLE `tidua5_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua6_1`
--

CREATE TABLE `tidua6_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua7_1`
--

CREATE TABLE `tidua7_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(20) DEFAULT NULL,
  `T3` varchar(20) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL,
  `T5` varchar(20) DEFAULT NULL,
  `T6` varchar(20) DEFAULT NULL,
  `T7` varchar(20) DEFAULT NULL,
  `T8` varchar(20) DEFAULT NULL,
  `T9` varchar(20) DEFAULT NULL,
  `T10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua8_1`
--

CREATE TABLE `tidua8_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(50) DEFAULT NULL,
  `T3` varchar(50) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL,
  `T5` varchar(20) DEFAULT NULL,
  `T6` varchar(20) DEFAULT NULL,
  `T7` varchar(20) DEFAULT NULL,
  `T8` varchar(50) DEFAULT NULL,
  `T9` varchar(20) DEFAULT NULL,
  `T10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tidua9_1`
--

CREATE TABLE `tidua9_1` (
  `id_alum` int(11) NOT NULL,
  `T1` varchar(20) DEFAULT NULL,
  `T2` varchar(50) DEFAULT NULL,
  `T3` varchar(50) DEFAULT NULL,
  `T4` varchar(20) DEFAULT NULL,
  `T5` varchar(20) DEFAULT NULL,
  `T6` varchar(20) DEFAULT NULL,
  `T7` varchar(20) DEFAULT NULL,
  `T8` varchar(50) DEFAULT NULL,
  `T9` varchar(20) DEFAULT NULL,
  `T10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_alu1`
--

CREATE TABLE `ti_alu1` (
  `id` int(11) NOT NULL,
  `id_alu` varchar(50) NOT NULL,
  `cod_grupo` varchar(50) NOT NULL,
  `cod_Acneae` varchar(150) NOT NULL,
  `Tipo_Acneae` varchar(150) NOT NULL,
  `Antiguedad` int(2) NOT NULL,
  `cod_centro` varchar(20) NOT NULL,
  `Tipo1` tinyint(1) DEFAULT 0,
  `Informe` tinyint(1) DEFAULT 0,
  `Perfil1` varchar(50) DEFAULT NULL,
  `ExtraPerfil1` varchar(50) DEFAULT NULL,
  `Perfil2` varchar(50) DEFAULT NULL,
  `ExtraPerfil2` varchar(50) DEFAULT NULL,
  `OtrasObservaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ti_alu1`
--

INSERT INTO `ti_alu1` (`id`, `id_alu`, `cod_grupo`, `cod_Acneae`, `Tipo_Acneae`, `Antiguedad`, `cod_centro`, `Tipo1`, `Informe`, `Perfil1`, `ExtraPerfil1`, `Perfil2`, `ExtraPerfil2`, `OtrasObservaciones`) VALUES
(0, '300003772A1', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A2', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A3', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A4', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A5', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A6', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A7', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A8', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A9', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A10', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A11', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A12', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A1', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A2', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A3', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A4', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A5', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A6', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A7', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A8', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A9', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A10', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A11', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A12', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'Dislexia', 'Lectora', ''),
(0, '300003772A1', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Leve', 'TDAH', 'Leve', ''),
(0, '300003772A1', 'DIV2A', '', '', 0, '30000377', 1, 0, 'TDAH', 'Moderado', 'TDAH', 'Leve', ''),
(0, '300003772A2', 'DIV2A', '', '', 0, '30000377', 1, 0, 'Dislexia', 'Lectora', 'Autismo', 'Nivel 1', ''),
(0, '300003772A3', 'DIV2A', '', '', 0, '30000377', 0, 0, '', '', '', '', ''),
(0, '300003772A4', 'DIV2A', '', '', 0, '30000377', 0, 0, '', '', '', '', ''),
(0, '300003772A5', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A6', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A7', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A8', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A9', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A10', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A11', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', ''),
(0, '300003772A12', 'DIV2A', '', '', 0, '30000377', 0, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_gr1`
--

CREATE TABLE `ti_gr1` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `cod_centro` varchar(50) NOT NULL,
  `Etapa` varchar(15) NOT NULL,
  `Modalidad` varchar(20) NOT NULL,
  `Curso` int(1) NOT NULL,
  `Grupo` varchar(1) NOT NULL,
  `cod_grupo` varchar(50) NOT NULL,
  `listado` int(11) NOT NULL,
  `tipo_completado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ti_gr1`
--

INSERT INTO `ti_gr1` (`id`, `id_user`, `cod_centro`, `Etapa`, `Modalidad`, `Curso`, `Grupo`, `cod_grupo`, `listado`, `tipo_completado`) VALUES
(27, 7, '30000377', 'ESO', 'DIV', 2, 'A', 'DIV2A', 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_tipologia`
--

CREATE TABLE `ti_tipologia` (
  `id_alu` int(11) NOT NULL,
  `cod_grupo` varchar(20) NOT NULL,
  `Tipo1` tinyint(1) NOT NULL DEFAULT 0,
  `Informe` tinyint(1) NOT NULL DEFAULT 0,
  `Perfil1` varchar(100) DEFAULT NULL,
  `ExtraPerfil1` varchar(100) DEFAULT NULL,
  `Perfil2` varchar(100) DEFAULT NULL,
  `ExtraPerfil2` varchar(100) DEFAULT NULL,
  `Otro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ti_tipologia`
--

INSERT INTO `ti_tipologia` (`id_alu`, `cod_grupo`, `Tipo1`, `Informe`, `Perfil1`, `ExtraPerfil1`, `Perfil2`, `ExtraPerfil2`, `Otro`) VALUES
(5, '', 1, 0, 'Autismo', 'Nivel 2', '', '', ''),
(6, '', 0, 0, NULL, '', NULL, '', ''),
(7, '', 0, 0, NULL, '', NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttalu1`
--

CREATE TABLE `ttalu1` (
  `cod_acneae` varchar(50) NOT NULL,
  `Acneae` varchar(255) DEFAULT NULL,
  `Texto1` varchar(250) DEFAULT NULL,
  `Texto2` varchar(250) DEFAULT NULL,
  `id_plumier` varchar(50) DEFAULT NULL,
  `cat_plumier` varchar(100) DEFAULT NULL,
  `sn_nee` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttalu1`
--

INSERT INTO `ttalu1` (`cod_acneae`, `Acneae`, `Texto1`, `Texto2`, `id_plumier`, `cat_plumier`, `sn_nee`) VALUES
('Con vuln / cultural', 'Vulnerable por razones culturales.', 'Alumno/a con desfase por razones culturales.', 'Además tiene desfase curricular por violencia de género.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('Con vuln / económica', 'Vulnerable por factores económicos.', 'Alumno/a con desfase por factores económicos.', 'Además tiene desfase curricular por factores socioec-culturales.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('Con vuln / experiencias previas', 'desfase por experiencias adversas en el infancia (EAI).', 'Alumno/a con desfase por experiencias adversas en el infancia (EAI).', 'Además tiene desfase por experiencias adversas en el infancia (EAI).', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('Con vuln / mot étn', 'desfase por situación étnica.', 'Alumno/a con desfase por situación étnica.', 'Además tiene desfase por situación étnica.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('Con vuln / social', 'Vulnerable por razones sociales.', 'Alumno/a con desfase por razones sociales.', 'Además tiene desfase desfase por geográficos.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('Con vuln / violencia gen', 'desfase por factores étnicos.', 'Alumno/a con desfase por factores étnicos.', 'Además tiene desfase curricular de al menos un curso determinado por por factores étnicos.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('Con vulnerab.', 'Vulnerable por violencia de género, factores geogrÁficos, étnicos o por experiencias adversas', 'Alumno/a en la educación básica, con desfase curricular de al menos un curso determinado por factores económicos, culturales, sociales, familias derivadas de violencia de género, geográficos, étnicos o de otra índole; así como los derivados de experi', 'Además tiene desfase curricular de al menos un curso determinado por factores económicos, culturales, sociales, familias derivadas de violencia de género, geográficos, étnicos o de otra índole; así como los derivados de experiencias adversas en el in', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('CPHE /', 'Condiciones personales', 'Alumnado que presenta necesidades específicas de apoyo educativo por condiciones personales o historia escolar.', 'Además tiene dificultades condiciones personales y/o historia escolar.', 'ITSE', 'Incorporación Tardía al Sistema Educativo', 'No NEE'),
('CPHE / convalecencia', 'Larga convalecencia', 'Alumnado que presenta necesidades específicas de apoyo educativo por condiciones personales o historia escolar derivadas de larga convalecencia en domicilio.', 'Además tiene dificultades por larga convalecencia en domicilio.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('CPHE / hospitalización', 'Hospitalización', 'Alumnado que presenta necesidades específicas de apoyo educativo por condiciones personales o historia escolar derivadas de hospitalización.', 'Además tiene dificultades por hospitalización.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('CPHE / ideas autolesivas', 'Ideas autoesivas.', 'Alumnado que presenta necesidades específicas de apoyo educativo por condiciones personales o historia escolar derivadas de ideas autoesivas.', 'Además tiene ideas autolesivas.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('CPHE / riesgo abandono', 'Riesgo de abandono escolar.', 'Alumnado que presenta necesidades específicas de apoyo educativo por condiciones personales o historia escolar derivadas de riesgo de abandono escolar.', 'Además tiene riesgo de abandono escolar.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('CPHE / sms', 'Situación medica señalada por SMS.', 'Alumnado que presenta necesidades específicas de apoyo educativo por condiciones personales o historia escolar derivadas de situación medica señalada por SMS.', 'Además tiene situación médica señalada por SMS.', 'CPHE', 'Condiciones Personales o de Historia Escolar', 'No NEE'),
('IT', 'Incorporación tardía', 'Alumnado que presenta necesidades específicas de apoyo educativo, procedente de otros países y que en este curso se ha incorporado en el sistema educativo.', 'Además, procede de otros países y que en este curso se ha incorporado en el sistema educativo.', 'ITSE', 'Incorporación Tardía al Sistema Educativo', 'No NEE'),
('IT /en apoyo.', 'Incorporación tardía y en apoyo.', 'Alumnado que presenta necesidades específicas de apoyo educativo, por tener desfase curricular, provenir de otros países y estar recibiendo atención educativa específica simultánea.', 'Además es de incorporación tardía, en grupo de apoyo.', 'ITSE', 'Incorporación Tardía al Sistema Educativo', 'No NEE'),
('IT /grupo inferior.', 'Incorporación tardía en grupo inferior.', 'Alumnado que presenta necesidades específicas de apoyo educativo, incorporado este curso, con desfase escolarizado en un nivel inferior.', 'Además es de incorporación tardía, y está en curso inferior a su edad.', 'ITSE', 'Incorporación Tardía al Sistema Educativo', 'No NEE'),
('NEE', 'Necesidades  educativas  especiales.', 'Alumno/a  que  presenta  necesidades  educativas  especiales.', 'Además tiene necesidades educativas especiales.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Aud', 'Discapacidad auditiva.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, derivadas de discapacidad auditiva.', 'Además tiene discapacidad auditiva que requiere apoyos especializados.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Int', 'Intelectual', 'Alumno/a  que  presenta limitaciones significativas del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'Además presenta limitaciones significativas del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Int-Grave', 'Intelectual grave', 'Alumno/a  que  presenta limitaciones significativas graves del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'Además presenta limitaciones significativas graves del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Int-Leve', 'Intelectual leve', 'Alumno/a  que  presenta limitaciones significativas leves del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'Además tiene limitaciones significativas leves del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Int-Moderado', 'Intelectual moderado', 'Alumno/a  que  presenta limitaciones significativas moderadas del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'Además presenta limitaciones significativas moderadas del funcionamiento intelectual y de la conducta adaptativa (en los dominios conceptual, social y práctico).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Mot', 'Discapacidad motora.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, derivadas de discapacidad motora.', 'Además tiene discapacidad motora que requiere apoyos especializados.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Plu', 'Pluridiscapacidad.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, derivadas de pluridiscapacidad.', 'Además presenta necesidades educativas especiales, derivadas de pluridiscapacidad.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Disc / Vis', 'Discapacidad visual.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, derivadas de discapacidad visual.', 'Además presenta necesidades educativas especiales, derivadas de discapacidad visual.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / TEA', 'TEA', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, derivados de trastorno del espectro autista.', 'Además tiene rasgos del espectro autista.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / TEA Ásperger', 'TEA - ASPERGER.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, TEA - ÁSPERGER.', 'Además tiene rasgos de ásperger.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / TEA Autismo', 'TEA - AUTISMO.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, derivados de trastorno del espectro autista - AUTISMO.', 'Además tiene rasgos de autismo.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / TEA TGD', 'TEA - TGD.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, TEA - TGD.', 'Además tiene rasgos de TGD.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Tgrave / Conducta/Pers.', 'Salud mental.', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, derivados de trastorno grave de conducta/personalidad derivado de problemas de salud mental.', 'Además tiene trastorno grave de conducta/personalidad derivado de problemas de salud mental.', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Tgrave LyC / comprensión o expresión', 'Trastornos graves de Comunicación y Lenguaje', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, que presenta,  dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la prod', 'Además presenta dificultades dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Tgrave LyC / Disfasia', 'Trastornos graves de Comunicación y Lenguaje (disfasia)', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, que presenta,  dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la prod', 'Además presenta dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión). (Disfasia).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Tgrave LyC / Ret.Sev.Len..', 'Trastornos graves de Comunicación y Lenguaje (Ret.Sev.Len).', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, que presenta,  dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la prod', 'Además presenta dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión), (retrasos severos del lenguaje).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('NEE / Tgrave LyC / TEL grave', 'Trastornos graves de Comunicación y Lenguaje (TEL-grave)', 'Alumno/a  que  presenta  necesidades  educativas  especiales, no asociadas a discapacidad, que presenta,  dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la prod', 'Además presenta dificultades graves persistentes en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión), (TEL graves).', 'NEE', 'Necesidades Educativas Especiales', 'NEE'),
('Por ACI', 'altas capacidades intelectuales.', 'Alumnado con altas capacidades intelectuales.', 'Además es un alumnado con altas capacidades intelectuales.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / 2 ó + Talentos simples', 'altas capacidades intelectuales con mÁs de un talento simple.', 'Alumnado con altas capacidades intelectuales con más de un talento simple.', 'Además, es Talento Compuesto.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Precoz', 'altas capacidades intelectuales (precoz).', 'Alumnado con altas capacidades intelectuales (precoz).', 'Además, es precoz.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Sobredotado', 'altas capacidades intelectuales (sobredotado).', 'Alumnado con altas capacidades intelectuales (sobredotado).', 'Además, es sobredotado.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Tal. Simple', 'con altas capacidades intelectuales con un talento simple.', 'Alumnado con altas capacidades intelectuales con un talento simple.', 'Además, es Talento Simple.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Tcomp Acad.', 'altas capacidades intelectuales (complejo académico).', 'Alumnado con altas capacidades intelectuales (complejo académico).', 'Además, es talento complejo académico.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Tcomp Acad. Creat <50', 'altas capacidades intelectuales (complejo académico con creatividad < 50).', 'Alumnado con altas capacidades intelectuales (complejo académico con creatividad < 50).', 'Además, es talento complejo académico con creatividad <50.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Tcomp Acad. Creat >50', 'altas capacidades intelectuales (complejo académico con creatividad > 50).', 'Alumnado con altas capacidades intelectuales (complejo académico con creatividad > 50).', 'Además, es talento complejo académico con creatividad >50.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por ACI / Tcomp Fig-Creat', 'altas capacidades intelectuales (complejo figurativo-creativo).', 'Alumnado con altas capacidades intelectuales (complejo figurativo-creativo).', 'Además, es talento complejo figurativo-creativo.', 'ACI', 'Altas Capacidades', 'No NEE'),
('Por desc. leng.', 'Desconocimiento grave de la lengua de aprendizaje sin ser de incorporación tardía.', 'Alumno/a con necesidad específica de apoyo educativo, por presentar un desconocimiento grave de la lengua de aprendizaje sin ser de incorporación tardía.', 'Además desconoce le lengua de aprendizaje.', 'DGLA', 'Desconocimiento Grave de la Lengua de Aprendizaje', 'No NEE'),
('Ret-mad', 'Retraso madurativo', 'Alumno/a  con necesidad específica de apoyo educativo, menor de 5 años con el que no se puede llevar a cabo una valoración sistemática del funcionamiento intelectual, y no cumple con los hitos de desarrollo esperados en varios campos del funcionamien', 'Además, siendo menor de 5 años no se puede llevar a cabo una valoración sistemática del funcionamiento intelectual, y no cumple con los hitos de desarrollo esperados en varios campos del funcionamiento intelectual (habilidades cognitivas, lingüística', 'RET', 'Retraso Madurativo', 'No NEE'),
('Tr Apr / por dispraxia', 'Trastornos por dispraxia', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dispraxia.', 'Además tiene dificultades por presentar dispraxia.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr Apr / por Int. Límite.', 'Trastorno por inteligencia', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar inteligencia límite.', 'Además presenta inteligencia límite.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr Apr / por tr. Coord. Motriz', 'Trastorno de coordinación motriz', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar trastorno de la coordinación motriz.', 'Además tiene dificultades de la coordinación motriz.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr', 'Trastornos del aprendizaje', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje.', 'Además presenta trastorno del aprendizaje.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif en Ámbitos matemÁticos', 'Trastornos por dificultades en Ámbitos de matemÁticas', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades en ámbitos de las matemáticas.', 'Además tiene dificultades en el ámbito matemático.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif en matemÁticas', 'Trastornos en Ámbitos de las matemÁticas', 'Alumno/a  con necesidad específica de apoyo educativo, por dificultades en las matemáticas.', 'Además tiene dificultades en las matemáticas.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif escritura', 'Trast. en la escritura', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por sus dificultades en la escritura.', 'Además tiene dificultades en la escritura.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif expresión', 'Trastornos del aprendizaje (expresivo)', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del lenguaje de índole expresivo', 'Además presenta trastorno del lenguaje de índole expresiva.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif expresión escrita', 'Trastornos en la expresión escrita', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por presentar dificultades en la expresión escrita.', 'Además tiene dificultades en su expresón escrita.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif lectura', 'Trastornos del aprendizaje (lectura)', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por sus dificultades en la lectura.', 'Además presenta dificultades en la lectura.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif por discalculia', 'Trastornos por discalculia', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar discalculia.', 'Además tiene discalculia.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif por disgr/disort', 'Trastorno por disgrafía y disortografía', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por presentar dificultades en la expresón escrita (disgrafía/disortografía).', 'Además presenta disgrafía y disortografía.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif por disgrafía', 'Trastornos por disgrafía', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por presentar disgrafía.', 'Además tiene disgrafía.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif por disortografía', 'Trastorno por disortografía', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por presentar disortografía.', 'Además tiene disortografía.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / dif por lectoescritura', 'Trastorno por dificultades en la lectura y escritura', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por presentar dificultades en la lectura y escritura.', 'Además, tiene dificultades en la lectura y escritura.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / por dislexia', 'Trastornos del aprendizaje (dislexia)', 'Alumno/a  con necesidad específica de apoyo educativo, con trastorno del aprendizaje por presentar dislexia.', 'Además presenta dislexia.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / por rutinas y pr No Verbal', 'Trastorno por dificultades en la adquisición y uso de rutinas y habilidades procedimentales-no verbales.', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades en la adquisición y uso de rutinas y habilidades procedimentales-no verbales.', 'Además tiene dificultades en la adquisición y uso de rutinas y habilidades procedimentales-no verbales.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Apr / por TANV', 'Trastorno del aprendizaje no verbal (TANV).', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades en la adquisición y uso de rutinas y habilidades procedimentales-no verbales derivadas de trastorno del aprendizaje no verbal (TANV).', 'Además tiene dificultades en la adquisición y uso de rutinas y habilidades procedimentales-no verbales derivadas de trastorno del aprendizaje no verbal (TANV).', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten /', 'Trastornos de atención', 'Alumno/a  con necesidad específica de apoyo educativo, por trastorno de atención.', 'Además presenta trastorno de atención.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / (func-ej hiper+impul)', 'Trastornos de atención (func-ej+hiper+impul)', 'Alumno/a  con necesidad específica de apoyo educativo, por trastorno de atención asociado al funcionamiento ejecutivo, hiperactividad y/o impulsividad.', 'Además presenta trastorno de atención asociado al funcionamiento ejecutivo, hiperactividad y/o impulsividad.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / (hiper+impul)', 'Trastornos de atención (hiper+impul)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar trastorno de atención asociado a hiperactividad e impulsividad.', 'Además presenta trastorno de atención asociado a hiperactividad e impulsividad.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / combinado', 'Trastornos de atención', 'Alumno/a  con necesidad específica de apoyo educativo, por trastorno de atención e hiperactividad.', 'Además presenta trastorno de atención.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / func-ej', 'Trastornos de atención (func-ej)', 'Alumno/a  con necesidad específica de apoyo educativo, por trastorno de atención asociado a dificultades en el funcionamiento ejecutivo (atención, inhibición de conducta, memoria de trabajo, flexibilidad cognitiva, fluidez verbal, planificación y org', 'Además presenta trastorno de atención asociado a dificultades en el funcionamiento ejecutivo (atención, inhibición de conducta, memoria de trabajo, flexibilidad cognitiva, fluidez verbal, planificación y organización).', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / hiper', 'Trastornos de atención (hiper)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar trastorno de atención asociado a hiperactividad.', 'Además presenta trastorno de atención asociado a hiperactividad.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / impuls', 'Trastornos de atención (impul)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar trastorno de atención asociado a impulsividad.', 'Además presenta trastorno de atención asociado a impulsividad.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.Aten / TDAH', 'Trastornos de atención', 'Alumno/a  con necesidad específica de apoyo educativo, por trastorno de atención e hiperactividad.', 'Además presenta trastorno de atención e hiperactividad.', 'TAA', 'Trastorno de Atención y/o Aprendizaje', 'No NEE'),
('Tr.des.LyC / com-soc', 'Trastornos del desarrollo del lenguaje y la comunicación (com-soc)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades por trastorno de la comunicación social (pragmático).', 'Además presenta dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades por trastorno de la comunicación social (pragmático).', 'TLC', 'Trastorno del Lenguaje y Comunicación', 'No NEE'),
('Tr.des.LyC / compr-expr', 'Trastornos del desarrollo del lenguaje y la comunicación (compr/expr)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión).', 'Además presenta dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión).', 'TLC', 'Trastorno del Lenguaje y Comunicación', 'No NEE'),
('Tr.des.LyC / fluidez', 'Trastornos del desarrollo del lenguaje y la comunicación (fluidez)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades debido a trastornos de la fluidez.', 'Además presenta dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades debido a trastornos de la fluidez.', 'TLC', 'Trastorno del Lenguaje y Comunicación', 'No NEE'),
('Tr.des.LyC / fonol.', 'Trastornos del desarrollo del lenguaje y la comunicación (tr-fon)', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades por trastorno fonológico.', 'Además presenta dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades por trastorno fonológico.', 'TLC', 'Trastorno del Lenguaje y Comunicación', 'No NEE'),
('Tr.des.LyC/', 'Trastorno del desarrollo del lenguaje y la comunicación', 'Alumno/a  con necesidad específica de apoyo educativo, por presentar dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión); trasto', 'Además presenta dificultades persistentes, leve o moderada, en la adquisición y uso del lenguaje en todas sus modalidades debido a deficiencias de la comprensión o la producción (expresión); trastorno fonológico; trastorno de la fluidez; o trastorno ', 'TLC', 'Trastorno del Lenguaje y Comunicación', 'No NEE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttap1`
--

CREATE TABLE `ttap1` (
  `Texto1` int(11) NOT NULL,
  `Texto2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttap1`
--

INSERT INTO `ttap1` (`Texto1`, `Texto2`) VALUES
(1, 'se atenderán aspectos relacionados con habilidades lecto-escritoras'),
(2, 'se promoverá el desarrollo de funciones ejecutivas'),
(3, 'se trabajarán aspectos a mejorar de su competencia matemática'),
(4, 'se dedicará tiempo para mejorar su conducta'),
(5, 'se harán ejercicios de fortalecimiento emocional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttcentros`
--

CREATE TABLE `ttcentros` (
  `cod_centro` varchar(20) NOT NULL,
  `com_aut` varchar(50) DEFAULT NULL,
  `prov` varchar(50) DEFAULT NULL,
  `mun` varchar(50) DEFAULT NULL,
  `loc` varchar(100) DEFAULT NULL,
  `cod_tipo_centro` varchar(10) DEFAULT NULL,
  `tipo_centro` varchar(100) DEFAULT NULL,
  `nombre_centro` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttcentros`
--

INSERT INTO `ttcentros` (`cod_centro`, `com_aut`, `prov`, `mun`, `loc`, `cod_tipo_centro`, `tipo_centro`, `nombre_centro`) VALUES
('30000018', 'REGIÓN DE MURCIA', 'Murcia', 'Abanilla', 'Abanilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SANTÍSIMA CRUZ'),
('30000146', 'REGIÓN DE MURCIA', 'Murcia', 'Abarán', 'Abarán', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN PABLO'),
('30000161', 'REGIÓN DE MURCIA', 'Murcia', 'Abarán', 'Abarán', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JUAN XXIII'),
('30000213', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'RAMÓN Y CAJAL'),
('30000225', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LOS DOLORES'),
('30000365', 'REGIÓN DE MURCIA', 'Murcia', 'Albudeite', 'Albudeite', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LOS REMEDIOS'),
('30000377', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CAMPOAMOR'),
('30000389', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JACINTO BENAVENTE'),
('30000390', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LA ASUNCIÓN'),
('30000407', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LA SALUD'),
('30000481', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN JOSÉ OBRERO'),
('30000501', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LAS TEJERAS'),
('30000641', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Venta de los Carrascos', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'REINA SOFÍA'),
('30000717', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Escuela Oficial de Idiomas', 'ESCUELA OFICIAL DE IDIOMAS'),
('30001849', 'REGIÓN DE MURCIA', 'Murcia', 'Cartagena', 'Albujón', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LUIS VIVES'),
('30002192', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Isla Plana', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PUIG CAMPILLO'),
('30002350', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'La Asomada', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LA ASOMADA'),
('30002911', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Balsapintada', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PABLO NERUDA'),
('30003779', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'La Paca', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PETRA GONZÁLEZ'),
('30004760', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PUENTE DE DOÑANA'),
('30004772', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JUAN XXIII'),
('30004784', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'JESÚS MARÍA NUESTRA SEÑORA DE LA FUENSANTA'),
('30004796', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Alberca de las Torres', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'VIRGEN DE LA FUENSANTA'),
('30004826', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Santo Ángel', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SANTO ÁNGEL'),
('30004838', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Santo Ángel', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'CRISTO CRUCIFICADO'),
('30004841', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Algezares', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAAVEDRA FAJARDO'),
('30004843', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'MARÍA CERVERA'),
('30004899', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Alquerías', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN JUAN BAUTISTA'),
('30004954', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Barqueros', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PEDRO MARTÍNEZ CHACAS'),
('30004966', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Beniaján', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LA FUENSANTA'),
('30004978', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Beniaján', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE FÁTIMA'),
('30004981', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Beniaján', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'INFANTA ELENA'),
('30004991', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'San José de la Vega', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'FRANCISCO NOGUERA'),
('30005053', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Cabezo de Torres', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LAS LÁGRIMAS'),
('30005065', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Cabezo de Torres', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'MARÍA AUXILIADORA'),
('30005120', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Cobatillas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'VIRGEN DE LA VEGA'),
('30005168', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'MAESTRO ENRIQUE LABORDA'),
('30005171', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Era Alta', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SANTIAGO GARCÍA MEDEL'),
('30005193', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Esparragal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LOS ÁNGELES'),
('30005201', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Esparragal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LA CRUZ'),
('30005260', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Guadalupe de Maciascoque', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'VIRGEN DE GUADALUPE'),
('30005296', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Rincón de Beniscornia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'RINCÓN DE BENISCORNIA'),
('30005302', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Javalí Nuevo', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CONTRAPARADA'),
('30005326', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Javalí Viejo (O el Lugarico)', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'HELLÍN LASHERAS'),
('30005375', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Huerta de Llano de Brujas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JUAN CARLOS I'),
('30005454', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'ANDRÉS BAQUERO'),
('30005466', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CIERVA PEÑAFIEL'),
('30005478', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'FEDERICO DE ARCE MARTÍNEZ'),
('30005481', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'VISTABELLA'),
('30005511', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'MARÍA MAROTO'),
('30005521', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'MARIANO AROCA'),
('30005533', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NICOLÁS DE LAS PEÑAS'),
('30005545', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DEL CARMEN'),
('30005557', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LA PAZ'),
('30005582', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SANTA MARÍA DE GRACIA'),
('30005594', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LUIS COSTA'),
('30005600', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PEDRO PÉREZ ABADÍA'),
('30005612', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Público de Educación Infantil y Básica', 'SALZILLO'),
('30005673', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'DIVINO MAESTRO'),
('30005740', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'EL BUEN PASTOR'),
('30005752', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'CRISTO REY'),
('30005764', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Educación Infantil, Primaria, Secundaria y Educación Especial', 'ESCUELA EQUIPO'),
('30005776', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'LA MERCED-FUENSANTA'),
('30005806', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'HERMA'),
('30005821', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'JESÚS MARÍA'),
('30005831', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Educación Infantil y Primaria', 'JOSÉ LOUSTAU'),
('30005879', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'MARCO'),
('30005892', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'LA MILAGROSA'),
('30005910', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'MONTEAGUDO-NELVA'),
('30005934', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Educación Infantil y Primaria', 'NTRA. SRA. DE LOS BUENOS LIBROS'),
('30005946', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SANTA MARÍA DEL CARMEN'),
('30005958', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'NTRA. SRA. DE LA CONSOLACIÓN'),
('30006008', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SAN BUENAVENTURA'),
('30006011', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SAN JOSÉ'),
('30006057', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SANTA JOAQUINA DE VEDRUNA'),
('30006069', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SANTA MARÍA DE LA PAZ'),
('30006124', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN ANDRÉS'),
('30006148', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'BARRIOMAR 74'),
('30006215', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NARCISO YEPES'),
('30006321', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Nonduermas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE CORTES'),
('30006331', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'La Ñora', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DEL PASO'),
('30006355', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'ESCUELAS NUEVAS'),
('30006367', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LOS ROSALES'),
('30006418', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'VICENTE BLASCO IBÁÑEZ'),
('30006434', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PINTOR PEDRO FLORES'),
('30006446', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DEL ROSARIO'),
('30006483', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Casillas (lugar De) o Ermita de Buendía', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JUAN DE LA CIERVA'),
('30006513', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'El Puntal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'EL PUNTAL'),
('30006525', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Huerta del Raal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LOS DOLORES'),
('30006537', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Los Ramos', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'FRANCISCO SALZILLO'),
('30006549', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'La Raya', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LA ENCARNACIÓN'),
('30006550', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Rincón de Seca', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LOS ÁNGELES'),
('30006631', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SAN VICENTE FERRER'),
('30006641', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Ermita de Patiño', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JOSÉ MARTÍNEZ TORNEL'),
('30006675', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'BASILIO SÁNCHEZ'),
('30006689', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'San José de la Montaña', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PABLO GIL CASTILLO'),
('30006690', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'San José de la Montaña', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN JOSÉ DE LA MONTAÑA'),
('30006707', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'ANTONIO DELGADO DORREGO'),
('30006719', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NICOLÁS RAYA'),
('30006732', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Santa Cruz', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CRISTO DE LA EXPIRACIÓN'),
('30006756', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE BELÉN'),
('30006771', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE ATOCHA'),
('30006793', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Zarandona', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN FÉLIX'),
('30006859', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sucina', 'CPEIBAS', 'Centro Público de Educación Infantil y Básica', 'ARTEAGA'),
('30006860', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Torreagüera', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'ÁNGEL ZAPATA'),
('30006872', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Valladolises', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LA CANDELARIA'),
('30006884', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Zeneta', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAGRADO CORAZÓN'),
('30006938', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Esparragal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PURÍSIMA CONCEPCIÓN'),
('30007281', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'JOSÉ IBÁÑEZ MARTÍNEZ'),
('30007330', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'MEDITERRÁNEO'),
('30008003', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'PEDRO GUERRERO'),
('30008054', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Educación de Personas Adultas', 'CIRCULO ECCA (RADIO ECCA)'),
('30008091', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEA', 'Centro Público de Educación de Personas Adultas', 'GARCÍA ALIX'),
('30008145', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SANTA ROSA DE LIMA'),
('30008241', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'SANTIAGO GRISOLÍA'),
('30008251', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'PARRA'),
('30008406', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN JUAN DE LAS ÁGUILAS'),
('30008595', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN PABLO'),
('30008601', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN JUAN'),
('30008625', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Cabezo de Torres', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JOSÉ RUBIO GOMARIZ'),
('30008674', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SAN PÍO X'),
('30008698', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'IES', 'Instituto de Educación Secundaria', 'SIERRA DE CARRASCOY'),
('30008731', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Huerta del Raal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'TORRETEATINOS'),
('30008868', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE ARRIXACA'),
('30008959', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'SANTIAGO EL MAYOR'),
('30009010', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'IES', 'Instituto de Educación Secundaria', 'ALJADA'),
('30009058', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JOAQUÍN TENDERO'),
('30009083', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'JUAN DE LA CIERVA'),
('30009150', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'FÉLIX RODRÍGUEZ DE LA FUENTE'),
('30009162', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CIUDAD DE LA PAZ'),
('30009174', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JOSÉ MORENO'),
('30009277', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'SAN ANTOLÍN'),
('30009371', 'REGIÓN DE MURCIA', 'Murcia', 'Alcantarilla', 'Alcantarilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JARA CARRILLO'),
('30009435', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Esparragal', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'VICENTE MEDINA'),
('30009447', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'ALEJANDRO VALVERDE BELMONTE'),
('30009459', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'RAMÓN GAYA'),
('30009460', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Torreagüera', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CRISTO DEL VALLE'),
('30009575', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'SAN LORENZO'),
('30009629', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'TORRE SALINAS'),
('30009733', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Conservatorio Superior de Música', 'MANUEL MASSOTTI LITTEL'),
('30010249', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'ASOCIACIÓN PARA LA EDUCACIÓN AMBIENTAL Y EL CONSUMO ECOLOGICO'),
('30010309', 'REGIÓN DE MURCIA', 'Murcia', 'Abanilla', 'Abanilla', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'DIONISIO BUENO'),
('30010361', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'VIRGEN DE LA FUENSANTA'),
('30010401', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Javalí Nuevo', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'RÍO SEGURA'),
('30010449', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'La Arboleja', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LA ARBOLEJA'),
('30010450', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'LA SANTA CRUZ'),
('30010531', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Elemental de Danza', 'Mª DOLORES MORENO MESEGUER'),
('30010541', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Elemental de Música', 'SANTA CECILIA'),
('30010619', 'REGIÓN DE MURCIA', 'Murcia', 'Abarán', 'Abarán', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'VIRGEN DEL ORO'),
('30010620', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Escuela Oficial de Idiomas', 'ESCUELA OFICIAL DE IDIOMAS - MURCIA'),
('30010693', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'M. FERNÁNDEZ CABALLERO'),
('30010700', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'PRÍNCIPE DE ESPAÑA'),
('30010701', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'FRANCISCO GINER DE LOS RÍOS'),
('30010711', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'JOSÉ MARÍA PÁRRAGA'),
('30010802', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'CENTRO DE ESTUDIOS C.E.I.'),
('30010899', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro de Educación Especial', 'STMO.CRISTO DE LA MISERICORDIA'),
('30010929', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'MEDITERRÁNEO'),
('30010954', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LOS ÁLAMOS'),
('30010991', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'EL RUBIAL'),
('30011028', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Alberca de las Torres', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'EL MOLINICO'),
('30011031', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'URCI'),
('30011326', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Algezares', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'FRANCISCO COBACHO'),
('30011417', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro de Educación Especial', 'PARA NIÑOS AUTISTAS LAS BOQUERAS'),
('30011454', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'GLORIA FUERTES'),
('30011511', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CIUDAD DE MURCIA'),
('30011521', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'MAESTRO JOSÉ CASTAÑO'),
('30011661', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Elemental de Música', 'ANMAVI'),
('30011877', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'SEVERO OCHOA'),
('30011973', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'CIUDAD DE MURCIA'),
('30011983', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LAS LOMAS'),
('30012057', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Conservatorio Profesional de Danza', 'CONSERVATORIO DE DANZA TERESA SOUAN BERNAL'),
('30012094', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Valentín', 'CRA', 'Colegio Rural Agrupado', 'RÍO ARGOS'),
('30012185', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'BAMBI'),
('30012291', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LA FLOTA'),
('30012321', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Elemental de Danza', 'CAMARGO'),
('30012439', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'LUIS VIVES'),
('30012574', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEA', 'Centro Público de Educación de Personas Adultas', 'INFANTE'),
('30012586', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEA', 'Centro Público de Educación de Personas Adultas', 'PUENTE TOCINOS'),
('30012604', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'VIRGEN DE LA FUENSANTA'),
('30012689', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Elemental de Danza', 'FLEXION'),
('30012801', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'EMEI', 'Escuela Municipal de Educación Infantil', 'NTRA. SRA. DE LOS ÁNGELES'),
('30012938', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'INFANTA CRISTINA'),
('30012941', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Profesional de Música', 'ANMAVI'),
('30013049', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Conservatorio Profesional de Música', 'CONSERVATORIO DE MUSICA DE MURCIA'),
('30013566', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'IES', 'Instituto de Educación Secundaria', 'SANGONERA LA VERDE'),
('30013633', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'NEFER CENTER, S.L.'),
('30013636', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'LUCES DE LA VEGA'),
('30013682', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'LA ARBOLEDA'),
('30013751', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Profesional de Música', 'ALTER MUSICI'),
('30013840', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'SÁNCHEZ ROSELL'),
('30014089', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'VIRGEN DE LA FUENSANTA'),
('30014652', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'VIRGEN DEL PASICO'),
('30017951', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'ABENARABI'),
('30018096', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Escuela de Arte', 'ESCUELA DE ARTE'),
('30018138', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'CENTRO DE EDUCACIÓN AYS'),
('30018618', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Integrado de Formación Profesional', 'CENTRO INTEGRADO DE FORMACIÓN PROFESIONAL ARSENIO SÁNCHEZ (FREMM)'),
('30018710', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Educación Infantil, Primaria, Secundaria y Educación Especial', 'GABRIEL PÉREZ CÁRCEL'),
('30018734', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Educación Infantil, Primaria, Secundaria y Educación Especial', 'LA FLOTA MURCIA'),
('30018771', 'REGIÓN DE MURCIA', 'Murcia', 'Águilas', 'Águilas', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'CIUDAD DEL MAR'),
('30018795', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'REINO DE MURCIA'),
('30018849', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Jerónimos y Avileses', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'AVILESES'),
('30018941', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Autorizado de Enseñanzas Artísticas Profesionales de Artes Plásticas y Diseño', 'ESCUELA SUPERIOR INTERNACIONAL'),
('30019015', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'SOLCITOS'),
('30019076', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', 'CPEI', 'Centro Privado de Educación Infantil', 'ORIGAMI CENTRO DE EDUCACION INFANTIL BILINGÜE'),
('30019240', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'SAAVEDRA FAJARDO'),
('30019271', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Palmar (el) o Lugar de Don Juan', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'PINTOR PEDRO CANO'),
('30019293', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'VIRGEN DEL CARMEN'),
('30019325', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Escuela Municipal de Educación Infantil', 'LA PAZ'),
('30019349', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Torreagüera', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'MIRASIERRA'),
('30019350', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIPS', 'Centro Privado de Educación Infantil Primaria y Secundaria', 'FUENTEBLANCA'),
('30019428', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'ARCO IRIS'),
('30019441', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Santo Ángel', 'CPEI', 'Centro Privado de Educación Infantil', 'MIRASIERRA'),
('30019571', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'EI', 'Escuela Infantil', 'INFANTE JUAN MANUEL'),
('30019581', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'EI', 'Escuela Infantil', 'SAN BASILIO'),
('30019672', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'Nº 39'),
('30019696', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'San Ginés', 'CPEI', 'Centro Privado de Educación Infantil', 'AEPIO'),
('30019751', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CAED', 'Centro Privado Autorizado de Enseñanzas Deportivas', 'INSTITUTO SUPERIOR DE FORMACIÓN DEPORTIVA DE LA FEDERACIÓN DE FÚTBOL DE LA REGIÓN DE MURCIA'),
('30019775', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Los Martínez del Puerto', 'CEIP', 'Colegio de Educación Infantil y Primaria', 'NTRA. SRA. DE LAS MARAVILLAS'),
('30019830', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'NATANAEL'),
('30020111', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'CPEI', 'Centro Privado de Educación Infantil', 'BAMBINO'),
('30020194', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'CENTRO DE ESTUDIOS ENCARNA CAMACHO'),
('30020251', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional', 'CESUR MURCIA'),
('30020303', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Integrado de Formación Profesional', 'INSTITUTO SUPERIOR DE FORMACIÓN PROFESIONAL AMUSAL'),
('30020376', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'INSTITUTO SUPERIOR DE FORMACIÓN PROFESIONAL XTART'),
('30020421', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CAED', 'Centro Privado Autorizado de Enseñanzas Deportivas', 'TÁNDEM'),
('30020534', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'INSTITUTO SUPERIOR DE FORMACIÓN PROFESIONAL HOSTELERÍA Y TURISMO VESTA'),
('30020716', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Aula Hospitalaria', 'REINA SOFÍA'),
('30020728', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Aula Hospitalaria', 'MORALES MESEGUER'),
('30020871', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'CESUR MURCIA AUDIOVISUAL'),
('30020893', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado Autorizado Profesional de Música', 'ALTER MUSICI'),
('30020960', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CAED', 'Centro Privado Autorizado de Enseñanzas Deportivas', 'ESCUELA MURCIANA DE ESPELEOLOGÍA Y DESCENSO DE CAÑONES'),
('30020972', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'CEIB PUERTA DE MURCIA'),
('30021009', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Docente Privado Extranjero en España', 'INTERNACIONAL DESIGN HIGH SCHOOL'),
('30021010', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional Específica', 'EVERIS SCHOOL MURCIA'),
('30021034', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Docente Privado Extranjero en España', 'Cuatronaranjos Murcia Active School, S.L.'),
('30021061', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Autorizado de Enseñanzas Artísticas Profesionales de Artes Plásticas y Diseño', 'INSTITUTO 42'),
('30021173', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Escuela Oficial de Idiomas', 'ESCUELA OFICIAL DE IDIOMAS - MURCIA CENTRO'),
('30021174', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Zarandona', 'CPEI', 'Centro Privado de Educación Infantil', 'CHISPITAS'),
('30021186', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'CPEI', 'Centro Privado de Educación Infantil', 'BABY DOS'),
('30021198', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Puente Tocinos', '', 'Centro Docente Privado Extranjero en España', 'LA ENREDADERA VIVENCIAL SCHOOL'),
('30021265', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional', 'MEDAC MURCIA'),
('30021277', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'VIRGEN DE LA FUENSANTA'),
('30021307', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Público Integrado de Formación Profesional', 'CENTRO INTEGRADO DE FORMACIÓN PROFESIONAL POLITÉCNICO DE MURCIA'),
('30021401', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Sangonera la Verde o Ermita Nueva', 'CPEI', 'Centro Privado de Educación Infantil', 'EL SUEÑO DE MELISA'),
('30021435', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional', 'CESUR MURCIA LAGO'),
('30021563', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'IES', 'SANTIAGO RAMÓN Y CAJAL'),
('30021666', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', 'EI', 'Escuela Infantil', 'ESCUELA INFANTIL UNIVERSIDAD DE MURCIA'),
('30021915', 'REGIÓN DE MURCIA', 'Murcia', 'Murcia', 'Murcia', '', 'Centro Privado de Formación Profesional', 'CESUR DIGILTEA GRUPO HOZONO GLOBAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttdua`
--

CREATE TABLE `ttdua` (
  `texto1` varchar(10) DEFAULT NULL,
  `texto2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttdua`
--

INSERT INTO `ttdua` (`texto1`, `texto2`) VALUES
('NEE', 'El equipo docente acuerda las siguientes medidas  teniendo en cuenta la documentación existente en su expediente, la evaluación inicial efectuada y el asesoramiento de los especialista de orientación educativa. \r\n \r\nEste apartado no recoge las adaptaciones de los elementos curriculares de cada una de las materias, áreas, módulo,... que se imparten, esa tarea es para el responsable de cada una de las mismas. Por su condición de alumno con necesidades educativas especiales, el responsable de cada materia, podrá seleccionar aquellas competencias, criterios de evaluación y saberes básicos que sean necesarios a la luz de sus características. \r\n\r\nAquí se han acordado las medidas en nueve apartados que corresponde a las nueve pautas del Diseño Universal del Aprendizaje que se considera oportuno realizar en todas las materias con las adecuaciones pertinentes.'),
('NO NEE', 'El equipo docente acuerda las siguientes medidas  teniendo en cuenta la documentación existente en su expediente, la evaluación inicial efectuada y el asesoramiento de los especialista de orientación educativa. \r\n \r\nEste apartado no recoge las adaptaciones de los elementos curriculares de cada una de las materias, áreas, módulo,... que se imparten, esa tarea es para el responsable de cada una de las mismas. Por su condición de alumno sin necesidades educativas especiales, las competencias específicas, criterios de evaluación y saberes básicos serán los señalados en la programación docente de cada materia. \r\n\r\nAquí se han acordado las medidas en nueve apartados que corresponde a las nueve pautas del Diseño Universal del Aprendizaje que se considera oportuno realizar en todas las materias con las adecuaciones pertinentes.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttfamintr`
--

CREATE TABLE `ttfamintr` (
  `texto1` varchar(10) DEFAULT NULL,
  `texto2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttfamintr`
--

INSERT INTO `ttfamintr` (`texto1`, `texto2`) VALUES
('1', 'La familia debe saber que todo aquello que pueda influir en el desarrollo académico de su hijo puede ayudar a mejorar, a veces a la documentación oficial le faltan detalles que salvando la intimidad deberían conocerse, para lo anterior es necesario la comunicación fluida para comprender plenamente sus necesidades y la respuesta que va dando a las medidas adoptadas. \r\n\r\nSe señala a continuación propuestas de colaboración de la familia en cinco apartados para favorecer lo que se hace en el centro con el alumno/a:');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttfinaleval`
--

CREATE TABLE `ttfinaleval` (
  `Texto1` varchar(10) DEFAULT NULL,
  `Texto2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttfinaleval`
--

INSERT INTO `ttfinaleval` (`Texto1`, `Texto2`) VALUES
('1', 'En las sesiones de evaluación se analizarán los resultados de las medidas que se hayan adoptado. Tras este análisis se adoptarán las decisiones para el periodo siguiente y cuando sea el caso de la evaluación final se harán las propuestas para el curso en donde se matricule. Los logros alcanzados en cada materia así como la evaluación del desarrollo de las mismas se realizará en los términos recogidos en las programaciones docentes.'),
('2', 'La información que reflejará el análisis de cada evaluación contendrá los siguientes apartados:'),
('3', 'I.-Calificaciones y evolución apreciada en sus aprendizajes'),
('4', 'Materias con calificación +/ - y con progreso o no'),
('5', 'II.- Lo que se estima referido a otros aspectos que repercuten en su aprendizaje'),
('6', 'Relaciones con sus iguales'),
('7', 'Participación en clase'),
('8', 'Perseverancia para su mejora'),
('9', 'III.- Apoyo recibido y valoración que se hace del mismo'),
('10', 'PT'),
('11', 'AL'),
('12', 'Idioma'),
('13', 'IV.- Conclusiones, decisiones del equipo docente  en la sesión de evaluación'),
('14', '1ª evaluación'),
('15', '¿Continuar sin cambios en las medidas adoptadas?'),
('16', '¿Continuar con las medidas, pero con cambios en el apoyo específico?'),
('17', '¿Continuar con las medidas, con ciertos cambios que se señalan en hoja complementaria a esta?'),
('18', 'Revisar las necesidades señaladas en su informe por si significarían cambios en las mismas y a continuación en el plan, por las razones señaladas en hoja aparte:'),
('19', '2ª evaluación'),
('20', '¿Continuar sin cambios en las medidas adoptadas?'),
('21', '¿Continuar con las medidas, pero con cambios en el apoyo específico?'),
('22', '¿Continuar con las medidas, con ciertos cambios que se señalan en hoja complementaria a esta?'),
('23', 'Estudiar los posibles cambios en su escolarización a final de curso  por los motivos expuestos en hoja aparte que se adjunta'),
('24', 'Evaluación Final'),
('25', '¿Promocionar si es el caso?'),
('26', '¿Continuar sin cambios en las medidas adoptadas?'),
('27', 'Proponerlo/a a la siguiente oferta educativa:'),
('28', '¿Se ha de estudiar su situación para ajustar sus necesidades?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttgr1`
--

CREATE TABLE `ttgr1` (
  `cod_grupo` varchar(10) NOT NULL,
  `etapa` varchar(50) DEFAULT NULL,
  `etapa_1` varchar(10) DEFAULT NULL,
  `curso` int(1) DEFAULT NULL,
  `grupo` varchar(1) DEFAULT NULL,
  `cod_nivel` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttgr1`
--

INSERT INTO `ttgr1` (`cod_grupo`, `etapa`, `etapa_1`, `curso`, `grupo`, `cod_nivel`) VALUES
('DIV1A', 'ESO-DIV', 'DIV', 1, 'A', 'DIV1'),
('DIV1B', 'ESO-DIV', 'DIV', 1, 'B', 'DIV1'),
('DIV1C', 'ESO-DIV', 'DIV', 1, 'C', 'DIV1'),
('DIV2A', 'ESO-DIV', 'DIV', 2, 'A', 'DIV2'),
('DIV2B', 'ESO-DIV', 'DIV', 2, 'B', 'DIV2'),
('DIV2C', 'ESO-DIV', 'DIV', 2, 'C', 'DIV2'),
('ESO1A', 'ESO', 'ESO', 1, 'A', 'ESO1'),
('ESO1B', 'ESO', 'ESO', 1, 'B', 'ESO1'),
('ESO1C', 'ESO', 'ESO', 1, 'C', 'ESO1'),
('ESO1D', 'ESO', 'ESO', 1, 'D', 'ESO1'),
('ESO1E', 'ESO', 'ESO', 1, 'E', 'ESO1'),
('ESO1F', 'ESO', 'ESO', 1, 'F', 'ESO1'),
('ESO1G', 'ESO', 'ESO', 1, 'G', 'ESO1'),
('ESO1H', 'ESO', 'ESO', 1, 'H', 'ESO1'),
('ESO2A', 'ESO', 'ESO', 2, 'A', 'ESO2'),
('ESO2B', 'ESO', 'ESO', 2, 'B', 'ESO2'),
('ESO2C', 'ESO', 'ESO', 2, 'C', 'ESO2'),
('ESO2D', 'ESO', 'ESO', 2, 'D', 'ESO2'),
('ESO2E', 'ESO', 'ESO', 2, 'E', 'ESO2'),
('ESO2F', 'ESO', 'ESO', 2, 'F', 'ESO2'),
('ESO2G', 'ESO', 'ESO', 2, 'G', 'ESO2'),
('ESO2H', 'ESO', 'ESO', 2, 'H', 'ESO2'),
('ESO3A', 'ESO', 'ESO', 3, 'A', 'ESO3'),
('ESO3B', 'ESO', 'ESO', 3, 'B', 'ESO3'),
('ESO3C', 'ESO', 'ESO', 3, 'C', 'ESO3'),
('ESO3D', 'ESO', 'ESO', 3, 'D', 'ESO3'),
('ESO3E', 'ESO', 'ESO', 3, 'E', 'ESO3'),
('ESO3F', 'ESO', 'ESO', 3, 'F', 'ESO3'),
('ESO3G', 'ESO', 'ESO', 3, 'G', 'ESO3'),
('ESO3H', 'ESO', 'ESO', 3, 'H', 'ESO3'),
('ESO4A', 'ESO', 'ESO', 4, 'A', 'ESO4'),
('ESO4B', 'ESO', 'ESO', 4, 'B', 'ESO4'),
('ESO4C', 'ESO', 'ESO', 4, 'C', 'ESO4'),
('ESO4D', 'ESO', 'ESO', 4, 'D', 'ESO4'),
('ESO4E', 'ESO', 'ESO', 4, 'E', 'ESO4'),
('ESO4F', 'ESO', 'ESO', 4, 'F', 'ESO4'),
('ESO4G', 'ESO', 'ESO', 4, 'G', 'ESO4'),
('ESO4H', 'ESO', 'ESO', 4, 'H', 'ESO4'),
('FPB1A', 'ESO-FPB', 'FPB', 1, 'A', 'FPB1'),
('FPB1B', 'ESO-FPB', 'FPB', 1, 'B', 'FPB1'),
('FPB1C', 'ESO-FPB', 'FPB', 1, 'C', 'FPB1'),
('FPB1D', 'ESO-FPB', 'FPB', 1, 'D', 'FPB1'),
('FPB1E', 'ESO-FPB', 'FPB', 1, 'E', 'FPB1'),
('FPB1F', 'ESO-FPB', 'FPB', 1, 'F', 'FPB1'),
('FPB1G', 'ESO-FPB', 'FPB', 1, 'G', 'FPB1'),
('FPB1H', 'ESO-FPB', 'FPB', 1, 'H', 'FPB1'),
('FPB2A', 'ESO-FPB', 'FPB', 2, 'A', 'FPB2'),
('FPB2B', 'ESO-FPB', 'FPB', 2, 'B', 'FPB2'),
('FPB2C', 'ESO-FPB', 'FPB', 2, 'C', 'FPB2'),
('FPB2D', 'ESO-FPB', 'FPB', 2, 'D', 'FPB2'),
('FPB2E', 'ESO-FPB', 'FPB', 2, 'E', 'FPB2'),
('FPB2F', 'ESO-FPB', 'FPB', 2, 'F', 'FPB2'),
('FPB2G', 'ESO-FPB', 'FPB', 2, 'G', 'FPB2'),
('FPB2H', 'ESO-FPB', 'FPB', 2, 'H', 'FPB2'),
('INF1A', 'INFANTIL', 'INF', 1, 'A', 'INF1'),
('INF1B', 'INFANTIL', 'INF', 1, 'B', 'INF1'),
('INF1C', 'INFANTIL', 'INF', 1, 'C', 'INF1'),
('INF1D', 'INFANTIL', 'INF', 1, 'D', 'INF1'),
('INF1E', 'INFANTIL', 'INF', 1, 'E', 'INF1'),
('INF1F', 'INFANTIL', 'INF', 1, 'F', 'INF1'),
('INF1G', 'INFANTIL', 'INF', 1, 'G', 'INF1'),
('INF1H', 'INFANTIL', 'INF', 1, 'H', 'INF1'),
('INF2A', 'INFANTIL', 'INF', 2, 'A', 'INF2'),
('INF2B', 'INFANTIL', 'INF', 2, 'B', 'INF2'),
('INF2C', 'INFANTIL', 'INF', 2, 'C', 'INF2'),
('INF2D', 'INFANTIL', 'INF', 2, 'D', 'INF2'),
('INF2E', 'INFANTIL', 'INF', 2, 'E', 'INF2'),
('INF2F', 'INFANTIL', 'INF', 2, 'F', 'INF2'),
('INF2G', 'INFANTIL', 'INF', 2, 'G', 'INF2'),
('INF2H', 'INFANTIL', 'INF', 2, 'H', 'INF2'),
('INF3A', 'INFANTIL', 'INF', 3, 'A', 'INF3'),
('INF3B', 'INFANTIL', 'INF', 3, 'B', 'INF3'),
('INF3C', 'INFANTIL', 'INF', 3, 'C', 'INF3'),
('INF3D', 'INFANTIL', 'INF', 3, 'D', 'INF3'),
('INF3E', 'INFANTIL', 'INF', 3, 'E', 'INF3'),
('INF3F', 'INFANTIL', 'INF', 3, 'F', 'INF3'),
('INF3G', 'INFANTIL', 'INF', 3, 'G', 'INF3'),
('INF3H', 'INFANTIL', 'INF', 3, 'H', 'INF3'),
('PRI1A', 'PRIMARIA', 'PRI', 1, 'A', 'PRI1'),
('PRI1B', 'PRIMARIA', 'PRI', 1, 'B', 'PRI1'),
('PRI1C', 'PRIMARIA', 'PRI', 1, 'C', 'PRI1'),
('PRI1D', 'PRIMARIA', 'PRI', 1, 'D', 'PRI1'),
('PRI1E', 'PRIMARIA', 'PRI', 1, 'E', 'PRI1'),
('PRI1F', 'PRIMARIA', 'PRI', 1, 'F', 'PRI1'),
('PRI1G', 'PRIMARIA', 'PRI', 1, 'G', 'PRI1'),
('PRI1H', 'PRIMARIA', 'PRI', 1, 'H', 'PRI1'),
('PRI2A', 'PRIMARIA', 'PRI', 2, 'A', 'PRI2'),
('PRI2B', 'PRIMARIA', 'PRI', 2, 'B', 'PRI2'),
('PRI2C', 'PRIMARIA', 'PRI', 2, 'C', 'PRI2'),
('PRI2D', 'PRIMARIA', 'PRI', 2, 'D', 'PRI2'),
('PRI2E', 'PRIMARIA', 'PRI', 2, 'E', 'PRI2'),
('PRI2F', 'PRIMARIA', 'PRI', 2, 'F', 'PRI2'),
('PRI2G', 'PRIMARIA', 'PRI', 2, 'G', 'PRI2'),
('PRI2H', 'PRIMARIA', 'PRI', 2, 'H', 'PRI2'),
('PRI3A', 'PRIMARIA', 'PRI', 3, 'A', 'PRI3'),
('PRI3B', 'PRIMARIA', 'PRI', 3, 'B', 'PRI3'),
('PRI3C', 'PRIMARIA', 'PRI', 3, 'C', 'PRI3'),
('PRI3D', 'PRIMARIA', 'PRI', 3, 'D', 'PRI3'),
('PRI3E', 'PRIMARIA', 'PRI', 3, 'E', 'PRI3'),
('PRI3F', 'PRIMARIA', 'PRI', 3, 'F', 'PRI3'),
('PRI3G', 'PRIMARIA', 'PRI', 3, 'G', 'PRI3'),
('PRI3H', 'PRIMARIA', 'PRI', 3, 'H', 'PRI3'),
('PRI4A', 'PRIMARIA', 'PRI', 4, 'A', 'PRI4'),
('PRI4B', 'PRIMARIA', 'PRI', 4, 'B', 'PRI4'),
('PRI4C', 'PRIMARIA', 'PRI', 4, 'C', 'PRI4'),
('PRI4D', 'PRIMARIA', 'PRI', 4, 'D', 'PRI4'),
('PRI4E', 'PRIMARIA', 'PRI', 4, 'E', 'PRI4'),
('PRI4F', 'PRIMARIA', 'PRI', 4, 'F', 'PRI4'),
('PRI4G', 'PRIMARIA', 'PRI', 4, 'G', 'PRI4'),
('PRI4H', 'PRIMARIA', 'PRI', 4, 'H', 'PRI4'),
('PRI5A', 'PRIMARIA', 'PRI', 5, 'A', 'PRI5'),
('PRI5B', 'PRIMARIA', 'PRI', 5, 'B', 'PRI5'),
('PRI5C', 'PRIMARIA', 'PRI', 5, 'C', 'PRI5'),
('PRI5D', 'PRIMARIA', 'PRI', 5, 'D', 'PRI5'),
('PRI5E', 'PRIMARIA', 'PRI', 5, 'E', 'PRI5'),
('PRI5F', 'PRIMARIA', 'PRI', 5, 'F', 'PRI5'),
('PRI5G', 'PRIMARIA', 'PRI', 5, 'G', 'PRI5'),
('PRI5H', 'PRIMARIA', 'PRI', 5, 'H', 'PRI5'),
('PRI6A', 'PRIMARIA', 'PRI', 6, 'A', 'PRI6'),
('PRI6B', 'PRIMARIA', 'PRI', 6, 'B', 'PRI6'),
('PRI6C', 'PRIMARIA', 'PRI', 6, 'C', 'PRI6'),
('PRI6D', 'PRIMARIA', 'PRI', 6, 'D', 'PRI6'),
('PRI6E', 'PRIMARIA', 'PRI', 6, 'E', 'PRI6'),
('PRI6F', 'PRIMARIA', 'PRI', 6, 'F', 'PRI6'),
('PRI6G', 'PRIMARIA', 'PRI', 6, 'G', 'PRI6'),
('PRI6H', 'PRIMARIA', 'PRI', 6, 'H', 'PRI6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttmatcom`
--

CREATE TABLE `ttmatcom` (
  `cod_nivel` varchar(10) NOT NULL,
  `Mat1` varchar(100) DEFAULT NULL,
  `Mat2` varchar(100) DEFAULT NULL,
  `Mat3` varchar(100) DEFAULT NULL,
  `Mat4` varchar(100) DEFAULT NULL,
  `Mat5` varchar(100) DEFAULT NULL,
  `Mat6` varchar(100) DEFAULT NULL,
  `Mat7` varchar(100) DEFAULT NULL,
  `Mat8` varchar(100) DEFAULT NULL,
  `Mat9` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttmatcom`
--

INSERT INTO `ttmatcom` (`cod_nivel`, `Mat1`, `Mat2`, `Mat3`, `Mat4`, `Mat5`, `Mat6`, `Mat7`, `Mat8`, `Mat9`) VALUES
('DIV1', 'Educación Física', 'Ámbito Socio-lingüístico 1', 'Ámbito científico-tecnológico 1', 'Lengua Extranjera.', 'Música', '', '', '', ''),
('DIV2', 'Educación Física', 'Ámbito Socio-lingüístico 2', 'Ámbito científico-tecnológico 2', 'Lengua Extranjera.', 'Formación y Orientación Personal y Profesional.', '', '', '', ''),
('ESO1', 'Educación Física', 'Geografía e Historia.', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Tecnología y Digitalización.', 'Biología y Geología.', ''),
('ESO2', 'Educación Física', 'Geografía e Historia.', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Educación en Valores Cívicos y Éticos.', 'Física y Química.', 'Música'),
('ESO3', 'Educación Física', 'Geografía e Historia.', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Física y Química.', 'Tecnología y Digitalización.', 'Biología y Geología.', 'Música'),
('ESO4', 'Educación Física', 'Geografía e Historia.', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', '', '', '', '', ''),
('FPB1', 'Ciencias Aplicadas', 'Comunicación y sociedad', 'Módulo profesional 1', 'Módulo profesional 2', 'Módulo profesional 3', 'Módulo profesional 4', '', '', ''),
('FPB2', 'Ciencias Aplicadas', 'Comunicación y sociedad', 'Módulo profesional 1', 'Módulo profesional 2', 'Módulo profesional 3', 'Módulo profesional 4', 'Formación en centro de trabajo', '', ''),
('INF2', 'Desarrollo personal y social', 'Descubrimiento y exploración del entorno', 'Comunicación y representación', '', '', '', '', '', ''),
('INF3', 'Desarrollo personal y social', 'Descubrimiento y exploración del entorno', 'Comunicación y representación', '', '', '', '', '', ''),
('NF1', 'Desarrollo personal y social', 'Descubrimiento y exploración del entorno', 'Comunicación y representación', '', '', '', '', '', ''),
('PRI1', 'Educación Física', 'Ciencias Sociales', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Profundización Educativa', 'Ciencias de la Naturaleza', 'Música y Danza.'),
('PRI2', 'Educación Física', 'Ciencias Sociales', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Profundización Educativa', 'Ciencias de la Naturaleza', 'Música y Danza.'),
('PRI3', 'Educación Física', 'Ciencias Sociales', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Profundización Educativa', 'Ciencias de la Naturaleza', 'Música y Danza.'),
('PRI4', 'Educación Física', 'Ciencias Sociales', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Profundización Educativa', 'Ciencias de la Naturaleza', 'Música y Danza.'),
('PRI5', 'Educación Física', 'Ciencias Sociales', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Profundización Educativa', 'Ciencias de la Naturaleza', 'Música y Danza.'),
('PRI6', 'Educación Física', 'Ciencias Sociales', 'Lengua Castellana y Literatura.', 'Lengua Extranjera.', 'Matemáticas.', 'Educación Plástica y Visual', 'Educación en Valores Cívicos y Éticos', 'Ciencias de la Naturaleza', 'Música y Danza.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttmatop`
--

CREATE TABLE `ttmatop` (
  `id_optativa` int(11) NOT NULL,
  `cod_nivel` varchar(5) DEFAULT NULL,
  `cod_opt` varchar(4) DEFAULT NULL,
  `Mat1` varchar(10) DEFAULT NULL,
  `Mat2` varchar(10) DEFAULT NULL,
  `Mat3` varchar(10) DEFAULT NULL,
  `Mat4` varchar(10) DEFAULT NULL,
  `Mat5` varchar(10) DEFAULT NULL,
  `Mat6` varchar(10) DEFAULT NULL,
  `Mat7` varchar(10) DEFAULT NULL,
  `Mat8` varchar(10) DEFAULT NULL,
  `Mat9` varchar(10) DEFAULT NULL,
  `Mat10` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttmatop`
--

INSERT INTO `ttmatop` (`id_optativa`, `cod_nivel`, `cod_opt`, `Mat1`, `Mat2`, `Mat3`, `Mat4`, `Mat5`, `Mat6`, `Mat7`, `Mat8`, `Mat9`, `Mat10`) VALUES
(1, 'INF1', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'INF2', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'INF3', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'PRI1', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'PRI2', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'PRI3', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'PRI4', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'PRI5', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'PRI5', 'opt2', 'Segunda Le', 'Refuerzo d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'PRI6', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'PRI6', 'opt2', 'Segunda Le', 'Refuerzo d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'ESO1', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'ESO2', 'opt2', 'Segunda Le', 'Refuerzo d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'ESO3', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'ESO3', 'opt2', 'Segunda Le', 'Refuerzo d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'ESO3', 'opt3', 'Artes Escé', 'Comunicaci', 'Cultura Cl', 'Digitaliza', 'Emprendimi', 'Segunda Le', NULL, NULL, NULL, NULL),
(17, 'ESO4', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'ESO4', 'opt4', 'Matemática', 'Matemática', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'ESO4', 'opt5', 'Biología y', 'Digitaliza', 'Economía y', 'Expresión ', 'Física y Q', 'Formación ', 'Latín', 'Música', 'Segunda Le', 'Tecnología'),
(20, 'ESO4', 'opt6', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', NULL, NULL, NULL),
(21, 'DIV1', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'DIV1', 'opt3', 'Artes Escé', 'Comunicaci', 'Cultura Cl', 'Digitaliza', 'Emprendimi', 'Segunda Le', NULL, NULL, NULL, NULL),
(23, 'DIV2', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'DIV2', 'opt6', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', 'Proyecto d', NULL, NULL, NULL),
(25, 'FPB2', 'opt1', 'Religión', 'Atención E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttprev0`
--

CREATE TABLE `ttprev0` (
  `id_txt` int(4) NOT NULL,
  `intro` text NOT NULL,
  `resultado` text NOT NULL,
  `ambito` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ttprev0`
--

INSERT INTO `ttprev0` (`id_txt`, `intro`, `resultado`, `ambito`) VALUES
(1, 'Tuvo medidas personalizadas', 'Tuvo medidas personalizadas recogidas en un documento.', '1 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(2, 'PT', 'Especial. Pedagogía Terapéutica', '1 de RECURSOS QUE DISPUSO'),
(3, 'AL', 'Especial. Audición y Lenguaje', '2 de RECURSOS QUE DISPUSO'),
(4, 'AO', 'Prof. en Apoyo Ordinario', '3 de RECURSOS QUE DISPUSO'),
(5, 'ATE', 'Auxiliar Técnico Educativo', '4 de RECURSOS QUE DISPUSO'),
(6, 'FIS', 'Fisio-terapeuta', '5 de RECURSOS QUE DISPUSO'),
(7, 'DISC VIS', 'Especialista disc. visual', '6 de RECURSOS QUE DISPUSO'),
(8, 'DISC AUD', 'Especialista para disc. auditiva', '7 de RECURSOS QUE DISPUSO'),
(9, 'AY. SOC-EMOC.', 'Prof. de ayuda socio - emocional', '8 de RECURSOS QUE DISPUSO'),
(10, 'Especialista dificultades visuales', 'Especialista dificultades visuales', '1 de APOYO EXTERNO QUE TUVO'),
(11, 'Especialista auditivo', 'Especialista auditivo', '2 de APOYO EXTERNO QUE TUVO'),
(12, 'Por ser nee-discapacidad se le adaptó significativamente.', 'Por ser alumno/a de necesidades educativas especiales asociadas a discapacidad se le adaptó significativamente el currículo en las materias en donde se apreció.', '2 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(13, 'Ayuda social', 'Ayuda social', '3 de APOYO EXTERNO QUE TUVO'),
(14, 'Ayuda socioemocional', 'Ayuda socioemocional', '4 de APOYO EXTERNO QUE TUVO'),
(15, 'Ayuda de refuerzo educativo externo fuera de casa', 'Ayuda de refuerzo educativo externo fuera de casa', '5 de APOYO EXTERNO QUE TUVO'),
(16, 'Ayuda de refuerzo educativo externo en de casa', 'Ayuda de refuerzo educativo externo en de casa', '6 de APOYO EXTERNO QUE TUVO'),
(17, 'Seguimiento estrecho de familiar', 'Seguimiento estrecho de familiar', '7 de APOYO EXTERNO QUE TUVO'),
(18, 'Repitió curso', 'Se le aplicó, hasta ahora, la medida de permanecer en el mismo curso una vez.', '1 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(19, 'Repitió dos veces', 'Se le aplicó, hasta ahora, la medida de permanecer en el mismo curso ya dos veces', '2 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(20, 'Se le adelantó curso en algunas materias', 'Se le adelantó curso en algunas materias', '3 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(21, 'Se le adelantó curso completo', 'Se le adelantó curso completo', '4 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(22, 'Una suspensión del derecho de asistencia', 'Se le aplicó medida de suspensión del derecho de asistencia al centro en alguna ocasión.', '5 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(23, 'Aunque era nee-no discapacidad sí se tuvo que adaptar significativamente.', 'Tenía la condición de alumno/a de necesidades educativas especiales y aunque no estaba asociada a discapacidad sí se tuvo que adaptar significativamente el currículo en determinadas materias.', '3 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(24, 'Más de una suspensión del derecho de asistencia', 'Se le aplicó medida de suspensión del derecho de asistencia al centro en más de una ocasión.', '6 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(25, 'Cambio de centro motivado por medidas educativa correctora', 'Proviene de otro centro por aplicarse la medida educativa correctora de cambio de centro.', '7 de MEDIDAS EXTRAORDINARIAS ANTERIORES'),
(26, 'Todas las materias superadas', 'Las medidas adoptadas dieron un resultado positivo, todas las materias fueron superadas.', '1 de RESULTADO DE LAS MEDIDAS'),
(27, 'Una o dos materias no superadas', 'Hay que replantear las medidas sabiendo que las que se adoptaron dieron un resultado no totalmente satisfactorio ya que tuvo entre una o dos materias negativas.', '2 de RESULTADO DE LAS MEDIDAS'),
(28, 'Tres o más materias no superadas', 'Hay que plantear las medidas sabiendo que las que se adoptaron tienen que ser reforzadas por haber terminado con más de dos materias sin superar.', '3 de RESULTADO DE LAS MEDIDAS'),
(29, 'Era nee-no discapacidad y no se tuvo que adaptar significativamente.', 'Tenía la condición de alumno/a de necesidades educativas especiales pero no estaba asociada a discapacidad y no se tuvo que adaptar significativamente el currículo en materias alguna.', '4 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(30, 'Tuvo adecuaciones metodológicas.', 'Curricularmente tuvo adecuaciones metodológicas.', '5 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(31, 'Las adaptaciones en la evaluación no significaron alteración.', 'Las adaptaciones en la evaluación no significaron alteración alguna de los referentes de evaluación.', '6 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(32, 'Las adecuaciones por sus dificultades lectoescritoras.', 'Las adecuaciones realizadas fueron motivadas por sus dificultades en el ámbito lectoescritor.', '7 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(33, 'Problemas en el ámbito matemático significaron adaptaciones.', 'Problemas en el ámbito matemático significaron las adaptaciones que se le aplicó.', '8 de Medida previas sobre ADAPTACIÓN CURRICULAR'),
(34, 'Las adecuaciones curriculares realizadas fueron por su desfase curricular.', 'Las adecuaciones curriculares realizadas fueron por su desfase curricular motivada por su situación personal anterior.', '9 de Medida previas sobre ADAPTACIÓN CURRICULAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `progreso` int(11) DEFAULT 0,
  `cod_centro` varchar(20) NOT NULL,
  `rol` enum('Tutor','Director') NOT NULL DEFAULT 'Tutor',
  `apellidos` varchar(100) DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `email`, `password`, `nombre`, `progreso`, `cod_centro`, `rol`, `apellidos`, `observaciones`) VALUES
(7, 'carlosnicort@gmail.com', '$2y$10$Hd1mgEoFUMF.7guV0YBpkORazqUpDXyyiSMsz9ZfqiHq8uZCS/xr.', 'Carlos', 0, '30000377', 'Tutor', 'Ortuño', ''),
(8, 'figosipituno@gmail.com', '$2y$10$87Kela9/.aGyD8aUstpaDuOPxfHWLVJ25CjXDvzs/GrD/J3hzNwvy', '1', 0, '30000213', 'Director', '1', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tidua1_1`
--
ALTER TABLE `tidua1_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua2_1`
--
ALTER TABLE `tidua2_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua3_1`
--
ALTER TABLE `tidua3_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua4_1`
--
ALTER TABLE `tidua4_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua5_1`
--
ALTER TABLE `tidua5_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua6_1`
--
ALTER TABLE `tidua6_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua7_1`
--
ALTER TABLE `tidua7_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua8_1`
--
ALTER TABLE `tidua8_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `tidua9_1`
--
ALTER TABLE `tidua9_1`
  ADD PRIMARY KEY (`id_alum`);

--
-- Indices de la tabla `ti_gr1`
--
ALTER TABLE `ti_gr1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ti_tipologia`
--
ALTER TABLE `ti_tipologia`
  ADD PRIMARY KEY (`id_alu`);

--
-- Indices de la tabla `ttalu1`
--
ALTER TABLE `ttalu1`
  ADD PRIMARY KEY (`cod_acneae`);

--
-- Indices de la tabla `ttap1`
--
ALTER TABLE `ttap1`
  ADD PRIMARY KEY (`Texto1`);

--
-- Indices de la tabla `ttcentros`
--
ALTER TABLE `ttcentros`
  ADD PRIMARY KEY (`cod_centro`),
  ADD UNIQUE KEY `cod_centro` (`cod_centro`);

--
-- Indices de la tabla `ttgr1`
--
ALTER TABLE `ttgr1`
  ADD PRIMARY KEY (`cod_grupo`),
  ADD UNIQUE KEY `cod_grupo` (`cod_grupo`);

--
-- Indices de la tabla `ttmatcom`
--
ALTER TABLE `ttmatcom`
  ADD PRIMARY KEY (`cod_nivel`);

--
-- Indices de la tabla `ttmatop`
--
ALTER TABLE `ttmatop`
  ADD UNIQUE KEY `id` (`id_optativa`);

--
-- Indices de la tabla `ttprev0`
--
ALTER TABLE `ttprev0`
  ADD PRIMARY KEY (`id_txt`),
  ADD UNIQUE KEY `id_txt` (`id_txt`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ti_gr1`
--
ALTER TABLE `ti_gr1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `ti_tipologia`
--
ALTER TABLE `ti_tipologia`
  MODIFY `id_alu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ttmatop`
--
ALTER TABLE `ttmatop`
  MODIFY `id_optativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ttprev0`
--
ALTER TABLE `ttprev0`
  MODIFY `id_txt` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
