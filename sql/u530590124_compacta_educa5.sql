-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2025 a las 22:13:12
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
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` int(11) NOT NULL,
  `id_alu` varchar(50) NOT NULL,
  `cod_grupo` varchar(20) NOT NULL,
  `estado` enum('pendiente','completado') DEFAULT 'pendiente',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `id_alu` varchar(50) NOT NULL,
  `cod_centro` varchar(20) NOT NULL,
  `cod_grupo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `Tipo1` tinyint(1) DEFAULT 0,
  `Informe` tinyint(1) DEFAULT 0,
  `Perfil1` varchar(50) DEFAULT NULL,
  `ExtraPerfil1` varchar(50) DEFAULT NULL,
  `Perfil2` varchar(50) DEFAULT NULL,
  `ExtraPerfil2` varchar(50) DEFAULT NULL,
  `OtrasObservaciones` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_alu1`
--

INSERT INTO `ti_alu1` (`id_alu`, `cod_centro`, `cod_grupo`, `id_user`, `Tipo1`, `Informe`, `Perfil1`, `ExtraPerfil1`, `Perfil2`, `ExtraPerfil2`, `OtrasObservaciones`, `fecha`) VALUES
('30000213BAE1D1', '30000213', 'BAE1D', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 16:20:43'),
('30000213BAE1D2', '30000213', 'BAE1D', 2, 1, 0, 'TDAH', 'Moderado', '0', '0', '0', '2025-09-24 16:14:41'),
('30000213BAE1D3', '30000213', 'BAE1D', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 16:20:48'),
('30000213BAE1D4', '30000213', 'BAE1D', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 16:25:08'),
('30000213BCT2H1', '30000213', 'BCT2H', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 16:20:53'),
('30000213BCT2H2', '30000213', 'BCT2H', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 16:55:37'),
('30000213ESO3C1', '30000213', 'ESO3C', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 16:55:29'),
('30000213ESO3C2', '30000213', 'ESO3C', 2, 1, 0, 'NEE-Derivadas de discapacidad', 'Intelectual moderada', '0', '0', '0', '2025-09-24 16:55:44'),
('30000213ESO3C3', '30000213', 'ESO3C', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-24 17:16:34'),
('30000213ESO4C1', '30000213', 'ESO4C', 11, 1, 1, 'Trastornos del desarrollo del lenguaje y la comuni', 'Sin especificar', 'Altas capacidades intelectuales', 'Sin especificar', '0', '2025-09-26 15:12:03'),
('30000213ESO4C2', '30000213', 'ESO4C', 2, 0, 0, '0', '0', '0', '0', '0', '2025-09-26 15:39:52'),
('30000213INF1A1', '30000213', 'INF1A', 2, 1, 0, 'Altas capacidades intelectuales', 'Talento complejo académico', '0', '0', '0', '2025-09-24 17:16:25'),
('30000213INF3A1', '30000213', 'INF3A', 0, 1, 1, 'TDAH', 'Leve', 'Dislexia', 'Comprensión', '', '2025-09-22 23:27:35'),
('30000377CFM2A1', '30000377', 'CFM2A', 1, 1, 0, 'Trastornos del aprendizaje', 'Discalculia', 'Desconocimiento grave de la lengua', 'Recibe apoyo complementario sin ser de incorporaci', 'sdolñw', '2025-09-24 17:21:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_asignaciones`
--

