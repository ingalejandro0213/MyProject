-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2025 a las 01:52:53
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
-- Base de datos: `biblioteca_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda_reservas`
--

CREATE TABLE `agenda_reservas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `responsable` varchar(100) NOT NULL,
  `area_sesion` varchar(250) NOT NULL,
  `actividad` text DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agenda_reservas`
--

INSERT INTO `agenda_reservas` (`id`, `fecha`, `hora_inicio`, `hora_fin`, `responsable`, `area_sesion`, `actividad`, `creado_en`) VALUES
(7, '2025-08-27', '16:31:00', '17:31:00', 'CARMENZA SANCHEZ', '', 'conversatorio', '2025-08-26 19:32:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_prestamos`
--

CREATE TABLE `auditoria_prestamos` (
  `id` int(11) NOT NULL,
  `prestamo_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `accion` varchar(20) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_prestamos`
--

INSERT INTO `auditoria_prestamos` (`id`, `prestamo_id`, `libro_id`, `usuario_id`, `nombre_usuario`, `accion`, `fecha`) VALUES
(7, 1, 2, 1, 'admin', 'devuelto', '2025-07-21 21:20:08'),
(8, 1, 2, 1, 'admin', 'no_devuelto', '2025-07-21 21:20:11'),
(9, 2, 3, 3, 'admin', 'devuelto', '2025-07-22 19:13:27'),
(10, 1, 2, 3, 'admin', 'devuelto', '2025-07-22 19:13:33'),
(11, 3, 2, 1, 'admin', 'devuelto', '2025-08-26 19:26:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta_especializada`
--

CREATE TABLE `consulta_especializada` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `computador` text NOT NULL,
  `tema_consulta` text NOT NULL,
  `fecha_consulta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `grado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre_completo`, `email`, `documento`, `grado`) VALUES
(1, 'ABDALA LOPEZ WILLIAM DAVID', 'william.abdala@colegio-americano.edu.co', '1043679387', ' 10C'),
(2, 'AGUILAR DE LUQUE ABEL EDUARDO', 'abel.aguilard@colegio-americano.edu.co', '1046707595', ' 9A'),
(3, 'AGUILAR RAMOS SAMUEL DAVID', 'samuel.aguilar@colegio-americano.edu.co', '1042260950', ' 10A'),
(4, 'ALVAREZ HELD JOSE ALEJANDRO', 'jose.alvarezh@colegio-americano.edu.co', '1048076299', ' 9A'),
(5, 'ARGUELLO MEJIA JHERELIN MARIOL', 'jherelin.arguello@colegio-americano.edu.co', '1048074063', ' 10B'),
(6, 'ARTETA CERVANTES SALOME', 'salome.arteta@colegio-americano.edu.co', '1042260262', ' 10A'),
(7, 'ARTETA MUÑOZ SAMUEL DE JESUS', 'samuel.arteta@colegio-americano.edu.co', '1194965074', ' 10B'),
(8, 'BARBOSA SARABIA LEUDER', 'leuder.barbosa@colegio-americano.edu.co', '1042258607', ' 11A'),
(9, 'BARRERA BOLAÑO ALEJANDRA', 'alejandra.barrerab@colegio-americano.edu.co', '1139431981', ' 10B'),
(10, 'BARRIGA NAVAJA SOFIA MARCELA', 'sofia.barriga@colegio-americano.edu.co', '1139430711', ' 10A'),
(11, 'BOLIVAR REDONDO ANTONIO JOSE', 'antonio.bolivar@colegio-americano.edu.co', '1194965687', ' 10C'),
(12, 'BRITO PAZ LEYPERD DIJEES', 'leyperd.brito@colegio-americano.edu.co', '1042256179', ' 11B'),
(13, 'CABARCAS LINERO SHARON SOFIA', 'sharon.cabarcasl@colegio-americano.edu.co', '1047047041', ' 11B'),
(14, 'CAMPANELLA OSPINO EMMANUELLE', 'emmanuelle.campanella@colegio-americano.edu.co', '1042859799', ' 9B'),
(15, 'CARBONO PEREZ GABRIELA SOFIA', 'gabriela.carbonop@colegio-americano.edu.co', '1043452600', ' 10B'),
(16, 'CARMONA CASTILLO SEBASTIAN DAVID', 'sebastiand.carmona@colegio-americano.edu.co', '1082927328', ' 11B'),
(17, 'CERVANTES CADENA DIEGO ANDRES', 'diego.cervantesc@colegio-americano.edu.co', '1146535123', ' 11A'),
(18, 'CORONELL LARA GABRIELA', 'gabriela.coronell@colegio-americano.edu.co', '1042260329', ' 10B'),
(19, 'DAZA OROZCO ORLANDO JOSE', 'orlando.daza@colegio-americano.edu.co', '1127912814', ' 10A'),
(20, 'DAZA SERNA EFRAIN ALBERTO', 'efrain.daza@colegio-americano.edu.co', '1043678047', ' 11B'),
(21, 'DE LA CRUZ GUTIERREZ ISABELLA SOFIA', 'isabella.delacruzg@colegio-americano.edu.co', '1194964589', ' 10A'),
(22, 'DE LA CRUZ PALMA SANTIAGO JOSE', 'santiago.delacruz@colegio-americano.edu.co', '1042858927', ' 10C'),
(23, 'DEVENISH VARGAS CHRISTOPHER ADAM', 'christopher.devenish@colegio-americano.edu.co', '1139429491', ' 11A'),
(24, 'ESCALANTE RODELO SAMUEL ANDRES', 'samuel.escalante@colegio-americano.edu.co', '1044219186', ' 10C'),
(25, 'ESMERAL DE LOS REYES HECTOR MANUEL', 'hector.esmeral@colegio-americano.edu.co', '1042856752', ' 10C'),
(26, 'FLOREZ RODRIGUEZ LUIS ANGEL', 'luis.florez@colegio-americano.edu.co', '1046713143', ' 8A'),
(27, 'GARCES RAMIREZ ISABELLA', 'isabella.garces@colegio-americano.edu.co', '1048076387', ' 9A'),
(28, 'GONZALEZ VILLALBA MARIA GABRIELA', 'maria.gonzalezv@colegio-americano.edu.co', '1042259663', ' 10B'),
(29, 'GUERRA REY JORGE LUIS', 'jorge.guerrar@colegio-americano.edu.co', '1043151471', ' 11A'),
(30, 'GUTIERREZ FERNANDEZ CAROLINA', 'carolina.gutierrezf@colegio-americano.edu.co', '1042257788', ' 10C'),
(31, 'HABIB CAMARGO AMIR JOSE', 'amir.habib@colegio-americano.edu.co', '1042856680', ' 10B'),
(32, 'HERNANDEZ NARANJO EDUARD JESUS', 'eduard.hernandez@colegio-americano.edu.co', '1139431072', ' 11C'),
(33, 'HIDALGO RUIZ SAYURI GUADALUPE', 'sayuri.hidalgo@colegio-americano.edu.co', '1028440171', ' 10C'),
(34, 'JABBA JIMENEZ LORIS', 'loris.jabba@colegio-americano.edu.co', '1042857254', ' 10C'),
(35, 'JIMENEZ MORON DEYAM CAROLINA', 'deyam.jimenez@colegio-americano.edu.co', '1048075565', ' 9A'),
(36, 'LEIVA FERNANDEZ ANA LUCIA', 'ana.leivafe@colegio-americano.edu.co', '1044220751', ' 9C'),
(37, 'LOPEZ JIMENEZ SOFIA MIRANDA', 'sofia.lopezj@colegio-americano.edu.co', '1194965377', ' 10B'),
(38, 'MAESTRE DOUGLAS ISABELLA SOFIA', 'isabella.maestre@colegio-americano.edu.co', '1048072292', ' 11B'),
(39, 'MANOTAS REDONDO SANTIAGO JOSE', 'santiago.manotas@colegio-americano.edu.co', '1042259902', ' 10B'),
(40, 'MARTINEZ SUAREZ SAMUEL', 'samuel.martinezs@colegio-americano.edu.co', '1047045439', ' 11A'),
(41, 'MARTINEZ VILLAMIZAR EDGARDO DAVID', 'edgardo.martinez@colegio-americano.edu.co', '1046710154', ' 8B'),
(42, 'MATTOS CALDERON GONZALO', 'gonzalo.mattos@colegio-americano.edu.co', '1126240817', ' 11B'),
(43, 'MATURANA CORREDOR DANIEL FELIPE', 'daniel.maturana@colegio-americano.edu.co', '1029666612', ' 8B'),
(44, 'MENDOZA ALI SAMUEL DAVID', 'samuel.mendoza@colegio-americano.edu.co', '1041695933', ' 10A'),
(45, 'MESINO RAMOS ELIAS DAVID', 'elias.mesino@colegio-americano.edu.co', '1044219091', ' 10A'),
(46, 'MEZA HENAO ASHLY', 'ashly.meza@colegio-americano.edu.co', '1042259590', ' 11B'),
(47, 'MONSALVE PEREZ LUIS FELIPE', 'luis.monsalve@colegio-americano.edu.co', '1044222786', ' 7A'),
(48, 'MUÑOZ RUIZ JERONIMO', 'jeronimo.munoz@colegio-americano.edu.co', '1043453385', ' 10B'),
(49, 'MUÑOZ RUIZ VALERIA', 'valeria.munozr@colegio-americano.edu.co', '1043458034', ' 8A'),
(50, 'MUÑOZ VILLALOBOS MATIAS', 'matias.munoz@colegio-americano.edu.co', '1046705615', ' 10A'),
(51, 'NAVARRO GRANADOS JOSE DAVID', 'jose.navarro@colegio-americano.edu.co', '1082952417', ' 9C'),
(52, 'NEGRETE VELASQUEZ JOSE DANIEL', 'jose.negretev@colegio-americano.edu.co', '1042258138', ' 11B'),
(53, 'NOVOA HURTADO CAMILO ANDRES', 'camilo.novoa@colegio-americano.edu.co', '1142924564', ' 10B'),
(54, 'ORTIZ QUINTERO ANDRES', 'andres.ortizq@colegio-americano.edu.co', '1042259287', ' 11B'),
(55, 'OVALLE DIAZ LAURA ISABELA', 'laura.ovalle@colegio-americano.edu.co', '1048075863', ' 9B'),
(56, 'PACHECO URBINA SHARAY DANIELA', 'sharay.pacheco@colegio-americano.edu.co', '1042859530', ' 9A'),
(57, 'PADILLA PADILLA SHARON', 'sharon.padilla@colegio-americano.edu.co', '1042860337', ' 8A'),
(58, 'PANNEFLEK YIMES ENRIQUE ALBERTO', 'enrique.panneflek@colegio-americano.edu.co', '1046705448', ' 9C'),
(59, 'PAYARES SANTAMARIA SEBASTIAN', 'sebastian.payares@colegio-americano.edu.co', '1043451536', ' 11A'),
(60, 'PERALTA ACOSTA ELINA', 'elina.peralta@colegio-americano.edu.co', '1044636461', ' 10C'),
(61, 'PEREZ ESCOBAR JULIANA VALENTINA', 'juliana.pereze@colegio-americano.edu.co', '1194965607', ' 9B'),
(62, 'PEÑA HERNANDEZ MARIANA', 'mariana.pena@colegio-americano.edu.co', '1043454086', ' 9A'),
(63, 'PICON CORREA SEBASTIAN', 'sebastian.piconc@colegio-americano.edu.co', '1146534614', ' 11B'),
(64, 'QIU HUANG ANDRES', 'andres.qiu@colegio-americano.edu.co', '1048074266', ' 10A'),
(65, 'QIU HUANG ANGI YUYING', 'angi.qiu@colegio-americano.edu.co', '1048070995', ' 11B'),
(66, 'QUIJANO QUESADA VALENTINA', 'valentina.quijano@colegio-americano.edu.co', '1047048052', ' 10A'),
(67, 'QUINTERO MARTINEZ EDUAR DANIEL', 'eduar.quintero@colegio-americano.edu.co', '1043459100', ' 8B'),
(68, 'QUINTERO REALES BRUCE GILBERTO', 'bruce.quintero@colegio-americano.edu.co', '1043678146', ' 11B'),
(69, 'RODELO RINCON RAFAEL JUNIOR', 'rafael.rodelo@colegio-americano.edu.co', '1043451097', ' 10A'),
(70, 'RODRIGUEZ GONZALEZ GABRIELA', 'gabriela.rodriguezgo@colegio-americano.edu.co', '1042861225', ' 8A'),
(71, 'RODRIGUEZ GONZALEZ VALERIA ISABEL', 'valeria.rodriguezg@colegio-americano.edu.co', '1042855675', ' 11A'),
(72, 'RODRIGUEZ YEPES JUAN FERNANDO', 'juan.rodriguezy@colegio-americano.edu.co', '1046708440', ' 9A'),
(73, 'RODRIGUEZ YEPES JULIAN ANDRES', 'julian.rodriguezy@colegio-americano.edu.co', '1046713605', ' 7A'),
(74, 'RODRIGUEZ YEPES MARTIN ANDRES', 'martin.rodriguezy@colegio-americano.edu.co', '1046713604', ' 7A'),
(75, 'ROLON ORTIZ NATALY SOFIA', 'nataly.rolong@colegio-americano.edu.co', '1046714719', ' 7A'),
(76, 'ROMERO SANCHEZ FABIANA', 'fabiana.romeros@colegio-americano.edu.co', '1141323541', ' 11A'),
(77, 'ROMO JIMENEZ CARLOS DANIEL', 'carlos.romoj@colegio-americano.edu.co', '1034298256', ' 10C'),
(78, 'ROSAS URIETA CARLOS MOISES', 'carlos.rosasu@colegio-americano.edu.co', '1042256486', ' 11A'),
(79, 'RUAN CHEN JENNIFER SHUWEN', 'jennifer.ruanc@colegio-americano.edu.co', '1044635884', ' 10A'),
(80, 'RUZ ALARCON ISAAC DAVID', 'isaac.ruz@colegio-americano.edu.co', '1029862487', ' 9B'),
(81, 'SAAVEDRA MORALES ISABELLA', 'isabella.saavedra@colegio-americano.edu.co', '1042261593', ' 10C'),
(82, 'SALAS JIMENEZ MARIA JOSE', 'maria.salasj@colegio-americano.edu.co', '1046705117', ' 11A'),
(83, 'SANCHEZ MARTINEZ MARIA FERNANDA', 'maria.sanchezm@colegio-americano.edu.co', '1194965222', ' 10B'),
(84, 'SANTANA LLANES SAMUEL DAVID', 'samuel.santana@colegio-americano.edu.co', '1042260301', ' 10C'),
(85, 'SANTIAGO PALACIO ALFREDO ANTONIO', 'alfredo.santiagop@colegio-americano.edu.co', '1043677315', ' 11A'),
(86, 'SIERRA TORRES SANTIAGO JOSE', 'santiago.sierrat@colegio-americano.edu.co', '1043667950', ' 11B'),
(87, 'SUAREZ LOPEZ SEBASTIAN', 'sebastian.suarez@colegio-americano.edu.co', '1046707010', ' 10C'),
(88, 'SUTTON MEKONG CLAUDIA MILENA', 'claudia.sutton@colegio-americano.edu.co', '1146534906', ' 11B'),
(89, 'TORO FAQUIRÁ PAOLA SOFIA', 'paola.toro@colegio-americano.edu.co', '685565', ' 9B'),
(90, 'URRUTIA MONTES VALERIA SOFIA', 'valeria.urrutia@colegio-americano.edu.co', '1194963630', ' 10B'),
(91, 'VARGAS HENAO ZARAH', 'zarah.vargas@colegio-americano.edu.co', '1072990283', ' 10C'),
(92, 'VEGA MERLANO GABRIEL ALEJANDRO', 'gabriel.vega@colegio-americano.edu.co', '1042860133', ' 8C'),
(93, 'VERGARA GUZMAN FABIAN ANDRES', 'fabian.vergara@colegio-americano.edu.co', '1139431589', ' 10B'),
(94, 'VERTEL CASTILLO ALEJANDRO DANIEL', 'alejandro.vertel@colegio-americano.edu.co', '1042259244', ' 10B'),
(95, 'VILLARREAL PEINADO VALENTINA', 'valentina.villareal@colegio-americano.edu.co', '1042258666', ' 11A'),
(96, 'WAYNER CARRILLO ITALA NATALIA', 'itala.wayner@colegio-americano.edu.co', '1042257870', ' 10B'),
(97, 'WONG CHEN WENDY', 'wendy.wong@colegio-americano.edu.co', '1194964372', ' 10A'),
(98, 'WONG CHEN WILLIAM WEN', 'william.wong@colegio-americano.edu.co', '1194967566', ' 9B'),
(99, 'YU YU TONY', 'tony.yu@colegio-americano.edu.co', '1048071136', ' 11B'),
(100, 'ZAPATA SOLANO CAMILO JOSE', 'camilo.zapata@colegio-americano.edu.co', '1042258338', ' 11A'),
(101, 'ACUÑA BORJA JAIME JAIME', 'jaime.acuna@colegio-americano.edu.co', '1130272251', ' 10C'),
(102, 'CLAVIJO SANCHEZ CARLOS ADRIAN', 'carlos.clavijo@colegio-americano.edu.co', '1048074886', ' 9C'),
(103, 'DE SALES BLANCO EUSEBIO NICOLAS', 'eusebio.desales@colegio-americano.edu.co', '1043455579', ' 9A'),
(104, 'DIAZ MARTINEZ SAMUEL ELIAS', 'samuel.diaz@colegio-americano.edu.co', '1046705835', ' 10A'),
(105, 'FLORIAN MACHADO JUAN PABLO', 'juan.florian@colegio-americano.edu.co', '1046709598', ' 9A'),
(106, 'GALOFRE TERAN SEBASTIAN', 'sebastian.galofre@colegio-americano.edu.co', '1048073122', ' 11A'),
(107, 'HERNANDEZ NARANJO EMANUEL JESUS', 'emanuel.hernandezn@colegio-americano.edu.co', '1194968676', ' 8B'),
(108, 'HUANG WENG TONNY', 'tonny.huang@colegio-americano.edu.co', '1042858580', ' 9B'),
(109, 'L`HOESTE OROZCO MATHEY`S JOSEPH', 'matheys.lhoeste@colegio-americano.edu.co', '1043456752', ' 9B'),
(110, 'MA KUANG JIA YI', 'jia.ma@colegio-americano.edu.co', '530609', ' 9A'),
(111, 'MONSALVE YANES LIA SOFIA', 'lia.monsalve@colegio-americano.edu.co', '1046715986', ' 7A'),
(112, 'MONSALVE YANES SARA VICTORIA', 'sara.monsalve@colegio-americano.edu.co', '1046715987', ' 7A'),
(113, 'NARANJO ROMERO SANTIAGO', 'santiago.naranjor@colegio-americano.edu.co', '1046709055', ' 8A'),
(114, 'PEREZ ESCOBAR JUAN CAMILO', 'juan.pereze@colegio-americano.edu.co', '1046709533', ' 8A'),
(115, 'RESTREPO SANTIAGO GENESIS', 'genesis.restrepo@colegio-americano.edu.co', '1043461266', ' 7A'),
(116, 'SERNA LUGO LUIS CARLOS', 'luis.serna@colegio-americano.edu.co', '1042859628', ' 8A'),
(117, 'VERGARA CAMACHO NICOLAS DAVID', 'nicolas.vergara@colegio-americano.edu.co', '1046711963', ' 8A'),
(118, 'VITAL CANTILLO JUAN ESTEBAN', 'juan.vital@colegio-americano.edu.co', '1042859223', ' 10A'),
(119, 'ARIAS ROJAS ISABELLA', 'isabella.arias@colegio-americano.edu.co', '1146548449', ' 7A'),
(120, 'MARTINEZ ALVAREZ JUAN DAVID', 'juan.martineza@colegio-americano.edu.co', '1042262658', ' 9A'),
(121, 'VERGARA TORRES ISABEL SOFIA', 'isabel.vergara@colegio-americano.edu.co', '1142930735', ' 9B'),
(122, 'YU WU NICOLAS WENTAO', 'nicolas.yu@colegio-americano.edu.co', '1084454786', ' 6A'),
(123, 'PEÑA HERNANDEZ ANDRES EDUARD', 'andres.penah@colegio-americano.edu.co', '1046722823', ' 5A'),
(124, 'KRAYEM SAMHAT FATIMA ZAHRA', 'fatima.krayem@colegio-americano.edu.co', '674143', ' 6B'),
(125, 'ACUÑA SANJUAN ALFREDO ALEJANDRO', 'alfredo.acuna@colegio-americano.edu.co', '1139433357', ' 8A'),
(126, 'ARENAS BARROS GIAN ALEXANDER', 'gian.arenas@colegio-americano.edu.co', '1046718265', ' 6B'),
(127, 'ARENAS ULLOQUE DIEGO ALEJANDRO', 'diego.arenasu@colegio-americano.edu.co', '1044222990', ' 6B'),
(128, 'ARENAS ULLOQUE MATEO ANTONIO', 'mateo.arenas@colegio-americano.edu.co', '1044225157', ' 4B'),
(129, 'ARTETA NATERA TOMAS ALEJANDRO', 'tomas.arteta@colegio-americano.edu.co', '1013012141', ' 8A'),
(130, 'BAENA ALVAREZ FABIANA CAROLINA', 'baena.alvarez@colegio-americano.edu.co', '1044617687', ' 11B'),
(131, 'CARREÑO ESCOBAR DAVID ANTONIO', 'david.carreno@colegio-americano.edu.co', '1146536659', ' 8A'),
(132, 'FLOREZ SERGE SANTIAGO EDUARDO', 'santiago.florez@colegio-americano.edu.co', '1043306758', ' 10B'),
(133, 'GARCIA PEÑA ALEJANDRO DAVID', 'alejandro.garciap@colegio-americano.edu.co', '1139429741', ' 11B'),
(134, 'GIRALDO MACEA RAFAEL ARTURO', 'rafael.giraldo@colegio-americano.edu.co', '1046705312', ' 10B'),
(135, 'GONZALEZ BACHILLER ISABELLA', 'isabella.gonzalezb@colegio-americano.edu.co', '1141119901', ' 10A'),
(136, 'GONZALEZ GENEZ ISABELLA', 'isabella.gonzalezg@colegio-americano.edu.co', '1044221824', ' 8A'),
(137, 'GUERRA MEJIA VICTOR MANUEL', 'victor.guerram@colegio-americano.edu.co', '1042259833', ' 10B'),
(138, 'GUTIERREZ FERNANDEZ EMMANUEL', 'emmanuel.gutierrezf@colegio-americano.edu.co', '1042263807', ' 8B'),
(139, 'HENRIQUEZ ARIAS CAMILO ANDRES', 'camilo.henriquez@colegio-americano.edu.co', '1042264050', ' 7B'),
(140, 'HERNANDEZ JIMENEZ SAMUEL DAVID', 'samuel.hernandezj@colegio-americano.edu.co', '1046709001', ' 8A'),
(141, 'HERNANDEZ JIMENEZ SARAH ISABEL', 'sarah.hernandez@colegio-americano.edu.co', '1046708998', ' 8A'),
(142, 'HERNANDEZ JIMENEZ SEBASTIAN ANDRES', 'sebastian.hernandezj@colegio-americano.edu.co', '1046709000', ' 7B'),
(143, 'HERNANDEZ JIMENEZ SOFIA ISABEL', 'sofia.hernandezj@colegio-americano.edu.co', '1046708999', ' 8A'),
(144, 'JIMENEZ FACIOLINCE DANNA', 'danna.jimenez@colegio-americano.edu.co', '1194966942', ' 8B'),
(145, 'JIMENEZ FACIOLINCE DIEGO', 'diego.jimenezfa@colegio-americano.edu.co', '1194969533', ' 6A'),
(146, 'LIANG YU YU HAO', 'liang.yuyu@colegio-americano.edu.co', '1043681546', ' 11B'),
(147, 'LOPEZ TORRES SAMUEL ENRIQUE', 'samuel.lopezt@colegio-americano.edu.co', '1033113989', ' 6A'),
(148, 'MANOTAS PERNETT GABRIELA', 'gabriela.manotas@colegio-americano.edu.co', '1046709704', ' 8C'),
(149, 'MARTINEZ ALARCON THOMAS JAMES', 'thomas.martinez@colegio-americano.edu.co', '1042262628', ' 8C'),
(150, 'MAY COELLO JADEN', 'jaden.may@colegio-americano.edu.co', '1042263457', ' 8B'),
(151, 'MEI MEI KEYNE', 'keyne.mei@colegio-americano.edu.co', '1043457045', ' 8C'),
(152, 'MENDEZ DURANGO DANNA SOFIA', 'danna.mendezd@colegio-americano.edu.co', '1044222388', ' 7B'),
(153, 'MENDOZA VARGAS VALERIE PAOLA', 'valerie.mendoza@colegio-americano.edu.co', '1046712041', ' 7B'),
(154, 'MIRANDA JUNCO SANIA SOFIA', 'sania.miranda@colegio-americano.edu.co', '1048082800', ' 4A'),
(155, 'MONDRAGON SEPULVEDA BIANCA', 'bianca.mondragon@colegio-americano.edu.co', '1046717659', ' 6B'),
(156, 'ORSINES BACCA FIORELLA MARIA', 'fiorella.orsines@colegio-americano.edu.co', '1047051367', ' 8B'),
(157, 'OSPINO SILVERA MIGUEL ANGEL', 'miguel.ospino@colegio-americano.edu.co', '1043677065', ' 10C'),
(158, 'PADILLA CERVANTES SAMANTHA', 'samanta.padilla@colegio-americano.edu.co', '1010843826', ' 7A'),
(159, 'PAJARO GARCIA SAMUEL DAVID', 'samuel.pajaro@colegio-americano.edu.co', '1046710508', ' 8B'),
(160, 'PEREZ GUETTE MIGUEL ANGEL', 'miguel.perezg@colegio-americano.edu.co', '1042263966', ' 8B'),
(161, 'PETRO CERPA SAMUEL DAVID', 'samuel.petro@colegio-americano.edu.co', '1139429534', ' 11B'),
(162, 'PINILLOS DEJANON CARLOS JOSE', 'carlos.pinillos@colegio-americano.edu.co', '1043686368', ' 9A'),
(163, 'POLO DE CASTRO SANTIAGO', 'santiago.polo@colegio-americano.edu.co', '1042259952', ' 10C'),
(164, 'PUA GOMEZ AVRIL', 'avril.pua@colegio-americano.edu.co', '1041700204', ' 4A'),
(165, 'SERNA LUGO CHRISTIAN CAMILO', 'christian.serna@colegio-americano.edu.co', '1146541789', ' 3B'),
(166, 'SERRANO NARVAEZ SAMUEL ALFONSO', 'samuel.serrano@colegio-americano.edu.co', '1048071313', ' 11B'),
(167, 'TORRADO FORNARIS LUIS ANGEL', 'luis.torrado@colegio-americano.edu.co', '1046712509', ' 8B'),
(168, 'VILLALBA REALES ADRIAN JOSE', 'adrian.villalba@colegio-americano.edu.co', '1042264278', ' 8A'),
(169, 'WINKEL BARRAZA LUCAS RICHARD', 'lucas.winkel@colegio-americano.edu.co', '1125810199', ' 4A'),
(170, 'ARAUJO MEZA JESUS MANUEL', 'jesus.araujo@colegio-americano.edu.co', '1046711314', ' 8A'),
(171, 'MATURANA CORREDOR ISABELLA LUCIA', 'isabella.maturana@colegio-americano.edu.co', '1044650892', ' 6A'),
(172, 'HERNANDEZ AVILA MARIANA', 'mariana.hernandeza@colegio-americano.edu.co', '1014871706', ' 10C'),
(173, 'SILVERA FRAGOZO VALERIA SOFIA', 'valeria.silvera@colegio-americano.edu.co', '1043700334', ' 4A'),
(174, 'ESPINOSA RUIZ SAMUEL', 'samuel.espinosa@colegio-americano.edu.co', '1141331971', ' 9B'),
(175, 'LEON CRUZ JUAN DAVID', 'juan.leonc@colegio-americano.edu.co', '1188214235', ' 9A'),
(176, 'CAMPO TALERO CAROLINA ROSA', 'carolina.campot@colegio-americano.edu.co', '1014995451', ' 7B'),
(177, 'DIAZ ACUÑA ANDERSON ISSACK', 'anderson.diaza@colegio-americano.edu.co', '1066883429', ' 7A'),
(178, 'HENRIQUEZ CHARRIS HECTOR DARIO', 'hector.henriquezc@colegio-americano.edu.co', '1194968686', ' 7B'),
(179, 'LOPEZ RIZO IVANNA', 'ivanna.lopezr@colegio-americano.edu.co', '1127057858', ' 7A'),
(180, 'NARVAEZ FONTALVO CAMILO ANDRES', 'camilo.narvaezf@colegio-americano.edu.co', '1042263834', ' 7A'),
(181, 'NAVIA PICHON VIOLETTA', 'violetta.naviap@colegio-americano.edu.co', '1046713826', ' 7A'),
(182, 'PACHECO MANOTAS ESTEBAN ANDRES', 'esteban.pachecom@colegio-americano.edu.co', '1048078103', ' 7A'),
(183, 'PULGAR CAMACHO YOSETH DAVID', 'yoseth.pulgarc@colegio-americano.edu.co', '1194970443', ' 7B'),
(184, 'SALAZAR FERNANDEZ LUCIANA', 'luciana.salazarf@colegio-americano.edu.co', '1146537746', ' 7B'),
(185, 'VARGAS CASIJ SOFIA', 'sofia.vargasc@colegio-americano.edu.co', '1146537364', ' 7B'),
(186, 'VASQUEZ VILORIA LUIS JESÚS', 'luis.vasquezv@colegio-americano.edu.co', '907278', ' 7A'),
(187, 'VIZCAINO GOMEZ ANDRES FERNANDO', 'andres.vizcaino@colegio-americano.edu.co', '1043460176', ' 7A'),
(188, 'MORALES MORALES ELIAS DAVID', 'Elias.moralesm@colegio-americano.edu.co', '1046709888', ' 8A'),
(189, 'BOLIVAR RODRIGUEZ JULIANA MARIA', 'juliana.bolivarr@colegio-americano.edu.co', '1139431646', ' 9B'),
(190, 'CASTRO VELASCO FEDERICA LI', 'federica.castrov@colegio-americano.edu.co', '1042261790', ' 10B'),
(191, 'GRANADOS PINZON DAVID LEONARDO', 'david.granadosp@colegio-americano.edu.co', '1016719558', ' 10A'),
(192, 'NAVARRO BRIBRAGER JONATHAN', 'jonathan.navarrob@colegio-americano.edu.co', '1066738232', ' 10B'),
(193, 'MENDOZA LOBO LEYDER ALEXANDER', 'leyder.mendozal@colegio-americano.edu.co', '1082913485', ' 11A'),
(194, 'PALENCIA RODRIGUEZ SANTIAGO', 'santiago.palenciar@colegio-americano.edu.co', '1043448533', ' 11C'),
(195, 'PATERNINA GONZALEZ KEYLA ESTHER', 'keyla.paterninag@colegio-americano.edu.co', '1043453093', ' 11C'),
(196, 'PATERNINA GONZALEZ KEYNER RAFAEL', 'keyner.paterninag@colegio-americano.edu.co', '1043453092', ' 11C'),
(197, 'VITAL CANTILLO CARLOS ESTEBAN', 'carlos.vitalc@colegio-americano.edu.co', '1044660664', ' 4A'),
(198, 'YU YU RICKY', 'ricky.yuy@colegio-americano.edu.co', 'AR830375', ' 4A'),
(199, 'CASTRO MUÑOZ ANGEL FELIPE', 'angel.castrom@colegio-americano.edu.co', '1089621138', ' 5A'),
(200, 'GONZALEZ GENEZ MARIANA', 'mariana.gonzalezg@colegio-americano.edu.co', '1043468073', ' 5A'),
(201, 'MONSALVE ROJAS MAXIMILIANO', 'maximiliano.monsalver@colegio-americano.edu.co', '1194972098', ' 5A'),
(202, 'OSPINA LECHUGA ISAAC DAVID', 'isaac.ospinal@colegio-americano.edu.co', '1046729991', ' 3A'),
(203, 'RESTREPO SALTARIN JOSHUA', 'joshua.restrepos@colegio-americano.edu.co', '1046731401', ' 3A'),
(204, 'SIERRA GUZMAN MARIA GABRIELLE', 'maria.sierrag@colegio-americano.edu.co', '1042271791', ' 3B'),
(205, 'FERNANDEZ NAVARRO NEL SANTIAGO DE JESUS', 'nel.fernandezn@colegio-americano.edu.co', '1046704666', ' 11C'),
(206, 'BERNAL MACIA EMMANUEL SANTOS', 'emmanuel.bernalm@colegio-americano.edu.co', '1043305769', ' 11C'),
(207, 'CANTILLO OSORIO GABRIEL ELIAS', 'gabriel.cantilloo@colegio-americano.edu.co', '1194975596', ' 3A'),
(208, 'GONZALEZ ALVARADO EDUARDO', 'eduardo.gonzaleza@colegio-americano.edu.co', '1046713635', ' 7A'),
(209, 'MONTERROSA VEGA ANTHONY ENRRIQUE', 'anthony.monterrosa@colegio-americano.edu.co', '1046715242', ' 7A'),
(210, 'PITRE BOLAÑO LUIS SANTIAGO', 'luis.pitreb@colegio-americano.edu.co', '1042265133', ' 7B'),
(211, 'MENDOZA OSPINO JEAN PIERE', 'jean.mendoza@colegio-americano.edu.co', '1044220020', ' 9A'),
(212, 'CASELLES NUÑEZ NATHALY JOANDRA', 'nathaly.casellesn@colegio-americano.edu.co', '1094053080', ' 11C'),
(213, 'BARCENAS AVILA SAILETH ANDREA', 'saileth.barcenas@colegio-americano.edu.co', '1046706098', ' 9C'),
(214, 'SALGADO ROSADO MARIANA SOFIA', 'mariana.salgado@colegio-americano.edu.co', '1046731734', ' 3A'),
(215, 'CONTRERAS LINARES MAURICIO', 'mauricio.contrerasl@colegio-americano.edu.co', '1142715608', ' 11A'),
(216, 'RAMOS CASTAÑEDA MARIANA', 'mariana.ramosc@colegio-americano.edu.co', '1014997889', ' 11B'),
(217, 'RADA DOMINGUEZ JULIAN ANDRES', 'julian.radad@colegio-americano.edu.co', '1048080069', ' 6A'),
(218, 'AGUAS BORJA REBECA BELEN', 'rebeca.aguas@colegio-americano.edu.co', '1046718638', ' 6A'),
(219, 'AVILA ALTAHONA SEBASTIAN ELIAS', 'sebastian.avilaa@colegio-americano.edu.co', '1084061055', ' 6A'),
(220, 'BOLIVAR CARDENAS SHADIA', 'shadia.bolivar@colegio-americano.edu.co', '1043463329', ' 6B'),
(221, 'CHEN LI JUN HAO', 'jun.chen@colegio-americano.edu.co', '1046726249', ' 4B'),
(222, 'DE LA CRUZ GUTIERREZ THIAGO DAVID', 'thiago.delacruz@colegio-americano.edu.co', '1194971892', ' 6B'),
(223, 'DOMENECH PATERNINA DAVID', 'david.domenech@colegio-americano.edu.co', '1042265490', ' 6A'),
(224, 'GARCIA BULA MARCO ANDRES', 'marco.garciab@colegio-americano.edu.co', '1043194471', ' 6B'),
(225, 'HERRERA CURE JUAN FELIPE', 'juan.herrerac@colegio-americano.edu.co', '1188219327', ' 6B'),
(226, 'JARAMILLO ORJUELA VALENTINA', 'valentina.jaramillo@colegio-americano.edu.co', '1028444126', ' 6A'),
(227, 'JIMENEZ MEJIA ALEJANDRO JOSE', 'alejandro.jimenezm@colegio-americano.edu.co', '1041698532', ' 6A'),
(228, 'LOPEZ GARCIA LUCIANO JOSE', 'luciano.lopezg@colegio-americano.edu.co', '1043461660', ' 6B'),
(229, 'MARTINEZ ALVAREZ SAMUEL DAVID', 'samuel.martineza@colegio-americano.edu.co', '1042266433', ' 6A'),
(230, 'MEZA LARIOS LUIS GABRIEL', 'Luis.mezal@colegio-americano.edu.co', '1043462051', ' 6B'),
(231, 'PRASCA SANDOVAL ANNETTE SOFIA', 'Annette.prasca@colegio-americano.edu.co', '1041698630', ' 6B'),
(232, 'SAAVEDRA ROPERO JUAN DIEGO', 'juan.saavedrar@colegio-americano.edu.co', '1046717034', ' 6B'),
(233, 'SIERRA RODRIGUEZ SAMUEL ALEJANDRO', 'samuel.sierrar@colegio-americano.edu.co', '1046718538', ' 6B'),
(234, 'VARGAS SILVERA ALLISON', 'allison.vargas@colegio-americano.edu.co', '1043462581', ' 6A'),
(235, 'ZHU ZHU YUAN BIN ABEL', 'yuang.zhu@colegio-americano.edu.co', '1046718351', ' 6B'),
(236, 'GUERRA REY VALENTINA', 'valentina.guerrar@colegio-americano.edu.co', '1043172158', ' 7B'),
(237, 'ORTIZ MARCHENA SARA SOFIA', 'sara.ortizm@colegio-americano.edu.co', '1046713230', ' 7A'),
(238, 'NEGRETE CHAUX MARIANA', 'mariana.negretec@colegio-americano.edu.co', '1143686923', ' 8B'),
(239, 'PEREZ MARQUEZ DANNA TALIA', 'danna.perezm@colegio-americano.edu.co', '1044221276', ' 8C'),
(240, 'CAITA AVILA MARTIN GABRIEL', 'martin.caita@colegio-americano.edu.co', '1019904456', ' 9B'),
(241, 'FONTALVO OSPINO JULIETA', 'julieta.fontalvo@colegio-americano.edu.co', '1046708772', ' 9A'),
(242, 'HENAO GOMEZ OSKARY VALERIA', 'oskary.henao@colegio-americano.edu.co', '1048220556', ' 8C'),
(243, 'OBREGON NAVAS SERGIO ANDRES', 'sergio.obregonn@colegio-americano.edu.co', '1126984476', ' 9B'),
(244, 'ORTEGA ROLDAN MILEY ANDREA', 'miley.ortega@colegio-americano.edu.co', '1046705901', ' 9B'),
(245, 'POLO HERNANDEZ GUILLERMO RAFAEL', 'guillermo.poloh@colegio-americano.edu.co', '1043454537', ' 9A'),
(246, 'SANCHEZ GONZALEZ ALEX FRANCISCO', 'alex.sanchezg@colegio-americano.edu.co', '1042858402', ' 9B'),
(247, 'FONTALVO OSPINO SAMUEL DAVID', 'samuel.fontalvo@colegio-americano.edu.co', '1042260725', ' 10B'),
(248, 'ORTIZ MARCHENA ISABEL SOFIA', 'isabel.ortizm@colegio-americano.edu.co', '1043678946', ' 10A'),
(249, 'PIÑERES ARIZA DANIEL DAVID', 'daniel.pineresa@colegio-americano.edu.co', '1042259738', ' 10B'),
(250, 'AMADOR VILLA EDICKSON JOSÉ', 'edickson.amador@colegio-americano.edu.co', '1042259028', ' 11A'),
(251, 'CONDE MENCO LEONARDO JUNIOR', 'leonardo.condem@colegio-americano.edu.co', '1042852508', ' 11B'),
(252, 'CONTRERAS GIL CAMILA', 'camila.contrerasg@colegio-americano.edu.co', '1025145079', ' 11A'),
(253, 'GERALDINO PEÑA GIANLUCA', 'gianluca.geraldino@colegio-americano.edu.co', '1044218488', ' 11B'),
(254, 'GONZALEZ BARRIENTOS JUAN DAVID', 'juan.gonzalezba@colegio-americano.edu.co', '1042855196', ' 11A'),
(255, 'JIMENO ZUÑIGA MATHEW ALEJANDRO', 'mathew.jimeno@colegio-americano.edu.co', '1043449291', ' 11B'),
(256, 'LLANOS AHUMADA ANDRES DARIO', 'andres.llanosa@colegio-americano.edu.co', '1043451505', ' 11B'),
(257, 'RODRIGUEZ MORALES DIEGO HELAMAN', 'diego.rodriguezm@colegio-americano.edu.co', '1042258465', ' 11A'),
(258, 'SAAVEDRA OCHOA SEBASTIAN JOSE', 'sebastian.saavedrao@colegio-americano.edu.co', '1048069846', ' 11C'),
(259, 'ARAUJO MEZA DANIEL ALBERTO', 'daniel.araujom@colegio-americano.edu.co', '1046729921', ' 3A'),
(260, 'ARAUJO MEZA DANIELA SOFIA', 'daniela.araujom@colegio-americano.edu.co', '1046729922', ' 3A'),
(261, 'KRAYEM SAMHAT BATOUL', 'batoul.krayem@colegio-americano.edu.co', '693654', ' 3A'),
(262, 'LEAL DIAZ EMILY', 'emily.leal@colegio-americano.edu.co', '1043477447', ' 3A'),
(263, 'RAMOS CASTAÑEDA JUAN MARTIN', 'juan.ramosca@colegio-americano.edu.co', '1220222320', ' 3A'),
(264, 'VARGAS TEHERAN SEBASTIAN', 'sebastian.vargast@colegio-americano.edu.co', '1046732098', ' 3A'),
(265, 'VENTURA GONZALEZ FELIX JONAS', 'felix.ventura@colegio-americano.edu.co', '1043479763', ' 3A'),
(266, 'GUZMAN CALDERON DAGOBERTO FRANCISCO', 'dagoberto.guzman@colegio-americano.edu.co', '1197469359', ' 4A'),
(267, 'MARCELES PARRA MIRANDA ISABEL', 'miranda.marceles@colegio-americano.edu.co', '1042863452', ' 4A'),
(268, 'BARROS QUESADA VICTORIA', 'victoria.barrosq@colegio-americano.edu.co', '1042266726', ' 5B'),
(269, 'GUERRA APARICIO VICTOR JOSUE', 'victor.guerraa@colegio-americano.edu.co', '1042266751', ' 5A'),
(270, 'NAVARRO CABALLERO THIAGO', 'thiago.navarro@colegio-americano.edu.co', '1046724124', ' 5B'),
(271, 'OTERO VIZCAINO ANGEL GABRIEL', 'angel.oterov@colegio-americano.edu.co', '1235254401', ' 5B'),
(272, 'PALMA MARTINEZ JERONIMO', 'jeronimo.palma@colegio-americano.edu.co', '1062609484', ' 5B'),
(273, 'VENTURA GONZALEZ JERONIMO', 'jeronimo.ventura@colegio-americano.edu.co', '1046723065', ' 5B'),
(274, 'DAZA SERNA JAIDER DANIEL', 'jaider.daza@colegio-americano.edu.co', '1043706098', ' 2B'),
(275, 'MARTINEZ MARTINEZ SAMUEL DAVID', 'samuel.martinezm@colegio-americano.edu.co', '1048086289', ' 2A'),
(276, 'TORREGROZA ACOSTA STEVEN', 'steven.torregroza@colegio-americano.edu.co', '1048084902', ' 2A'),
(277, 'AGUILAR RAMOS SARA SOFIA', 'sara.aguilar@colegio-americano.edu.co', '1042267475', ' 5B'),
(278, 'OROZCO ZAER JUAN GUILLERMO', 'juan.orozcoz@colegio-americano.edu.co', '1080697774', ' 7B'),
(279, 'BARRIOS RODRIGUEZ MATIAS RICARDO', 'matias.barrios@colegio-americano.edu.co', '1201229330', ' 8A'),
(280, 'IGUARAN TELLEZ PAULA ANDREA', 'paula.iguaran@colegio-americano.edu.co', '1050727243', ' 9B'),
(281, 'VILORIA GOMEZ ORLANDO JAVIER', 'orlando.viloria@colegio-americano.edu.co', '1046722650', ' 5B'),
(282, 'DOMINGUEZ BENEDETTI VALERIA', 'valeria.dominguezb@colegio-americano.edu.co', '1042262068', ' 9C'),
(283, 'BRITO TORREGROZA ISABELLA MARIA', 'isabella.britot@colegio-americano.edu.co', '1194977380', ' 2A'),
(284, 'AVILA URDANETA JEILY ISABELLA', 'jeily.avila@colegio-americano.edu.co', '1044228801', ' 2A'),
(285, 'SUAREZ SALAZAR LUISA ALEJANDRA', 'luisa.suarez@colegio-americano.edu.co', '1127541414', ' 3A'),
(286, 'AVILA URDANETA DIEGO DE JESUS', 'diego.avilau@colegio-americano.edu.co', '1044663476', ' 3A'),
(287, 'OROZCO JINETE SEBASTIAN', 'sebastian.orozcoj@colegio-americano.edu.co', '1043466650', ' 4A'),
(288, 'PIMIENTA SALGADO MARCELA ISABELL', 'marcela.pimienta@colegio-americano.edu.co', '1043472271', ' 4A'),
(289, 'CORRALES CRUZ ANA SOFIA', 'ana.corrales@colegio-americano.edu.co', '1013040055', ' 4A'),
(290, 'ANGARITA PEÑA GABRIELLA', 'gabriella.angarita@colegio-americano.edu.co', '1043474695', ' 4A'),
(291, 'PEREZ TABOADA MARYCRUZ', 'marycruz.perez@colegio-americano.edu.co', '1062535960', ' 4A'),
(292, 'RUMBO HOYOS MATIAS', 'matias.rumbo@colegio-americano.edu.co', '1043469008', ' 5A'),
(293, 'CUELLO QUINTERO MARIA CELESTE', 'maria.cuello@colegio-americano.edu.co', '1046720935', ' 5B'),
(294, 'PLATA OROZCO SANTIAGO ANDRES', 'santiago.platao@colegio-americano.edu.co', '1146538974', ' 5A'),
(295, 'PIÑERES ARIZA GABRIELA CAROLINA', 'gabriela.pineres@colegio-americano.edu.co', '1042266971', ' 5A'),
(296, 'PEREZ VARGAS DANIEL DAVID', 'danield.perezv@colegio-americano.edu.co', '1146540190', ' 5A'),
(297, 'RAMOS MOLINA THIAGO', 'thiago.ramos@colegio-americano.edu.co', '1044653972', ' 5A'),
(298, 'ROMERO LOZANO EDUARDO JOSE', 'eduardo.romerol@colegio-americano.edu.co', '1041698009', ' 7A'),
(299, 'LONDOÑO SANJUAN DANIEL FELIPE', 'daniel.londono@colegio-americano.edu.co', '1042861760', ' 7A'),
(300, 'SUAREZ SALAZAR SOFIA ISABEL', 'sofia.suarezs@colegio-americano.edu.co', '1127538444', ' 7B'),
(301, 'CAMELO SALAS SARA SOFIA', 'sara.camelo@colegio-americano.edu.co', '1046912782', ' 7A'),
(302, 'TOBIAS VARGAS NICOLL CAROLINA', 'nicoll.tobias@colegio-americano.edu.co', '1146536201', ' 8C'),
(303, 'SIERRA LOBO VALENTINA', 'valentina.sierra@colegio-americano.edu.co', '1106635507', ' 10C'),
(304, 'BELEÑO GUERRA SARA INES', 'sara.beleno@colegio-americano.edu.co', '1063963542', ' 10C'),
(305, 'DE HOYOS BATISTA DIEGO ANDRES', 'diego.dehoyos@colegio-americano.edu.co', '1139431857', ' 10B'),
(306, 'INSIGNARES MARQUEZ HUMBERTO', 'humberto.insignares@colegio-americano.edu.co', '1041695224', ' 10B'),
(307, 'RUIZ BERNAL MAIDA ALEJANDRA', 'maida.ruiz@colegio-americano.edu.co', '1048074796', ' 10C'),
(308, 'CACERES HERNANDEZ MANUEL DE JESUS', 'manuel.caceresh@colegio-americano.edu.co', '1046705039', ' 10C'),
(309, 'AVILA URDANETA SANDRO JAVIER', 'sandro.avila@colegio-americano.edu.co', '1044657979', ' 10C'),
(310, 'PIÑERES ARIZA ISABELLA CAROLINA', 'isabella.pineres@colegio-americano.edu.co', '1042261744', ' 10C'),
(311, 'HERNANDEZ HENRIQUEZ GIULIANNA MICHELLE', 'giulianna.hernandez@colegio-americano.edu.co', '1043452611', ' 10C'),
(312, 'ORTEGA OSPINO SANTIAGO ELIAS', 'santiago.ortegao@colegio-americano.edu.co', '1043450216', ' 11A'),
(313, 'PALENCIA DEVIA ALEJANDRO', 'alejandro.palencia@colegio-americano.edu.co', '1044216422', ' 11A'),
(314, 'MARTINEZ VILLAMIL MAXIMILIANO', 'maximiliano.martinezv@colegio-americano.edu.co', '1043181374', ' 4A'),
(315, 'ECHEVERRIA GRANADOS ANDRES DAVID', 'andres.echeverria@colegio-americano.edu.co', '1043446463', ' 11A'),
(316, 'AHUMADA ALEMAN ISABELLA SOFIA', 'isabella.ahumada@colegio-americano.edu.co', '1139429474', ' 10A'),
(317, 'MAESTRE DOUGLAS JUAN DE DIOS', 'juan.maestre@colegio-americano.edu.co', '1046725058', ' 5B'),
(318, 'CRUZ PRINCE SARA SOFIA', 'sara.cruzp@colegio-americano.edu.co', '1046722060', ' 5A'),
(319, 'CRUZ PRINCE REMIGIO ANDRES', 'remigio.cruz@colegio-americano.edu.co', '1046713599', ' 7A'),
(320, 'PADILLA SANTODOMINGO DAVID ALBERTO', 'david.padillas@colegio-americano.edu.co', '1194963210', ' 11A'),
(321, 'LOPEZ SEPULVEDA SAMUEL DAVID', 'samuel.lopezs@colegio-americano.edu.co', '1042261363', ' 10B'),
(322, 'MOLINA IRIARTE THOMAS ALEJANDRO', 'thomas.molina@colegio-americano.edu.co', '1130281997', ' 2A'),
(323, 'GUTIERREZ MARTINEZ EMMA LUCIA', 'emma.gutierrezm@colegio-americano.edu.co', '1048084676', ' 2A'),
(324, 'GONZALEZ BOVEA THOMAS', 'thomas.gonzalez@colegio-americano.edu.co', '1046729082', ' 4A'),
(325, 'CAMARGO BORREGO ALEJANDRO', 'alejandro.camargo@colegio-americano.edu.co', '1046734817', ' 1A'),
(326, 'COBA PUERTO EMMANUEL', 'emmanuel.coba@colegio-americano.edu.co', '1043489602', ' 1A'),
(327, 'RODRIGUEZ RANGEL NOELIA', 'noelia.rodriguezr@colegio-americano.edu.co', '1042274435', ' 1A'),
(328, 'SANCHEZ FISCHER MARIA CAMILA', 'maria.sanchezf@colegio-americano.edu.co', '1044230988', ' 1A'),
(329, 'ALVAREZ HERNANDEZ ANTONELLA', 'antonella.alvarez@colegio-americano.edu.co', '1104841201', ' 2A'),
(330, 'TORREGROZA ACOSTA ELISA', 'elisa.torregroza@colegio-americano.edu.co', '1048087904', ' 1A'),
(331, 'CASTRO FLOREZ SHARIK NICOLL', 'sharik.castro@colegio-americano.edu.co', '1194978026', ' 2B'),
(332, 'MEDINA ROBAYO DANIEL ISAI', 'daniel.medinar@colegio-americano.edu.co', '1041701080', ' 2B'),
(333, 'RODRIGUEZ NATERA DIEGO', 'diego.rodriguezn@colegio-americano.edu.co', '1042272123', ' 2A'),
(334, 'SANCHEZ CARPIO VIOLETTA', 'violetta.sanchez@colegio-americano.edu.co', '1146543353', ' 2B'),
(335, 'QUICENO HERNANDEZ YEISON ANDRES', 'yeison.quiceno@colegio-americano.edu.co', '1043478137', ' 3B'),
(336, 'ACUÑA SANJUAN ARIADNA ANDREA', 'ariadna.acuna@colegio-americano.edu.co', '1041699870', ' 4B'),
(337, 'DONADO MAYA JUAN JOSE', 'juan.donado@colegio-americano.edu.co', '1108258245', ' 4B'),
(338, 'DE LA CRUZ HERRERA GARETH', 'gareth.delacruz@colegio-americano.edu.co', '1042272414', ' 2B'),
(339, 'BLANCO DE LA HOZ JULIAN DAVID', 'julian.blancod@colegio-americano.edu.co', '1043473306', ' 3B'),
(340, 'RODRIGUEZ GOMEZ SANTIAGO', 'santiago.rodriguezgo@colegio-americano.edu.co', '1044226344', ' 3A'),
(341, 'DURAN GARCIA GABRIEL', 'gabriel.durang@colegio-americano.edu.co', '1051074460', ' 4B'),
(342, 'FERNANDEZ POLO SARA SOFIA', 'sara.fernandez@colegio-americano.edu.co', '1143460942', ' 4B'),
(343, 'GARCIA MEDRANO JEREMIAS', 'jeremias.garciam@colegio-americano.edu.co', '1044657512', ' 4B'),
(344, 'GONZALEZ JULIO SANTIAGO', 'santiago.gonzalezj@colegio-americano.edu.co', '1146540712', ' 4B'),
(345, 'ROCHA BUENDIA DAVID ANDRES', 'david.rochab@colegio-americano.edu.co', '1043473885', ' 4A'),
(346, 'MEDINA PEÑA LUIS FELIPE', 'luis.medinap@colegio-americano.edu.co', '1118864010', ' 5B'),
(347, 'VILLEGAS CHARRIS ALEJANDRO', 'alejandro.villegasc@colegio-americano.edu.co', '1194970616', ' 5B'),
(348, 'ANGULO BORELLY ANTHONY ALBERTO', 'anthony.angulo@colegio-americano.edu.co', '1194970331', ' 6B'),
(349, 'VALENCIA SANCHEZ JHOEL CRISTIANO', 'jhoel.valencia@colegio-americano.edu.co', '1194971938', ' 6B'),
(350, 'ALCOCER GUARDELA ALAN ANDRES', 'alan.alcocer@colegio-americano.edu.co', '1048076860', ' 8B'),
(351, 'MEDINA PEÑA GREGORI DAVID', 'gregori.medina@colegio-americano.edu.co', '1065808127', ' 8B'),
(352, 'ROCHA BUENDIA DANIELA PAOLA', 'daniela.rochab@colegio-americano.edu.co', '1044220836', ' 8B'),
(353, 'ROMERO MORA MARIA ANGEL', 'maria.romerom@colegio-americano.edu.co', '1023396161', ' 8B'),
(354, 'FEREIRA GOMEZ NICOLE STEFANNY', 'nicole.fereira@colegio-americano.edu.co', '6054412', ' 9A'),
(355, 'RODRIGUEZ COLINA ISAAC DANIEL', 'isaac.rodriguezc@colegio-americano.edu.co', '1044226320', ' 2B'),
(356, 'VILLA FRANCO SARA SOFIA', 'sara.villa@colegio-americano.edu.co', '1046733847', ' 2B'),
(357, 'GIRALDO CHARRIS NEYMAR JOSUE', 'neymar.giraldo@colegio-americano.edu.co', '1139433174', ' 9B'),
(358, 'CAMPO CARRILLO ELIUD JAVIER', 'eliud.campo@colegio-americano.edu.co', '1046732018', ' 3B'),
(359, 'AVILA ROMERO JERONIMO', 'jeronimo.avila@colegio-americano.edu.co', '1222209327', ' 4B'),
(360, 'LAMADRID TORRES ANDRES DAVID', 'andres.lamadrid@colegio-americano.edu.co', '1043471016', ' 4A'),
(361, 'WINKEL BARRAZA GABRIELLA JADE', 'gabriela.winkel@colegio-americano.edu.co', '1042274524', ' 1A'),
(362, 'CARANQUI ALVAREZ OSCAR FELIPE', 'oscar.caranqui@colegio-americano.edu.co', '1205963579', ' 9A'),
(363, 'TORO BARROS MATEO', 'mateo.toro@colegio-americano.edu.co', '1046706257', ' 9A'),
(364, 'TORRES CASSIANI ASTRID CAROLINA', 'astrid.torres@colegio-americano.edu.co', '1048076296', ' 9A'),
(365, 'ALBA HERNANDEZ CARMEN JOSE', 'carmen.albah@colegio-americano.edu.co', '1043456788', ' 9B'),
(366, 'GOMEZ LOZANO FABIO SAID', 'fabio.gomez@colegio-americano.edu.co', '1139431962', ' 9B'),
(367, 'PEREZ CORREDOR JESUS DAVID', 'jesus.perezc@colegio-americano.edu.co', '1139431674', ' 9B'),
(368, 'MORRON ORTEGA SEBASTIAN DE JESUS', 'sebastian.morron@colegio-americano.edu.co', '1146536114', ' 9B'),
(369, 'YEPES ROJAS ESTEFANIA', 'estefania.yepes@colegio-americano.edu.co', '1028869276', ' 9B'),
(370, 'CORONELL LARA ANDRES FELIPE', 'andres.coronell@colegio-americano.edu.co', '1146541044', ' 4A'),
(371, 'DEL RIO CARRILLO MARIA JOSE', 'maria.delrioca@colegio-americano.edu.co', '1030221855', ' 8B'),
(372, 'NEGRETE VELASQUEZ ANDRES DAVID', 'andres.negrete@colegio-americano.edu.co', '1042268873', ' 3A'),
(373, 'GONZALEZ SALAZAR MATIAS JOSE', 'matias.gonzalezs@colegio-americano.edu.co', '1048083134', ' 3A'),
(374, 'GONZALEZ BORJA EVA LUZ', 'eva.gonzalezb@colegio-americano.edu.co', '1143467808', ' 3B'),
(375, 'HARVEY BOLAÑO SOPHIA PRINCE', 'sophia.harvey@colegio-americano.edu.co', '1083436904', ' 9A'),
(376, 'FERNANDEZ CASDELO CAMILO ANDRES', 'camilo.fernandez@colegio-americano.edu.co', '1044219370', ' 10B'),
(377, 'CAICEDO MENDEZ MATHIAS ANDRES F.', 'mathias.caicedo@colegio-americano.edu.co', '1127166478', ' 10B'),
(378, 'DURAN SANDOVAL TARECK', 'tareck.duran@colegio-americano.edu.co', '1092181052', ' 10A'),
(379, 'CASTILLO ESTRADA EMMANUEL', 'emmanuel.castilloe@colegio-americano.edu.co', '1043698120', ' 4B'),
(380, 'VILLA FRANCO MATHIAS', 'mathias.villa@colegio-americano.edu.co', '1046722914', ' 5A'),
(381, 'GONZALEZ BORJA MARIA ALEJANDRA', 'maria.gonzalezb@colegio-americano.edu.co', '1143460586', ' 4B'),
(382, 'DURAN OVALLES ARIADNA SOFIA', 'ariadna.duran@colegio-americano.edu.co', '1042467336', ' 11B'),
(383, 'CASTRO ESCORCIA MARIA JOSE', 'maria.castroe@colegio-americano.edu.co', '1043679203', ' 11B'),
(384, 'POSADA SOCARRAS MATEO JESUS', 'mateo.posada@colegio-americano.edu.co', '1042265407', ' 5B'),
(385, 'ROJAS BANDERA JOHAN MANUEL', 'johan.rojasb@colegio-americano.edu.co', '1043996965', ' 6A'),
(386, 'MARQUEZ ROJAS MARCOS BASILIO', 'marcos.marquez@colegio-americano.edu.co', '1013608', ' 8B'),
(387, 'BARRAZA RODRIGUEZ RENATA', 'renata.barraza@colegio-americano.edu.co', '1158466968', ' 2B'),
(388, 'VARGAS JACOME TALIANA SOFIA', 'taliana.vargas@colegio-americano.edu.co', '1094052084', ' 11A'),
(389, 'DIAZ VARELA SAMUEL ANDRES', 'samuel.diazv@colegio-americano.edu.co', '1046716069', ' 7B'),
(390, 'CASTELLANOS LOPEZ JUAN SEBASTIAN', 'juan.castellanoslo@colegio-americano.edu.co', '1089604611', ' 11C'),
(391, 'HERNANDEZ MUNAR MARIANA', 'mariana.hernandezm@colegio-americano.edu.co', '1013141557', ' 7B'),
(392, 'GONZALEZ BOVEA THALIANA JULIETH', 'thaliana.gonzalez@colegio-americano.edu.co', '1043686082', ' 8B'),
(393, 'SANCHEZ CARPIO MOISES DAVID', 'moises.sanchezca@colegio-americano.edu.co', '1046718785', ' 6A'),
(394, 'CASTELLANOS LOPEZ JUAN NICOLAS', 'juan.castellanosl@colegio-americano.edu.co', '1097791295', ' 4B'),
(395, 'MOLINARES BARRETO JESSICA PAOLA', 'jessica.molinares@colegio-americano.edu.co', '1042256556', ' 11A'),
(396, 'MIZAR OLIVEROS SAMARA SOFIA', 'samara.mizar@colegio-americano.edu.co', '1146541842', ' 3B'),
(397, 'ARIAS ROJAS ISAAC DAVID', 'isaac.arias@colegio-americano.edu.co', '1043190481', ' 2B'),
(398, 'BARRAGAN NORIEGA ANTHONY', 'anthony.barragan@colegio-americano.edu.co', '1043691734', ' 7B'),
(399, 'GUZMAN CACHAN ANDREY JOSE', 'andrey.guzman@colegio-americano.edu.co', '1048081070', ' 5A'),
(400, 'URZOLA MUÑOZ AMANDA', 'amanda.urzola@colegio-americano.edu.co', '1041984057', ' 9A'),
(401, 'CASTRO LLAMAS ALEX DAVID', 'alex.castrol@colegio-americano.edu.co', '1043452972', ' 10C'),
(402, 'MARTELO DE LA HOZ ISABELLA', 'isabella.martelo@colegio-americano.edu.co', '1043982100', ' 10A'),
(403, 'WU YU VICTORIA YULIN', 'victoria.wu@colegio-americano.edu.co', '1046728349', ' 3B'),
(404, 'WU YU LUCIANA HUI QI', 'luciana.wu@colegio-americano.edu.co', '1194978040', ' 2B'),
(405, 'RUAN HUANG LUCAS WEIFENG', 'lucas.ruan@colegio-americano.edu.co', '1205967853', ' 1B'),
(406, 'SUAREZ CONTRERAS CARLOS DAVID', 'carlos.suarezc@colegio-americano.edu.co', '1046711430', ' 9B'),
(407, 'ZAMORA AGUIRRE JUAN ESTEBAN', 'juan.zamoraa@colegio-americano.edu.co', '1011211098', ' 7B'),
(408, 'REALES PAJARO MATHIAS', 'mathias.reales@colegio-americano.edu.co', '1043189027', ' 2C'),
(409, 'ESCORCIA PAJARO KEITLYN SOFIA', 'keitlyn.escorcia@colegio-americano.edu.co', '1130276690', ' 4A'),
(410, 'ESCORCIA PAJARO REYSHEL ZAHORY', 'reyshel.escorcia@colegio-americano.edu.co', '1140880998', ' 5A'),
(411, 'QIU HUANG ANGEL', 'angel.qiuh@colegio-americano.edu.co', '1048080186', ' 5B'),
(412, 'ALVAREZ FLOREZ SANTIAGO', 'santiago.alvarezf@colegio-americano.edu.co', '1042859278', ' 9B'),
(413, 'CORREA ANAYA SAMUEL', 'samuel.correaa@colegio-americano.edu.co', '1029625923', ' 1A'),
(414, 'VIDAL SANJUANELO SANTIAGO ANDRES', 'santiago.vidals@colegio-americano.edu.co', '1042864134', ' 2B'),
(415, 'PACHECO CANTILLO ISAIAS', 'isaias.pacheco@colegio-americano.edu.co', '1044229220', ' 1A'),
(416, 'WU LUO HANSON HAONING', 'hanson.wu@colegio-americano.edu.co', '1047061703', ' 4A'),
(417, 'TORRES RENTERIA ILIE JAFET', 'ilie.torres@colegio-americano.edu.co', '1046737556', ' TNA'),
(418, 'NEIRA SANTIAGO EDDIER', 'eddier.neira@colegio-americano.edu.co', '1042271455', ' 3A'),
(419, 'MANOSALVA CRESPO ARIANA', 'ariana.manosalva@colegio-americano.edu.co', '1044227154', ' 2A'),
(420, 'TINOCO POLO ANTONIO JOSE', 'antonio.tinoco@colegio-americano.edu.co', '1205968243', ' 2A'),
(421, 'MANOTAS RIVERA GABRIEL DAVID', 'gabriel.manotas@colegio-americano.edu.co', '1194975552', ' 3B'),
(422, 'TINOCO POLO ISABEL SOFIA', 'isabel.tinoco@colegio-americano.edu.co', '1205964779', ' 5A'),
(423, 'PRIMO MERCADO ALEJANDRO MANUEL', 'alejandro.primo@colegio-americano.edu.co', '1043463021', ' 6A'),
(424, 'MARQUEZ MIRANDA SAMUEL DAVID', 'samuel.marquezm@colegio-americano.edu.co', '1044223460', ' 6B'),
(425, 'RODRIGUEZ FERRER MATTIAS ANDRE', 'mattias.rodriguez@colegio-americano.edu.co', '1048076690', ' 8A'),
(426, 'ROJAS ESCOLAR SAMUEL', 'samuel.rojase@colegio-americano.edu.co', '1046710639', ' 8C'),
(427, 'MORALES CERA DANNA MARCELA', 'danna.moralescm@colegio-americano.edu.co', '1149935793', ' 10A'),
(428, 'PRIMO MERCADO VALENTINA', 'valentina.primo@colegio-americano.edu.co', '1043155250', ' 10C'),
(429, 'SUAREZ VIECCO ANA MARIA', 'ana.suarez@colegio-americano.edu.co', '1043676680', ' 11C'),
(430, 'MARQUEZ MIRANDA REYNALDO ANDRES', 'reynaldo.marquez@colegio-americano.edu.co', '1048071587', ' 11C'),
(431, 'AGUIRRE ROLON ALESSANDRE', 'alessandre.aguirre@colegio-americano.edu.co', '1048073306', ' 10B'),
(432, 'INSIGNARES RAMIREZ JERONIMO', 'jeronimo.insignares@colegio-americano.edu.co', '1042864352', ' 2A'),
(433, 'ACEVEDO DEL CAMPO JUAN CAMILO', 'juan.acevedod@colegio-americano.edu.co', '1046732184', ' 2A'),
(434, 'CABALLERO REAL THIAGO ALEJANDRO', 'thiago.caballero@colegio-americano.edu.co', '1013026555', ' 3B'),
(435, 'CASTRO BARROS ALEJANDRO', 'alejandro.castrob@colegio-americano.edu.co', '1042266063', ' 6B'),
(436, 'MARTINEZ AGUDELO SOFIA ALEJANDRA', 'sofia.martinezaa@colegio-americano.edu.co', '1130273909', ' 8A'),
(437, 'VILA MARTINEZ JOSÉ DANIEL', 'jose.vila@colegio-americano.edu.co', '1034519921', ' 9C'),
(438, 'MARTINEZ AGUDELO SEBASTIAN JABID', 'sebastian.martineza@colegio-americano.edu.co', '1130272560', ' 10C'),
(439, 'BALETA ASCENCIO FREDDY JOSE', 'freddy.baleta@colegio-americano.edu.co', '1103105549', ' 11C'),
(440, 'BAENA HAMBURGER MARIA GABRIELA', 'maria.baena@colegio-americano.edu.co', '1042855853', ' 11C'),
(441, 'HERNANDEZ SALCEDO CORINA', 'corina.hernandez@colegio-americano.edu.co', '1044233146', ' TNA'),
(442, 'SOLANO ARZUZA DANIEL ALFONSO', 'daniel.solanoa@colegio-americano.edu.co', '1046731205', ' 2A'),
(443, 'OLARTE ARZUZA ISMAEL DANIEL', 'ismael.olarte@colegio-americano.edu.co', '1043477775', ' 3A'),
(444, 'DE LOS REYES FORERO JESUS DAVID', 'jesus.delosreyesf@colegio-americano.edu.co', '1044221207', ' 8A'),
(445, 'DOMINGUEZ MAURY ALEJANDRO', 'alejandro.dominguezm@colegio-americano.edu.co', '1046707070', ' 9A'),
(446, 'AGUILAR CONSUEGRA JORGE ANDRES', 'jorge.aguilarc@colegio-americano.edu.co', '1043681955', ' 9A'),
(447, 'VARGAS JACOME ARIADNA SOFIA', 'ariadna.vargasj@colegio-americano.edu.co', '1194981365', ' TNA'),
(448, 'ROSAS GUTIERREZ BRIANNA SOFIA', 'brianna.rosas@colegio-americano.edu.co', '1084056921', ' 8A'),
(449, 'TORRES LORA PAULA ALEJANDRA', 'paula.torresl@colegio-americano.edu.co', '1043309805', ' 9A'),
(450, 'DUNCAN MANGA MICHAEL', 'michael.duncan@colegio-americano.edu.co', '1046732497', ' 2A'),
(451, 'GONZALEZ AGAMEZ HENRY JOSETH', 'henry.gonzaleza@colegio-americano.edu.co', '1140899525', ' 3A'),
(452, 'DE LA HOZ JIMENEZ CARLOS ARTURO', 'carlos.delahoz@colegio-americano.edu.co', '1043478465', ' 3B'),
(453, 'GONZALEZ DE ARMAS ELIETH YOVEIRA', 'elieth.gonzalez@colegio-americano.edu.co', '1139433047', ' 8A'),
(454, 'DUNCAN MANGA RYAN', 'ryan.duncan@colegio-americano.edu.co', '1044219978', ' 10B'),
(455, 'PICON COLLANTE STEVEN DAVID', 'steven.picon@colegio-americano.edu.co', '1042268043', ' 4B'),
(456, 'CALLE FERRER SANTIAGO', 'santiago.callef@colegio-americano.edu.co', '1043166292', ' 8B'),
(457, 'PICON COLLANTE ESTEBAN', 'esteban.picon@colegio-americano.edu.co', '1042262879', ' 8A'),
(458, 'SUAREZ REMOLINA ALAN JAVIER', 'alan.suarezr@colegio-americano.edu.co', '1047050100', ' 9B'),
(459, 'RUIZ CARRANZA HILLARY SOFIA', 'hillary.ruiz@colegio-americano.edu.co', '1194966573', ' 10A'),
(460, 'HERRERA FONTALVO NICOLAS ELIAS', 'nicolas.herreraf@colegio-americano.edu.co', '1047361965', ' 3B'),
(461, 'CERVANTES DIAZ GEMS CARLOS', 'gems.cervantes@colegio-americano.edu.co', '1046729879', ' 3B'),
(462, 'ACOSTA CABALLERO JACOBO', 'jacobo.acosta@colegio-americano.edu.co', '1048083834', ' 3B'),
(463, 'GUZMAN ACOSTA ISABELLA', 'isabella.guzmana@colegio-americano.edu.co', '1146540907', ' 4B'),
(464, 'QUIROGA ROCA MATHÍAS', 'mathias.quiroga@colegio-americano.edu.co', '1046725133', ' 5B'),
(465, 'QUIROGA ROCA HÉCTOR JR.', 'hector.quiroga@colegio-americano.edu.co', '1048075826', ' 9A'),
(466, 'EL ABBOUZ OROZCO LUCIA SANAA', 'lucia.elabbouz@colegio-americano.edu.co', '1194964962', ' 10C'),
(467, 'RUIZ CORREA VALERY LUCIA', 'valery.ruizc@colegio-americano.edu.co', '1041694678', ' 11C'),
(468, 'FREYLE REYES SAMUEL DAVID', 'samuel.freyle@colegio-americano.edu.co', '1048075849', ' 8C'),
(469, 'NAVARRO SANCHEZ SAMUEL DAVID', 'samuel.navarros@colegio-americano.edu.co', '1048084428', ' 3A'),
(470, 'SALAZAR BARRAZA LUIS ALEJANDRO', 'luis.salazarb@colegio-americano.edu.co', '1037671900', ' 2B'),
(471, 'EGUIS BARRAZA JULIANA', 'juliana.eguis@colegio-americano.edu.co', '1044222361', ' 8B'),
(472, 'PEÑA CRUZCO JUAN ELIAS', 'juan.penac@colegio-americano.edu.co', '1043459003', ' 8A'),
(473, 'MORENO ALARCON MARIA PAULA', 'maria.morenoa@colegio-americano.edu.co', '1016740221', ' 4A'),
(474, 'CORTES TORRES DANIEL DAVID', 'daniel.corteztd@colegio-americano.edu.co', '1130276252', ' 5B'),
(475, 'LEMUS GALVAN AMELIE', 'amelie.lemus@colegio-americano.edu.co', '1046722922', ' 5B'),
(476, 'ESTRADA LUQUE JAIR JOSE', 'jair.estrada@colegio-americano.edu.co', '1046707565', ' 9A'),
(477, 'OJEDA ALVEAR DANIEL EDUARDO', 'daniel.ojedaa@colegio-americano.edu.co', '1103507341', ' 11C'),
(478, 'ACUÑA MARTINEZ ISABELLA', 'isabella.acunam@colegio-americano.edu.co', '1034783422', ' 9B'),
(479, 'SUNDHEIM OROZCO ISAAC DAVID', 'isaac.sundheim@colegio-americano.edu.co', '1048084153', ' 3B'),
(480, 'NORIEGA JIMENEZ MARIA FERNANDA', 'maria.noriegaj@colegio-americano.edu.co', '1032186677', ' 7B'),
(481, 'SANTANDER CAAMAÑO MARIA CAMILA', 'maria.santanderc@colegio-americano.edu.co', '1139433173', ' 8A'),
(482, 'GARCIA TRUJILLO DENZEL NAEL', 'denzel.garcia@colegio-americano.edu.co', '1043704014', ' 2B'),
(483, 'HERRERA COGOLLO STEVEN -', 'steven.herrerac@colegio-americano.edu.co', '1046731939', ' 2B'),
(484, 'TRONCOSO ALVAREZ DIEGO ANDRES', 'diego.troncoso@colegio-americano.edu.co', '1046734480', ' 2B'),
(485, 'FAJARDO MENDOZA LAURA SOFIA', 'laura.fajardom@colegio-americano.edu.co', '1034789406', ' 4A'),
(486, 'CORBACHO CANTILLO MATEO', 'mateo.corbacho@colegio-americano.edu.co', '1194970450', ' 6B'),
(487, 'ARRIETA BUELVAS ANA CRISTINA', 'ana.arrieta@colegio-americano.edu.co', '1099963081', ' 9B'),
(488, 'NIEBLES BENTHAN ISAAC JAVIER', 'isaac.niebles@colegio-americano.edu.co', '1146543114', ' 2A'),
(489, 'MOZO YANCE LUIS MIGUEL', 'luis.mozo@colegio-americano.edu.co', '1043705282', ' 2B'),
(490, 'OSPINO ROMERO JUAN DAVID', 'juan.ospinor@colegio-americano.edu.co', '1046709681', ' 8B'),
(491, 'CONSUEGRA GALVIS DANIEL EDUARDO', 'daniel.consuegra@colegio-americano.edu.co', '1014993274', ' 9B'),
(492, 'MONTERO MOLANO SEBASTIAN ANDRES', 'sebastian.monterom@colegio-americano.edu.co', '1042855960', ' 10A'),
(493, 'SUAREZ TAPIAS RAUL DAVID', 'raul.suarezt@colegio-americano.edu.co', '1092548033', ' 1A'),
(494, 'SUAREZ TAPIAS MARIA ALEJANDRA', 'maria.suarezt@colegio-americano.edu.co', '1092538996', ' 9B'),
(495, 'VASQUEZ SIERRA JIMENA', 'jimena.vasquezsi@colegio-americano.edu.co', '1043451702', ' 10A'),
(496, 'SUAREZ REMOLINA ENEKO JAVIER', 'eneko.suarez@colegio-americano.edu.co', '1046729288', ' 3A'),
(497, 'RODRIGUEZ ALVAREZ VALENTINA', 'valentina.rodrigueza@colegio-americano.edu.co', '1043319075', ' 5A'),
(498, 'GRANADOS ARANGO SHELLYAN', 'shellyan.granadosa@colegio-americano.edu.co', '1194965062', ' 10B'),
(499, 'OROZCO ZAER JOSE MARTIN', 'jose.orozcoz@colegio-americano.edu.co', '1067634667', ' 3A'),
(500, 'ROSAS GARCIA SAMUEL DAVID', 'samuel.rosas@colegio-americano.edu.co', '1092945761', ' 10C'),
(501, 'BARRIOS JIMENEZ ALICE VICTORIA', 'alice.barrios@colegio-americano.edu.co', '1043479409', ' 2B'),
(502, 'DE LA HOZ BARRERO LUCIANA CAROLINA', 'luciana.delahoz@colegio-americano.edu.co', '1043477131', ' 3B');
INSERT INTO `estudiantes` (`id`, `nombre_completo`, `email`, `documento`, `grado`) VALUES
(503, 'MONTES ROSADO JUAN PABLO', 'juan.montesr@colegio-americano.edu.co', '1065814343', ' 7B'),
(504, 'PADILLA COTES MICHELL JOHANNA', 'michell.padilla@colegio-americano.edu.co', '1048075902', ' 9A'),
(505, 'HERNANDEZ ACOSTA SEBASTIAN', 'sebastian.hernandeza@colegio-americano.edu.co', '1143170590', ' 2B'),
(506, 'CHICA CRESPO CELESTE', 'celeste.chica@colegio-americano.edu.co', '1041702158', ' TNA'),
(507, 'LASPRILLA RUEDA ABIGAIL ESTHER', 'abigail.lasprilla@colegio-americano.edu.co', '1043478671', ' 2B'),
(508, 'CASTELLANOS HENAO JOSE DAVID', 'jose.castellanosh@colegio-americano.edu.co', '1194972971', ' 5B'),
(509, 'DEL CASTILLO HERNANDEZ DANIELA ALEJANDRA', 'daniela.delcastillo@colegio-americano.edu.co', '1084607372', ' 4B'),
(510, 'GONZALEZ TARA SAMUEL', 'samuel.gonzalezta@colegio-americano.edu.co', '1125230187', ' 6B'),
(511, 'GOMEZ BECERRA SEYCHELLS ARIADNA', 'seychells.gomez@colegio-americano.edu.co', '1043480389', ' 2A'),
(512, 'MARCHENA RENDON VALENTINA', 'valentina.marchena@colegio-americano.edu.co', '1046732610', ' 3B'),
(513, 'GUTIERREZ MOSQUERA JESUS ARSENIO', 'jesus.gutierrezm@colegio-americano.edu.co', '1042269758', ' 4A'),
(514, 'DAZA ESPINOSA DANTE', 'dante.daza@colegio-americano.edu.co', '1066883480', ' 6A'),
(515, 'DAZA ESPINOSA FIORELLA', 'fiorella.daza@colegio-americano.edu.co', '1067604857', ' 11C'),
(516, 'CASTRO SANTOS SALOME', 'salome.castro@colegio-americano.edu.co', '1092965998', ' TNA'),
(517, 'MIRANDA BERNOTTI FIORELLA MARIAM', 'fiorella.miranda@colegio-americano.edu.co', '1048088908', ' TNA'),
(518, 'CABALLERO MENDOZA SANTIAGO', 'santiago.caballerome@colegio-americano.edu.co', '1046731195', ' 3B'),
(519, 'MOLINA MARTINEZ LUCIA', 'lucia.molinam@colegio-americano.edu.co', '1146541980', ' 3A'),
(520, 'CASTRO SANTOS SAMUEL DAVID', 'samuel.castros@colegio-americano.edu.co', '1092959900', ' 4A'),
(521, 'GIRALDO CALABRIA NICOLAS', 'nicolas.giraldoc@colegio-americano.edu.co', '1048079996', ' 5B'),
(522, 'GIRALDO CALABRIA ISAAC', 'isaac.giraldoc@colegio-americano.edu.co', '1046708947', ' 8B'),
(523, 'CASTELLANOS HENAO ANGEL DAVID', 'angel.castellanosh@colegio-americano.edu.co', '1028141197', ' 11C'),
(524, 'DIAZ ACUÑA MAXIMILIANO', 'maximiliano.diaza@colegio-americano.edu.co', '1043487051', ' 1A'),
(525, 'BARBOSA OJEDA MARIA CELESTE', 'maria.barbosao@colegio-americano.edu.co', '1047054412', ' 6B'),
(526, 'PIÑERES ARIZA ELIAS DAVID', 'elias.pineres@colegio-americano.edu.co', '1042273414', ' 2A'),
(527, 'BARRERA LOPEZ GABRIELA ANDREA', 'gabriela.barreral@colegio-americano.edu.co', '1044216413', ' 11C'),
(528, 'GRANADOS PINZON MARIANA', 'mariana.granadosp@colegio-americano.edu.co', '1188223997', ' 3A'),
(529, 'ROLON ORTIZ EMILY SOFIA', 'emily.rolon@colegio-americano.edu.co', '1044233056', ' TNA'),
(530, 'GIRALDO CHARRIS IKER', 'iker.giraldo@colegio-americano.edu.co', '1194982338', ' TNA'),
(531, 'MENA JIMENEZ MATHIAS DANIEL', 'mathias.mena@colegio-americano.edu.co', '1194976895', ' 3A'),
(532, 'ORTIZ GUEDES ANDRES FABIAN', 'andres.ortizg@colegio-americano.edu.co', '1116792376', ' 10B'),
(533, 'ORTEGA DUQUE SANTIAGO', 'santiago.ortegad@colegio-americano.edu.co', '1236888674', ' TNA'),
(534, 'MATURANA CORREDOR SELINE LUCIANA', 'seline.maturana@colegio-americano.edu.co', '1044670531', ' TNA'),
(535, 'ORTEGA DUQUE SAMANTHA', 'samantha.ortegad@colegio-americano.edu.co', '1043704337', ' 2A'),
(536, 'FERNANDEZ  DE C BOLAÑO ALEJANDRO ENRIQUE', 'alejandro.fernandezdecastro@colegio-americano.edu', '1080435244', ' 8B'),
(537, 'RODRIGUEZ COLINA DANIELLA SOPHIA', 'daniela.rodriguezc@colegio-americano.edu.co', '1042859880', ' 9B'),
(538, 'OROZCO SANCHEZ CARLOS ANDRES', 'carlos.orozcos@colegio-americano.edu.co', '1041696322', ' 9C'),
(539, 'PACHECO NARANJO ISABELA', 'isabela.pacheco@colegio-americano.edu.co', '1140897014', ' 3B'),
(540, 'HERRERA SANDOVAL ALEXIS DAVID', 'alexis.herreras@colegio-americano.edu.co', '1067610031', ' 11C'),
(541, 'SANJUANELO FERRADA FELIPE MARTIN', 'martin.sanjuanelo@colegio-americano.edu.co', '1044226356', ' 3A'),
(542, 'CONSUEGRA DE LA CRUZ SEBASTIAN', 'sebastian.consuegra@colegio-americano.edu.co', '1139428355', ' 11C'),
(543, 'SANJUANELO FERRADA SOFIA ALEJANDRA', 'sofia.sanjuanelo@colegio-americano.edu.co', '1046727268', ' 4A'),
(544, 'VELANDIA REALPE MARIANA', 'mariana.velandiar@colegio-americano.edu.co', '1014901486', ' TNA'),
(545, 'FIGUEROA SANCHEZ CAMILA', 'camila.figueroas@colegio-americano.edu.co', '1084464569', ' 2C'),
(546, 'GUTIERREZ MIRANDA ANTONIO RAFAEL', 'antonio.gutierrezm@colegio-americano.edu.co', '1043474792', ' 4A'),
(547, 'RINCONES GARCIA SARA SOFIA', 'sara.rincones@colegio-americano.edu.co', '1013016042', ' 7A'),
(548, 'RINCONES GARCIA JOSUE DANIEL', 'josue.rincones@colegio-americano.edu.co', '1013025215', ' 4B'),
(549, 'GUTIERREZ MIRANDA TALIANA VICTORIA', 'taliana.gutierrez@colegio-americano.edu.co', '1043489633', ' TNA'),
(550, 'PERDOMO PEREZ NICOLLE MISHELL', 'nicolle.perdomo@colegio-americano.edu.co', '1043680018', ' 10A'),
(551, 'PERDOMO PEREZ SANTIAGO ANDRES', 'santiago.perdomop@colegio-americano.edu.co', '1043680019', ' 10C'),
(552, 'ARRIETA MUNERA JOHAN ANDRES', 'johan.arrieta@colegio-americano.edu.co', '1043337782', ' 1A'),
(553, 'QUIROZ MARTINEZ ANDRES FELIPE', 'andres.quirozm@colegio-americano.edu.co', '1103863808', ' 2C'),
(554, 'PERALTA BLANCO ASHLEY MARIA', 'ashley.peralta@colegio-americano.edu.co', '1042857864', ' 10A'),
(555, 'PERALTA BLANCO AYLEEN SOPHIA', 'ayleen.peralta@colegio-americano.edu.co', '1046726838', ' 4B'),
(556, 'VILLANUEVA LANCHEROS MATIAS', 'matias.villanueva@colegio-americano.edu.co', '1146545050', ' 2B'),
(557, 'CUDRIZ ROMERO DIEGO ANDRES', 'diego.cudriz@colegio-americano.edu.co', '1046732395', ' 3B'),
(558, 'CORDERO ESPITIA CHRISTOPHER', 'christopher.cordero@colegio-americano.edu.co', '1046729206', ' 4B'),
(559, 'FLEREZ BOLAÑO MATEO DE JESUS', 'mateo.flerez@colegio-americano.edu.co', '1044229826', ' 1A'),
(560, 'MONTERO BARRIOS AMELIA', 'amelia.montero@colegio-americano.edu.co', '1046731631', ' 2C'),
(561, 'MONTERO BARRIOS GABRIELA', 'gabriela.monterob@colegio-americano.edu.co', '1046725533', ' 4B'),
(562, 'GONZALEZ ALVARADO ALEJANDRO', 'alejandro.gonzaleza@colegio-americano.edu.co', '1048085713', ' 2C'),
(563, 'HENRIQUEZ ARIAS LEAH', 'leah.henriquez@colegio-americano.edu.co', '1042274460', ' 1A'),
(564, 'ESTARITA BARRIOS ARIANNA', 'arianna.estarita@colegio-americano.edu.co', '1043478983', ' 2C'),
(565, 'ACEVEDO HERNANDEZ KEREN SOFIA', 'keren.acevedo@colegio-americano.edu.co', '1043480909', ' 2A'),
(566, 'ROCHA MURIEL JEAN ALEJANDRO', 'jean.rocha@colegio-americano.edu.co', '1044228200', ' 2C'),
(567, 'URINA BALASNOA SOPHIA GISELLE', 'sophia.urina@colegio-americano.edu.co', '1194974723', ' 8A'),
(568, 'OROZCO CERVANTES SANTIAGO', 'santiago.orozcoc@colegio-americano.edu.co', '1130274208', ' 8C'),
(569, 'SOLANO ROLON EMMA', 'emma.solano@colegio-americano.edu.co', '1044229051', ' 2C'),
(570, 'GONZALEZ GARZON TOMAS ANDRES', 'tomas.gonzalezg@colegio-americano.edu.co', '1048087160', ' 1A'),
(571, 'SOLANO IGLESIAS DANNA', 'danna.solano@colegio-americano.edu.co', '1041698760', ' 6A'),
(572, 'GARCIA DIAZ TOMAS', 'tomas.garciad@colegio-americano.edu.co', '1147487924', ' 9C'),
(573, 'GARCIA DIAZ MARIA ALEJANDRA', 'maria.garciad@colegio-americano.edu.co', '1147489437', ' 2C'),
(574, 'ESTRADA PIZARRO VALERIA', 'valeria.estradap@colegio-americano.edu.co', '1042856826', ' 10A'),
(575, 'CAMELO BELLO SHARON ANDREA', 'sharon.camelo@colegio-americano.edu.co', '1042261186', ' 9C'),
(576, 'BELTRAN HENAO ISABEL SOFIA', 'isabel.beltranh@colegio-americano.edu.co', '1042262249', ' 9C'),
(577, 'OROZCO DURAN JERONIMO', 'jeronimo.orozcod@colegio-americano.edu.co', '1046730700', ' 2C'),
(578, 'RAMIREZ BARRIOS MIGUEL ANGEL', 'miguel.ramirezb@colegio-americano.edu.co', '1042860468', ' 9C'),
(579, 'GUARIN CONEO SANTIAGO', 'santiago.guarinc@colegio-americano.edu.co', '1046721348', ' 6B'),
(580, 'MORALES CONEO DIEGO ALEJANDRO', 'diego.moralesc@colegio-americano.edu.co', '1130296786', ' 2C'),
(581, 'REYES GARCIA KILIAN ALEJANDRO', 'kilian.reyes@colegio-americano.edu.co', '1194974921', ' 4A'),
(582, 'COGOLLO GOMEZ DYLAN SANTIAGO', 'dylan.cogollo@colegio-americano.edu.co', '1042265898', ' 6A'),
(583, 'AVILA ALTAHONA ISAAC DANIEL', 'isaac.avila@colegio-americano.edu.co', '1085114068', ' 2A'),
(584, 'MATEUS VASQUEZ LAURA VANESSA', 'laura.mateus@colegio-americano.edu.co', '1046710588', ' 8A'),
(585, 'BOZON AGUAS DOMINIC AMET', 'dominic.bozon@colegio-americano.edu.co', '1041702457', ' JDA'),
(586, 'DE HOYOS BATISTA JULIÁN JESÚS', 'julian.dehoyos@colegio-americano.edu.co', '1043462085', ' 7B'),
(587, 'ZHU ZHU LI YAN LINA', 'li.zhu@colegio-americano.edu.co', '1046731717', ' 2C'),
(588, 'VALBUENA PEREZ LUIS MIGUEL', 'luis.valbuena@colegio-americano.edu.co', '1065890378', ' 9C'),
(589, 'WU YU JENSON YU TENG', 'jenson.wu@colegio-americano.edu.co', '1194981924', ' TNB'),
(590, 'PORTO SAAVEDRA VALERIE', 'valerie.porto@colegio-americano.edu.co', '1048078200', ' 7A'),
(591, 'CASTRO FLOREZ SHAEL ANDRES', 'shael.castro@colegio-americano.edu.co', '1048091630', ' JDA'),
(592, 'MERCADO ORTIZ SEBASTIAN', 'sebastian.mercado@colegio-americano.edu.co', '1041697259', ' 7B'),
(593, 'DUNCAN RODELO SALOMON', 'salomon.duncan@colegio-americano.edu.co', '1046730962', ' 3B'),
(594, 'AFANADOR MORRIS DIEGO ALEXANDER', 'diego.afanador@colegio-americano.edu.co', '1044653666', ' 5A'),
(595, 'BARRIOS GONZALEZ IVANNA LUCIA', 'ivanna.barriosg@colegio-americano.edu.co', '1194977377', ' 2B'),
(596, 'POLO HAMMOUD JALIL FELIPE', 'jalil.polo@colegio-americano.edu.co', '1066296316', ' 3B'),
(597, 'POLO HAMMOUD BASHIR ALEJANDRO', 'bashir.polo@colegio-americano.edu.co', '1066897527', ' TNA'),
(598, 'GARCIA ACEVEDO MARIA ALEJANDRA', 'maria.garciaa@colegio-americano.edu.co', '1042864461', ' 1A'),
(599, 'VELEZ RUIZ JOHANNA', 'johanna.velez@colegio-americano.edu.co', '1048075457', ' 9C'),
(600, 'GALVIS MALDONADO EMILY ESTHER', 'emily.galvis@colegio-americano.edu.co', '1041988532', ' 7B'),
(601, 'RICO MOLINA MARTINA BELEN', 'martina.rico@colegio-americano.edu.co', '1194981461', ' TNA'),
(602, 'BRAVO MERCADO MIA ISABELLA', 'mia.bravo@colegio-americano.edu.co', '1048087156', ' 1A'),
(603, 'AREYANES MEDINA MARIANA', 'mariana.areyanes@colegio-americano.edu.co', '1041701408', ' 2C'),
(604, 'BARRIOS BARROS THIAGO ALEXANDER', 'thiago.barrios@colegio-americano.edu.co', '1043490862', ' TNB'),
(605, 'WU LUO LINDA XINYAN', 'linda.wu@colegio-americano.edu.co', '1048089299', ' TNB'),
(606, 'PINTO PIÑERES SOFIA', 'sofia.pintop@colegio-americano.edu.co', '1046714396', ' 7B'),
(607, 'PINTO PIÑERES ESTEBAN', 'esteban.pinto@colegio-americano.edu.co', '1044667262', ' 2C'),
(608, 'ANGARITA PATERNOSTRO MIA ISABEL', 'mia.angarita@colegio-americano.edu.co', '1047061607', ' 2C'),
(609, 'CHAVEZ GOMEZ SAMUEL ANDRES', 'samuel.chavez@colegio-americano.edu.co', '1043687381', ' 8A'),
(610, 'TORRENEGRA PINO MAXIMILIANO', 'maximiliano.torrenegra@colegio-americano.edu.co', '1048086007', ' 2C'),
(611, 'LOAIZA BUSTAMANTE ANTONIA', 'antonia.loaiza@colegio-americano.edu.co', '1080441560', ' 2C'),
(612, 'TOVIO ROMERO LUIS JOSE', 'luis.tovio@colegio-americano.edu.co', '1044230385', ' 1A'),
(613, 'CALVETE LEAÑO SAMUEL DAVID', 'samuel.calvete@colegio-americano.edu.co', '1046709070', ' 8C'),
(614, 'CALVETE LEAÑO JUAN CAMILO', 'juan.calvete@colegio-americano.edu.co', '1042260247', ' 10C'),
(615, 'TOVAR ROMERO LINA MARCELA', 'lina.tovar@colegio-americano.edu.co', '1043454111', ' 9C'),
(616, 'MARRUGO PAUTT LAUREN SOFIA', 'lauren.marrugo@colegio-americano.edu.co', '1046715358', ' 6A'),
(617, 'MARRUGO PAUTT MICHELLE ANDREA', 'michelle.marrugo@colegio-americano.edu.co', '1046708616', ' 7A'),
(618, 'GUTIERREZ QUIÑONES JERONIMO', 'jeronimo.gutierrezq@colegio-americano.edu.co', '1046736757', ' TNA'),
(619, 'GUTIERREZ QUIÑONES LUCIANA', 'luciana.gutierrezq@colegio-americano.edu.co', '1046732421', ' 2C'),
(620, 'PEÑA CERVANTES SAMUEL ALEJANDRO', 'samuel.penac@colegio-americano.edu.co', '1048085846', ' 2A'),
(621, 'DE MOYA VARELA ALEJANDRO GAEL', 'alejandro.demoya@colegio-americano.edu.co', '1046712719', ' 7A'),
(622, 'REDONDO MARTELO MARIANA', 'mariana.redondo@colegio-americano.edu.co', '1043316528', ' 6B'),
(623, 'REDONDO MARTELO VALENTIN', 'valentin.redondo@colegio-americano.edu.co', '1043334421', ' 1A'),
(624, 'RAMIREZ JIMENEZ ALBA LUCIA', 'alba.ramirezj@colegio-americano.edu.co', '1046726037', ' 4B'),
(625, 'BOLAÑO HERNANDEZ THIAGO', 'thiago.bolanoh@colegio-americano.edu.co', '1046733772', ' 2C'),
(626, 'GUTIERREZ CABRERA ALEJANDRO JOSE', 'alejandro.gutierrezc@colegio-americano.edu.co', '1048081741', ' 4B'),
(627, 'GUTIERREZ CABRERA MATIAS JOSE', 'matias.gutierrezc@colegio-americano.edu.co', '1048074938', ' 9C'),
(628, 'NAVARRO SIMANCAS SAMUEL DAVID', 'samuel.navarrosi@colegio-americano.edu.co', '1146538412', ' 5A'),
(629, 'MAESTRE DOUGLAS PAULINA SOFIA', 'paulina.maestre@colegio-americano.edu.co', '1046732585', ' 2A'),
(630, 'ANGULO CABARCAS SAMUEL GUILLERMO', 'samuel.angulo@colegio-americano.edu.co', '1194978334', ' 1A'),
(631, 'RIVERA BERDEJO SAMUEL JOSÉ', 'samuel.riverab@colegio-americano.edu.co', '1043465531', ' 7A'),
(632, 'RIVERA BERDEJO JUAN SEBASTIÁN', 'juan.riverab@colegio-americano.edu.co', '1043488123', ' 1A'),
(633, 'INSIGNARES AGUILAR SANTIAGO', 'santiago.insignares@colegio-americano.edu.co', '1044222226', ' 7B'),
(634, 'CASTILLO LOZANO MARIA FERNANDA', 'maria.castillol@colegio-americano.edu.co', '1101690217', ' 8B'),
(635, 'CUADROS ZAPATA SALOME', 'salome.cuadros@colegio-americano.edu.co', '1114010892', ' 2B'),
(636, 'CUADROS ZAPATA JUAN JOSE', 'juan.cuadrosz@colegio-americano.edu.co', '1114550636', ' 4B'),
(637, 'ORTIZ PARRA THALIANA', 'thaliana.ortiz@colegio-americano.edu.co', '1116818384', ' TNB'),
(638, 'QUIÑONES CORONEL DANIEL SANTIAGO', 'daniel.quinones@colegio-americano.edu.co', '1046718046', ' 6A'),
(639, 'PEREZ FORTICH LIAN DAVID', 'lian.perez@colegio-americano.edu.co', '1042269999', ' 3A'),
(640, 'GALLEGO GALLEGO NICOLAS', 'nicolas.gallego@colegio-americano.edu.co', '1048085088', ' 2C'),
(641, 'JUNIELES MERCADO ANDREA PAOLA', 'andrea.junieles@colegio-americano.edu.co', '1043155067', ' 9C'),
(642, 'CASTILLO ESTRADA LIAM DANIEL', 'liam.castillo@colegio-americano.edu.co', '1043704055', ' 2C'),
(643, 'ALEAN ARANGO JESHUA', 'jeshua.alean@colegio-americano.edu.co', '1043480220', ' 2C'),
(644, 'RODRIGUEZ DE LA PEÑA JHALENA ISABEL', 'jhalena.rodriguez@colegio-americano.edu.co', '1043693121', ' 6A'),
(645, 'DE LOS REYES RINCON ELIAS MANUEL', 'elias.delosreyesr@colegio-americano.edu.co', '1054879491', ' 7A'),
(646, 'DE LOS REYES RINCON ELENA SOFIA', 'elena.delosreyesr@colegio-americano.edu.co', '1054869326', ' 11C'),
(647, 'ESCAMILLA PUGLIESE DANNA SOFIA', 'danna.escamilla@colegio-americano.edu.co', '1046709015', ' 8C'),
(648, 'CUENTAS URIBE SHALEM ANDREA', 'shalem.cuentas@colegio-americano.edu.co', '1197471579', ' 7B'),
(649, 'SERENO VILLAVECES GABRIELA', 'gabriela.sereno@colegio-americano.edu.co', '1042256867', ' 11C'),
(650, 'GIRALDO PALACIOS SHAYRA GABRIELLE', 'shayra.giraldo@colegio-americano.edu.co', '1011224251', ' 6B'),
(651, 'FONTALVO VARELA TOMAS', 'tomas.fontalvo@colegio-americano.edu.co', '1194978902', ' 2C'),
(652, 'CASTRILLON LOZANO ANDRES DAVID', 'andres.castrillon@colegio-americano.edu.co', '1046723564', ' 5A'),
(653, 'IBARGUEN BLANCO ASHLEY', 'ashley.ibarguen@colegio-americano.edu.co', '1043478219', ' 3B'),
(654, 'NORIEGA RIVERO SAMUEL DAVID', 'samuel.noriega@colegio-americano.edu.co', '1043484354', ' 2C'),
(655, 'GARCIA HELD ISABELLA', 'isabella.garciahe@colegio-americano.edu.co', '1146540070', ' 4B'),
(656, 'CASSIANI GUTIÉRREZ RAFAEL ALBERTO', 'rafael.cassiani@colegio-americano.edu.co', '1146542777', ' 2C'),
(657, 'SALAS GARCES ISAAC DAVID', 'issac.salas@colegio-americano.edu.co', '1043478597', ' 2C'),
(658, 'DAZA FEDULLO MARIA ALEJANDRA', 'maria.dazaf@colegio-americano.edu.co', '1041698705', ' 6A'),
(659, 'DAZA FEDULLO SOPHIA', 'sophia.daza@colegio-americano.edu.co', '1046711416', ' 7B'),
(660, 'HENRIQUEZ CHARRIS EMILIA SOFIA', 'emilia.henriquezc@colegio-americano.edu.co', '1048086016', ' 2B'),
(661, 'TORRES ELJACH ADRIAN', 'adrian.torrese@colegio-americano.edu.co', '1048080428', ' 5A'),
(662, 'TORRES ELJACH MARIAN', 'marian.torrese@colegio-americano.edu.co', '1048075495', ' 9C'),
(663, 'DIAZ CABALLERO ANTONELLA', 'antonella.diazc@colegio-americano.edu.co', '1066296211', ' 3B'),
(664, 'DIAZ CABALLERO VALENTINA', 'valentina.diazc@colegio-americano.edu.co', '1065819335', ' 6B'),
(665, 'OLIVELLA GUZMAN MATEO', 'mateo.olivella@colegio-americano.edu.co', 'AAE944251', ' 2A'),
(666, 'FONTALVO CORONADO HANNAH', 'hannah.fontalvo@colegio-americano.edu.co', '1140910300', ' JDA'),
(667, 'BARRIOS TEHERAN SAMUEL JOSE', 'samuel.barriost@colegio-americano.edu.co', '1158465854', ' 4A'),
(668, 'UCROS MENDEZ JUAN JOSE', 'juan.ucros@colegio-americano.edu.co', '1033119928', ' 3B'),
(669, 'DIAZGRANADOS ULLOA FERNANDO EMILIO', 'fernando.diazgranados@colegio-americano.edu.co', '1046717399', ' 6A'),
(670, 'MEJIA LUQUE MAXIMO', 'maximo.mejia@colegio-americano.edu.co', '1048087823', ' TNB'),
(671, 'TORRES CEBALLOS ALANA SOFIA', 'alana.torres@colegio-americano.edu.co', '1044221321', ' 8C'),
(672, 'RIVAS COLINA ALEJANDRO', 'alejandro.rivas@colegio-americano.edu.co', '1043454934', ' 9C'),
(673, 'ALTAMAR SILVA JEYCEE ISABELLA', 'jeycee.altamar@colegio-americano.edu.co', '1046713380', ' 7A'),
(674, 'DEL RIO RIVERA ANTONELLA', 'antonella.delrio@colegio-americano.edu.co', '1013020067', ' 6B'),
(675, 'ARIZA MURILLO ASHLY PAOLA', 'ashly.ariza@colegio-americano.edu.co', '1158464693', ' 5A'),
(676, 'VILLAMIZAR GUERRA SANTIAGO', 'santiago.villamizar@colegio-americano.edu.co', '1043488040', ' 1B'),
(677, 'OSORIO MADARIAGA SAMUEL', 'samuel.osorio@colegio-americano.edu.co', '1048078371', ' 6A'),
(678, 'TAPIAS VELEZ ISABEL', 'isabel.tapias@colegio-americano.edu.co', '1046730762', ' 3A'),
(679, 'VILORIA RODRIGUEZ GABRIELA', 'gabriela.viloria@colegio-americano.edu.co', '1046718800', ' 6A'),
(680, 'PEREZ HERNANDEZ JADE SCARLETH', 'jade.perez@colegio-americano.edu.co', '1082984854', ' 8C'),
(681, 'PEREZ HERNANDEZ MANUEL SALVADOR', 'manuel.perez@colegio-americano.edu.co', '1044651597', ' 6A'),
(682, 'PALACIO HENKEN NEYDA MARGARET', 'neyda.palacio@colegio-americano.edu.co', '1194983453', ' JDA'),
(683, 'GUERRA APARICIO VALENTINA', 'valentina.guerra@colegio-americano.edu.co', '1042273888', ' 1A'),
(684, 'LUGO PUCHE NOHORA ISABEL', 'nohora.lugo@colegio-americano.edu.co', '1046735225', ' 1B'),
(685, 'DIOSA MARTELO ANGELA', 'angela.diosa@colegio-americano.edu.co', '1046731070', ' 2B'),
(686, 'JAIMES MARTELO VICTORIA', 'victoria.jaimes@colegio-americano.edu.co', '1048095458', ' PV'),
(687, 'ROJAS CIFUENTES BRAYAN SAMUEL', 'brayan.rojas@colegio-americano.edu.co', '1044221374', ' 8C'),
(688, 'CASSIANI BLANCO PABLO ANDRES', 'pablo.cassiani@colegio-americano.edu.co', '1194982037', ' TNB'),
(689, 'CASTRO ARRIETA EMANUEL JOSE', 'emanuel.castro@colegio-americano.edu.co', '1046720677', ' 6B'),
(690, 'ECHEVERRIA ESPITIA KAMILA', 'kamila.echeverria@colegio-americano.edu.co', '1065015200', ' 1B'),
(691, 'RODRIGUEZ BARROS SARAH ELIZABETH', 'sarah.rodriguez@colegio-americano.edu.co', '1084452956', ' 9C'),
(692, 'ALFARO NAVARRO MATHIAS JAVIER', 'mathias.alfaro@colegio-americano.edu.co', '1044230630', ' 1B'),
(693, 'HERRERA ESCAMILLA EMMA LUCIA', 'emma.herrera@colegio-americano.edu.co', '1146543772', ' 1B'),
(694, 'RODRIGUEZ SACIPA JUAN JOSE', 'juanjo.rodriguez@colegio-americano.edu.co', '1023397555', ' 7A'),
(695, 'SARMIENTO CASTAÑO ABIGAIL', 'abigail.sarmiento@colegio-americano.edu.co', '1043469352', ' 5A'),
(696, 'FRAGOZO VARELA JUAN JOSE', 'juan.fragozo@colegio-americano.edu.co', '1043484122', ' 1B'),
(697, 'BUITRAGO DE LA CUADRA SARAH ISABELLA', 'sarah.buitrago@colegio-americano.edu.co', '1027290485', ' 6B'),
(698, 'MARQUEZ YEPES JOSEP ANTOINE', 'josep.marquez@colegio-americano.edu.co', '1220217929', ' 5B'),
(699, 'GOMEZ VASQUEZ ANNETH', 'anneth.gomez@colegio-americano.edu.co', '1041702742', ' PJA'),
(700, 'TOVAR MANTILLA JERONIMO', 'jeronimo.tovar@colegio-americano.edu.co', '1146544336', ' TNB'),
(701, 'URINA BALASNOA GABRIEL ENRIQUE', 'gabriel.urina@colegio-americano.edu.co', '1043184364', ' 4A'),
(702, 'SEREN POMARES LUCAS', 'lucas.seren@colegio-americano.edu.co', '1048087451', ' 1B'),
(703, 'PALACIOS DE LA HOZ JHEANS MAYKELL', 'jheans.palacios@colegio-americano.edu.co', '1146546705', ' PJA'),
(704, 'PALACIOS DE LA HOZ JHEANS FARHENG', 'jheansf.palacios@colegio-americano.edu.co', '1137874399', ' 6A'),
(705, 'DE LA HOZ CALDERON NICOLAS', 'nicolas.delahoz@colegio-americano.edu.co', '1044226557', ' 2B'),
(706, 'ACEVEDO PALLARES LIA CAMILA', 'lia.acevedo@colegio-americano.edu.co', '1043484282', ' 2B'),
(707, 'OREJUELA GUZMAN NICOLLE SOFIA', 'nicolle.orejuela@colegio-americano.edu.co', '1043699116', ' 4B'),
(708, 'CAMPO BENITEZ VICTORIA', 'victoria.campo@colegio-americano.edu.co', '1083016976', ' 5B'),
(709, 'GUTIERREZ MONTES PEDRO PABLO', 'pedro.gutierrez@colegio-americano.edu.co', '1084607657', ' 3B'),
(710, 'OREJUELA GUZMAN LAUREN BRIGITTE', 'lauren.orejuela@colegio-americano.edu.co', '1043692511', ' 6A'),
(711, 'YEPES MARQUEZ SANTIAGO ANDRES', 'santiago.yepes@colegio-americano.edu.co', '1048084948', ' 2B'),
(712, 'CAMELO AGUILAR LUCIA', 'lucia.camelo@colegio-americano.edu.co', '1043703735', ' 2A'),
(713, 'CHEN LI YALAN', 'yalan.chen@colegio-americano.edu.co', '1046730771', ' 2C'),
(714, 'ESQUIVIA URUETA CARLA ISABEL', 'carla.esquivia@colegio-americano.edu.co', '1046711159', ' 8C'),
(715, 'BARRIOS JIMENEZ GABRIEL CAMILO', 'gabriel.barrios@colegio-americano.edu.co', '1042275851', ' PJA'),
(716, 'MONSERRAT QUINTERO CHRISTIAN DAVID', 'christian.monserrat@colegio-americano.edu.co', '1046739341', ' JDA'),
(717, 'REYES GUTIERREZ ANDRES ALEJANDRO', 'andres.reyes@colegio-americano.edu.co', '1013271881', ' 8C'),
(718, 'QUINTERO DONADO CHRISTOPHER', 'christopher.quintero@colegio-americano.edu.co', '1043197631', ' JDA'),
(719, 'MENDOZA BECERRA MATHIAS ANDRES', 'mathias.mendoza@colegio-americano.edu.co', '1044234401', ' JDA'),
(720, 'MENA CAICEDO SEBASTIAN DE JESUS', 'sebastian.mena@colegio-americano.edu.co', '1234888324', ' 4A'),
(721, 'SIERRA BOZON AXEL AMET', 'axel.sierra@colegio-americano.edu.co', '1046739785', ' PJA'),
(722, 'BAYONA CORREA VALENTINA', 'valentina.bayona@colegio-americano.edu.co', '1046736209', ' 1B'),
(723, 'FONTALVO PAEZ SALOME', 'salome.fontalvo@colegio-americano.edu.co', '1046724895', ' 5B'),
(724, 'PADRON CASTRO JUAN SEBASTIAN', 'juan.padron@colegio-americano.edu.co', '1045769505', ' PJA'),
(725, 'LOPEZ TIRADO SIAD MELISSA', 'siad.lopez@colegio-americano.edu.co', '1042261962', ' 9C'),
(726, 'ROJAS VARGAS JUAN SEBASTIAN', 'juan.rojas@colegio-americano.edu.co', '1046724086', ' 6B'),
(727, 'HERRERA CORDOBA SANTIAGO', 'santiago.herrera@colegio-americano.edu.co', '1044651477', ' 6A'),
(728, 'GALOFRE FRANCO MATTHEW', 'matthew.galofre@colegio-americano.edu.co', '1194966453', ' 8C'),
(729, 'VALENCIA LIZCANO CARLOS DANIEL', 'carlos.valencia@colegio-americano.edu.co', '1067624113', ' 6B'),
(730, 'BALLESTEROS GONZALEZ JULIANA', 'juliana.ballesteros@colegio-americano.edu.co', '1010966765', ' 9C'),
(731, 'BALETA ASCENSIO GABRIELA', 'gabriela.baleta@colegio-americano.edu.co', '1187464968', ' 7B'),
(732, 'BALETA ASCENSIO ANTONELLA', 'antonella.baleta@colegio-americano.edu.co', '1187464966', ' 7B'),
(733, 'MEJIA RAMIREZ JUAN ESTEBAN', 'juan.mejia@colegio-americano.edu.co', '1016720265', ' 9C'),
(734, 'RUAN HUANG KIM YULE', 'kim.ruan@colegio-americano.edu.co', '1046741782', ' PV'),
(735, 'RIPOLL MANOTAS ETHAN MANUEL', 'ethan.ripoll@colegio-americano.edu.co', '1042274350', ' 1A'),
(736, 'CASTRO LLAMAS ALEXANDRA', 'alexandra.castro@colegio-americano.edu.co', '1194970739', ' 4A'),
(737, 'CELIS RIOS HANNY ANTONELLA', 'hanny.celis@colegio-americano.edu.co', '1140936138', ' TNB'),
(738, 'JEREZ ZAPATA LUCIANA', 'luciana.jerez@colegio-americano.edu.co', '1030704517', ' 1B'),
(739, 'OSORIO HERRERA JOSE DANIEL', 'jose.osorio@colegio-americano.edu.co', '1046742394', ' PV'),
(740, 'OSORIO HERRERA MARIA PAULA', 'mariap.osorio@colegio-americano.edu.co', '1048087898', ' 1B'),
(741, 'TORRES BARRAZA MARTHA SOPHIA', 'martha.torres@colegio-americano.edu.co', '1146537232', ' 7A'),
(742, 'CANTILLO FERREIRA VALENTINA', 'valentina.cantillo@colegio-americano.edu.co', '1046719127', ' 6A'),
(743, 'POLO DE CASTRO SEBASTIAN', 'sebastian.polo@colegio-americano.edu.co', '1042267728', ' 4B'),
(744, 'CAMACHO CARRILLO GABRIEL JOSE', 'gabriel.camacho@colegio-americano.edu.co', '1014896051', ' 1B'),
(745, 'LOPEZ MENDOZA THALIANA SOFIA', 'thaliana.lopez@colegio-americano.edu.co', '1042864057', ' 3B'),
(746, 'BARROS QUESADA DANILO', 'danilo.barros@colegio-americano.edu.co', '1194978949', ' 1B'),
(747, 'KRAYEM SAMHAT HAIDAR ALI', 'haidar.krayem@colegio-americano.edu.co', '1194985497', ' PJA'),
(748, 'AMADOR CANTILLO ALANNA SOPHIA', 'alanna.amador@colegio-americano.edu.co', '1146547251', ' PJA'),
(749, 'AMADOR CANTILLO VALERIA ISABEL', 'valeria.amador@colegio-americano.edu.co', '1044673252', ' JDA'),
(750, 'AVILA HERNANDEZ MARIA PAULA', 'maria.avila@colegio-americano.edu.co', '1043712477', ' JDA'),
(751, 'MARQUEZ FONTALVO ISABELLA SOPHIA', 'isabella.marquez@colegio-americano.edu.co', '1044220689', ' 8C'),
(752, 'ALMANZA PEREZ MATIAS ALBERTO', 'matias.almanza@colegio-americano.edu.co', '1044223486', ' 6B'),
(753, 'DE ALBA VASQUEZ SANTIAGO', 'santiago.dealba@colegio-americano.edu.co', '1097787474', ' 8C'),
(754, 'PEREZ BORREGO ALEJANDRO', 'alejandro.perez@colegio-americano.edu.co', '1335281661', ' 7B'),
(755, 'BONIVENTO CARDOZO MATHEW DE JESUS', 'mathew.bonivento@colegio-americano.edu.co', '1046721249', ' 6B'),
(756, 'CANO ZAMBRANO CRISTINA ISABEL', 'cristina.cano@colegio-americano.edu.co', '1043690747', ' 6A'),
(757, 'CARBONO PEREZ ISABELLA', 'isabella.carbono@colegio-americano.edu.co', '1043467390', ' 5B'),
(758, 'YUNEZ BARRANCO VALENTINA', 'valentina.yunez@colegio-americano.edu.co', '1043699000', ' 4B'),
(759, 'GALLARDO VASQUEZ VALERIE SOFIA', 'valerie.gallardo@colegio-americano.edu.co', '1046729260', ' 3B'),
(760, 'MINA PRECIADO ADRIAN', 'adrian.mina@colegio-americano.edu.co', '1241439945', ' TNB'),
(761, 'NAVA CANTILLO MATHIAS ZAID', 'mathias.nava@colegio-americano.edu.co', '1047055964', ' 6A'),
(762, 'VELASQUEZ ANGULO DANIEL ALEJANDRO', 'daniel.velasquez@colegio-americano.edu.co', '1046717993', ' 6A'),
(763, 'ORTEGA CAICEDO LUCIANA', 'luciana.ortega@colegio-americano.edu.co', '1044221405', ' 8C'),
(764, 'HERNANDEZ GARCIA PRINCES DANIELA', 'princes.hernandez@colegio-americano.edu.co', '1043167006', ' 8C'),
(765, 'QUIROGA PINZON EMILIANO', 'emiliano.quiroga@colegio-americano.edu.co', '1221463702', ' 7B'),
(766, 'SANCHEZ JIMENEZ EDUARDO JOSE', 'eduardo.sanchez@colegio-americano.edu.co', '1048090674', ' JDA'),
(767, 'SANCHEZ JIMENEZ ISABEL SOFIA', 'isabel.sanchez@colegio-americano.edu.co', '1205963548', ' 5B'),
(768, 'MARTINEZ SERJE ANTONELLA', 'antonella.martinez@colegio-americano.edu.co', '1048086879', ' 1B'),
(769, 'RODRIGUEZ ROJAS AMALIA SOFIA', 'amalia.rodriguez@colegio-americano.edu.co', '1046713550', ' 7B'),
(770, 'JIMENEZ CAMARGO LUCIANA MARIA', 'luciana.jimenez@colegio-americano.edu.co', '1048086453', ' 1B'),
(771, 'MEJIA MERCADO SAMUEL JOSE', 'samuel.mejia@colegio-americano.edu.co', '1044657060', ' 5A'),
(772, 'MEJIA MERCADO SHADIA SOFIA', 'shadia.mejia@colegio-americano.edu.co', '1044670872', ' TNB'),
(773, 'DENNIS FAJARDO SAMUEL ELIAS', 'samuel.dennis@colegio-americano.edu.co', '1044221828', ' 8C'),
(774, 'ISAZA RAMIREZ ALEJANDRO', 'alejandro.isaza@colegio-americano.edu.co', '1103523344', ' TNB'),
(775, 'RODRIGUEZ DE LA HOZ ISABEL CRISTINA', 'isabel.rodriguez@colegio-americano.edu.co', '1042267015', ' 6B'),
(776, 'ALVAREZ CAÑON DANNA ROCIO', 'danna.alvarez@colegio-americano.edu.co', '1146544264', ' 1B'),
(777, 'BERMUDEZ PINZON CAMILA ANDREA', 'camila.bermudez@colegio-americano.edu.co', '1046739796', ' PJA'),
(778, 'BERMUDEZ PINZON SAMARA LUCIA', 'samara.bermudez@colegio-americano.edu.co', '1046737559', ' TNB'),
(779, 'HERNANDEZ GARCIA DIEGO GERARD', 'diego.hernandez@colegio-americano.edu.co', '1043176236', ' 6B'),
(780, 'PINTO MONTES MILTON ADRIAN', 'milton.pinto@colegio-americano.edu.co', '1046716388', ' 7B'),
(781, 'MARCELES AYALA THIAGO', 'thiago.marceles@colegio-americano.edu.co', '1046720466', ' 6A'),
(782, 'LLANO ALTAMAR SANTIAGO JOSE', 'santiago.llano@colegio-americano.edu.co', '1044648243', ' 6A'),
(783, 'SAINEA MORENO EMILY RIYELL', 'emily.sainea@colegio-americano.edu.co', '1050097054', ' 9C'),
(784, 'GAMARRA JIMENEZ DANIEL JOSE', 'daniel.gamarra@colegio-americano.edu.co', '1042258497', ' 10B'),
(785, 'COBO DE LA PAVA CELESTE', 'celeste.cobo@colegio-americano.edu.co', '1146544284', ' 1B'),
(786, 'PARRA CELADA GUADALUPE', 'guadalupe.parra@colegio-americano.edu.co', '1076922350', ' 1B'),
(787, 'PARRA CELADA JUAN DAVID', 'juan.parra@colegio-americano.edu.co', '1075292374', ' 5B'),
(788, 'GARCIA SUAREZ LUIS ALEJANDRO', 'luis.garcia@colegio-americano.edu.co', '1048076966', ' 8C'),
(789, 'SANDOVAL NIÑO JUAN JOSE', 'juan.sandoval@colegio-americano.edu.co', '1143449507', ' 7B'),
(790, 'SARMIENTO PINEDA LUIS JOSE', 'luis.sarmiento@colegio-americano.edu.co', '1103749964', ' 8C'),
(791, 'LAMADRID TORRES ALEJANDRO', 'alejandro.lamadrid@colegio-americano.edu.co', '1043488662', ' 1B'),
(792, 'PARDO MENDOZA GERARD SAMUEL', 'gerard.pardo@colegio-americano.edu.co', '1140906089', ' 1B'),
(793, 'AREVALO IGUARAN EVELYN FERNANDA', 'evelyn.arevalo@colegio-americano.edu.co', '1119702778', ' 9C'),
(794, 'BARROS PACHECO ANTONELLA', 'antonella.barros@colegio-americano.edu.co', '1046726717', ' 4B'),
(795, 'PERTUZ OROZCO SILVANA MARGARITA', 'silvana.pertuz@colegio-americano.edu.co', '1081212886', ' 11A'),
(796, 'TORRES LOGREIRA DANNA ISABEL', 'danna.torres@colegio-americano.edu.co', '1194966870', ' 9C'),
(797, 'CANTILLO GOMEZ FELIPE', 'felipe.cantillo@colegio-americano.edu.co', '1064803729', ' 3B'),
(798, 'RUBIO RAMIREZ JUAN SALVADOR', 'juan.rubio@colegio-americano.edu.co', '1019846971', ' 1B'),
(799, 'CUADRO MALDONADO JUAN JOSE', 'juan.cuadro@colegio-americano.edu.co', '1082987810', ' 8C'),
(800, 'TATIS JIMENEZ SANTIAGO', 'santiago.tatis@colegio-americano.edu.co', '1042268070', ' 4B'),
(801, 'DURAN ESCORCIA ARLEY SEBASTIAN', 'arley.duran@colegio-americano.edu.co', '1043452853', ' 9C'),
(802, 'DURAN ESCORCIA MARIA PAULA', 'maria.duran@colegio-americano.edu.co', '1043470358', ' 5B'),
(803, 'GARCIA ROJAS JUAN ESTEBAN', 'juan.garcia@colegio-americano.edu.co', '1150438970', ' 5A'),
(804, 'DE VIVO TIRADO MATHIAS ANDRES', 'mathias.devivo@colegio-americano.edu.co', '1048087983', ' 1A'),
(805, 'GALVIS MARQUEZ MARIANA', 'mariana.galvis@colegio-americano.edu.co', '1039311305', ' 6B'),
(806, 'GALVIS MARQUEZ SALOME', 'salome.galvis@colegio-americano.edu.co', '1010848870', ' TNB'),
(807, 'VALDIRI VARGAS JULIAN ANDRES', 'julian.valdiri@colegio-americano.edu.co', '1072704280', ' 7B'),
(808, 'NAVARRO GRANADOS ADRIAN DAVID', 'adrian.navarrog@colegio-americano.edu.co', '1146543083', ' 1B'),
(809, 'GRATEROL BARRETO ABIGAIL', 'abigail.graterol@colegio-americano.edu.co', '1046733313', ' 2B'),
(810, 'BRITO TORREGROZA ALCIDES ANDRES', 'alcides.brito@colegio-americano.edu.co', '1194983841', ' PJA'),
(811, 'ARDILA SIERRA JESUS ADRIAN', 'jesus.ardila@colegio-americano.edu.co', '1043456083', ' 9C'),
(812, 'FONTALVO ARDILA SEBASTIAN ANDREUW', 'sebastian.fontalvoa@colegio-americano.edu.co', '1043673381', ' 10A'),
(813, 'CASTRO BARROS MARCELO', 'marcelo.castro@colegio-americano.edu.co', '1042274385', ' 1A'),
(814, 'HERRERA PEÑALVER VALENTIN', 'valentin.herrera@colegio-americano.edu.co', '1143472015', ' 1B'),
(815, 'HERRERA PEÑALVER GIUSEP', 'giusep.herrera@colegio-americano.edu.co', '1044652978', ' 4B'),
(816, 'HERNANDEZ RODRIGUEZ GLOSBELL', 'glosbell.hernandez@colegio-americano.edu.co', '1043192838', ' 1A'),
(817, 'AVILA ROMERO EMILIANO', 'emiliano.avila@colegio-americano.edu.co', '1043485648', ' 1B'),
(818, 'LIONS BORJA EMILIO ANDRES', 'emilio.lions@colegio-americano.edu.co', '1043715920', ' PV'),
(819, 'ABUCHAIBE RODRIGUEZ FRANCO', 'franco.abuchaibe@colegio-americano.edu.co', '1146535301', ' 9C'),
(820, 'RODRIGUEZ POVEDA NAYELIS MICHELL', 'nayelis.rodriguez@colegio-americano.edu.co', '1043685946', ' 9C'),
(821, 'FONSECA PEREZ EUGENIO JESUS', 'eugenio.fonseca@colegio-americano.edu.co', '1044219575', ' 9C'),
(822, 'HERRERA RODRIGUEZ SAMUEL DAVID', 'samuel.herrera@colegio-americano.edu.co', '1084055379', ' 10A'),
(823, 'GOMEZ MERCADO MIGUEL', 'miguel.gomez@colegio-americano.edu.co', '1067173028', ' 1B'),
(824, 'SIERRA PACHECO PABLO JOSE', 'pablo.sierra@colegio-americano.edu.co', '1044222898', ' 6B'),
(825, 'CARRETERO REDONDO NATALY', 'nataly.carretero@colegio-americano.edu.co', '1043477950', ' 3A'),
(826, 'ACEVEDO DEL CAMPO JERONIMO', 'jeronimo.acevedo@colegio-americano.edu.co', '1044238768', ' PV'),
(827, 'COTES SANCHEZ MIA BELEN', 'mia.sanchez@colegio-americano.edu.co', '1118840176', ' 8C'),
(828, 'ARGUELLO MEJIA JESUS DAVID', 'jesus.arguello@colegio-americano.edu.co', '1048088638', ' JDA'),
(829, 'HERNANDEZ GUEVARA MARTINA', 'martina.hernandez@colegio-americano.edu.co', '1036459818', ' 1B'),
(830, 'MORENO MORALES GABRIEL DAVID', 'gabriel.moreno@colegio-americano.edu.co', '1029524181', ' 3A'),
(831, 'GOMEZ FORTICH ZARETH CRISTHINA', 'sareth.gomez@colegio-americano.edu.co', '1042276226', ' PV'),
(832, 'REDONDO ROSADO MARIA CELESTE', 'maria.redondo@colegio-americano.edu.co', '1048090307', ' JDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `codigo_libro` varchar(50) DEFAULT NULL,
  `estado` enum('disponible','prestado') DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `codigo_libro`, `estado`) VALUES
(2, 'CIEN AÑOS DE SOLEDAD', 'GABRIEL GARCIA MARQUEZ', '0000-1234-0154', 'disponible'),
(3, 'EL CORONEL NO TIENE QUIEN LE ESCRIBA', 'GABRIEL GARCIA MARQUEZ', '0001-4321-8765-6789', 'disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llamados_atencion`
--

CREATE TABLE `llamados_atencion` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `llamados_atencion`
--

INSERT INTO `llamados_atencion` (`id`, `estudiante_id`, `motivo`, `fecha`) VALUES
(1, 1, 'se le hace llamdode atencion a estudiante por no permitir que otro estudiante utilice el pc', '2025-07-23 18:30:33'),
(11, 1, 'no entrega pc puntual', '2025-07-23 21:02:05'),
(12, 1, 'prueba', '2025-08-01 16:34:03'),
(13, 125, 'No respeta las normas en sala de biblioteca comiendo ', '2025-08-26 19:20:51'),
(14, 125, 'presenta mal comportamineto', '2025-08-26 19:21:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_externo`
--

CREATE TABLE `personal_externo` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `tipo_personal` enum('docente','administrativo','otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL,
  `libro_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `grado` varchar(20) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `devuelto` enum('si','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id`, `libro_id`, `estudiante_id`, `grado`, `fecha_prestamo`, `fecha_devolucion`, `devuelto`) VALUES
(1, 2, 125, ' 8A', '2025-07-21', '2025-07-23', 'si'),
(2, 3, 58, ' 9C', '2025-07-22', '2025-07-25', 'si'),
(3, 2, 566, ' 2C', '2025-07-23', '2025-07-25', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_sala_biblioteca`
--

CREATE TABLE `prestamo_sala_biblioteca` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nombre_completo` varchar(120) NOT NULL,
  `area_sesion` varchar(120) NOT NULL,
  `tipo_usuario_id` int(10) UNSIGNED NOT NULL,
  `actividad` varchar(200) NOT NULL,
  `requerimientos` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo_sala_biblioteca`
--

INSERT INTO `prestamo_sala_biblioteca` (`id`, `fecha`, `hora`, `nombre_completo`, `area_sesion`, `tipo_usuario_id`, `actividad`, `requerimientos`, `observaciones`, `creado_en`) VALUES
(1, '2025-08-26', '16:00:00', 'CARLOS', 'logistica', 7, 'capacitación', '1 SILLA Y UN PORTATIL', 'NINGUNA', '2025-08-26 20:07:08'),
(2, '2025-08-30', '08:00:00', 'sst', 'talento humano', 3, 'capacitacion hsta las 12 pm', 'pc proyector smart tv 40 sillas microfono  agua cafe', 'capacitacon sobre medidas de seguidad y salud en el trabjo', '2025-08-29 13:40:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario_externo`
--

CREATE TABLE `tipo_usuario_externo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_usuario` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_usuario_externo`
--

INSERT INTO `tipo_usuario_externo` (`id`, `tipo_usuario`, `descripcion`, `estado`, `creado_en`, `actualizado_en`) VALUES
(1, 'Docente', 'Personal docente del CAB', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(2, 'Coordinador', 'Coordinaciones académicas y administrativas', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(3, 'Administrativo', 'Personal administrativo', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(4, 'Estudiante', 'Estudiantes del CAB', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(5, 'Padre de familia', 'Acudientes/Padres', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(6, 'Egresado', 'Exalumnos del CAB', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(7, 'Visitante externo', 'Invitados, conferencistas, etc.', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35'),
(8, 'Proveedor', 'Proveedores/contratistas', 'activo', '2025-08-26 19:48:35', '2025-08-26 19:48:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` enum('admin','estudiante') NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `creado_en`) VALUES
(1, 'ALEJANDRO LOPEZ', 'lidertic@colegio-americano.edu.co', '$2y$10$TNDfOh17vTW8zG9HKz0QNO1lIRxvJXuMTiliWbga8/kVW/yzkhste', 'admin', '2025-06-18 19:49:07'),
(3, 'AYDE SOFIA MACKENZIE GUTIÉRREZ', 'a.mackenzie@colegio-americano.edu.co', '$2y$10$G9jSJdryRFwKSN7MmrD5pe8.35H3J6nzQpLMS2Hmb38H7KUB1JYnu', 'admin', '2025-07-22 19:00:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda_reservas`
--
ALTER TABLE `agenda_reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auditoria_prestamos`
--
ALTER TABLE `auditoria_prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestamo_id` (`prestamo_id`),
  ADD KEY `libro_id` (`libro_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `consulta_especializada`
--
ALTER TABLE `consulta_especializada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `llamados_atencion`
--
ALTER TABLE `llamados_atencion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`);

--
-- Indices de la tabla `personal_externo`
--
ALTER TABLE `personal_externo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `libro_id` (`libro_id`),
  ADD KEY `estudiante_id` (`estudiante_id`);

--
-- Indices de la tabla `prestamo_sala_biblioteca`
--
ALTER TABLE `prestamo_sala_biblioteca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tipo_usuario` (`tipo_usuario_id`);

--
-- Indices de la tabla `tipo_usuario_externo`
--
ALTER TABLE `tipo_usuario_externo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tipo_usuario` (`tipo_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda_reservas`
--
ALTER TABLE `agenda_reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `auditoria_prestamos`
--
ALTER TABLE `auditoria_prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `consulta_especializada`
--
ALTER TABLE `consulta_especializada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=833;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `llamados_atencion`
--
ALTER TABLE `llamados_atencion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `personal_externo`
--
ALTER TABLE `personal_externo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamo_sala_biblioteca`
--
ALTER TABLE `prestamo_sala_biblioteca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario_externo`
--
ALTER TABLE `tipo_usuario_externo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria_prestamos`
--
ALTER TABLE `auditoria_prestamos`
  ADD CONSTRAINT `auditoria_prestamos_ibfk_1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamos` (`id`),
  ADD CONSTRAINT `auditoria_prestamos_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`),
  ADD CONSTRAINT `auditoria_prestamos_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `consulta_especializada`
--
ALTER TABLE `consulta_especializada`
  ADD CONSTRAINT `consulta_especializada_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`);

--
-- Filtros para la tabla `llamados_atencion`
--
ALTER TABLE `llamados_atencion`
  ADD CONSTRAINT `llamados_atencion_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`);

--
-- Filtros para la tabla `prestamo_sala_biblioteca`
--
ALTER TABLE `prestamo_sala_biblioteca`
  ADD CONSTRAINT `fk_tipo_usuario_externo` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario_externo` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