CREATE TABLE `ti_asignaciones` (
  `id_asignacion` int(10) UNSIGNED NOT NULL,
  `id_alu` varchar(50) NOT NULL,
  `cod_grupo` varchar(20) NOT NULL,
  `cod_materia` varchar(50) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_asignador` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_asignaciones`
--

INSERT INTO `ti_asignaciones` (`id_asignacion`, `id_alu`, `cod_grupo`, `cod_materia`, `fecha_asignacion`, `usuario_asignador`) VALUES
(10, '30000213INF1A1', 'INF1A', 'OPT_2', '2025-09-26 10:52:45', NULL),
(14, '30000213BCT2H2', 'BCT2H', 'OPT_33', '2025-09-26 10:56:39', NULL),
(15, '30000213BCT2H2', 'BCT2H', 'OPT_40', '2025-09-26 10:56:39', NULL),
(16, '30000213BCT2H2', 'BCT2H', 'OPT_1', '2025-09-26 10:56:39', NULL),
(17, '30000213BCT2H1', 'BCT2H', 'OPT_33', '2025-09-26 10:57:15', NULL),
(18, '30000213BCT2H1', 'BCT2H', 'OPT_41', '2025-09-26 10:57:15', NULL),
(19, '30000213BCT2H1', 'BCT2H', 'OPT_1', '2025-09-26 10:57:15', NULL),
(29, '30000213ESO3C2', 'ESO3C', 'OPT_10', '2025-09-26 14:08:06', NULL),
(30, '30000213ESO3C2', 'ESO3C', 'OPT_1', '2025-09-26 14:08:06', NULL),
(31, '30000213BAE1D2', 'BAE1D', 'OPT_36', '2025-09-26 14:08:29', NULL),
(32, '30000213BAE1D2', 'BAE1D', 'OPT_56', '2025-09-26 14:08:29', NULL),
(33, '30000213BAE1D2', 'BAE1D', 'OPT_75', '2025-09-26 14:08:29', NULL),
(34, '30000213BAE1D2', 'BAE1D', 'OPT_89', '2025-09-26 14:08:29', NULL),
(35, '30000213BAE1D2', 'BAE1D', 'OPT_1', '2025-09-26 14:08:29', NULL),
(45, '30000213BAE1D4', 'BAE1D', 'OPT_36', '2025-09-26 15:32:04', NULL),
(46, '30000213BAE1D4', 'BAE1D', 'OPT_56', '2025-09-26 15:32:04', NULL),
(47, '30000213BAE1D4', 'BAE1D', 'OPT_75', '2025-09-26 15:32:04', NULL),
(48, '30000213BAE1D4', 'BAE1D', 'OPT_76', '2025-09-26 15:32:04', NULL),
(49, '30000213BAE1D4', 'BAE1D', 'OPT_1', '2025-09-26 15:32:04', NULL),
(50, '30000213BAE1D1', 'BAE1D', 'OPT_36', '2025-09-26 15:32:11', NULL),
(51, '30000213BAE1D1', 'BAE1D', 'OPT_57', '2025-09-26 15:32:11', NULL),
(52, '30000213BAE1D1', 'BAE1D', 'OPT_89', '2025-09-26 15:32:11', NULL),
(53, '30000213BAE1D1', 'BAE1D', 'OPT_1', '2025-09-26 15:32:11', NULL),
(54, '30000213BAE1D3', 'BAE1D', 'OPT_36', '2025-09-26 15:32:36', NULL),
(55, '30000213BAE1D3', 'BAE1D', 'OPT_59', '2025-09-26 15:32:36', NULL),
(56, '30000213BAE1D3', 'BAE1D', 'OPT_89', '2025-09-26 15:32:36', NULL),
(57, '30000213BAE1D3', 'BAE1D', 'OPT_2', '2025-09-26 15:32:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_fase0`
--

CREATE TABLE `ti_fase0` (
  `id_fase0` int(11) NOT NULL,
  `id_alu` varchar(50) NOT NULL,
  `form_MP` tinyint(1) DEFAULT 0,
  `form_F` tinyint(1) DEFAULT 0,
  `form_OI` tinyint(1) DEFAULT 0,
  `form_R1PT` tinyint(1) DEFAULT 0,
  `form_R2AO` tinyint(1) DEFAULT 0,
  `form_R3AL` tinyint(1) DEFAULT 0,
  `form_R4OR` tinyint(1) DEFAULT 0,
  `completado` tinyint(1) DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_fase0_forms`
--

CREATE TABLE `ti_fase0_forms` (
  `id_form` int(11) NOT NULL,
  `nombre_form` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_fase0_forms`
--

INSERT INTO `ti_fase0_forms` (`id_form`, `nombre_form`, `descripcion`) VALUES
(1, 'Formulario MP', NULL),
(2, 'Formulario F', NULL),
(3, 'Formulario OI', NULL),
(4, 'Formulario R1PT', NULL),
(5, 'Formulario R2AP', NULL),
(6, 'Formulario R3OR', NULL),
(7, 'Formulario R4OR', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_fase0_respuestas`
--

CREATE TABLE `ti_fase0_respuestas` (
  `id_fase0_resp` int(11) NOT NULL,
  `id_alu` varchar(50) NOT NULL,
  `id_texto` int(11) NOT NULL,
  `seleccionado` tinyint(1) DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_fase0_textos`
--

CREATE TABLE `ti_fase0_textos` (
  `id_texto` int(11) NOT NULL,
  `id_formulario` varchar(10) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `frase_si` text NOT NULL,
  `frase_no` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_fase0_textos`
--

INSERT INTO `ti_fase0_textos` (`id_texto`, `id_formulario`, `titulo`, `frase_si`, `frase_no`) VALUES
(1, 'F', 'Se mantuvo conversación con miembro del entorno familiar F1', 'Se recogieron datos y propuestas de cooperación del entorno familiar para este curso', 'No hubo contacto con el entorno familiar previo a este PAP'),
(2, 'F', 'Transmitido lo que supone el \"acompañamiento escolar desde la familia\"', 'Se transmitió el mensaje de al menos 6 NECESIDADES DE TODO ALUMNO/a: APOYO EMOCIONAL, procurando un clima de seguridad para ayudar en la gestión de sus emociones; APOYO DIDÁCTICO, consistente en una precisa ayuda para que realice con autonomía sus tareas; COLABORACIÓN CONSTRUCTIVA CON LOS DOCENTES; Creación de un ESPACIO DE ESTUDIO en casa  y el FOMENTO DEL INTERÉS por el aprendizaje.', ''),
(3, 'F', 'Transmitidas las 3 claves para el desarrollo del alumno que supone la cooperación familiar', 'Se le comunicó que bueno es para el desarrollo del alumno/a que con el centro se mantenga una buena COLABORACIÓN, una COMUNICACIÓN ABIERTA y la participación en cuantas ACTIVIDADES se pueda.', 'Frase F3 no seleccionada'),
(4, 'F', 'Recibidos datos confidenciales', 'Se ha comunicado que tiene una situación médica, emocional, familiar,... que es necesaria ser conocida por el equipo docente y que se informará confidencialmente a cada uno de ellos.', 'No se ha comunicado situación médica, emocional, familiar,... alguna necesaria ser conocida por el centro.'),
(5, 'F', 'Habrá supervisión familiar de los trabajos', 'La familia ha comunicado que en la medida de sus posibilidades horarias se realizará un seguimiento al trabajo del alumno/a en el centro y en casa.', ''),
(6, 'F', 'Apoyo externo y coherencia con el centro', 'La familia se compromete, en el caso de ayuda externa que reciba el alumno/a, a buscar la coherencia con lo que el centro le está ofreciendo.', ''),
(7, 'F', 'Buen trabajo conlleva a buenas amistades.', 'Tutor/a y familia comparten que el buen trabajo también provoca buenas amistades y que es compatible tener amigos en el centro con su responsabilidad ante la tarea. Esta idea se potenciará en casa.', ''),
(8, 'F', 'Las dudas en clase se resuelven', 'Se coincide con la familia que cuando se estudia surgen dudas y estas deben preguntarse después de un esfuerzo personal sobre la tarea, y el último lugar para aclararlas es en clase.', ''),
(9, 'F', 'Paciencia, calma y dialogo ante el conflicto', 'Se promoverá en casa la resolución de cualquier conflicto en calma, con paciencia y de forma dialogada ya que de hacerlo así se contribuye al desarrollo personal del alumno.', ''),
(10, 'F', 'Relación entre dedicación y resultado.', 'En la mayoría de los casos siempre están relacionados dedicación a la tarea y buen logro. Cuando no sea así hay que analizar las razones de ello para mejorar.', ''),
(11, 'MP', 'Con PAP', 'El equipo docente adoptó medidas personalizadas.', 'No dispuso de medidas personalizadas.'),
(12, 'MP', 'Con ACSI', 'Se le hizo una adaptación currícular significativa individualizada al menos en una materia.', 'No se le hizo adaptación currícular significativa individualizada alguna.'),
(13, 'MP', 'Con apoyo especializado en el centro', 'Dispuso de apoyo especializado por su condición de acneae.', 'No dispuso de apoyo especializado por su condición de acneae.'),
(14, 'MP', 'Con refuerzo educativo en el centro', 'Dispuso de refuerzo educativo en el centro.', 'No dispuso de refuerzo educativo en el centro.'),
(15, 'MP', 'Con apoyo externo aportado por la familia', 'Ha tenido apoyo fuera del centro bien yendo a academias o con profesores particulares.', 'Ha tenido apoyo docente fuera del centro.'),
(16, 'MP', 'Repetición de curso', 'Se le aplicó la medida de permanecer en el mismo curso una vez.', 'No ha repetido curso.'),
(17, 'MP', 'Con medidas correctivas importantes reflexionar, responsabilizarse y evitar repetición.', 'Ha tenido medidas correctivas importantes reflexionar, responsabilizarse y evitar repetición.', 'No ha tenido medidas educativas importantes para corregir conductas.'),
(18, 'MP', 'Todas las materias superadas al finalizar el curso anterior', 'Las medidas adoptadas dieron un resultado positivo, todas las materias fueron superadas.', ''),
(19, 'MP', 'Una o dos materias no superadas al finalizar el curso anterior', 'Hay que replantear las medidas sabiendo que las que se adoptaron dieron un resultado no totalmente satisfactorio ya que tuvo entre una o dos materias negativas.', ''),
(20, 'MP', 'Tres o más materias no superadas al finalizar el curso anterior', 'Hay que plantear las medidas sabiendo que las que se adoptaron tienen que ser reforzadas por haber terminado con más de dos materias sin superar.', ''),
(21, 'OI', 'INICIÓ ETAPA EN EL CENTRO', 'Empezó la etapa en el centro.', 'No empezó la etapa en el centro'),
(22, 'OI', 'No hay informe', '', 'No se dispone del texto del informe.'),
(23, 'OI', 'Menos de 2 cursos', '', 'La situación del alumno/a se describió hace menos de dos años en un informe.'),
(24, 'OI', '3-4 cursos', 'La situación del alumno/a se describió hace entre 3 y 4 años en un informe.', ''),
(25, 'OI', '5 cursos o más', 'La situación del alumno/a se describió hace más de 4 años en un informe.', ''),
(26, 'OI', 'PT', 'El informe proponía PT.', ''),
(27, 'OI', 'AL', 'El informe proponía AL.', ''),
(28, 'OI', 'OTROS', 'El informe proponía apoyos complementarios.', ''),
(29, 'OI', 'En clase', 'La familia ha dado su conformidad a los apoyos en clase', ''),
(30, 'OI', 'Fuera de clase', 'La familia ha dado su conformidad a los apoyos fuera de clase', ''),
(31, 'R1PT', '¿APOYO DE PT?', 'Tendrá intervención del/de la especialista de Pedagogía Terapéutica.', 'No tendrá intervención del es espcialista de Pedagogía Terapéutica.'),
(32, 'R1PT', 'Solo', 'Solo', ''),
(33, 'R1PT', 'Pequeño Grupo', 'Pequeño Grupo', ''),
(34, 'R1PT', 'En clase', 'En clase', ''),
(35, 'R1PT', 'Fuera de clase', 'Fuera de clase', ''),
(36, 'R1PT', 'Competencia lingüística', 'Atender aspectos relacionados con habilidades lecto-escritoras', ''),
(37, 'R1PT', 'Competencia matemática', 'Trabajar la mejorara de su competencia matemática', ''),
(38, 'R1PT', 'Funciones ejecutivas', 'Potenciar el desarrollo de funciones ejecutivas', ''),
(39, 'R1PT', 'Conducta', 'Mejorar sus habilidades sociales', ''),
(40, 'R1PT', 'Emociones', 'Fortalecer su equilibrio emocional', ''),
(41, 'R2AO', '¿APOYO ORDINARIO?', 'Estará en el programa de apoyo ordinario', 'No estará en el programa de apoyo ordinario'),
(42, 'R2AO', 'Solo', 'Solo', ''),
(43, 'R2AO', 'Pequeño Grupo', 'Pequeño Grupo', ''),
(44, 'R2AO', 'En clase', 'En clase', ''),
(45, 'R2AO', 'Fuera de clase', 'Fuera de clase', ''),
(46, 'R2AO', 'Habilidades lecto-escritoras', 'Atender aspectos relacionados con habilidades lecto-escritoras', ''),
(47, 'R2AO', 'Funciones ejecutivas', 'Potenciar el desarrollo de funciones ejecutivas', ''),
(48, 'R2AO', 'Competencia matemática', 'Trabajar la mejorar de su competencia matemática', ''),
(49, 'R2AO', 'Estrategias de aprendizaje', 'Mejorar sus estrategias de aprendizaje', ''),
(50, 'R2AO', 'Consolidación', 'Consolidar lo tratado en clase', ''),
(51, 'R3AL', '¿APOYO DE AL?', 'Con intervención del/de la especialista de Audición y Lenguaje', 'Sin intervención del de Audición y Lenguaje'),
(52, 'R3AL', 'Solo', 'Solo', ''),
(53, 'R3AL', 'Pequeño Grupo', 'Pequeño Grupo', ''),
(54, 'R3AL', 'En clase', 'En clase', ''),
(55, 'R3AL', 'Fuera de clase', 'Fuera de clase', ''),
(56, 'R3AL', 'Percepción auditiva', 'Atender sus habilidades en la percepción auditiva del habla', ''),
(57, 'R3AL', 'Claridad en la expresión oral', 'Ejercitar su expresión oral', ''),
(58, 'R3AL', 'Conversaciones', 'Practicar habilidades comunicativas en las conversaciones', ''),
(59, 'R3AL', 'Alternativas a la lectoescritura', 'Practicar las alternativas a la lectoescritura que precise', ''),
(60, 'R3AL', 'Comprensión de textos', 'Mejorar su competencia comprensiva de textos escritos', ''),
(61, 'R4OA', '¿OTROS RECURSOS?', 'Tendrá recursos complementarios', 'No tendrá recursos complementarios'),
(62, 'R4OA', 'Auxiliar Técnico Educativo', 'Será atendido por auxiliar técnico educativo', ''),
(63, 'R4OA', 'Fisioterapeuta', 'Tiene sesiones de fisioterapeuta en el centro', ''),
(64, 'R4OA', 'Lenguaje de Signos', 'Le asiste especialista de lenguaje de signos', ''),
(65, 'R4OA', 'Fuera de clase', 'Fuera de clase', ''),
(66, 'R4OA', 'Desconocimiento de Idioma', 'Con sesiones para aprender español', ''),
(67, 'R4OA', 'Para compensar situaciones personales', 'Ejercitar su expresión oral', ''),
(68, 'R4OA', 'Otro tipo de recurso', 'Se le ayuda educativamente por situación personal', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_fase_dua`
--

CREATE TABLE `ti_fase_dua` (
  `id_alu` varchar(50) NOT NULL,
  `d1_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d2_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d3_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d4_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d5_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d6_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d7_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d8_completado` tinyint(1) NOT NULL DEFAULT 0,
  `d9_completado` tinyint(1) NOT NULL DEFAULT 0,
  `fasedua_completada` tinyint(1) GENERATED ALWAYS AS (`d1_completado` <> 0 and `d2_completado` <> 0 and `d3_completado` <> 0 and `d4_completado` <> 0 and `d5_completado` <> 0 and `d6_completado` <> 0 and `d7_completado` <> 0 and `d8_completado` <> 0 and `d9_completado` <> 0) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `cod_grupo` varchar(50) DEFAULT NULL,
  `listado` int(11) NOT NULL,
  `tipo_completado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ti_gr1`
--

INSERT INTO `ti_gr1` (`id`, `id_user`, `cod_centro`, `Etapa`, `Modalidad`, `Curso`, `Grupo`, `cod_grupo`, `listado`, `tipo_completado`) VALUES
(40, 2, '30000213', 'Infantil', '', 1, 'A', 'INF1A', 1, 0),
(42, 2, '30000213', 'ESO', 'ESO', 3, 'C', 'ESO3C', 3, 0),
(43, 2, '30000213', 'Bachillerato', 'BAE', 1, 'D', 'BAE1D', 4, 0),
(44, 2, '30000213', 'Bachillerato', 'BCT', 2, 'H', 'BCT2H', 2, 0),
(45, 2, '30000213', 'Infantil', '', 3, 'A', 'INF3A', 1, 0),
(46, 1, '30000377', 'FP', 'CFM', 2, 'A', 'CFM2A', 1, 0),
(47, 9, '30000389', 'FP', 'CFS', 2, 'A', 'CFS2A', 20, 0),
(48, 11, '30000213', 'ESO', 'ESO', 4, 'C', 'ESO4C', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_materias`
--

CREATE TABLE `ti_materias` (
  `cod_materia` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('comun','optativa') NOT NULL,
  `niveles` varchar(250) NOT NULL,
  `bloque` varchar(50) DEFAULT NULL,
  `seleccion_min` int(11) DEFAULT NULL,
  `seleccion_max` int(11) DEFAULT NULL,
  `obligatoria` tinyint(1) DEFAULT 0,
  `orden` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_materias`
--

INSERT INTO `ti_materias` (`cod_materia`, `nombre`, `tipo`, `niveles`, `bloque`, `seleccion_min`, `seleccion_max`, `obligatoria`, `orden`, `descripcion`) VALUES
('', '', '', '', NULL, NULL, NULL, 0, NULL, NULL),
('Asig_1', 'Crecimiento en Armonía', 'comun', 'INF1,INF2,INF3', NULL, NULL, NULL, 1, 1, 'Asignatura común INF'),
('Asig_10', 'Matemáticas', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6,ESO1,ESO2,ESO3', NULL, NULL, NULL, 1, 10, 'Asignatura común PRI1-6'),
('Asig_11', 'Música y Danza', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6', NULL, NULL, NULL, 1, 11, 'Asignatura común PRI1-6'),
('Asig_12', 'Profundización Educativa', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5', NULL, NULL, NULL, 1, 12, 'Asignatura común PRI1-5'),
('Asig_13', 'Valores Cívicos y éticos', 'comun', 'PRI6', NULL, NULL, NULL, 1, 13, 'Asignatura PRI6'),
('Asig_14', 'Tecnología y Digitalización', 'comun', 'ESO1,ESO3', NULL, NULL, NULL, 1, 14, 'Asignatura común PRI'),
('Asig_15', 'Ámbito Socio-lingüistico', 'comun', 'DIV1,DIV2', NULL, NULL, NULL, 1, 15, 'Asignatura común PRI'),
('Asig_16', 'Música', 'comun', 'DIV1,DIV2,ESO2,ESO3', NULL, NULL, NULL, 1, 16, 'Asignatura común PRI'),
('Asig_17', 'Ámbito Científico-Tecnológico', 'comun', 'DIV1,DIV2', NULL, NULL, NULL, 1, 17, ''),
('Asig_18', 'Filosofía', 'comun', 'BCT1,BHS1,BAP1,BAE1,BGR1', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_19', 'Historia de la Filosofía', 'comun', 'BCT2,BHS2,BAP2,BAE2,BGR2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_2', 'Descubrimiento y Exploración del Entorno', 'comun', 'INF1,INF2,INF3', NULL, NULL, NULL, 1, 2, 'Asignatura común INF'),
('Asig_20', 'Ámbito de Comunicación y Ciencias Sociales', 'comun', 'CFB1,CFB2', NULL, NULL, NULL, 1, 3, 'Asignatura común CFB'),
('Asig_21', 'Ámbito de Ciencias Aplicadas', 'comun', 'CFB1,CFB2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_22', '1er Modulo Profesional Asociado', 'comun', 'CFB1,CFB2,CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_23', '2º Modulo Profesional Asociado', 'comun', 'CFB1,CFB2,CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_24', '3er Modulo Profesional Asociado', 'comun', 'CFB1,CFB2,CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_25', '4º Modulo Profesional Asociado', 'comun', 'CFB1,CFB2,CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_26', '5º Modulo Profesional Asociado', 'comun', 'CFB1,CFB2,CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_27', '6º Modulo Profesional Asociado', 'comun', 'CFB1,CFB2,CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_28', '7º Modulo Profesional Asociado', 'comun', 'CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_29', '8º Modulo Profesional Asociado', 'comun', 'CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_3', 'Comunicación y Representación de la Realidad', 'comun', 'INF1,INF2,INF3', NULL, NULL, NULL, 1, 3, 'Asignatura común INF'),
('Asig_30', '9º Modulo Profesional Asociado', 'comun', 'CFM1,CFM2,CFS1,CFS2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_31', 'Proyecto Intermodular', 'comun', 'CFB1,CFB2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_32', 'Educación en Valores Cívicos y Éticos', 'comun', 'ESO2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_33', 'Educación Plástica, Visual y Audiovisual', 'comun', 'ESO2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_34', 'Formación y Orientación Profesional y Personal', 'comun', 'DIV2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_35', 'Historia de España', 'comun', 'BCT2,BHS2,BAP2,BAE2,BGR2', NULL, NULL, NULL, 1, 3, 'Asignatura común PRI'),
('Asig_4', 'Ciencias de la Naturaleza', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6', NULL, NULL, NULL, 1, 4, 'Asignatura común PRI1-6'),
('Asig_5', 'Ciencias Sociales', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6', NULL, NULL, NULL, 1, 5, 'Asignatura común PRI1-6'),
('Asig_6', 'Educación Física', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6,ESO1,ESO2,ESO3,ESO4,DIV1,DIV2,BCT1,BHS1,BAP1,BAE1,BGR1', NULL, NULL, NULL, 1, 6, 'Asignatura común PRI1-6'),
('Asig_7', 'Educación Plástica y Visual', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6', NULL, NULL, NULL, 1, 7, 'Asignatura común PRI1-6'),
('Asig_8', 'Lengua Castellana y Literatura', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6,ESO1,ESO2,ESO3,ESO4,BCT1,BHS1,BAP1,BAE1,BGR1,BCT2,BHS2,BAP2,BAE2,BGR2', NULL, NULL, NULL, 1, 8, 'Asignatura común PRI1-6'),
('Asig_9', 'Lengua Extranjera', 'comun', 'PRI1,PRI2,PRI3,PRI4,PRI5,PRI6,ESO1,ESO2,ESO3,ESO4,DIV1,DIV2,BCT1,BHS1,BAP1,BAE1,BGR1,BCT2,BHS2,BAP2,', NULL, NULL, NULL, 1, 9, 'Asignatura común PRI1-6'),
('OPT_1', 'Religión', 'optativa', 'INF1,INF2,INF3,PRI1,PRI2,PRI3,PRI4,PRI5,PRI6,ESO1,ESO2,ESO3,ESO4,DIV1,DIV2,CFM1,CFM2,CFB1,CFB2,CFS1,BGR1,BGR2,BCT1,BCT2,BHS1,BHS2,BAE1,BAE2,BAP1,BAP2', 'B_REL', 1, 1, 1, 1, 'Asignatura optativa Religión'),
('OPT_10', 'Cultura clásica', 'optativa', 'DIV1,ESO3', 'B_ART', 1, 1, 1, 3, 'Asignatura optativa ART'),
('OPT_11', 'Digitalización Creativa', 'optativa', 'DIV1,ESO3', 'B_ART', 1, 1, 1, 4, 'Asignatura optativa ART'),
('OPT_12', 'Emprendimiento Personal y Social', 'optativa', 'DIV1,ESO3', 'B_ART', 1, 1, 1, 5, 'Asignatura optativa ART'),
('OPT_13', 'Segunda Lengua Extranjera', 'optativa', 'DIV1,ESO3', 'B_ART', 1, 1, 1, 6, 'Asignatura optativa ART'),
('OPT_14', 'Lengua de Signos Española', 'optativa', 'DIV1,ESO3,ESO4,DIV2', 'B_ART', 1, 1, 1, 7, 'Asignatura optativa ART'),
('OPT_15', 'Creaciones Audiovisuales y Plasticas', 'optativa', 'DIV2,ESO4', 'B_ART', 1, 1, 1, 8, 'Asignatura optativa ART'),
('OPT_16', 'Creaciones Escénico-Musicales', 'optativa', 'DIV2,ESO4', 'B_ART', 1, 1, 1, 9, 'Asignatura optativa ART'),
('OPT_17', 'Educación Financiera y Consumo Responsable', 'optativa', 'DIV2,ESO4', 'B_ART', 1, 1, 1, 10, 'Asignatura optativa ART'),
('OPT_18', 'El mundo clásico: Lenguaje, Historia y Patrimonio', 'optativa', 'DIV2,ESO4', 'B_ART', 1, 1, 1, 11, 'Asignatura optativa ART'),
('OPT_19', 'Filosofía, Retórica y Argumentación', 'optativa', 'DIV2,ESO4', 'B_ART', 1, 1, 1, 12, 'Asignatura optativa ART'),
('OPT_2', 'Atención Educativa', 'optativa', 'INF1,INF2,INF3,PRI1,PRI2,PRI3,PRI4,PRI5,PRI6,ESO1,ESO2,ESO3,ESO4,DIV1,DIV2,CFM1,CFM2,CFB1,CFB2,CFS1,BGR1,BGR2,BCT1,BCT2,BHS1,BHS2,BAE1,BAE2,BAP1,BAP2', 'B_REL', 1, 1, 1, 2, 'Asignatura optativa Atención Educativa'),
('OPT_20', 'Investigación Científica e Innovación Tecnológica', 'optativa', 'DIV2,ESO4', 'B_ART', 1, 1, 1, 13, 'Asignatura optativa ART'),
('OPT_21', 'Biología y Geología', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 1, 'Asignatura optativa ESO'),
('OPT_22', 'Digitalización', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 2, 'Asignatura optativa ESO'),
('OPT_23', 'Economía y Emprendimiento', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 3, 'Asignatura optativa ESO'),
('OPT_24', 'Expresión Artística', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 4, 'Asignatura optativa ESO'),
('OPT_25', 'Física y Química', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 5, 'Asignatura optativa ESO'),
('OPT_26', 'Formación y Orientación Personal y Profesional', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 6, 'Asignatura optativa ESO'),
('OPT_27', 'Latín', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 7, 'Asignatura optativa ESO'),
('OPT_28', 'Música', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 8, 'Asignatura optativa ESO'),
('OPT_29', 'Segunda Lengua Extranjera', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 9, 'Asignatura optativa ESO'),
('OPT_3', 'Matemáticas A', 'optativa', 'ESO4', 'B_MAT', 1, 1, 1, 1, 'Asignatura optativa MAT ESO4'),
('OPT_30', 'Tecnología', 'optativa', 'ESO4', 'B_ESO', 3, 3, 1, 10, 'Asignatura optativa ESO'),
('OPT_31', 'Matemáticas', 'optativa', 'BCT1,BCT2', 'B_BACH1', 1, 1, 1, 1, 'Asignatura optativa BACH'),
('OPT_32', 'Matemáticas Generales', 'optativa', 'BGR1', 'B_BACH1', 1, 1, 1, 2, 'Asignatura optativa BACH'),
('OPT_33', 'Matemáticas Aplicadas a las CCSS', 'optativa', 'BCT2,BHS1,BHS2', 'B_BACH1', 1, 1, 1, 3, 'Asignatura optativa BACH'),
('OPT_34', 'Latin', 'optativa', 'BHS1,BHS2', 'B_BACH1', 1, 1, 1, 4, 'Asignatura optativa BACH'),
('OPT_35', 'Análisis Musical', 'optativa', 'BAE1,BAE2', 'B_BACH1', 1, 1, 1, 5, 'Asignatura optativa BACH'),
('OPT_36', 'Artes Escénicas', 'optativa', 'BAE1,BAE2', 'B_BACH1', 1, 1, 1, 6, 'Asignatura optativa BACH'),
('OPT_37', 'Dibujo Artístico', 'optativa', 'BAP1,BAP2', 'B_BACH1', 1, 1, 1, 7, 'Asignatura optativa BACH'),
('OPT_38', 'Ciencias Generales', 'optativa', 'BGR2', 'B_BACH1', 1, 1, 1, 8, 'Asignatura optativa BACH'),
('OPT_39', 'Biología Geología y Ciencias Ambientales', 'optativa', 'BCT1', 'B_BACH2', 1, 1, 1, 1, 'Asignatura optativa BACH'),
('OPT_4', 'Matemáticas B', 'optativa', 'ESO4', 'B_MAT', 1, 1, 1, 2, 'Asignatura optativa MAT ESO4'),
('OPT_40', 'Biología', 'optativa', 'BCT2', 'B_BACH2', 1, 1, 1, 2, 'Asignatura optativa BACH'),
('OPT_41', 'Dibujo Técnico', 'optativa', 'BCT1,BCT2', 'B_BACH2', 1, 1, 1, 3, 'Asignatura optativa BACH'),
('OPT_42', 'Fisica y Química', 'optativa', 'BCT1', 'B_BACH2', 1, 1, 1, 4, 'Asignatura optativa BACH'),
('OPT_43', 'Fisica', 'optativa', 'BCT2', 'B_BACH2', 1, 1, 1, 5, 'Asignatura optativa BACH'),
('OPT_44', 'Química', 'optativa', 'BCT2', 'B_BACH2', 1, 1, 1, 28, 'Asignatura optativa BACH'),
('OPT_45', 'Geología y Ciencas Ambientales', 'optativa', 'BCT2', 'B_BACH2', 1, 1, 1, 29, 'Asignatura optativa BACH'),
('OPT_46', 'Tecnología e Ingeniería', 'optativa', 'BCT1,BCT2', 'B_BACH2', 1, 1, 1, 6, 'Asignatura optativa BACH'),
('OPT_47', 'Economía', 'optativa', 'BHS1', 'B_BACH2', 1, 1, 1, 7, 'Asignatura optativa BACH'),
('OPT_48', 'Griego', 'optativa', 'BHS1,BHS2', 'B_BACH2', 1, 1, 1, 8, 'Asignatura optativa BACH'),
('OPT_49', 'Literatura Universal', 'optativa', 'BHS1', 'B_BACH2', 1, 1, 1, 9, 'Asignatura optativa BACH'),
('OPT_5', 'Segunda Lengua Extranjera', 'optativa', 'PRI5,PRI6,ESO1,ESO2', 'B_IDI', 1, 1, 1, 1, 'Asignatura optativa ESO4'),
('OPT_50', 'Historia del Arte', 'optativa', 'BHS2', 'B_BACH2', 1, 1, 1, 10, 'Asignatura optativa BACH'),
('OPT_51', 'Geografía', 'optativa', 'BHS2', 'B_BACH2', 1, 1, 1, 11, 'Asignatura optativa BACH'),
('OPT_52', 'Latín', 'optativa', 'BHS1,BHS2', 'B_BACH2', 1, 1, 1, 12, 'Asignatura optativa BACH'),
('OPT_53', 'Historia del Mundo ContemporáneoArte', 'optativa', 'BHS1', 'B_BACH2', 1, 1, 1, 13, 'Asignatura optativa BACH'),
('OPT_54', 'Empresa y Diseño de Modelos de Negocios', 'optativa', 'BHS2', 'B_BACH2', 1, 1, 1, 14, 'Asignatura optativa BACH'),
('OPT_55', 'Análisis Musical', 'optativa', 'BAE1,BAE2', 'B_BACH2', 1, 1, 1, 15, 'Asignatura optativa BACH'),
('OPT_56', 'Artes Escénicas', 'optativa', 'BAE1,BAE2', 'B_BACH2', 1, 1, 1, 16, 'Asignatura optativa BACH'),
('OPT_57', 'Cultura Audiovisual', 'optativa', 'BAE1', 'B_BACH2', 1, 1, 1, 17, 'Asignatura optativa BACH'),
('OPT_58', 'Coro y Técnica Vocal', 'optativa', 'BAE1,BAE2', 'B_BACH2', 1, 1, 1, 18, 'Asignatura optativa BACH'),
('OPT_59', 'Lenguaje y Práctica Audiovisual', 'optativa', 'BAE1', 'B_BACH2', 1, 1, 1, 19, 'Asignatura optativa BACH'),
('OPT_6', 'Refuerzo de la Competencia en Comunicación Lingüística', 'optativa', 'PRI5,PRI6,ESO1,ESO2', 'B_IDI', 1, 1, 1, 2, 'Asignatura optativa ESO4'),
('OPT_60', 'Literatura Dramática', 'optativa', 'BAE2', 'B_BACH2', 1, 1, 1, 20, 'Asignatura optativa BACH'),
('OPT_61', 'Historia de la Música y la Danza', 'optativa', 'BAE2', 'B_BACH2', 1, 1, 1, 30, 'Asignatura optativa BACH'),
('OPT_62', 'Diseño', 'optativa', 'BAP2', 'B_BACH2', 1, 1, 1, 21, 'Asignatura optativa BACH'),
('OPT_63', 'Dibujo Técnico Aplicado a las Artes Plásticas y al Diseño', 'optativa', 'BAP1,BAP2', 'B_BACH2', 1, 1, 1, 22, 'Asignatura optativa BACH'),
('OPT_64', 'Imagen Digital', 'optativa', 'BAP2', 'B_BACH2', 1, 1, 1, 23, 'Asignatura optativa BACH'),
('OPT_65', 'Proyectos Artísticos', 'optativa', 'BAP1', 'B_BACH2', 1, 1, 1, 24, 'Asignatura optativa BACH'),
('OPT_66', 'Volumen', 'optativa', 'BAP1', 'B_BACH2', 1, 1, 1, 25, 'Asignatura optativa BACH'),
('OPT_67', 'Fundamentos Artísticos', 'optativa', 'BAP2', 'B_BACH2', 1, 1, 1, 26, 'Asignatura optativa BACH'),
('OPT_68', 'Técnicas de Expresión Gráfico-Plástica', 'optativa', 'BAP2', 'B_BACH2', 1, 1, 1, 27, 'Asignatura optativa BACH'),
('OPT_69', 'Economía Emprendimiento y Actividad Empresarial', 'optativa', 'BGR1', 'B_BACH2', 1, 1, 1, 31, 'Asignatura optativa BACH'),
('OPT_7', 'Lengua de signos Española', 'optativa', 'ESO1,ESO2,PRI5,PRI6', 'B_IDI', 1, 1, 1, 3, 'Asignatura optativa ESO4'),
('OPT_70', 'Movimientos Culturales y Artísticos', 'optativa', 'BGR2', 'B_BACH2', 1, 1, 1, 32, 'Asignatura optativa BACH'),
('OPT_71', '1X1', 'optativa', 'BAP1', 'B_BACH2', 1, 1, 1, 33, 'Asignatura optativa BACH'),
('OPT_72', '1X2', 'optativa', 'BAP2', 'B_BACH2', 1, 1, 1, 34, 'Asignatura optativa BACH'),
('OPT_73', '1X3', 'optativa', 'BAP2', 'B_BACH2', 1, 1, 1, 35, 'Asignatura optativa BACH'),
('OPT_74', 'Anatomía Aplicada', 'optativa', 'BAP1,BAE1,BGR1,BHS1,BCT1', 'B_BACH3', 0, 2, 0, 1, 'Asignatura optativa BACH'),
('OPT_75', 'Digitalización y Ofimática', 'optativa', 'BAP1,BAE1,BGR1,BHS1,BCT1', 'B_BACH3', 0, 2, 0, 2, 'Asignatura optativa BACH'),
('OPT_76', 'Finanzas Responsables', 'optativa', 'BAP1,BAE1,BGR1,BHS1,BCT1', 'B_BACH3', 0, 2, 0, 3, 'Asignatura optativa BACH'),
('OPT_77', 'Herencia y Mitología Clásicas', 'optativa', 'BAP1,BAE1,BGR1,BHS1,BCT1', 'B_BACH3', 0, 2, 0, 4, 'Asignatura optativa BACH'),
('OPT_78', 'Música, Espectáculo y Comunicación', 'optativa', 'BAP1,BAE1,BGR1,BHS1,BCT1', 'B_BACH3', 0, 2, 0, 5, 'Asignatura optativa BACH'),
('OPT_79', 'Digitalización y Programación', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 6, 'Asignatura optativa BACH'),
('OPT_8', 'Artes Escénicas y Danza', 'optativa', 'DIV1,ESO3', 'B_ART', 1, 1, 1, 1, 'Asignatura optativa ART'),
('OPT_80', 'Electrotécnia', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 7, 'Asignatura optativa BACH'),
('OPT_81', 'Imagen Digital', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 8, 'Asignatura optativa BACH'),
('OPT_82', 'Imagen y Sonido', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 9, 'Asignatura optativa BACH'),
('OPT_83', 'Nuevos Medios Audiovisuales', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 10, 'Asignatura optativa BACH'),
('OPT_84', 'Pervivencia Clásica y Mitología', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 11, 'Asignatura optativa BACH'),
('OPT_85', 'Producción e Interpretación Musical', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 2, 0, 12, 'Asignatura optativa BACH'),
('OPT_86', 'Psicología', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH3', 0, 1, 0, 13, 'Asignatura optativa BACH'),
('OPT_87', 'Fundamentos de Administración y Gestión', 'optativa', 'BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH4', 0, 1, 0, 1, 'Asignatura optativa BACH'),
('OPT_88', 'Materia de Modalidad', 'optativa', 'BAP1,BAE1,BGR1,BHS1,BCT1,BAP2,BAE2,BGR2,BHS2,BCT2', 'B_BACH4', 0, 1, 0, 2, 'Asignatura optativa BACH'),
('OPT_89', 'Segunda Lengua Extranjera', 'optativa', 'BCT1,BCT2,BHS1,BHS2,BAE1,BAE2,BAP1,BAP2,BGR1,BGR2', 'B_BACH4', 0, 1, 0, 3, NULL),
('OPT_9', 'Comunicación Audiovisual', 'optativa', 'DIV1,ESO3', 'B_ART', 1, 1, 1, 2, 'Asignatura optativa ART');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_perfiles`
--

CREATE TABLE `ti_perfiles` (
  `id` int(11) NOT NULL,
  `perfil` varchar(100) NOT NULL,
  `opcion` varchar(255) NOT NULL,
  `extra` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_perfiles`
--

INSERT INTO `ti_perfiles` (`id`, `perfil`, `opcion`, `extra`) VALUES
(1, 'NEE-Derivadas de discapacidad', 'Sin especificar', ''),
(2, 'NEE-Derivadas de discapacidad', 'Auditiva', ''),
(3, 'NEE-Derivadas de discapacidad', 'Motora', ''),
(4, 'NEE-Derivadas de discapacidad', 'Intelectual leve', ''),
(5, 'NEE-Derivadas de discapacidad', 'Intelectual moderada', ''),
(6, 'NEE-Derivadas de discapacidad', 'Intelectual grave', ''),
(7, 'NEE-Derivadas de discapacidad', 'Visual', ''),
(8, 'NEE-Derivadas de discapacidad', 'Pluridiscapacidad', ''),
(9, 'NEE-No asociadas a discapacidad', 'Sin especificar', ''),
(10, 'NEE-No asociadas a discapacidad', 'Trastornos del espectro del autismo', ''),
(11, 'NEE-No asociadas a discapacidad', 'Trastornos graves de conducta/personalidad derivados de problemas de salud mental', ''),
(12, 'NEE-No asociadas a discapacidad', 'Trastornos graves de la comunicación y del lenguaje', ''),
(13, 'NEE-No asociadas a discapacidad', 'TEL graves', ''),
(14, 'NEE-No asociadas a discapacidad', 'Retrasos severos del lenguaje', ''),
(15, 'NEE-No asociadas a discapacidad', 'Disfasias', ''),
(16, 'Retraso madurativo', 'Sin especificar', ''),
(17, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Sin especificar', ''),
(18, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada en la comprensión o la producción (expresión)', ''),
(19, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada en la producción', ''),
(20, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada en la expresión', ''),
(21, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada por trastorno fonológico', ''),
(22, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada en la fluidez', ''),
(23, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada en la comunicación social', ''),
(24, 'Trastornos del desarrollo del lenguaje y la comunicación', 'Dificultades leves o moderada en el uso del lenguaje por trastorno pragmático', ''),
(25, 'Trastornos de atención', 'Sin especificar', ''),
(26, 'Trastornos de atención', 'Asociados al funcionamiento ejecutivo', ''),
(27, 'Trastornos de atención', 'Dificultades de aprendizaje asociadas a la atención', ''),
(28, 'Trastornos de atención', 'Asociadas a hiperactividad', ''),
(29, 'Trastornos de atención', 'Atención e impulsividad', ''),
(30, 'Trastornos de atención', 'Atención e hiperactividad', ''),
(31, 'Trastornos de atención', 'Atención y funciones ejecutivas', ''),
(32, 'Trastornos de atención', 'Impulsividad e hiperactividad', ''),
(33, 'Trastornos de atención', 'Atención, impulsividad e hiperactividad', ''),
(34, 'Trastornos de atención', 'Funciones ejecutivas, impulsividad e hiperactividad', ''),
(35, 'Trastornos de atención', 'Trastorno de la coordinación motriz', ''),
(36, 'Trastornos del aprendizaje', 'Sin especificar', ''),
(37, 'Trastornos del aprendizaje', 'Dificultad en la lectura', ''),
(38, 'Trastornos del aprendizaje', 'Dislexia', ''),
(39, 'Trastornos del aprendizaje', 'Dificultad en la expresión escrita', ''),
(40, 'Trastornos del aprendizaje', 'Disgrafía', ''),
(41, 'Trastornos del aprendizaje', 'Disortografía', ''),
(42, 'Trastornos del aprendizaje', 'Disgrafía y disortografía', ''),
(43, 'Trastornos del aprendizaje', 'Dificultad matemática', ''),
(44, 'Trastornos del aprendizaje', 'Discalculia', ''),
(45, 'Trastornos del aprendizaje', 'Dificultad en la adquisición y uso de rutinas y habilidades procedimentales-no verbales (TANV)', ''),
(46, 'Trastornos del aprendizaje', 'Dispraxia', ''),
(47, 'Trastornos del aprendizaje', 'Trastorno de la coordinación motriz', ''),
(48, 'Trastornos del aprendizaje', 'Inteligencia límite', ''),
(49, 'Desconocimiento grave de la lengua', 'Sin especificar', ''),
(50, 'Desconocimiento grave de la lengua', 'Recibe apoyo complementario sin ser de incorporación tardía', ''),
(51, 'Con vulnerabilidad y con desfase', 'Sin especificar', ''),
(52, 'Con vulnerabilidad y con desfase', 'Violencia de género, factores geográficos, étnicos o por experiencias adversas', ''),
(53, 'Con vulnerabilidad y con desfase', 'Factores económicos', ''),
(54, 'Con vulnerabilidad y con desfase', 'Razones culturales', ''),
(55, 'Con vulnerabilidad y con desfase', 'Razones sociales', ''),
(56, 'Con vulnerabilidad y con desfase', 'Factores étnicos', ''),
(57, 'Con vulnerabilidad y con desfase', 'Situación étnica', ''),
(58, 'Con vulnerabilidad y con desfase', 'Por experiencias adversas en la infancia (EAI)', ''),
(59, 'Altas capacidades intelectuales', 'Sin especificar', ''),
(60, 'Altas capacidades intelectuales', 'Precoz', ''),
(61, 'Altas capacidades intelectuales', 'Sobredotación', ''),
(62, 'Altas capacidades intelectuales', 'Talento complejo académico', ''),
(63, 'Altas capacidades intelectuales', 'Talento complejo académico con creatividad superior o igual a 50', ''),
(64, 'Altas capacidades intelectuales', 'Talento complejo académico con creatividad inferior a 50', ''),
(65, 'Altas capacidades intelectuales', 'Talento complejo artístico figurativo', ''),
(66, 'Altas capacidades intelectuales', 'Talento complejo académico y uno o más talentos simples', ''),
(67, 'Altas capacidades intelectuales', 'Talento complejo artístico figurativo y uno o más talentos simples', ''),
(68, 'Altas capacidades intelectuales', 'Talento simple lógico', ''),
(69, 'Altas capacidades intelectuales', 'Talento simple verbal', ''),
(70, 'Altas capacidades intelectuales', 'Talento simple matemático', ''),
(71, 'Altas capacidades intelectuales', 'Talento simple creativo', ''),
(72, 'Altas capacidades intelectuales', 'Talento simple espacial', ''),
(73, 'Altas capacidades intelectuales', 'Talento simple mecánico', ''),
(74, 'Altas capacidades intelectuales', 'Talento simple sin especificar', ''),
(75, 'Integración tardía al sistema', 'Sin especificar', ''),
(76, 'Integración tardía al sistema', 'Escolarizado en un curso inferior por desfase de dos cursos o más', ''),
(77, 'Integración tardía al sistema', 'Recibe atención', ''),
(78, 'Condiciones personales o historia escolar', 'Sin especificar', ''),
(79, 'Condiciones personales o historia escolar', 'Condiciones personales', ''),
(80, 'Condiciones personales o historia escolar', 'Riesgo abandono escolar', ''),
(81, 'Condiciones personales o historia escolar', 'Hospitalización', ''),
(82, 'Condiciones personales o historia escolar', 'Larga convalecencia', ''),
(83, 'Condiciones personales o historia escolar', 'Situación medica señalada por SMS', ''),
(84, 'Condiciones personales o historia escolar', 'Ideas autolesivas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ti_reglas_grupo`
--

CREATE TABLE `ti_reglas_grupo` (
  `id` int(11) NOT NULL,
  `cod_grupo` varchar(20) DEFAULT NULL,
  `bloque` varchar(20) DEFAULT NULL,
  `min_asignaturas` int(11) DEFAULT NULL,
  `max_asignaturas` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ti_reglas_grupo`
--

INSERT INTO `ti_reglas_grupo` (`id`, `cod_grupo`, `bloque`, `min_asignaturas`, `max_asignaturas`, `descripcion`) VALUES
(1, 'GR1', 'B_BACH3', 0, 2, 'Si no se elige B_BACH4, debe elegir 2'),
(2, 'GR1', 'B_BACH4', 0, 1, 'Si no se elige B_BACH3, debe elegir 1');

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
-- Estructura de tabla para la tabla `tt_perfiles_extras`
--

CREATE TABLE `tt_perfiles_extras` (
  `id` int(11) NOT NULL,
  `perfil` varchar(100) NOT NULL,
  `extra` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tt_perfiles_extras`
--

INSERT INTO `tt_perfiles_extras` (`id`, `perfil`, `extra`) VALUES
(1, 'NEE-Derivadas de discapacidad', 'sin especificar'),
(2, 'NEE-Derivadas de discapacidad', 'auditiva'),
(3, 'NEE-Derivadas de discapacidad', 'motora'),
(4, 'NEE-Derivadas de discapacidad', 'intelectual leve'),
(5, 'NEE-Derivadas de discapacidad', 'intelectual moderada'),
(6, 'NEE-Derivadas de discapacidad', 'intelectual grave'),
(7, 'NEE-Derivadas de discapacidad', 'visual'),
(8, 'NEE-Derivadas de discapacidad', 'pluridiscapacidad'),
(9, 'NEE-No asociadas a discapacidad', 'sin especificar'),
(10, 'NEE-No asociadas a discapacidad', 'trastornos del espectro del autismo'),
(11, 'NEE-No asociadas a discapacidad', 'trastornos graves de conducta/personalidad derivados de problemas de salud mental.'),
(12, 'NEE-No asociadas a discapacidad', 'trastornos graves de la comunicación y del lenguaje'),
(13, 'NEE-No asociadas a discapacidad', 'TEL graves'),
(14, 'NEE-No asociadas a discapacidad', 'retrasos severos del lenguaje'),
(15, 'NEE-No asociadas a discapacidad', 'disfasias'),
(16, 'Retraso madurativo', 'sin especificar'),
(17, 'Trastornos del desarrollo del lenguaje y la comunicación', 'sin especificar'),
(18, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada en la comprensión o la producción (expresión)'),
(19, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada en la producción'),
(20, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada en la expresión'),
(21, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada por trastorno fonológico'),
(22, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada en la fluidez'),
(23, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada en la comunicación social'),
(24, 'Trastornos del desarrollo del lenguaje y la comunicación', 'dificultades leves o moderada en el uso del lenguaje por trastorno pragmático'),
(25, 'Trastornos de atención', 'sin especificar'),
(26, 'Trastornos de atención', 'asociadas al funcionamiento ejecutivo'),
(27, 'Trastornos de atención', 'dificultades de aprendizaje asociadas a la atención'),
(28, 'Trastornos de atención', 'asociadas a hiperactividad'),
(29, 'Trastornos de atención', 'impulsividad'),
(30, 'Trastornos de atención', 'atención e impulsividad'),
(31, 'Trastornos de atención', 'atención e hiperactividad'),
(32, 'Trastornos de atención', 'atención y funciones ejecutivas'),
(33, 'Trastornos de atención', 'impulsividad e hiperactividad'),
(34, 'Trastornos de atención', 'atención, impulsividad e hiperactividad'),
(35, 'Trastornos de atención', 'funciones ejecutivas, impulsividad e hiperactividad'),
(36, 'Trastornos del aprendizaje', 'sin especificar'),
(37, 'Trastornos del aprendizaje', 'dificultad en la lectura'),
(38, 'Trastornos del aprendizaje', 'dislexia'),
(39, 'Trastornos del aprendizaje', 'dificultad en la expresión escrita'),
(40, 'Trastornos del aprendizaje', 'disgrafía'),
(41, 'Trastornos del aprendizaje', 'disortografía'),
(42, 'Trastornos del aprendizaje', 'disgrafía/ y disortografía'),
(43, 'Trastornos del aprendizaje', 'dificultad matemática'),
(44, 'Trastornos del aprendizaje', 'discalculia'),
(45, 'Trastornos del aprendizaje', 'dificultad en la adquisición y uso de rutinas y habilidades procedimentales-no verbales derivadas de trastorno del aprendizaje no verbal (TANV)'),
(46, 'Trastornos del aprendizaje', 'dispraxia'),
(47, 'Trastornos del aprendizaje', 'trastorno de la coordinación motriz'),
(48, 'Trastornos del aprendizaje', 'inteligencia límite'),
(49, 'Desconocimiento grave de la lengua', 'sin especificar'),
(50, 'Desconocimiento grave de la lengua', 'recibe apoyo complementario sin ser de incorporación tardía'),
(51, 'Con vulnerabilidad y con desfase', 'sin especificar'),
(52, 'Con vulnerabilidad y con desfase', 'violencia de género, factores geográficos, étnicos o por experiencias adversas'),
(53, 'Con vulnerabilidad y con desfase', 'factores económicos.'),
(54, 'Con vulnerabilidad y con desfase', 'razones culturales.'),
(55, 'Con vulnerabilidad y con desfase', 'razones sociales.'),
(56, 'Con vulnerabilidad y con desfase', 'factores étnicos.'),
(57, 'Con vulnerabilidad y con desfase', 'situación étnica.'),
(58, 'Con vulnerabilidad y con desfase', 'por experiencias adversas en la infancia (EAI).'),
(59, 'Altas capacidades intelectuales', 'sin especificar'),
(60, 'Altas capacidades intelectuales', 'precoz'),
(61, 'Altas capacidades intelectuales', 'sobredotación'),
(62, 'Altas capacidades intelectuales', 'talento complejo ccadémico'),
(63, 'Altas capacidades intelectuales', 'talento complejo académico con creatividad superior o igual a 50'),
(64, 'Altas capacidades intelectuales', 'talento complejo académico con creatividad inferior a 50'),
(65, 'Altas capacidades intelectuales', 'talento complejo artístico figurativo'),
(66, 'Altas capacidades intelectuales', 'talento complejo académico y uno o más talentos simples'),
(67, 'Altas capacidades intelectuales', 'talento complejo artístico figurativo y uno o más talentos simples'),
(68, 'Altas capacidades intelectuales', 'dos talentos simples'),
(69, 'Altas capacidades intelectuales', 'talento simple lógico'),
(70, 'Altas capacidades intelectales', 'talento simple verbal'),
(71, 'Altas capacidades intelectuales', 'talento simple matemático'),
(72, 'Altas capacidades intelectuales', 'talento simple creativo'),
(73, 'Altas capacidades intelectuales', 'talento simple espacial'),
(74, 'Altas capacidades intelectuales', 'talento simple mecánico'),
(75, 'Altas capacidades intelectuales', 'talento simple sin especificar'),
(76, 'Integración tardía al sistema', 'sin especificar'),
(77, 'Integración tardía al sistema', 'escolarizado en un curso inferior por desfase de dos cursos o más'),
(78, 'Integración tardía al sistema', 'recibe atención'),
(79, 'Condiciones personales o historia escolar', 'sin especificar'),
(80, 'Condiciones personales o historia escolar', 'condiciones personales'),
(81, 'Condiciones personales o historia escolar', 'hospitalización'),
(82, 'Condiciones personales o historia escolar', 'larga convalecencia'),
(83, 'Condiciones personales o historia escolar', 'riesgo de abandono escolar.'),
(84, 'Condiciones personales o historia escolar', 'situación medica señalada por SMS'),
(85, 'Condiciones personales o historia escolar', 'ideas autoesivas');

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
(1, 'carlosnicort@gmail.com', '$2y$10$Hd1mgEoFUMF.7guV0YBpkORazqUpDXyyiSMsz9ZfqiHq8uZCS/xr.', 'Carlos', 0, '30000377', 'Tutor', 'Ortuño', ''),
(2, 'figosipituno@gmail.com', '$2y$10$87Kela9/.aGyD8aUstpaDuOPxfHWLVJ25CjXDvzs/GrD/J3hzNwvy', '2', 0, '30000213', 'Director', '2', ''),
(9, '1@1.com', '$2y$10$SJ3bqERyJRi/KjTH1nO65.K.wDOGluLjarIQg4n/y2sjI4UszRFCC', '1', 0, '30000389', 'Director', '1', '1'),
(11, '2@gmail.com', '$2y$10$ShpyAduaVLYYiyvOuZ3Q2.wQhrVXA1/2Qsa2hBynYQ3HCpcA5o5lW', '2', 0, '30000213', 'Tutor', '2', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`);

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
-- Indices de la tabla `ti_alu1`
--
ALTER TABLE `ti_alu1`
  ADD PRIMARY KEY (`id_alu`),
  ADD UNIQUE KEY `id_alu` (`id_alu`),
  ADD KEY `idx_grupo` (`cod_grupo`);

--
-- Indices de la tabla `ti_asignaciones`
--
ALTER TABLE `ti_asignaciones`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `fk_asig_alumno` (`id_alu`),
  ADD KEY `fk_asig_materia` (`cod_materia`);

--
-- Indices de la tabla `ti_fase0`
--
ALTER TABLE `ti_fase0`
  ADD PRIMARY KEY (`id_fase0`),
  ADD UNIQUE KEY `id_alu` (`id_alu`);

--
-- Indices de la tabla `ti_fase0_forms`
--
ALTER TABLE `ti_fase0_forms`
  ADD PRIMARY KEY (`id_form`);

--
-- Indices de la tabla `ti_fase0_respuestas`
--
ALTER TABLE `ti_fase0_respuestas`
  ADD PRIMARY KEY (`id_fase0_resp`),
  ADD UNIQUE KEY `unique_respuesta` (`id_alu`,`id_texto`),
  ADD KEY `fk_respuestas_textos` (`id_texto`);

--
-- Indices de la tabla `ti_fase0_textos`
--
ALTER TABLE `ti_fase0_textos`
  ADD PRIMARY KEY (`id_texto`);

--
-- Indices de la tabla `ti_fase_dua`
--
ALTER TABLE `ti_fase_dua`
  ADD PRIMARY KEY (`id_alu`);

--
-- Indices de la tabla `ti_gr1`
--
ALTER TABLE `ti_gr1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ti_materias`
--
ALTER TABLE `ti_materias`
  ADD PRIMARY KEY (`cod_materia`);

--
-- Indices de la tabla `ti_perfiles`
--
ALTER TABLE `ti_perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ti_reglas_grupo`
--
ALTER TABLE `ti_reglas_grupo`
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
-- Indices de la tabla `ttprev0`
--
ALTER TABLE `ttprev0`
  ADD PRIMARY KEY (`id_txt`),
  ADD UNIQUE KEY `id_txt` (`id_txt`);

--
-- Indices de la tabla `tt_perfiles_extras`
--
ALTER TABLE `tt_perfiles_extras`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id_progreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ti_asignaciones`
--
ALTER TABLE `ti_asignaciones`
  MODIFY `id_asignacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `ti_fase0`
--
ALTER TABLE `ti_fase0`
  MODIFY `id_fase0` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ti_fase0_forms`
--
ALTER TABLE `ti_fase0_forms`
  MODIFY `id_form` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ti_fase0_respuestas`
--
ALTER TABLE `ti_fase0_respuestas`
  MODIFY `id_fase0_resp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ti_fase0_textos`
--
ALTER TABLE `ti_fase0_textos`
  MODIFY `id_texto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `ti_gr1`
--
ALTER TABLE `ti_gr1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ti_perfiles`
--
ALTER TABLE `ti_perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `ti_reglas_grupo`
--
ALTER TABLE `ti_reglas_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ti_tipologia`
--
ALTER TABLE `ti_tipologia`
  MODIFY `id_alu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ttprev0`
--
ALTER TABLE `ttprev0`
  MODIFY `id_txt` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `tt_perfiles_extras`
--
ALTER TABLE `tt_perfiles_extras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ti_asignaciones`
--
ALTER TABLE `ti_asignaciones`
  ADD CONSTRAINT `fk_asig_alumno` FOREIGN KEY (`id_alu`) REFERENCES `ti_alu1` (`id_alu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_asig_materia` FOREIGN KEY (`cod_materia`) REFERENCES `ti_materias` (`cod_materia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ti_fase0_respuestas`
--
ALTER TABLE `ti_fase0_respuestas`
  ADD CONSTRAINT `fk_respuestas_textos` FOREIGN KEY (`id_texto`) REFERENCES `ti_fase0_textos` (`id_texto`) ON DELETE CASCADE,
  ADD CONSTRAINT `ti_fase0_respuestas_ibfk_1` FOREIGN KEY (`id_alu`) REFERENCES `ti_fase0` (`id_alu`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ti_fase_dua`
--
ALTER TABLE `ti_fase_dua`
  ADD CONSTRAINT `fk_fasedua_alumno` FOREIGN KEY (`id_alu`) REFERENCES `ti_alu1` (`id_alu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
