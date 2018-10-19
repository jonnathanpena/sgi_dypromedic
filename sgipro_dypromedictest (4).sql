-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2018 a las 18:58:41
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgipro_dypromedictest`
--
CREATE DATABASE IF NOT EXISTS `sgipro_dypromedictest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sgipro_dypromedictest`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `id_bancos` int(11) NOT NULL,
  `nombre_bancos` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id_bancos`, `nombre_bancos`) VALUES
(1, 'Banco del Pichincha, .S.A.'),
(2, 'Banco de Guayaquil, S.A.'),
(3, 'Banco Bolivariano, S.A.'),
(4, 'Banco de Machala, S.A.'),
(5, 'Banco de Loja, S.A.'),
(6, 'Banco Comercial de Manabí, S.A.'),
(7, '\r\nBanco Solidario del Ecuador,S.A.'),
(8, 'Banco del Pacífico, S.A.'),
(9, 'Banco Promérica, S.A.'),
(10, 'Banco del Austro, S.A.'),
(11, 'Banco Amazonas, S.A.'),
(12, 'UNIBANCO, S.A.'),
(13, 'Banco General Rumiñahui, S.A.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `detalle_sustento_comprobante_id` int(11) NOT NULL,
  `serie_compra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `documento_compra` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autorizacion_compra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_comprobante_compra` date DEFAULT NULL,
  `fecha_ingreso_bodega_compra` date DEFAULT NULL,
  `fecha_caducidad_compra` date DEFAULT NULL,
  `vencimiento_compra` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_compra` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `condiciones_compra` int(11) NOT NULL,
  `st_con_iva_compra` float NOT NULL,
  `descuento_con_iva_compra` float NOT NULL,
  `total_con_iva_compra` float NOT NULL,
  `st_sin_iva_compra` float NOT NULL,
  `descuento_sin_iva_compra` float NOT NULL,
  `total_sin_iva_compra` float NOT NULL,
  `st_iva_cero_compra` float NOT NULL,
  `descuento_iva_cero_compra` float NOT NULL,
  `total_iva_cero` float NOT NULL,
  `ice_cc_compra` float NOT NULL,
  `imp_verde_compra` float NOT NULL,
  `iva_compra` float NOT NULL,
  `otros_compra` float NOT NULL,
  `interes_compra` float DEFAULT NULL,
  `bonificacion_compra` float DEFAULT NULL,
  `total_compra` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `usuario_id`, `fecha_compra`, `proveedor_id`, `detalle_sustento_comprobante_id`, `serie_compra`, `documento_compra`, `autorizacion_compra`, `fecha_comprobante_compra`, `fecha_ingreso_bodega_compra`, `fecha_caducidad_compra`, `vencimiento_compra`, `descripcion_compra`, `condiciones_compra`, `st_con_iva_compra`, `descuento_con_iva_compra`, `total_con_iva_compra`, `st_sin_iva_compra`, `descuento_sin_iva_compra`, `total_sin_iva_compra`, `st_iva_cero_compra`, `descuento_iva_cero_compra`, `total_iva_cero`, `ice_cc_compra`, `imp_verde_compra`, `iva_compra`, `otros_compra`, `interes_compra`, `bonificacion_compra`, `total_compra`) VALUES
(1, 1, '2018-10-17 11:46:47', 1, 47, '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', '', 4, 224, 0, 224, 200, 0, 200, 0, 0, 0, 0, 0, 0.12, 0, 0, 0, 224);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra_gasto`
--

DROP TABLE IF EXISTS `detalle_compra_gasto`;
CREATE TABLE `detalle_compra_gasto` (
  `id_dcg` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `cuenta_dcg` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `subtotal_civa_dcg` float NOT NULL,
  `subtotal_siva_dcg` float NOT NULL,
  `subtotal_iva_cero_dcg` float NOT NULL,
  `total_dcg` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra_producto`
--

DROP TABLE IF EXISTS `detalle_compra_producto`;
CREATE TABLE `detalle_compra_producto` (
  `id_dcp` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `bonificacion_dcp` int(10) NOT NULL,
  `cantidad_dcp` int(10) NOT NULL,
  `precio_unitario_dcp` float NOT NULL,
  `descuento_dcp` float NOT NULL,
  `iva_dcp` float NOT NULL,
  `subtotal_dcp` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra_producto`
--

INSERT INTO `detalle_compra_producto` (`id_dcp`, `compra_id`, `producto_id`, `bonificacion_dcp`, `cantidad_dcp`, `precio_unitario_dcp`, `descuento_dcp`, `iva_dcp`, `subtotal_dcp`) VALUES
(1, 1, 1, 0, 100, 2, 0, 24, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pagos_compra`
--

DROP TABLE IF EXISTS `detalle_pagos_compra`;
CREATE TABLE `detalle_pagos_compra` (
  `id_dpc` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `metodo_pago_id` int(11) NOT NULL,
  `banco_emisor` int(11) DEFAULT NULL,
  `banco_receptor` int(11) DEFAULT NULL,
  `codigo` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_tarjeta` int(11) DEFAULT NULL,
  `franquicia` int(11) DEFAULT NULL,
  `recibo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `titular` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cheque` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_pagos_compra`
--

INSERT INTO `detalle_pagos_compra` (`id_dpc`, `compra_id`, `metodo_pago_id`, `banco_emisor`, `banco_receptor`, `codigo`, `fecha`, `tipo_tarjeta`, `franquicia`, `recibo`, `titular`, `cheque`) VALUES
(1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_sustento_comprobante`
--

DROP TABLE IF EXISTS `detalle_sustento_comprobante`;
CREATE TABLE `detalle_sustento_comprobante` (
  `id_dsc` int(11) NOT NULL,
  `sustento_id` int(11) NOT NULL,
  `comprobante_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_sustento_comprobante`
--

INSERT INTO `detalle_sustento_comprobante` (`id_dsc`, `sustento_id`, `comprobante_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 1),
(12, 2, 11),
(13, 2, 2),
(14, 2, 3),
(15, 2, 4),
(16, 2, 13),
(17, 2, 5),
(18, 2, 6),
(19, 2, 14),
(20, 2, 15),
(21, 2, 16),
(22, 2, 7),
(23, 2, 8),
(24, 2, 9),
(25, 2, 10),
(26, 3, 1),
(27, 3, 2),
(28, 3, 3),
(29, 3, 4),
(30, 3, 9),
(31, 3, 10),
(32, 4, 1),
(33, 4, 11),
(34, 4, 12),
(35, 4, 3),
(36, 4, 4),
(37, 4, 14),
(38, 4, 9),
(39, 4, 10),
(40, 5, 1),
(41, 5, 11),
(42, 5, 12),
(43, 5, 3),
(44, 5, 4),
(45, 5, 5),
(46, 5, 14),
(47, 6, 1),
(48, 6, 12),
(49, 6, 3),
(50, 6, 4),
(51, 6, 8),
(52, 6, 9),
(53, 6, 10),
(54, 7, 1),
(55, 7, 11),
(56, 7, 12),
(57, 7, 3),
(58, 7, 4),
(59, 7, 14),
(60, 7, 8),
(61, 7, 9),
(62, 7, 10),
(63, 8, 1),
(64, 8, 11),
(65, 8, 12),
(66, 8, 3),
(67, 8, 4),
(68, 8, 7),
(69, 9, 1),
(70, 9, 3),
(71, 9, 4),
(72, 9, 17),
(73, 10, 15),
(74, 11, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_banco`
--

DROP TABLE IF EXISTS `df_banco`;
CREATE TABLE `df_banco` (
  `df_id_banco` int(11) NOT NULL,
  `df_fecha_banco` datetime NOT NULL,
  `df_usuario_id_banco` int(11) NOT NULL,
  `df_tipo_movimiento` varchar(100) NOT NULL,
  `df_monto_banco` float NOT NULL,
  `df_saldo_banco` float NOT NULL,
  `df_num_documento_banco` varchar(100) NOT NULL,
  `df_detalle_mov_banco` text NOT NULL,
  `df_modificadoBy_banco` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_bodega`
--

DROP TABLE IF EXISTS `df_bodega`;
CREATE TABLE `df_bodega` (
  `df_id_bodega` int(11) NOT NULL,
  `df_nombre_bodega` text NOT NULL,
  `df_direccion_bodega` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_bodega`
--

INSERT INTO `df_bodega` (`df_id_bodega`, `df_nombre_bodega`, `df_direccion_bodega`) VALUES
(1, 'Matriz', 'Local Princial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_caja_chica_gasto`
--

DROP TABLE IF EXISTS `df_caja_chica_gasto`;
CREATE TABLE `df_caja_chica_gasto` (
  `df_id_gasto` int(11) NOT NULL,
  `df_usuario_id` int(11) NOT NULL,
  `df_movimiento` text NOT NULL,
  `df_gasto` float NOT NULL,
  `df_saldo` float NOT NULL,
  `df_fecha_gasto` datetime NOT NULL,
  `df_num_documento` varchar(50) DEFAULT NULL,
  `df_ingreso_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_caja_chica_ingreso`
--

DROP TABLE IF EXISTS `df_caja_chica_ingreso`;
CREATE TABLE `df_caja_chica_ingreso` (
  `df_id_ingreso_cc` int(11) NOT NULL,
  `df_fecha_ingreso` datetime NOT NULL,
  `df_usuario_id_ingreso` int(11) NOT NULL,
  `df_num_cheque` varchar(25) NOT NULL,
  `df_valor_cheque` float NOT NULL,
  `df_saldo_cc` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_cat_movimiento`
--

DROP TABLE IF EXISTS `df_cat_movimiento`;
CREATE TABLE `df_cat_movimiento` (
  `df_id_cat_movimiento` int(11) NOT NULL,
  `df_nombre_movimiento` varchar(200) NOT NULL,
  `df_tipo` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Catalogo de nombre movimiento de caja chica y banco';

--
-- Volcado de datos para la tabla `df_cat_movimiento`
--

INSERT INTO `df_cat_movimiento` (`df_id_cat_movimiento`, `df_nombre_movimiento`, `df_tipo`) VALUES
(1, 'APORTE', 'I'),
(2, 'VENTAS', 'I'),
(3, 'PRESTAMO', 'I'),
(4, 'BONIFICACIONES', 'I'),
(5, 'MERCADERIA', 'E'),
(6, 'ARRIENDO', 'E'),
(7, 'SUELDOS', 'E'),
(8, 'MOVILIZACION', 'E'),
(9, 'SERVICIOS BASICOS', 'E'),
(10, 'GASTOS DE MOVILIZACION', 'E'),
(11, 'ENSERES DE OFICINA', 'E'),
(12, 'SUMINISTROS DE OFICINA', 'E'),
(13, 'PRESTAMO', 'E'),
(14, 'SERVICIOS PROFECIONALES', 'E'),
(15, 'MULTAS O RECARGOS', 'E'),
(16, 'IESS', 'E'),
(17, 'SRI', 'E'),
(18, 'IMPUESTO A LA RENTA', 'E'),
(19, 'UNIFORMES', 'E'),
(20, 'ANTICIPO', 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_ciudad`
--

DROP TABLE IF EXISTS `df_ciudad`;
CREATE TABLE `df_ciudad` (
  `df_codigo_ciudad` int(11) NOT NULL,
  `df_nombre_ciudad` varchar(120) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Ciudades';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_cliente`
--

DROP TABLE IF EXISTS `df_cliente`;
CREATE TABLE `df_cliente` (
  `df_id_cliente` int(11) NOT NULL,
  `df_codigo_cliente` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `df_nombre_cli` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_razon_social_cli` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_tipo_documento_cli` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_documento_cli` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_direccion_cli` text COLLATE utf8_spanish_ci NOT NULL,
  `df_referencia_cli` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_sector_cod` int(11) DEFAULT NULL,
  `df_email_cli` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_telefono_cli` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_celular_cli` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_cliente`
--

INSERT INTO `df_cliente` (`df_id_cliente`, `df_codigo_cliente`, `df_nombre_cli`, `df_razon_social_cli`, `df_tipo_documento_cli`, `df_documento_cli`, `df_direccion_cli`, `df_referencia_cli`, `df_sector_cod`, `df_email_cli`, `df_telefono_cli`, `df_celular_cli`) VALUES
(1, 'CLI-001', 'PRUEBA', 'PRUEBA', 'Cedula', '12345', 'PRUEBA22', 'PRUEBA222', 4, 'diego.sanchez@proconty.com', '', ''),
(2, 'CLI-002', 'José Luis', 'Distrifarma', 'RUC', '1103314835001', 'Cesar Teran y Aviguiras', 'frente a amagasi del inca', 12, '', '', ''),
(3, 'CLI-003', 'CONSUMIDOR FINAL', '', 'Cedula', '9999999999', 'NO APLICA', 'NO APLICA', 1, '', '', ''),
(4, 'CLI-004', 'CECILIA NARANJO', '', 'Cedula', '180415385', 'LINEA FERREA E1-238 Y PEDRO CANDO', 'FRENTE A UNIDAD POLICIAL', 28, '', '', ''),
(5, 'CLI-005', 'LUIS TAPIA', 'BE HAPPY', 'RUC', '1719314344001', '12 DE OCTUBRE N24-529 Y LUIS CORDERO', 'REDONDEL ', 17, '', '', ''),
(6, 'CLI-006', 'PAOLA PIÑAS', '', 'Cedula', '1723598783', 'JOSE MARIA GUERRERO N63-293 Y JOSE FIGUEROA', 'JUNTO A CASA AMARILLA', 5, '', '', ''),
(7, 'CLI-007', 'PILAR QUILACHAMIN', '', 'Cedula', '1707404081', 'SARAGURO E3-19 Y LUJAN ', 'BODEGA DE TOLDO AZUL', 30, '', '', ''),
(8, 'CLI-008', 'GRACIELA CUADRADO', '', 'Cedula', '1103504039', 'PJE N53 A Y DE LOS JAZMINES', 'FRENTE A CONJ BRASILIA 2', 9, '', '', ''),
(9, 'CLI-009', 'JOSE LUIS ', 'Distrifarma', 'Cedula', '1103314835', 'Cesar Teran y Aviguiras', 'frente a amagasi del inca', 12, '', '', ''),
(10, 'CLI-010', 'WILLIAM GUANOLUISA', 'WILLIAM GUANOLUISA', 'RUC', '1722928999001', 'GIOVANNY CALLES OE2-208 Y CARAN', 'BODEGA WILLY´S', 20, NULL, '2024066', NULL),
(11, 'CLI-011', 'JACKELINE AVEIGA', 'JACKELINE AVEIGA', 'RUC', '801434556001', '10 DE AGOSTO Y LAS CASAS', 'BLACK AND WHITE', 17, NULL, '', NULL),
(12, 'CLI-012', 'ALEXANDRA BEDON', 'ALEXANDRA BEDON', 'RUC', '1002569430001', 'AMERICA N31-222 Y MARIANA DE JESUS  ', '', 17, NULL, '', NULL),
(13, 'CLI-013', 'ABDULLA RAIDAN MOHAMED   ', 'ABDULLA RAIDAN MOHAMED   ', 'RUC', '1792824362001', 'ELOY ALFARO N37-68 Y JOSE CORREA   ', 'DOUBLE APPLE', 17, NULL, '', NULL),
(14, 'CLI-014', 'AHMED ABDULMALEK QASEM         ', 'AHMED ABDULMALEK QASEM         ', 'RUC', '1757452337001', '6 DE DICIEMBRE Y BELGICA/BOMBA DE GASOLINA', 'LUNA Y SOL', 17, NULL, '995950080', NULL),
(15, 'CLI-015', 'AISKEL MACEA       ', 'AISKEL MACEA       ', 'RUC', '1757812308001', 'PALMERAS N46-87 Y DE LAS BREVAS       ', '', 17, NULL, '999099253', NULL),
(16, 'CLI-016', 'ALEJANDRA CAMPUES ', 'ALEJANDRA CAMPUES ', 'RUC', '1725883381001', 'GALO PLAZA N53-55 Y SANTIAGO DE VIDELA   ', '', 19, NULL, '', NULL),
(17, 'CLI-017', 'ALEXANDRA ANRANGO   ', 'ALEXANDRA ANRANGO   ', 'CEDULA', '1718010364', 'GALO PLAZA LASSO OE12-130 Y FCO ROBLES ', '', 19, NULL, '', NULL),
(18, 'CLI-018', 'ALFONSO ESPINOZA     ', 'ALFONSO ESPINOZA     ', 'RUC', '1309091724001', 'PALMERAS Y DE LOS TULIPANES  ', 'EL GOLOSO', 17, NULL, '', NULL),
(19, 'CLI-019', 'ALICIA LINCANGO ', 'ALICIA LINCANGO ', 'CEDULA', '1705998548', 'DE LOS TULIPANES E10-298 Y DE LAS PALMERAS ', '', 17, NULL, '', NULL),
(20, 'CLI-020', 'ALICIA TANDAZO   ', 'ALICIA TANDAZO   ', 'RUC', '1704597101001', 'MACHALA N60-11 Y BARTOLOME RUIZ       ', '', 17, NULL, '', NULL),
(21, 'CLI-021', 'AMPARO DONOSO      ', 'AMPARO DONOSO      ', 'CEDULA', '1707228555', 'EL INCA E10-42 Y DE LAS MARGARITAS    ', 'FARMACIA DAS', 14, NULL, '', NULL),
(22, 'CLI-022', 'ANA CAIZA', 'ANA CAIZA', 'CEDULA', '1723332712', 'CESAR TERAN Y AVIGIRAS      ', 'TIENDA ANITA', 12, NULL, '', NULL),
(23, 'CLI-023', 'ANA LUCIA BACULIMA        ', 'ANA LUCIA BACULIMA        ', 'CEDULA', '1721794830', 'CARLOS MANTILLA OE6-164 Y ALHAMBRA      ', '', 19, NULL, '', NULL),
(24, 'CLI-024', 'ANA LUISA MADRID       ', 'ANA LUISA MADRID       ', 'CEDULA', '1704965910', 'SAQUILISI  E7-62 Y JUAN BAUTISTA AGUIRRE   ', '', 40, NULL, '', NULL),
(25, 'CLI-025', 'ANDRES AULESTIA    ', 'ANDRES AULESTIA    ', 'RUC', '1711085843001', 'DOMINGO BRIEVA N38-153 Y GRANDA CENTENO ', '', 2, NULL, '', NULL),
(26, 'CLI-026', 'BANANA MINI MARKET  ', 'BANANA MINI MARKET  ', 'RUC', '1757252653001', 'DIEGO DE ALMAGRO Y BULGARIA     ', '', 17, NULL, '', NULL),
(27, 'CLI-027', 'BETSABETH BARRAZUETA       ', 'BETSABETH BARRAZUETA       ', 'RUC', '101886893001', 'GONZALO GALLO OE7-192 Y JORGE PIEDRA  ', '', 17, NULL, '', NULL),
(28, 'CLI-028', 'CARLOS PULUPA     ', 'CARLOS PULUPA     ', 'RUC', '1710624071001', 'VACA DE CASTRO OE5-60 Y PEDRO FREILE   ', 'MUNDI EXPRESS', 17, NULL, '', NULL),
(29, 'CLI-029', 'CARMEN VASQUEZ      ', 'CARMEN VASQUEZ      ', 'RUC', '1704514460001', 'RUIZ CASTILLA Y LORENZO ANDANA       ', 'VIVERES CARMITA', 17, NULL, '', NULL),
(30, 'CLI-030', 'LILIA GONZALES', 'LILIA GONZALES', 'RUC', '1708612062001', 'JOSE ARIZAGA E2-20 E IÑAQUITO', 'VIVERES LA PREFERIDA', 16, NULL, '', NULL),
(31, 'CLI-031', 'CAROLINA NACIMBA        ', 'CAROLINA NACIMBA        ', 'RUC', '1724066384001', 'GASPAR DE ESCALONA N38-185 Y GRANADA CENTENO              ', 'MINI MARKET GRANDA CENTENO   ', 2, NULL, '', NULL),
(32, 'CLI-032', 'DEXY MONSERRATE  ', 'DEXY MONSERRATE  ', 'CEDULA', '1713792081', 'LUIS ROVALINO OE6-111 Y JULIO LARREA      ', '', 17, NULL, '', NULL),
(33, 'CLI-033', 'DIANA BERRONES      ', 'DIANA BERRONES      ', 'RUC', '1715218051001', 'FLAVIO ALFARO OE5-218 Y JOSE MORA    ', 'PANIFICADORA DANESA', 17, NULL, '', NULL),
(34, 'CLI-034', 'MARIA GUAMAN', 'MARIA GUAMAN', 'RUC', '604363143001', 'CADIZ N14-126 Y MANTILLA   ', 'DELI SAN JOSE', 19, NULL, '', NULL),
(35, 'CLI-035', 'LUPE RUALES    ', 'LUPE RUALES    ', 'CEDULA', '10026431281', 'GIOVANNY CALLES OE7-229 Y LOS PINOS    ', '', 19, NULL, '', NULL),
(36, 'CLI-036', 'TATIANA PEREZ', 'TATIANA PEREZ', 'RUC', '1721885356001', 'ALCALA OE6-79 Y ALHAMBRA   ', '', 19, NULL, '', NULL),
(37, 'CLI-037', 'EL TONO PERFECTO S.A.   ', 'EL TONO PERFECTO S.A.   ', 'RUC', '1791802977001', 'JOSE FELIX BARREIRO Y CARLOS ALVARADO  ', '', 9, NULL, '', NULL),
(38, 'CLI-038', 'ELIZABETH BRIONES       ', 'ELIZABETH BRIONES       ', 'CEDULA', '1718610239', 'HOMERO SALAS OE5-09 Y MANUEL SERRANO  ', '', 17, NULL, '', NULL),
(39, 'CLI-039', 'ELVIA AUZ   ', 'ELVIA AUZ   ', 'CEDULA', '1000691905', 'GRAL VEINTIMILLA Y JOSE TAMAYO     ', '', 17, NULL, '', NULL),
(40, 'CLI-040', 'ESTELA CANENCIA      ', 'ESTELA CANENCIA      ', 'RUC', '1704522315001', 'ANDRES CEVALLOS N65-113 Y JOSE ENCALADA', '', 10, NULL, '23454746', NULL),
(41, 'CLI-041', 'FABIOLA VIVAS      ', 'FABIOLA VIVAS      ', 'RUC', '1700798299001', 'HOMERO SALAS OE5-09 Y MANUEL SERRANO  ', 'LA SUPER TIENDA DEL BARRIO ', 17, NULL, '', NULL),
(42, 'CLI-042', 'FAUSTO TOTOY                  ', 'FAUSTO TOTOY                  ', 'RUC', '1715403398001', 'AMERICA N31-152 Y MARIANA DE JESUS     ', '', 17, NULL, '', NULL),
(43, 'CLI-043', 'FERNANDA TARAMUEL    ', 'FERNANDA TARAMUEL    ', 'CEDULA', '1719067967', 'MUNIVE OE7-112 Y JOSE DEL ROSARIO  ', 'VIVERES MARUJITA   ', 17, NULL, '', NULL),
(44, 'CLI-044', 'FERNANDO ALCOSER  ', 'FERNANDO ALCOSER  ', 'RUC', '2200082689001', 'NARIZ DEL DIABLO E5-211 Y SERGIO OREJUELA', '', 28, NULL, '995884136', NULL),
(45, 'CLI-045', 'FLOR MARIA SALAZAR           ', 'FLOR MARIA SALAZAR           ', 'CEDULA', '1707904544', 'DIEGO DE ALMAGRO Y PEDRO PONCE CARRASCO', 'VIVERES FLORCITA       ', 17, NULL, '', NULL),
(46, 'CLI-046', 'FRANCENED DIAZ      ', 'FRANCENED DIAZ      ', 'RUC', '1726145335001', 'SHYRIS Y EL ZURIAGO      ', 'FRANCY LOOK     ', 17, NULL, '', NULL),
(47, 'CLI-047', 'FRANCISCO DAZA   ', 'FRANCISCO DAZA   ', 'RUC', '1791751914001', 'JOAQUIN MANCHENO N74-20 Y ELOY ALFARO', '', 14, NULL, '', NULL),
(48, 'CLI-048', 'GABRIELA BAUTISTA  ', 'GABRIELA BAUTISTA  ', 'CEDULA', '1717218737', 'PEDRO FREILE N63-75 Y SABANILLA      ', 'FRIGO FAMILIAR', 5, NULL, '', NULL),
(49, 'CLI-049', 'ISABEL ALLEUCA          ', 'ISABEL ALLEUCA          ', 'CEDULA', '502462039', 'JOSE HERBOSO OE6-252 Y YUMBOS     ', '', 4, NULL, '', NULL),
(50, 'CLI-050', 'ROSARIO LASSO   ', 'ROSARIO LASSO   ', 'CEDULA', '502498868', 'LA FLORIDA OE3-176 Y LA PRENSA    ', '', 4, NULL, '', NULL),
(51, 'CLI-051', 'CHRISTIAN BENAVIDEZ ', 'CHRISTIAN BENAVIDEZ ', 'RUC', '1721199204001', 'ZAMORA OE3-237 Y BRASIL ', 'MINI MARKET ZAMORA', 3, NULL, '', NULL),
(52, 'CLI-052', 'JORGE GARCIA    ', 'JORGE GARCIA    ', 'CEDULA', '1758591844', 'SHYRIS N41-131 E ISLA FLOREANA', 'ANDRES ROA PELUQUERIA', 17, NULL, '', NULL),
(53, 'CLI-053', 'MARIELENA RUIZ ', 'MARIELENA RUIZ ', 'RUC', '1706912761001', 'GASPAR DE VILLA RUEL Y 6 DE DICIEMBRE   ', '  PA TODOS DE TODO PA TODOS          ', 17, NULL, '', NULL),
(54, 'CLI-054', 'ALEXANDRA CHUQUILIA', 'ALEXANDRA CHUQUILIA', 'RUC', '1716981897001', 'AV EL INCA Y EL MORLAN ', '  MINI MARKET ALEX              ', 14, NULL, '', NULL),
(55, 'CLI-055', 'ANITA ANDRADE     ', 'ANITA ANDRADE     ', 'RUC', '1704969110001', 'MANUEL SERRANO N51-113 Y EUSTOQUIO BLANCO ', 'MINI MARKET SOL DEL NORTE', 4, NULL, '', NULL),
(56, 'CLI-056', 'ANA CULLASPUMA              ', 'ANA CULLASPUMA              ', 'CEDULA', '1717708372', 'DE LOS ALAMOS E10-162 Y ASUNOS   ', 'VARIEDADES CARLITOS', 9, NULL, '', NULL),
(57, 'CLI-057', 'ROSA TENELEMA ', 'ROSA TENELEMA ', 'CEDULA', '502594377', 'NICOLAS LOPEZ Y AV BRAZIL', 'VIVERES MELANI', 17, NULL, '', NULL),
(58, 'CLI-058', 'GLADYS RUIZ', 'GLADYS RUIZ', 'CEDULA', '256816', 'ALONSO JEREZ E1-15 Y MATILDE HIDALGO ', '', 55, NULL, '', NULL),
(59, 'CLI-059', 'ROSA CAGUANGO', 'ROSA CAGUANGO', 'CEDULA', '171468888', 'AV YEROVI INDABURU OE1-62 Y ANTONIO VELAZCO', 'VIVERES SAMANTA', 19, NULL, '', NULL),
(60, 'CLI-060', 'ALEGRIA INTRIAGO ', 'ALEGRIA INTRIAGO ', 'CEDULA', '1307441962', 'JUAN MOLINEROS E11-59 Y FLORIPONDIO', 'BODEGA JULIO ABDALA', 10, NULL, '', NULL),
(61, 'CLI-061', 'LEIDY VELASQUEZ  ', 'LEIDY VELASQUEZ  ', 'RUC', '1758788481001', 'COLON Y 12 DE OCTUBRE ', 'CHERRY BOOM', 17, NULL, '', NULL),
(62, 'CLI-062', 'DORIS RODRIGUEZ         ', 'DORIS RODRIGUEZ         ', 'CEDULA', '1706796065', 'MANUEL SERRANO N52-10 Y LA FLORIDA   ', 'DELI HELADERIA', 4, NULL, '', NULL),
(63, 'CLI-063', 'CONSUELO CONDOR', 'CONSUELO CONDOR', 'CEDULA', '1711595478', 'CACHA  N4-130 Y JORGE MORTILLO     ', '', 20, NULL, '', NULL),
(64, 'CLI-064', 'MARIA GREFA', 'MARIA GREFA', 'RUC', '1500161607', 'PRENSA N47-233 Y GONZALO SALAZAR', 'MINI MARKET LOLITA', 17, NULL, '', NULL),
(65, 'CLI-065', 'LUIS POTOSI ', 'LUIS POTOSI ', 'RUC', '1002057931001', 'NOGALES N50-295 Y JOSE BARREIRO', 'PANADERIA ALEXANDRA', 12, NULL, '', NULL),
(66, 'CLI-066', 'CLARA DE CELI  ', 'CLARA DE CELI  ', 'RUC', '1800995894001', 'MARCOS JOFRE OE5-135 Y FELIX ORALABAL', 'MICRO MERCADO DANIEL', 17, NULL, '', NULL),
(67, 'CLI-067', 'MARIANA CHULDE', 'MARIANA CHULDE', 'RUC', '1708487564001', 'WILSON E9-11 Y LEONIDAS PLAZA GUTIERREZ', '', 17, NULL, '', NULL),
(68, 'CLI-068', 'JESSICA CUMBAJIN', 'JESSICA CUMBAJIN', 'RUC', '1104686025001', 'DE LOS MORTIÑOS E14-225 Y ELOY ALFARO', 'PLASTICOS D´CUMBA', 17, NULL, '', NULL),
(69, 'CLI-069', 'ROSALIA MONAGAS', 'ROSALIA MONAGAS', 'RUC', '1756728604001', '6 DE DICIEMBRE Y GASPAR DE VILLAROEL', 'LOS ANDES', 17, NULL, '', NULL),
(70, 'CLI-070', 'MARITZA SANCHO', 'MARITZA SANCHO', 'CEDULA', '1715234744', 'SHYRIS N42-125 Y TOMAS DE BERLANGA', 'UÑAS', 17, NULL, '', NULL),
(71, 'CLI-071', 'HILDA MANOSALVAS', 'HILDA MANOSALVAS', 'RUC', '1707461891001', 'NEPTALY GODOY Y RIO AMAZONAS', 'LA ARQUERIA', 19, NULL, '', NULL),
(72, 'CLI-072', 'JENNY SANGUÑA', 'JENNY SANGUÑA', 'RUC', '1724474471001', 'GIOVANNY CALLES OE11-373 Y VALDIVIA', '', 19, NULL, '', NULL),
(73, 'CLI-073', 'SOILA MOROCHO', 'SOILA MOROCHO', 'RUC', '1704185972001', 'LEONIDAS PLAZA N16-261 Y FCO ROBLES', 'VICKY MARKET', 19, NULL, '', NULL),
(74, 'CLI-074', 'JACKELINE PORTILLA', 'JACKELINE PORTILLA', 'CEDULA', '400763074', 'ISLA SANTA ANA N17-70 E ISLA ESPERANZA', 'VIVERES OCCIDENTAL', 19, NULL, '', NULL),
(75, 'CLI-075', 'NOHEMY GUILCAPY   ', 'NOHEMY GUILCAPY   ', 'CEDULA', '1720067758', 'JAIME CHIRIBOGA N50-124 Y HOMERO SALAS', 'TODO AL MENOR PRECIO', 4, NULL, '', NULL),
(76, 'CLI-076', 'MICHAEL SUPERLANO', 'MICHAEL SUPERLANO', 'CEDULA', '20211580', 'JOAQUIN SUMAITA N47-354 Y SAMUEL FRITZ', '', 14, NULL, '', NULL),
(77, 'CLI-077', 'BLACK AND WITHE', 'BLACK AND WITHE', 'RUC', '2100153085', '10 DE AGOSTO Y LAS CASAS', '', 17, NULL, '', NULL),
(78, 'CLI-078', 'LOURDES PORRAS', 'LOURDES PORRAS', 'RUC', '1714352620001', 'AUCAS N23-28 Y JOSE HERBOSO', 'LA REINA', 4, NULL, '', NULL),
(79, 'CLI-079', 'MARIA MUGMAL', 'MARIA MUGMAL', 'CEDULA', '1003372776', 'DE LOS TULIPANES E10-335 Y LAS PALMERAS', '', 17, NULL, '', NULL),
(80, 'CLI-080', 'BLANCA PEÑALOZA', 'BLANCA PEÑALOZA', 'RUC', '1711314193001', 'WOLFANG MOZART Y BETHOVEN', 'CIABATTA', 17, NULL, '', NULL),
(81, 'CLI-081', 'TATIANA RODRIGUEZ CARABALI', 'TATIANA RODRIGUEZ CARABALI', 'RUC', '1712725876001', '6 DE DICIEMBRE N35-221 Y PJE EL JARDIN', 'JPS MARKET', 17, NULL, '', NULL),
(82, 'CLI-082', 'JOSELYN PUETATE', 'JOSELYN PUETATE', 'RUC', '401930458001', 'PEDRO DE ALVARADO N58-22 Y VACA DE CASTRO', '', 17, NULL, '', NULL),
(83, 'CLI-083', 'GABRIELA KUZCO', 'GABRIELA KUZCO', 'RUC', '1723650741001', 'ALPALLANA E7-64 Y WHYMPER    ', 'VIVERES DANNY', 18, NULL, '', NULL),
(84, 'CLI-084', 'NORMA BAQUE', 'NORMA BAQUE', 'RUC', '1713298485001', 'HERNAN CORTEZ N56-225 Y RUPERTO ALARCON', 'EL OSITO', 4, NULL, '', NULL),
(85, 'CLI-085', 'RICARDO CADENA', 'RICARDO CADENA', 'RUC', '1714590237001', 'NICOLAS VELEZ Y MACHALA  ', '', 17, NULL, '', NULL),
(86, 'CLI-086', 'XIMENA DELGADO', 'XIMENA DELGADO', 'RUC', '1711753515001', 'SANTA TERESA OE5-39 Y N64B           ', 'MICRO DAJEMA', 5, NULL, '', NULL),
(87, 'CLI-087', 'RUTH ALVAREZ', 'RUTH ALVAREZ', 'RUC', '1002751699001', 'HUACHI N60-38 Y FLAVIO ALFARO ', '', 5, NULL, '', NULL),
(88, 'CLI-088', 'ANGELA GAIBOR', 'ANGELA GAIBOR', 'RUC', '201355476001', 'PEDRO DE ALVARADO N60-209 Y FLAVIO ALFARO       ', 'LA ECONOMIA', 5, NULL, '', NULL),
(89, 'CLI-089', 'JUAN SARE', 'JUAN SARE', 'RUC', '701694457001', 'MARIANO AGUILERA E7-45 Y LA PRADERA  ', 'TRIANGULO MARKET', 16, NULL, '', NULL),
(90, 'CLI-090', 'LIGIA ROMERO', 'LIGIA ROMERO', 'RUC', '1704566924001', 'MARIANA DE JESUS E7-47 Y LA PRADERA  ', 'ARCICHOKIE', 16, NULL, '', NULL),
(91, 'CLI-091', 'MIRIAM MARGUA  ', 'MIRIAM MARGUA  ', 'RUC', '1715080519001', '10 DE AGOSTO N34-88 Y THOMAS MORO ', 'SODA BAR', 16, NULL, '', NULL),
(92, 'CLI-092', 'JESSY RAMOS   ', 'JESSY RAMOS   ', 'CEDULA', '1103421978', 'JOSE HERBOSO OE4-110 Y MANUEL SERRANO ', '', 5, NULL, '', NULL),
(93, 'CLI-093', 'VIVIANA BEDOYA     ', 'VIVIANA BEDOYA     ', 'RUC', '1719309021001', 'INGLATERRA Y MARIANA DE JESUS ', 'VIVERES NAYELI', 16, NULL, '', NULL),
(94, 'CLI-094', 'RICHARD VARGAS', 'RICHARD VARGAS', 'CEDULA', '1715587265', 'RUMIÑAHUI  OE11-36 Y JAIME ROLDOS A. ', 'TATOO', 19, NULL, '984290219', NULL),
(95, 'CLI-095', 'CUMANDA ORTEGA', 'CUMANDA ORTEGA', 'RUC', '1706637574001', 'SHYRIS N34-434 Y PORTUGAL  ', 'UÑAS VIP', 16, NULL, '984567363', NULL),
(96, 'CLI-096', 'MAYRA ROEL', 'MAYRA ROEL', 'RUC', '1715570451001', 'HUNGRIA N31-64 Y VANCOUVER', 'MYA PELUQUERIA', 16, NULL, '', NULL),
(97, 'CLI-097', 'EVELYN ACOSTA', 'EVELYN ACOSTA', 'CEDULA', '1710647585', 'JORGE WASHINGTON E1-32 Y 10 DE AGOSTO  ', 'EVIS MARKET', 17, NULL, '', NULL),
(98, 'CLI-098', 'JAIRO NOLIVOS', 'JAIRO NOLIVOS', 'CEDULA', '1724536162', 'ALEJANDRO PONCE N83-84 Y JAIME ROLDOS', 'JUNTO DELFIN AZUL', 19, NULL, '', NULL),
(99, 'CLI-099', 'RAUL ESPINOZA', 'RAUL ESPINOZA', 'RUC', '1701355933001', 'REAL AUDIENCIA N60-224 Y AV EL MAESTRO', 'EL ZARAPE MICRO', 8, NULL, '', NULL),
(100, 'CLI-100', 'MERY JACOME ', 'MERY JACOME ', 'RUC', '170177266001', 'LUIS TUFIÑO OE1-205 Y MANUEL MATHEU        ', 'VITAL PAN', 8, NULL, '', NULL),
(101, 'CLI-101', 'WILLIAM MOSCOSO', 'WILLIAM MOSCOSO', 'CEDULA', '1709684755', 'REAL AUDIENCIA N56-60 Y ALFONSO YEPEZ    ', 'LICORVEZA', 8, NULL, '', NULL),
(102, 'CLI-102', 'YOLANDA LOPEZ', 'YOLANDA LOPEZ', 'RUC', '1705871513001', 'REAL AUDIENCIA Y PORFIRIO ROMERO     ', 'FAST MARKET', 8, NULL, '', NULL),
(103, 'CLI-103', 'FAUSTO CALISPA', 'FAUSTO CALISPA', 'CEDULA', '1709828444', 'HUMBERTO MARIN OE2-20 Y SANTIAGO VIDELA', 'LICORERIA JUNTO A RESTAURANT', 8, NULL, '', NULL),
(104, 'CLI-104', 'ELVIA RUIZ', 'ELVIA RUIZ', 'CEDULA', '1709271660', 'TERMINAL DE CARCELEN LOCAL 2', '', 55, NULL, '', NULL),
(105, 'CLI-105', 'ARNULFO CHACON ', 'ARNULFO CHACON ', 'RUC', '1758712036001', 'LA GASCA Y GASPAR DE CARVAJAL     ', 'ATELIER DE BELLEZA KAROLAY', 17, NULL, '', NULL),
(106, 'CLI-106', 'IVAN PEÑA ', 'IVAN PEÑA ', 'RUC', '1706857784001', 'FLAVIO ALFARO OE4-47 Y AV LA PRENSA    ', 'SUS MIL ARTICULOS', 17, NULL, '', NULL),
(107, 'CLI-107', 'LA PELU', 'LA PELU', 'RUC', '1715053912001', 'YANEZ PINZON N26-131 Y LA NIÑA    ', '', 17, NULL, '', NULL),
(108, 'CLI-108', 'LISETH PAZMIÑO ', 'LISETH PAZMIÑO ', 'RUC', '1720660800001', '12 DE OCTUBRE N23-117 Y WILSON    ', 'MINI MARKET', 17, NULL, '', NULL),
(109, 'CLI-109', 'JUAN CARLOS BALLA', 'JUAN CARLOS BALLA', 'RUC', '1721774337001', 'JERONIMO CARRION Y 12 DE OCTUBRE   ', 'MINI MARKET LEONEL', 17, NULL, '', NULL),
(110, 'CLI-110', 'BYRON EGAS', 'BYRON EGAS', 'CEDULA', '1705938882601', 'TAMAYO N21-171 Y VICENTE ROCA     ', 'PIONT CENTER', 17, NULL, '', NULL),
(111, 'CLI-111', 'FERNANDA ENRIQUEZ', 'FERNANDA ENRIQUEZ', 'RUC', '1726164872001', 'IGNACIO VEINTIMILLA E7-49 Y REINA VICTORIA ', 'OPEN GO', 17, NULL, '', NULL),
(112, 'CLI-112', 'PATRICIA RODRIGUEZ', 'PATRICIA RODRIGUEZ', 'RUC', '171734814001', 'WILSON Y DIEGO DE ALMAGRO', '24 W', 17, NULL, '', NULL),
(113, 'CLI-113', 'MARIA RAQUEL ESCOBAR', 'MARIA RAQUEL ESCOBAR', 'CEDULA', '1704539418', 'REINA VICTORIA N9-10 Y LA PATRIA  ', '', 17, NULL, '', NULL),
(114, 'CLI-114', 'ALEX ALVAREZ', 'ALEX ALVAREZ', 'RUC', '1713376042001', 'RAMIREZ DAVALOS E4-37 Y AMAZONAS    ', 'MEGA VALENTINA', 17, NULL, '', NULL),
(115, 'CLI-115', 'LUIS PERUGACHI', 'LUIS PERUGACHI', 'CEDULA', '1714942917', 'JORGE WASHINGTON Y JUAN LEON     ', 'XPRESS MARKET', 17, NULL, '', NULL),
(116, 'CLI-116', 'ELVIS MORALES', 'ELVIS MORALES', 'CEDULA', '1805053913', 'IGNACIO DE QUEZADA Y HUMBERTO ALBORNOZ', '', 17, NULL, '', NULL),
(117, 'CLI-117', 'BLANCA VILLA', 'BLANCA VILLA', 'RUC', '601967862001', 'LADRON DE GUEVARA E13-293 Y LERIDA', 'ANUNCIO COLGATE', 17, NULL, '', NULL),
(118, 'CLI-118', 'JIMENA BURBANA', 'JIMENA BURBANA', 'CEDULA', '1714681499', 'PAPALLACTA Y 10 DE AGOSTO      ', 'MINI MARKET JUNTO CRUZ ROJA', 2, NULL, '', NULL),
(119, 'CLI-119', 'ROCIO ORTIZ', 'ROCIO ORTIZ', 'CEDULA', '1706022546', 'PEDRO DE VALDIVIA N21-21 Y JORGE WASHINGTON     ', 'DELIKATESSEN KELYTA', 17, NULL, '', NULL),
(120, 'CLI-120', 'CARLOS HERNANDEZ', 'CARLOS HERNANDEZ', 'RUC', '401072830001', 'RAMIREZ DAVALOS OE1-55 Y 10 DE AGOSTO   ', 'COPIAS INTERNET', 17, NULL, '', NULL),
(121, 'CLI-121', 'JACKELINE JIMENEZ', 'JACKELINE JIMENEZ', 'CEDULA', '1757126931', '10 DE AGOSTO N23-65 Y ALONSO DE MERCADILLO', 'DOMINICA REPUBLICA', 17, NULL, '', NULL),
(122, 'CLI-122', 'MARIO LOVATO', 'MARIO LOVATO', 'RUC', '500491048001', '6 DE DICIEMBRE Y LA NIÑA  C.C. MULTICENTRO', 'PELUQUERIA MARIOS  MULTICENTRO LOCAL 16 PB', 17, NULL, '', NULL),
(123, 'CLI-123', 'NELLY CHABLAY', 'NELLY CHABLAY', 'CEDULA', '1708341464', 'ATACAMES Y PONCE DE LEON', 'VIVERES ANDY JUNTO A N25-137', 17, NULL, '', NULL),
(124, 'CLI-124', 'MARGOTH NEPAS', 'MARGOTH NEPAS', 'RUC', '1720095098001', 'EL MORLAN N49-62 Y N49C            ', 'INTERNET Y CABINAS', 14, NULL, '', NULL),
(125, 'CLI-125', 'JESSICA CHICAIZA', 'JESSICA CHICAIZA', 'RUC', '1500523798001', 'JAIME ROLDOS N15-103 Y CARIHUAIRAZO', 'DISTRIBUIDORA CAMPOVERDE', 19, NULL, '962695670', NULL),
(126, 'CLI-126', 'JOSELYN CASTELLANO', 'JOSELYN CASTELLANO', 'CEDULA', '1723110258', 'YANEZ PINZON N26-140 Y LA NIÑA        ', '', 17, NULL, '', NULL),
(127, 'CLI-127', 'OLGA TAPIA', 'OLGA TAPIA', 'CEDULA', '1703921062', 'ELOY ALFARO N52-220 Y LOS GUAYABOS', '', 12, NULL, '', NULL),
(128, 'CLI-128', 'NORMA TELLO', 'NORMA TELLO', 'RUC', '2100056932001', 'RIO CAYAMBE OE11-121 Y NEPTALY GODOY   ', 'BACHITAS PAÑALERA', 19, NULL, '969155297', NULL),
(129, 'CLI-129', 'MONICA BASANTES', 'MONICA BASANTES', 'CEDULA', '1713794533', 'ZALDUMBIDE N49-134 Y ABELARDO MONTALVO', 'PELUQUERIA MONICA', 9, NULL, '', NULL),
(130, 'CLI-130', 'NESTOR ARONI', 'NESTOR ARONI', 'RUC', '1757981467001', 'ZALDUMBIDE N50-80 Y BUSTAMANTE', '', 9, NULL, '', NULL),
(131, 'CLI-131', 'JESSICA PATIN', 'JESSICA PATIN', 'CEDULA', '250125457', 'HUMBERTO ALBORNOZ OE6-80 Y GARCIA VALVERDE   ', 'FRUTAS Y LEGUMBRES LISSET', 17, NULL, '', NULL),
(132, 'CLI-132', 'MARIA MOROCHO', 'MARIA MOROCHO', 'RUC', '106071159001', 'NUÑEZ DE BONILLA N24-191 Y CARVAJAL', 'JESUS DEL GRAN PODER', 17, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_cuotas_compra`
--

DROP TABLE IF EXISTS `df_cuotas_compra`;
CREATE TABLE `df_cuotas_compra` (
  `df_id_cc` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `df_fecha_cc` date NOT NULL,
  `df_monto_cc` float NOT NULL,
  `df_estado_cc` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_cuotas_compra`
--

INSERT INTO `df_cuotas_compra` (`df_id_cc`, `compra_id`, `df_fecha_cc`, `df_monto_cc`, `df_estado_cc`) VALUES
(1, 1, '2018-10-26', 224, 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_ciudad`
--

DROP TABLE IF EXISTS `df_detalle_ciudad`;
CREATE TABLE `df_detalle_ciudad` (
  `df_id_detalle_ciudad` int(11) NOT NULL,
  `df_sector_id` int(11) NOT NULL,
  `df_ciudad_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_entrega`
--

DROP TABLE IF EXISTS `df_detalle_entrega`;
CREATE TABLE `df_detalle_entrega` (
  `df_id_detent` int(11) NOT NULL,
  `df_guia_entrega` int(11) NOT NULL,
  `df_cod_producto` int(11) NOT NULL,
  `df_unidad_detent` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `df_cant_producto_detent` int(11) NOT NULL,
  `df_factura_detent` int(11) NOT NULL,
  `df_nom_producto_detent` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_num_factura_detent` bigint(20) NOT NULL COMMENT 'Numero de la factura relacionada al producto'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_factura`
--

DROP TABLE IF EXISTS `df_detalle_factura`;
CREATE TABLE `df_detalle_factura` (
  `df_id_factura_detfac` int(11) NOT NULL,
  `df_num_factura_detfac` int(11) NOT NULL,
  `df_prod_precio_detfac` int(11) NOT NULL,
  `df_precio_prod_detfac` float NOT NULL,
  `df_cantidad_detfac` int(11) NOT NULL,
  `df_nombre_und_detfac` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la unidad: Caja o Und',
  `df_cant_x_und_detfac` int(11) NOT NULL COMMENT 'Cantidad total de la factura por unidaddes',
  `df_edo_entrega_prod_detfac` int(11) NOT NULL COMMENT 'Estado relacionado al edo de factura. En este caso es referente a la entrega el producto en guia e recepcion',
  `df_valor_sin_iva_detfac` float NOT NULL,
  `df_iva_detfac` float NOT NULL,
  `df_valor_total_detfac` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_mercancia`
--

DROP TABLE IF EXISTS `df_detalle_mercancia`;
CREATE TABLE `df_detalle_mercancia` (
  `df_mercancia_detmer` int(11) NOT NULL,
  `df_mercancia_cod` int(11) NOT NULL,
  `df_producto_cod_mer` int(11) NOT NULL,
  `df_nom_producto_mer` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_ppp_mer` float NOT NULL,
  `df_iva_mer` int(11) NOT NULL,
  `df_total_producto_mer` int(11) NOT NULL,
  `df_cantidad_mer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_personal`
--

DROP TABLE IF EXISTS `df_detalle_personal`;
CREATE TABLE `df_detalle_personal` (
  `df_id_detper` int(11) NOT NULL,
  `df_sueldo_detper` float NOT NULL,
  `df_bono_detper` float DEFAULT NULL,
  `df_anticipo_detper` float DEFAULT NULL,
  `df_descuento_detper` float DEFAULT NULL,
  `df_decimos_detper` float DEFAULT NULL,
  `df_vacaciones_detper` float DEFAULT NULL,
  `df_tabala_comision_detper` float DEFAULT NULL,
  `df_comisiones_detper` float DEFAULT NULL,
  `df_personal_cod_detper` int(11) NOT NULL,
  `df_usuario_detper` int(11) DEFAULT NULL,
  `df_fecha_proceso` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_detalle_personal`
--

INSERT INTO `df_detalle_personal` (`df_id_detper`, `df_sueldo_detper`, `df_bono_detper`, `df_anticipo_detper`, `df_descuento_detper`, `df_decimos_detper`, `df_vacaciones_detper`, `df_tabala_comision_detper`, `df_comisiones_detper`, `df_personal_cod_detper`, `df_usuario_detper`, `df_fecha_proceso`) VALUES
(9, 300, 0, 0, 0, 0, 0, 1, 0, 8, NULL, '2018-09-28 17:21:18'),
(8, 300, 0, 0, 0, 0, 0, 1, 0, 8, NULL, '2018-09-28 17:21:01'),
(7, 386, 0, 0, 0, 0, 0, 1, 0, 7, NULL, '2018-09-26 17:05:37'),
(6, 386, 0, 0, 0, 0, 0, 1, 0, 6, NULL, '2018-09-26 17:04:48'),
(5, 386, 0, 0, 0, 0, 0, 1, 0, 5, NULL, '2018-09-26 17:04:00'),
(4, 386, 0, 0, 0, 0, 0, 1, 0, 4, NULL, '2018-09-26 17:02:51'),
(3, 386, 0, 0, 0, 0, 0, 1, 0, 3, NULL, '2018-09-26 17:01:14'),
(2, 386, 0, 0, 0, 0, 0, 1, 0, 2, NULL, '2018-09-26 16:59:41'),
(1, 386, 0, 0, 0, 0, 0, 1, 0, 1, NULL, '2018-09-26 16:58:10'),
(11, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 13:17:21'),
(10, 30, 0, 0, 0, 0, 0, 1, 0, 8, NULL, '2018-09-28 17:25:36'),
(12, 386, 0, 0, 0, 0, 0, 1, 0, 6, NULL, '2018-10-12 13:58:40'),
(13, 386, 0, 0, 0, 0, 0, 1, 0, 6, NULL, '2018-10-12 13:58:49'),
(14, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 13:59:19'),
(15, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 14:00:21'),
(16, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 14:40:24'),
(17, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 14:41:53'),
(18, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 14:42:34'),
(19, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-12 16:06:23'),
(20, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-14 23:45:29'),
(21, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-15 00:39:30'),
(22, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-15 00:40:33'),
(23, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-15 13:45:52'),
(24, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-15 19:18:28'),
(25, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-15 19:19:53'),
(26, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-15 19:20:31'),
(27, 386, 0, 0, 0, 0, 0, 1, 0, 8, 30, '2018-10-16 23:43:16'),
(28, 500, 0, 0, 0, 0, 0, 1, 0, 9, 33, '2018-10-16 23:47:40'),
(29, 500, 0, 0, 0, 0, 0, 1, 0, 9, 33, '2018-10-16 23:51:40'),
(30, 400, 0, 0, 0, 0, 0, 1, 0, 10, 35, '2018-10-16 23:54:39'),
(31, 400, 0, 0, 0, 0, 0, 1, 0, 10, 35, '2018-10-17 02:15:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_recepcion`
--

DROP TABLE IF EXISTS `df_detalle_recepcion`;
CREATE TABLE `df_detalle_recepcion` (
  `df_id_detrec` int(11) NOT NULL,
  `df_guia_recepcion_detrec` int(11) NOT NULL,
  `df_factura_rec` int(11) DEFAULT NULL,
  `df_cant_producto_detrec` int(11) NOT NULL,
  `df_cant_caja_detrec` int(10) NOT NULL,
  `df_producto_cod_detrec` int(11) NOT NULL,
  `df_nueva_fecha` datetime DEFAULT NULL,
  `df_detalleRemision_detrec` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Se escribe el detalle del producto en guía de recepción',
  `df_edo_prod_fact_detrec` int(11) DEFAULT NULL COMMENT 'Estado del producto de la factura, segun la recepcion'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_detalle_remision`
--

DROP TABLE IF EXISTS `df_detalle_remision`;
CREATE TABLE `df_detalle_remision` (
  `df_id_detrem` int(11) NOT NULL,
  `df_guia_remision_detrem` int(11) NOT NULL,
  `df_producto_precio_detrem` int(11) NOT NULL,
  `df_cant_producto_detrem` int(11) NOT NULL,
  `df_nombre_und_detrem` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `df_cant_x_und_detrem` int(11) NOT NULL,
  `df_valor_sin_iva_detrem` float NOT NULL,
  `df_iva_detrem` float NOT NULL,
  `df_valor_total_detrem` varchar(11) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_edo_kardex`
--

DROP TABLE IF EXISTS `df_edo_kardex`;
CREATE TABLE `df_edo_kardex` (
  `df_id_edo_kardex` int(11) NOT NULL,
  `df_nombre_edo_kardex` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_edo_kardex`
--

INSERT INTO `df_edo_kardex` (`df_id_edo_kardex`, `df_nombre_edo_kardex`) VALUES
(1, 'Venta'),
(2, 'Compra'),
(3, 'Devolución');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_edo_mercancia`
--

DROP TABLE IF EXISTS `df_edo_mercancia`;
CREATE TABLE `df_edo_mercancia` (
  `df_id_edo_mercancia` int(11) NOT NULL,
  `df_nombre_mercncia` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_edo_mercancia`
--

INSERT INTO `df_edo_mercancia` (`df_id_edo_mercancia`, `df_nombre_mercncia`) VALUES
(1, 'Por Despacho'),
(2, 'Despachado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_estado_factura`
--

DROP TABLE IF EXISTS `df_estado_factura`;
CREATE TABLE `df_estado_factura` (
  `df_id_estado` int(11) NOT NULL,
  `df_nombre_estado` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_estado_factura`
--

INSERT INTO `df_estado_factura` (`df_id_estado`, `df_nombre_estado`) VALUES
(1, 'Pendiente Entrega'),
(2, 'Entregado'),
(3, 'Abonado'),
(4, 'Modificado'),
(5, 'Anulado'),
(6, 'Reasignado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_estado_impresion`
--

DROP TABLE IF EXISTS `df_estado_impresion`;
CREATE TABLE `df_estado_impresion` (
  `df_estado_imp_id` int(11) NOT NULL,
  `df_nombre_impresion` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_estado_impresion`
--

INSERT INTO `df_estado_impresion` (`df_estado_imp_id`, `df_nombre_impresion`) VALUES
(1, 'Pendiente Impresión'),
(2, 'Impreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_factura`
--

DROP TABLE IF EXISTS `df_factura`;
CREATE TABLE `df_factura` (
  `df_num_factura` bigint(7) UNSIGNED ZEROFILL NOT NULL,
  `df_fecha_fac` datetime NOT NULL,
  `df_cliente_cod_fac` int(11) NOT NULL,
  `df_personal_cod_fac` int(11) NOT NULL,
  `df_sector_cod_fac` int(11) NOT NULL,
  `df_forma_pago_fac` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `df_subtotal_fac` float NOT NULL,
  `df_descuento_fac` float NOT NULL,
  `df_iva_fac` float NOT NULL,
  `df_valor_total_fac` float NOT NULL,
  `df_creadaBy` int(11) NOT NULL COMMENT 'id de usuario',
  `df_fecha_creacion` datetime NOT NULL,
  `df_edo_factura_fac` int(11) NOT NULL,
  `df_fecha_entrega_fac` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_factura_recepcion`
--

DROP TABLE IF EXISTS `df_factura_recepcion`;
CREATE TABLE `df_factura_recepcion` (
  `df_id_factura_rec` int(11) NOT NULL,
  `df_id_guia_rec` int(11) NOT NULL,
  `df_num_factura_rec` bigint(20) NOT NULL,
  `df_tipo_pago_rec` varchar(50) NOT NULL,
  `df_monto_rec` float NOT NULL,
  `df_num_documento` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_guia_entrega`
--

DROP TABLE IF EXISTS `df_guia_entrega`;
CREATE TABLE `df_guia_entrega` (
  `df_num_guia_entrega` int(11) NOT NULL,
  `df_codigo_guia_ent` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_sector_ent` int(11) NOT NULL,
  `df_repartidor_ent` int(11) NOT NULL,
  `df_cant_total_producto_ent` int(11) NOT NULL,
  `df_cant_total_cajas_ent` int(10) NOT NULL,
  `df_cant_facturas_ent` int(11) NOT NULL,
  `df_fecha_ent` datetime NOT NULL,
  `df_creadoBy_ent` int(11) NOT NULL,
  `df_modificadoBy_ent` int(11) DEFAULT NULL,
  `df_guia_ent_recibido` int(1) NOT NULL COMMENT '1 Recibido, 0 No recibido'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_guia_recepcion`
--

DROP TABLE IF EXISTS `df_guia_recepcion`;
CREATE TABLE `df_guia_recepcion` (
  `df_guia_recepcion` int(11) NOT NULL,
  `df_codigo_guia_rec` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_fecha_recepcion` datetime NOT NULL,
  `df_repartidor_rec` int(11) NOT NULL,
  `df_cant_und_rec` int(10) NOT NULL,
  `df_cant_caja_rec` int(10) NOT NULL,
  `df_valor_recaudado` float NOT NULL,
  `df_valor_efectivo` float NOT NULL,
  `df_valor_cheque` float NOT NULL,
  `df_retenciones` float NOT NULL,
  `df_descuento_rec` float NOT NULL,
  `df_diferencia_rec` float NOT NULL,
  `df_remision_rec` int(1) NOT NULL COMMENT '1 Si, 0 No',
  `df_entrega_rec` int(1) NOT NULL COMMENT '1 Si, 0 No',
  `df_num_guia` int(11) NOT NULL,
  `df_creadoBy_rec` int(11) NOT NULL,
  `df_modificadoBy_rec` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_guia_remision`
--

DROP TABLE IF EXISTS `df_guia_remision`;
CREATE TABLE `df_guia_remision` (
  `df_guia_remision` int(11) NOT NULL,
  `df_codigo_rem` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_fecha_remision` datetime NOT NULL,
  `df_sector_cod_rem` int(11) NOT NULL,
  `df_vendedor_rem` int(11) NOT NULL,
  `df_cant_total_producto_rem` int(11) NOT NULL,
  `df_valor_efectivo_rem` float NOT NULL,
  `df_creadoBy_rem` int(11) NOT NULL,
  `df_modificadoBy_rem` int(11) NOT NULL,
  `df_guia_rem_recibido` int(1) NOT NULL COMMENT '1 Recibido, 0 No recibido'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_historia_edo_factura`
--

DROP TABLE IF EXISTS `df_historia_edo_factura`;
CREATE TABLE `df_historia_edo_factura` (
  `df_id_hist_edo_factura` bigint(20) NOT NULL,
  `df_num_factura` bigint(20) NOT NULL,
  `df_edo_factura` int(11) NOT NULL,
  `df_edo_impresion` int(11) NOT NULL,
  `df_usuario_id` int(11) NOT NULL,
  `df_fecha_proceso` datetime NOT NULL,
  `df_sector_factura` int(5) NOT NULL,
  `df_direccion_factura` varchar(70) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_impuesto`
--

DROP TABLE IF EXISTS `df_impuesto`;
CREATE TABLE `df_impuesto` (
  `df_id_impuesto` int(11) NOT NULL,
  `df_nombre_impuesto` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `df_valor_impuesto` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_impuesto`
--

INSERT INTO `df_impuesto` (`df_id_impuesto`, `df_nombre_impuesto`, `df_valor_impuesto`) VALUES
(1, 'IVA', 12),
(2, 'IVA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_ingreso_mercancia`
--

DROP TABLE IF EXISTS `df_ingreso_mercancia`;
CREATE TABLE `df_ingreso_mercancia` (
  `df_mercancia_codigo` int(11) NOT NULL,
  `df_fecha_mer` datetime NOT NULL,
  `df_proveedor_cod_mer` int(11) NOT NULL,
  `df_factura_mer` int(11) NOT NULL,
  `df_subtotal_mer` float NOT NULL,
  `df_descuento_pro` float NOT NULL,
  `df_iva_mer` float NOT NULL,
  `df_total_fac_mer` float NOT NULL,
  `df_creadoBy_mer` int(11) NOT NULL,
  `df_edo_mercancia` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_inventario`
--

DROP TABLE IF EXISTS `df_inventario`;
CREATE TABLE `df_inventario` (
  `df_id_inventario` int(11) NOT NULL,
  `df_cant_bodega` int(11) NOT NULL,
  `df_cant_transito` int(11) NOT NULL,
  `df_producto` int(11) NOT NULL,
  `df_ppp_ind` float NOT NULL,
  `df_pvt_ind` float NOT NULL,
  `df_ppp_total` float NOT NULL,
  `df_pvt_total` float NOT NULL,
  `df_minimo_sug` int(11) NOT NULL,
  `df_und_caja` int(11) NOT NULL,
  `df_bodega` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_inventario`
--

INSERT INTO `df_inventario` (`df_id_inventario`, `df_cant_bodega`, `df_cant_transito`, `df_producto`, `df_ppp_ind`, `df_pvt_ind`, `df_ppp_total`, `df_pvt_total`, `df_minimo_sug`, `df_und_caja`, `df_bodega`) VALUES
(1, 160, 0, 1, 2, 0.6, 320, 96, 0, 1, 1),
(2, 9, 0, 2, 0, 0.68, 0, 6.12, 0, 1, 1),
(3, 6, 0, 3, 0, 1.9, 0, 11.4, 0, 1, 1),
(4, 0, 0, 4, 0, 5.68, 0, 0, 0, 1, 1),
(5, 59, 0, 5, 0, 0.6, 0, 35.4, 0, 1, 1),
(6, 188, 0, 6, 0, 0.65, 0, 122.2, 0, 1, 1),
(7, 14, 0, 7, 0, 3.04, 0, 42.56, 0, 1, 1),
(8, 7, 0, 8, 0, 9, 0, 63, 0, 1, 1),
(9, 113, 0, 9, 0, 0.24, 0, 27.12, 0, 1, 1),
(10, 25, 0, 10, 0, 0.73, 0, 18.25, 0, 1, 1),
(11, 42, 0, 11, 0, 1.86, 0, 78.12, 0, 1, 1),
(12, 32, 0, 12, 0, 3.1, 0, 99.2, 0, 1, 1),
(13, 0, 0, 13, 0, 6, 0, 0, 0, 1, 1),
(14, 1778, 0, 14, 0, 2.6, 0, 4622.8, 0, 1, 1),
(15, 210, 0, 15, 0, 5, 0, 1050, 0, 20, 1),
(16, 36560, 0, 16, 0, 6.08, 0, 222285, 0, 20, 1),
(17, 180, 0, 17, 0, 8, 0, 1440, 0, 20, 1),
(18, 8220, 0, 18, 0, 8.2, 0, 67404, 0, 20, 1),
(19, 400, 0, 19, 0, 7.8, 0, 3120, 0, 40, 1),
(20, 20, 0, 20, 0, 2.19, 0, 43.8, 0, 1, 1),
(21, 14, 0, 21, 0, 1.11, 0, 15.54, 0, 1, 1),
(22, 1135, 0, 22, 0, 0.58, 0, 658.3, 0, 1, 1),
(23, 6, 0, 23, 0, 7.04, 0, 42.24, 0, 1, 1),
(24, 2, 0, 24, 0, 0.89, 0, 1.78, 0, 1, 1),
(25, 48, 0, 25, 0, 0.45, 0, 21.6, 0, 1, 1),
(26, 0, 0, 26, 0, 6.84, 0, 0, 0, 1, 1),
(27, 5, 0, 27, 0, 2.24, 0, 11.2, 0, 1, 1),
(28, 3, 0, 28, 0, 2.34, 0, 7.02, 0, 1, 1),
(29, 0, 0, 29, 0, 1.69, 0, 0, 0, 1, 1),
(30, 0, 0, 30, 0, 3.34, 0, 0, 0, 1, 1),
(31, 150, 0, 31, 0, 15.54, 0, 2331, 0, 50, 1),
(32, 0, 0, 32, 0, 25, 0, 0, 0, 1, 1),
(33, 195, 0, 33, 0, 6.75, 0, 1316.25, 0, 20, 1),
(34, 37412, 0, 34, 0, 19, 0, 710828, 0, 100, 1),
(35, 13958, 0, 35, 0, 16, 0, 223328, 0, 50, 1),
(36, 75, 0, 36, 0, 8.33, 0, 624.75, 0, 20, 1),
(37, 235, 0, 37, 0, 2.5, 0, 587.5, 0, 10, 1),
(38, 12, 0, 38, 0, 5.6, 0, 67.2, 0, 1, 1),
(39, 144, 0, 39, 0, 0.89, 0, 128.16, 0, 1, 1),
(40, 7, 0, 40, 0, 1.44, 0, 10.08, 0, 1, 1),
(41, 0, 0, 41, 0, 2.77, 0, 0, 0, 1, 1),
(42, 6, 0, 42, 0, 9.82, 0, 58.92, 0, 1, 1),
(43, 12, 0, 43, 0, 6.7, 0, 80.4, 0, 1, 1),
(44, 9, 0, 44, 0, 6.7, 0, 60.3, 0, 1, 1),
(45, 3, 0, 45, 0, 6.7, 0, 20.1, 0, 1, 1),
(46, 13, 0, 46, 0, 7.45, 0, 96.85, 0, 1, 1),
(47, 20, 0, 47, 0, 7.45, 0, 149, 0, 1, 1),
(48, 6, 0, 48, 0, 7.45, 0, 44.7, 0, 1, 1),
(49, 1, 0, 50, 0, 10.71, 0, 10.71, 0, 1, 1),
(50, 800, 0, 51, 0, 4.8, 0, 3840, 0, 100, 1),
(51, 1030, 0, 52, 0, 4.8, 0, 4944, 0, 50, 1),
(52, 366, 0, 53, 0, 7.89, 0, 2887.74, 0, 100, 1),
(53, 466, 0, 54, 0, 7.9, 0, 3681.4, 0, 100, 1),
(54, 225, 0, 55, 0, 8.9, 0, 2002.5, 0, 100, 1),
(55, 0, 0, 56, 0, 12.5, 0, 0, 0, 50, 1),
(56, 0, 0, 57, 0, 10.7, 0, 0, 0, 50, 1),
(57, 90, 0, 58, 0, 19, 0, 1710, 0, 40, 1),
(58, 0, 0, 59, 0, 0.88, 0, 0, 0, 1, 1),
(59, 0, 0, 60, 0, 4.46, 0, 0, 0, 1, 1),
(60, 0, 0, 61, 0, 4.42, 0, 0, 0, 1, 1),
(61, 12, 0, 62, 0, 3.43, 0, 41.16, 0, 1, 1),
(62, 96, 0, 63, 0, 7.51, 0, 720.96, 0, 12, 1),
(63, 480, 0, 64, 0, 5.6, 0, 2688, 0, 20, 1),
(64, 126, 0, 65, 0, 1.68, 0, 211.68, 0, 1, 1),
(65, 0, 0, 66, 0, 1.8, 0, 0, 0, 1, 1),
(66, 0, 0, 67, 0, 0.88, 0, 0, 0, 1, 1),
(67, 13, 0, 68, 0, 2.4, 0, 31.2, 0, 1, 1),
(68, 454, 0, 69, 0, 0.42, 0, 190.68, 0, 1, 1),
(69, 635, 0, 70, 0, 0.81, 0, 514.35, 0, 1, 1),
(70, 36, 0, 71, 0, 0.89, 0, 32.04, 0, 1, 1),
(71, 0, 0, 72, 0, 8.75, 0, 0, 0, 50, 1),
(72, 23, 0, 73, 0, 2, 0, 46, 0, 1, 1),
(73, 0, 0, 74, 0, 5.81, 0, 0, 0, 1, 1),
(74, 3, 0, 75, 0, 7.75, 0, 23.25, 0, 1, 1),
(75, 55, 0, 76, 0, 3.57, 0, 196.35, 0, 1, 1),
(76, 7, 0, 77, 0, 5.71, 0, 39.97, 0, 1, 1),
(77, 12, 0, 78, 0, 19.65, 0, 235.8, 0, 1, 1),
(78, 0, 0, 79, 0, 3.2, 0, 0, 0, 1, 1),
(79, 440, 0, 80, 0, 1.9, 0, 836, 0, 1, 1),
(80, 16425, 0, 81, 0, 7.8, 0, 128115, 0, 50, 1),
(81, 15, 0, 82, 0, 6.7, 0, 100.5, 0, 1, 1),
(82, 0, 0, 83, 0, 0.94, 0, 0, 0, 1, 1),
(83, 0, 0, 84, 0, 8.5, 0, 0, 0, 1, 1),
(84, 0, 0, 85, 0, 9.2, 0, 0, 0, 1, 1),
(85, 0, 0, 86, 0, 3.13, 0, 0, 0, 1, 1),
(86, 52, 0, 87, 0, 2, 0, 104, 0, 1, 1),
(87, 190, 0, 88, 0, 8, 0, 1520, 0, 20, 1),
(88, 3160, 0, 89, 0, 3.5, 0, 11060, 0, 20, 1),
(89, 425, 0, 90, 0, 0.16, 0, 68, 0, 1, 1),
(90, 125, 0, 91, 0, 9.5, 0, 1187.5, 0, 50, 1),
(91, 0, 0, 92, 0, 5.5, 0, 0, 0, 1, 1),
(92, 0, 0, 93, 0, 1.34, 0, 0, 0, 1, 1),
(93, 39, 0, 94, 0, 3.2, 0, 124.8, 0, 1, 1),
(94, 12, 0, 95, 0, 6.7, 0, 80.4, 0, 1, 1),
(95, 0, 0, 96, 0, 2.5, 0, 0, 0, 1, 1),
(96, 0, 0, 97, 0, 3.5, 0, 0, 0, 1, 1),
(97, 11, 0, 98, 0, 11.16, 0, 122.76, 0, 1, 1),
(98, 1, 0, 99, 0, 11.16, 0, 11.16, 0, 1, 1),
(99, 0, 0, 100, 0, 11.16, 0, 0, 0, 1, 1),
(100, 1, 0, 101, 0, 6.25, 0, 6.25, 0, 1, 1),
(101, 0, 0, 102, 0, 0.72, 0, 0, 0, 1, 1),
(102, 17, 0, 103, 0, 6.5, 0, 110.5, 0, 1, 1),
(103, 165, 0, 106, 0, 0.36, 0, 59.4, 0, 1, 1),
(104, 0, 0, 107, 0, 4.46, 0, 0, 0, 1, 1),
(105, 90, 0, 108, 0, 4.75, 0, 427.5, 0, 20, 1),
(106, 1, 0, 109, 0, 1.12, 0, 1.12, 0, 1, 1),
(107, 4, 0, 110, 0, 2.5, 0, 10, 0, 1, 1),
(108, 0, 0, 111, 0, 4.68, 0, 0, 0, 20, 1),
(109, 27, 0, 112, 0, 2, 0, 54, 0, 1, 1),
(110, 0, 0, 113, 0, 4.61, 0, 0, 0, 1, 1),
(111, 3, 0, 114, 0, 0.72, 0, 2.16, 0, 1, 1),
(112, 7, 0, 115, 0, 2.1, 0, 14.7, 0, 1, 1),
(113, 4, 0, 116, 0, 1.3, 0, 5.2, 0, 1, 1),
(114, 0, 0, 1117, 0, 1.15, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_kardex`
--

DROP TABLE IF EXISTS `df_kardex`;
CREATE TABLE `df_kardex` (
  `df_kardex_id` int(11) NOT NULL,
  `df_kardex_codigo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_fecha_kar` datetime NOT NULL,
  `df_producto_cod_kar` int(11) NOT NULL,
  `df_producto` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_factura_kar` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `df_ingresa_kar` int(11) NOT NULL,
  `df_egresa_kar` int(11) NOT NULL,
  `df_existencia_kar` int(11) NOT NULL,
  `df_creadoBy_kar` int(11) NOT NULL,
  `df_edo_kardex` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_kardex`
--

INSERT INTO `df_kardex` (`df_kardex_id`, `df_kardex_codigo`, `df_fecha_kar`, `df_producto_cod_kar`, `df_producto`, `df_factura_kar`, `df_ingresa_kar`, `df_egresa_kar`, `df_existencia_kar`, `df_creadoBy_kar`, `df_edo_kardex`) VALUES
(1, 'KAR-001', '2018-10-17 10:26:31', 2, 'Agua Oxigenada 120 ml', '97', 0, 5, 9, 1, 1),
(2, 'KAR-001', '2018-10-17 11:46:49', 1, 'Agua Oxigenada 60 ml.', '1', 100, 0, 160, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_libro_diario`
--

DROP TABLE IF EXISTS `df_libro_diario`;
CREATE TABLE `df_libro_diario` (
  `df_id_libro_diario` int(11) NOT NULL,
  `df_fuente_ld` varchar(200) NOT NULL,
  `df_valor_inicial_ld` float NOT NULL,
  `df_fecha_ld` datetime NOT NULL,
  `df_descipcion_ld` varchar(300) NOT NULL COMMENT 'Pago / Cobro',
  `df_ingreso_ld` float NOT NULL,
  `df_egreso_ld` float NOT NULL,
  `df_usuario_id_ld` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_personal`
--

DROP TABLE IF EXISTS `df_personal`;
CREATE TABLE `df_personal` (
  `df_id_personal` int(11) NOT NULL,
  `df_tipo_documento_per` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_nombre_per` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_apellido_per` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_cargo_per` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_fecha_ingreso` date DEFAULT NULL,
  `df_documento_per` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_correo_per` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_codigo_personal` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `df_telefono_per` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_celular_per` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_fecha_nac_per` date DEFAULT NULL,
  `df_direccion_per` text COLLATE utf8_spanish_ci,
  `df_contrato_per` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_nombre_contacto` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_telefono_contacto` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_activo_per` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Datos del personal';

--
-- Volcado de datos para la tabla `df_personal`
--

INSERT INTO `df_personal` (`df_id_personal`, `df_tipo_documento_per`, `df_nombre_per`, `df_apellido_per`, `df_cargo_per`, `df_fecha_ingreso`, `df_documento_per`, `df_correo_per`, `df_codigo_personal`, `df_telefono_per`, `df_celular_per`, `df_fecha_nac_per`, `df_direccion_per`, `df_contrato_per`, `df_nombre_contacto`, `df_telefono_contacto`, `df_activo_per`) VALUES
(1, 'Cedula', 'JONATHAN LEONARDO ', 'PADILLA RODRIGUEZ', 'Vendedor', '2018-05-21', '1759010620', 'null@distrifarma.com', 'PER-001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 'Cedula', 'JESI JESUS', 'SALAZAR CAMPOS', 'Supervisor', '2018-04-01', '1758788283', 'null@distrifarma.com', 'PER-002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 'Cedula', 'MARIA ALEJADRA ', 'SANCHEZ OVALLES', 'Secretaria', '2018-04-01', '1758790917', 'null@distrifarma.com', 'PER-003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 'Pasaporte', 'DANIEL ALEJANDRO', 'PACHECO VASQUEZ', 'Vendedor', '2018-07-01', '507205043', 'null@distrifarma.com', 'PER-004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 'Cedula', 'MAXIMILIANO JOSE', 'FERNANDEZ TOCUYO', 'Repartidor', '2018-07-01', '1758734287', 'null@distrifarma.com', 'PER-005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 'Cedula', 'GERMAN JOSE ', 'VIELMA ALVAREZ', 'Repartidor', '2018-07-01', '1757115835', 'null@distrifarma.com', 'PER-006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 'Cedula', 'GUSTAVO JOSE', 'FLORES HERNANDEZ', 'Vendedor', '2018-07-01', '127356950', 'null@distrifarma.com', 'PER-007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(8, 'Cedula', 'prueba', 'final', 'Administrador', '2018-10-02', '0424', 'diego.sanchez@proconty.com', 'PER-008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, 'Cedula', 'prueba', 'Celis', 'Contador', '2018-10-17', '8383838983', 'camposjosybett@gmail.com', 'PER-019', '02313922', '', '2018-10-01', 'Barrio La Esperanza Sector Mar Azuel Verede 2 casa 48', 'Externo', 'Jose', '04245913922', 1),
(20, 'Cedula', 'prueba', 'Yaguana', 'Administrador', '0000-00-00', '83838389', '', 'PER-020', '', '', '0000-00-00', '', 'Nómina', '', '', 1),
(21, 'null', 'prueba', 'Molina', 'Asistente', '0000-00-00', '', '', 'PER-021', '', '', '0000-00-00', '', 'Externo', '', '', 1),
(22, 'null', 'vvv', 'vvvv', 'Vendedor', '0000-00-00', '', '', 'PER-022', '', '', '0000-00-00', '', 'Externo', '', '', 1),
(23, 'null', 'vvv', 'vvvv', 'Vendedor', '0000-00-00', '', '', 'PER-023', '', '', '0000-00-00', '', 'Externo', '', '', 1),
(24, '', 'Leidy', 'Celis', 'Doctor', '0000-00-00', '', '', 'PER-024', '', '', '0000-00-00', '', 'Externo', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_producto`
--

DROP TABLE IF EXISTS `df_producto`;
CREATE TABLE `df_producto` (
  `df_id_producto` int(11) NOT NULL,
  `df_nombre_producto` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_codigo_prod` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_producto`
--

INSERT INTO `df_producto` (`df_id_producto`, `df_nombre_producto`, `df_codigo_prod`) VALUES
(1, 'Agua Oxigenada 60 ml.', 'PRO-1001'),
(2, 'Agua Oxigenada 120 ml', 'PRO-1002'),
(3, 'Agua Oxigenada Litro', 'PRO-1003'),
(4, 'Agua Oxigenada Galon', 'PRO-1004'),
(5, 'Alcohol 60 ml', 'PRO-1005'),
(6, 'Alcohol 125 ml', 'PRO-1006'),
(7, 'Alcohol Litro', 'PRO-1007'),
(8, 'Alcohol Galon', 'PRO-1008'),
(9, 'Algodon 10 gr', 'PRO-1009'),
(10, 'Algodon 30 gr', 'PRO-1010'),
(11, 'Algodon 120', 'PRO-1011'),
(12, 'Algodón 200 gr', 'PRO-1012'),
(13, 'Algodón 450 gr', 'PRO-1013'),
(14, 'Alka Seltzer', 'PRO-1014'),
(15, 'Analgan', 'PRO-1015'),
(16, 'Apronax 550 Comprimido', 'PRO-1016'),
(17, 'Apronax Capsula Liquida', 'PRO-1017'),
(18, 'Aspirina Efervecente', 'PRO-1018'),
(19, 'Aspirina Tableta', 'PRO-1019'),
(20, 'Banditas Adulto', 'PRO-1020'),
(21, 'Banditas Niños', 'PRO-1021'),
(22, 'Cepillo Colgate', 'PRO-1022'),
(23, 'Cofias', 'PRO-1023'),
(24, 'Cotonetes Caja 150 unidades', 'PRO-1024'),
(25, 'Cotonetes Funda 90 unidades', 'PRO-1025'),
(26, 'Diaren Compuesto', 'PRO-1026'),
(27, 'Diclofenaco 100 mg', 'PRO-1027'),
(28, 'Diclofenaco Gel 1% Genfar', 'PRO-1028'),
(29, 'Diclofenaco Inyectable 75 mg / 3 ml', 'PRO-1029'),
(30, 'Febrax', 'PRO-1030'),
(31, 'Femen Simple X 50', 'PRO-1031'),
(32, 'Femen Forte', 'PRO-1032'),
(33, 'Finalin Fem', 'PRO-1033'),
(34, 'Finalin Forte', 'PRO-1034'),
(35, 'Finalin Gripe', 'PRO-1035'),
(36, 'Finalin Muscular', 'PRO-1036'),
(37, 'Finalin Niños', 'PRO-1037'),
(38, 'Gasa', 'PRO-1038'),
(39, 'Gel Antiseptico con aroma', 'PRO-1039'),
(40, 'Gel Antiseptico Sin Aroma 120 ml', 'PRO-1040'),
(41, 'Gel Anitseptico sin Aroma 500 ml', 'PRO-1041'),
(42, 'Gel Aniseptico Galon Sin Aroma', 'PRO-1042'),
(43, 'Guantes de Latex Talla S', 'PRO-1043'),
(44, 'Guantes de Latex Talla M', 'PRO-1044'),
(45, 'Guantes de Latex Talla L', 'PRO-1045'),
(46, 'Guantes de Nitrilo Talla S', 'PRO-1046'),
(47, 'Guantes de Nitrilo Talla M', 'PRO-1047'),
(48, 'Guantes de Nitrilo Talla L', 'PRO-1048'),
(50, 'Hoja De Afeitar Astra', 'PRO-1050'),
(51, 'Ibuprofeno 400 Genfar', 'PRO-1051'),
(52, 'Ibuprofeno 800 Genfar', 'PRO-1052'),
(53, 'Jeringuillas 1 ml agujas 22', 'PRO-1053'),
(54, 'Jeringuillas 3 ml agujas 23', 'PRO-1054'),
(55, 'Jeringuillas 5 ml aguja 21', 'PRO-1055'),
(56, 'Jeringuillas 10 ml agujas 21', 'PRO-1056'),
(57, 'Jeringuillas 20 ml', 'PRO-1057'),
(58, 'LemonFlu Sobres', 'PRO-1058'),
(59, 'Ligas Plancha', 'PRO-1059'),
(60, 'Ligas Kilo', 'PRO-1060'),
(61, 'Liravlon Litro', 'PRO-1061'),
(62, 'Mascarillas', 'PRO-1062'),
(63, 'Mentol Chino Por 12', 'PRO-1063'),
(64, 'Molar-ex Forte', 'PRO-1064'),
(65, 'Nivea 30 ml', 'PRO-1065'),
(66, 'Pañitos Huggies', 'PRO-1066'),
(67, 'Pañitos Humedos Lov', 'PRO-1067'),
(68, 'Paracetamol 500 Genfar', 'PRO-1068'),
(69, 'Pasta Dental Colgate 22 ml Triple Acción', 'PRO-1069'),
(70, 'Pasta Dental Colgate 60 ml Triple Acción', 'PRO-1070'),
(71, 'Peinillas Vandux Docena', 'PRO-1071'),
(72, 'Preservativos al Granel SURE', 'PRO-1072'),
(73, 'Preservativos FIVE original Caja por 5', 'PRO-1073'),
(74, 'Protector de Camilla 1.80 X 1.05 Sin Elastico', 'PRO-1074'),
(75, 'Protector de Camilla 1.80 X 1.05 Con Elastico', 'PRO-1075'),
(76, 'Quita Esmaltes Pequeños X 12', 'PRO-1076'),
(77, 'Quita Esmalte Litro', 'PRO-1077'),
(78, 'Quita Esmalte Galon', 'PRO-1078'),
(79, 'Repelente Basa', 'PRO-1079'),
(80, 'Sal Andrews X 12', 'PRO-1080'),
(81, 'Sal Andrews X 50', 'PRO-1081'),
(82, 'Sertal Compuesto', 'PRO-1082'),
(83, 'Shampoo Sarys', 'PRO-1083'),
(84, 'Torunda Simple', 'PRO-1084'),
(85, 'Torundas Trensada', 'PRO-1085'),
(86, 'Vaselina Simple 450 gr', 'PRO-1086'),
(87, 'Vaselina Simple X 24', 'PRO-1087'),
(88, 'Buscapina', 'PRO-1088'),
(89, 'Buprex Flash Cap Liq 400mg', 'PRO-1089'),
(90, 'Algodon 5gm', 'PRO-1090'),
(91, 'Umbral 500', 'PRO-1091'),
(92, 'Algodon motas multiuso 500 UNID', 'PRO-1092'),
(93, 'Quita Esmalte en Torunda', 'PRO-1093'),
(94, 'Femen simple x10', 'PRO-1094'),
(95, 'Guantes de Latex Talla XS', 'PRO-1095'),
(96, 'Discos Desmaquillantes 100UD', 'PRO-1096'),
(97, 'Malla de Cabello x 20', 'PRO-1097'),
(98, 'Nitrilo Negro Talla S', 'PRO-1098'),
(99, 'Nitrilo Negro Talla M', 'PRO-1099'),
(100, 'Nitrilo Negro Talla L', 'PRO-1100'),
(101, 'Hojillas Dorcos', 'PRO-1101'),
(102, 'Cotonete para muestra', 'PRO-1102'),
(103, 'Algodon 500gr', 'PRO-1103'),
(106, 'NAIPES', 'PRO-1106'),
(107, 'Malla Para Cabello', 'PRO-1107'),
(108, 'Buscapina Niño', 'PRO-1108'),
(109, 'Lima carton', 'PRO-1109'),
(110, 'ALCOHOL 500 SPR', 'PRO-1110'),
(111, 'Genfar Grip', 'PRO-1111'),
(112, 'Vaselina simple x12', 'PRO-1112'),
(113, 'Agua oxg galon lira', 'PRO-1113'),
(114, 'Invisibles', 'PRO-1114'),
(115, 'Gel Anticeptico 250ml', 'PRO-1115'),
(116, 'GEL REX 400gr TRANSPARENTE', 'PRO-1116'),
(1117, 'Invisible Mediano', 'PRO-1117'),
(1118, 'Prueba', 'PRO-1118'),
(1119, 'CATAFLAN DE PRUEBA', 'PRO-1119'),
(1120, 'CATAFLAN DE PRUEBA', 'PRO-1120');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_producto_devuelto_recepcion`
--

DROP TABLE IF EXISTS `df_producto_devuelto_recepcion`;
CREATE TABLE `df_producto_devuelto_recepcion` (
  `df_id_prod_dev_rec` int(11) NOT NULL,
  `df_guia_rec` int(11) NOT NULL,
  `df_cant_und_rec` int(11) NOT NULL,
  `df_producto_id_rec` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_producto_precio`
--

DROP TABLE IF EXISTS `df_producto_precio`;
CREATE TABLE `df_producto_precio` (
  `df_id_precio` int(11) NOT NULL,
  `df_producto_id` int(11) NOT NULL,
  `df_ppp` float NOT NULL,
  `df_pvt1` float NOT NULL,
  `df_pvt2` float NOT NULL,
  `df_pvp` float NOT NULL,
  `df_iva` int(11) NOT NULL,
  `df_min_sugerido` int(11) NOT NULL,
  `df_und_caja` int(11) NOT NULL,
  `df_utilidad` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_producto_precio`
--

INSERT INTO `df_producto_precio` (`df_id_precio`, `df_producto_id`, `df_ppp`, `df_pvt1`, `df_pvt2`, `df_pvp`, `df_iva`, `df_min_sugerido`, `df_und_caja`, `df_utilidad`) VALUES
(1, 1, 0, 0.6, 0.6, 0.6, 2, 0, 1, 0),
(2, 2, 0, 0.68, 0.68, 0.68, 2, 0, 1, 0),
(3, 3, 0, 1.9, 1.9, 1.9, 2, 0, 1, 0),
(4, 4, 0, 5.68, 5.68, 5.68, 2, 0, 1, 0),
(5, 5, 0, 0.6, 0.6, 0.6, 2, 0, 1, 0),
(6, 6, 0, 0.65, 0.65, 0.65, 2, 0, 1, 0),
(7, 7, 0, 3.04, 3.04, 3.04, 2, 0, 1, 0),
(8, 8, 0, 9, 9, 9, 2, 0, 1, 0),
(9, 9, 0, 0.24, 0.24, 0.24, 1, 0, 1, 0),
(10, 10, 0, 0.73, 0.73, 0.73, 1, 0, 1, 0),
(11, 11, 0, 1.86, 1.86, 1.86, 1, 0, 1, 0),
(12, 12, 0, 3.1, 3.1, 3.1, 1, 0, 1, 0),
(13, 13, 0, 6, 6, 6, 1, 0, 1, 0),
(14, 14, 0, 2.6, 2.6, 2.6, 2, 0, 1, 0),
(15, 15, 0, 5, 5, 5, 2, 0, 20, 0),
(16, 16, 0, 6.08, 6.08, 6.08, 2, 0, 20, 0),
(17, 17, 0, 8, 8, 8, 2, 0, 20, 0),
(18, 18, 0, 8.2, 8.2, 8.2, 2, 0, 20, 0),
(19, 19, 0, 7.8, 7.8, 7.8, 2, 0, 40, 0),
(20, 20, 0, 2.19, 2.19, 2.19, 1, 0, 1, 0),
(21, 21, 0, 1.11, 1.11, 1.11, 1, 0, 1, 0),
(22, 22, 0, 0.58, 0.58, 0.58, 1, 0, 1, 0),
(23, 23, 0, 7.04, 7.04, 7.04, 1, 0, 1, 0),
(24, 24, 0, 0.89, 0.89, 0.89, 1, 0, 1, 0),
(25, 25, 0, 0.45, 0.45, 0.45, 1, 0, 1, 0),
(26, 26, 0, 6.84, 6.84, 6.84, 2, 0, 1, 0),
(27, 27, 0, 2.24, 2.24, 2.24, 2, 0, 1, 0),
(28, 28, 0, 2.34, 2.34, 2.34, 2, 0, 1, 0),
(29, 29, 0, 1.69, 1.69, 1.69, 2, 0, 1, 0),
(30, 30, 0, 3.34, 3.34, 3.34, 2, 0, 1, 0),
(31, 31, 0, 15.54, 15.54, 15.54, 2, 0, 50, 0),
(32, 32, 0, 25, 25, 25, 2, 0, 1, 0),
(33, 33, 0, 6.75, 6.75, 6.75, 2, 0, 20, 0),
(34, 34, 0, 19, 19, 19, 2, 0, 100, 0),
(35, 35, 0, 16, 16, 16, 2, 0, 50, 0),
(36, 36, 0, 8.33, 8.33, 8.33, 2, 0, 20, 0),
(37, 37, 0, 2.5, 2.5, 2.5, 2, 0, 10, 0),
(38, 38, 0, 5.6, 5.6, 5.6, 1, 0, 1, 0),
(39, 39, 0, 0.89, 0.89, 0.89, 1, 0, 1, 0),
(40, 40, 0, 1.44, 1.44, 1.44, 2, 0, 1, 0),
(41, 41, 0, 2.77, 2.77, 2.77, 2, 0, 1, 0),
(42, 42, 0, 9.82, 9.82, 9.82, 2, 0, 1, 0),
(43, 43, 0, 6.7, 6.7, 6.7, 1, 0, 1, 0),
(44, 44, 0, 6.7, 6.7, 6.7, 1, 0, 1, 0),
(45, 45, 0, 6.7, 6.7, 6.7, 1, 0, 1, 0),
(46, 46, 0, 7.45, 7.45, 7.45, 1, 0, 1, 0),
(47, 47, 0, 7.45, 7.45, 7.45, 1, 0, 1, 0),
(48, 48, 0, 7.45, 7.45, 7.45, 1, 0, 1, 0),
(50, 50, 0, 10.71, 10.71, 10.71, 1, 0, 1, 0),
(51, 51, 0, 4.8, 4.8, 4.8, 2, 0, 100, 0),
(52, 52, 0, 4, 4, 4, 2, 0, 50, 0),
(53, 53, 0, 7.89, 7.89, 7.89, 1, 0, 100, 0),
(54, 54, 0, 7.9, 7.9, 7.9, 1, 0, 100, 0),
(55, 55, 0, 8.9, 8.9, 8.9, 1, 0, 100, 0),
(56, 56, 0, 12.5, 12.5, 12.5, 1, 0, 50, 0),
(57, 57, 0, 10.7, 10.7, 10.7, 1, 0, 50, 0),
(58, 58, 0, 19, 19, 19, 2, 0, 40, 0),
(59, 59, 0, 0.88, 0.88, 0.88, 1, 0, 1, 0),
(60, 60, 0, 4.46, 4.46, 4.46, 1, 0, 1, 0),
(61, 61, 0, 4.42, 4.42, 4.42, 2, 0, 1, 0),
(62, 62, 0, 3.43, 3.43, 3.43, 1, 0, 1, 0),
(63, 63, 0, 7.51, 7.51, 7.51, 2, 0, 12, 0),
(64, 64, 0, 5.6, 5.6, 5.6, 2, 0, 20, 0),
(65, 65, 0, 1.68, 1.68, 1.68, 1, 0, 1, 0),
(66, 66, 0, 1.8, 1.8, 1.8, 1, 0, 1, 0),
(67, 67, 0, 0.88, 0.88, 0.88, 1, 0, 1, 0),
(68, 68, 0, 2.4, 2.4, 2.4, 2, 0, 1, 0),
(69, 69, 0, 0.42, 0.42, 0.42, 1, 0, 1, 0),
(70, 70, 0, 0.81, 0.81, 0.81, 1, 0, 1, 0),
(71, 71, 0, 0.89, 0.89, 0.89, 1, 0, 1, 0),
(72, 72, 0, 8.75, 8.75, 8.75, 1, 0, 50, 0),
(73, 73, 0, 2, 2, 2, 1, 0, 1, 0),
(74, 74, 0, 5.81, 5.81, 5.81, 1, 0, 1, 0),
(75, 75, 0, 7.75, 7.75, 7.75, 1, 0, 1, 0),
(76, 76, 0, 3.57, 3.57, 3.57, 1, 0, 1, 0),
(77, 77, 0, 5.71, 5.71, 5.71, 1, 0, 1, 0),
(78, 78, 0, 19.65, 19.65, 19.65, 1, 0, 1, 0),
(79, 79, 0, 3.2, 3.2, 3.2, 1, 0, 1, 0),
(80, 80, 0, 1.9, 1.9, 1.9, 2, 0, 1, 0),
(81, 81, 0, 7.8, 7.8, 7.8, 2, 0, 50, 0),
(82, 82, 0, 6.7, 6.7, 6.7, 2, 0, 1, 0),
(83, 83, 0, 0.94, 0.94, 0.94, 1, 0, 1, 0),
(84, 84, 0, 8.5, 8.5, 8.5, 2, 0, 1, 0),
(85, 85, 0, 9.2, 9.2, 9.2, 2, 0, 1, 0),
(86, 86, 0, 3.13, 3.13, 3.13, 1, 0, 1, 0),
(87, 87, 0, 2, 2, 2, 1, 0, 1, 0),
(88, 88, 0, 8, 8, 8, 2, 0, 20, 0),
(89, 89, 0, 3.5, 3.5, 3.5, 2, 0, 20, 0),
(90, 90, 0, 0.16, 0.16, 0.16, 1, 0, 1, 0),
(91, 91, 0, 9.5, 9.5, 9.5, 2, 0, 50, 0),
(92, 92, 0, 5.5, 5.5, 5.5, 1, 0, 1, 0),
(93, 93, 0, 1.34, 1.34, 1.34, 1, 0, 1, 0),
(94, 94, 0, 3.2, 3.2, 3.2, 2, 0, 1, 0),
(95, 95, 0, 6.7, 6.7, 6.7, 1, 0, 1, 0),
(96, 96, 0, 2.5, 2.5, 2.5, 1, 0, 1, 0),
(97, 97, 0, 3.5, 3.5, 3.5, 1, 0, 1, 0),
(98, 98, 0, 11.16, 11.16, 11.16, 1, 0, 1, 0),
(99, 99, 0, 11.16, 11.16, 11.16, 1, 0, 1, 0),
(100, 100, 0, 11.16, 11.16, 11.16, 1, 0, 1, 0),
(101, 101, 0, 6.25, 6.25, 6.25, 1, 0, 1, 0),
(102, 102, 0, 0.72, 0.72, 0.72, 1, 0, 1, 0),
(103, 103, 0, 6.5, 6.5, 6.5, 1, 0, 1, 0),
(106, 106, 0, 0.36, 0.36, 0.36, 1, 0, 1, 0),
(107, 107, 0, 4.46, 4.46, 4.46, 1, 0, 1, 0),
(108, 108, 0, 4.75, 4.75, 4.75, 2, 0, 20, 0),
(109, 109, 0, 1.12, 1.12, 1.12, 1, 0, 1, 0),
(110, 110, 0, 2.5, 2.5, 2.5, 2, 0, 1, 0),
(111, 111, 0, 4.68, 4.68, 4.68, 2, 0, 20, 0),
(112, 112, 0, 2, 2, 2, 1, 0, 1, 0),
(113, 113, 0, 4.61, 4.61, 4.61, 2, 0, 1, 0),
(114, 114, 0, 0.72, 0.72, 0.72, 1, 0, 1, 0),
(115, 115, 0, 2.1, 2.1, 2.1, 2, 0, 1, 0),
(116, 116, 0, 1.3, 1.3, 1.3, 1, 0, 1, 0),
(117, 1117, 0, 1.15, 1.15, 1.15, 1, 0, 1, 0),
(118, 1118, 0, 2.22, 2.22, 2.22, 2, 0, 22, 0),
(120, 1120, 0, 1.2, 0.2, 1.4, 1, 0, 15, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_producto_proveedor`
--

DROP TABLE IF EXISTS `df_producto_proveedor`;
CREATE TABLE `df_producto_proveedor` (
  `df_id_producto_pp` int(11) NOT NULL,
  `df_producto_cod_pp` int(11) NOT NULL,
  `df_proveedor_cod_pp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_proveedor`
--

DROP TABLE IF EXISTS `df_proveedor`;
CREATE TABLE `df_proveedor` (
  `df_id_proveedor` int(11) NOT NULL,
  `df_codigo_proveedor` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `df_nombre_empresa` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `df_tlf_empresa` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_direccion_empresa` text COLLATE utf8_spanish_ci NOT NULL,
  `df_nombre_contacto` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_tlf_contacto` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_documento_prov` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_proveedor`
--

INSERT INTO `df_proveedor` (`df_id_proveedor`, `df_codigo_proveedor`, `df_nombre_empresa`, `df_tlf_empresa`, `df_direccion_empresa`, `df_nombre_contacto`, `df_tlf_contacto`, `df_documento_prov`) VALUES
(1, 'PROV-001', 'FARMAENLACE', '022993100', 'CAP. RAFAEL RAMOS E2-210 Y CASTELLI', 'PAOLA QUISHPE', '0996277762', '1791984722001'),
(2, 'PROV-002', 'SURGICALMED', '', 'DE LOS EUCALIPTOS Y DE LOS CIPRESES', 'GONZALO ', '0989387000', '1792143543001'),
(3, 'PROV-003', 'NUEVO MUNDO', '022546001', 'VERSALLES 1242 Y DARQUEA', '', '', '1711586683001'),
(4, 'PROV-004', 'CANDLECROSS', '025550072', 'LA MAGDALENA', 'NELSON MORILLO', '0998209718', '1791768612001'),
(5, 'PROV-005', 'GARCOS S.A.', '0999400890', 'LUIS CORDERO E1-55 Y AV 10 DE AGOSTO   ', 'DIEGO ', '0999400890', '1790708799001'),
(6, 'PROV-006', 'CARLOS ALVAREZ (ALGODÓN PREMIUN)', '09982792833', 'PANAMERICANA SUR', '', '', '1792116074001'),
(7, 'PROV-007', 'ENNOTEX S.A (ALGODÓN SANA)', '0995759690', 'AVELLANAS E6-39 Y ELOY ALFARO        ', '', '', '1791082206001'),
(8, 'PROV-008', 'VERONICA FERNANDEZ (VASELINAS)', '023016424', 'GUAMANI STA ANITA LOTE 195', 'OSCAR', '996148200', '1721677092001'),
(9, 'PROV-009', 'DIFARE', '', 'URBANIZACION CIUDAD COLON', '', '', '0990858322001'),
(10, 'PROV-010', 'INSUDENT PLUS', '', 'AV CIRCUMBALACION TRAMO 2 CASA 10', 'MARCOS UZCATEGUI', '0995728556', '1715648489001'),
(11, 'PROV-011', 'MAX PROTECT ECUADOR', '022417287', 'RAFAEL RAMOS E6-65 Y GONZALO ZALDUMBIDE', 'EDUARDO BARRERA', '0995851276', '1792779936001'),
(12, 'PROV-012', 'LABORATORIO PRIMS', '022030339', 'GERANIOS Y CARLOS MANTILLA CALDERON ', 'RENAN ARROBO', '0995691000', '1707764906001'),
(13, 'PROV-013', 'ESTUARDO SANCHEZ', '022322090', '6 DE DICIEMBRE Y GASPAR DE VILLAROEL', '', '', '0992124857001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_provincia`
--

DROP TABLE IF EXISTS `df_provincia`;
CREATE TABLE `df_provincia` (
  `df_id_provincia` int(11) NOT NULL,
  `df_nombre_provincia` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_sector`
--

DROP TABLE IF EXISTS `df_sector`;
CREATE TABLE `df_sector` (
  `df_codigo_sector` int(11) NOT NULL,
  `df_nombre_sector` varchar(120) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Sectores';

--
-- Volcado de datos para la tabla `df_sector`
--

INSERT INTO `df_sector` (`df_codigo_sector`, `df_nombre_sector`) VALUES
(1, 'LA GRANJA'),
(2, 'GRANDA Y CENTENO'),
(3, 'CONCEPCION'),
(4, 'LA FLORIDA'),
(5, 'COTOCOLLAO'),
(6, 'JAIME ROLDOS / MITAD DEL MUNDO '),
(7, 'PONCIANO'),
(8, 'REAL AUDIENCIA'),
(9, 'KENNEDY/LUZ'),
(10, 'COMITÉ DEL PUEBLO'),
(11, 'LA BOTA'),
(12, 'AMAGASI DEL INCA'),
(13, 'MONTESERRIN'),
(14, 'INCA'),
(15, 'EL BATAN'),
(16, 'IÑAQUITO'),
(17, 'MARISCAL FOCH'),
(18, 'GONZALES SUAREZ '),
(19, 'CARAPUNGO'),
(20, 'CALDERON'),
(21, 'SAN JOSE DEL MORAN'),
(22, 'TUMBACO'),
(23, 'CUMBAYA'),
(24, 'PUEMBO'),
(33, 'LA BRETAÑA'),
(25, 'PIFO / YARUQUI'),
(26, 'QUINCHE'),
(27, 'CHIMBACALLE'),
(28, 'LINEA FERROVIARIA'),
(29, 'EL CAPULI '),
(30, 'LUCHA DE LOS POBRES'),
(31, 'PUENTE DE GUAJALO'),
(32, 'LA MENA '),
(34, 'GUAMANI'),
(35, 'CIUDADELA DEL EJERCITO'),
(36, 'QUITUMBE'),
(37, 'CHILLOGALLO'),
(38, 'TURUBAMBA'),
(39, 'SOLANDA'),
(40, 'QUITO SUR'),
(41, 'BILOXI'),
(42, 'EL PINTADO'),
(43, 'MARCO POMBA'),
(44, 'VILLA FLORA'),
(45, 'DOS PUNETES'),
(46, 'PUENGASI'),
(47, 'CONOCOTO'),
(48, 'SAN RAFAEL'),
(49, 'SANGOLQUI'),
(50, 'BENATERIO'),
(51, 'GUAYLLABAMBA'),
(52, 'CAYAMBE'),
(53, 'PUERTO QUITO'),
(54, 'MACHACHI'),
(55, 'CARCELEN ALTO / BAJO/ TERMINAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_usuario`
--

DROP TABLE IF EXISTS `df_usuario`;
CREATE TABLE `df_usuario` (
  `df_id_usuario` int(11) NOT NULL,
  `df_tipo_documento_usuario` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_documento_usuario` bigint(20) DEFAULT NULL,
  `df_nombre_usuario` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_apellido_usuario` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_usuario_usuario` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `df_personal_cod` int(11) DEFAULT NULL,
  `df_clave_usuario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `df_activo` int(1) NOT NULL,
  `df_correo` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `df_tipo_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `df_usuario`
--

INSERT INTO `df_usuario` (`df_id_usuario`, `df_tipo_documento_usuario`, `df_documento_usuario`, `df_nombre_usuario`, `df_apellido_usuario`, `df_usuario_usuario`, `df_personal_cod`, `df_clave_usuario`, `df_activo`, `df_correo`, `df_tipo_usuario`) VALUES
(1, 'Cedula', 123, 'Aministrador', 'Administrador', 'admin', NULL, 'admin', 1, 'admin@proconty.com', 'Administrador'),
(32, 'Cedula', 1103504039, 'GRACIELA ', 'CUADRADO', 'CHELA', NULL, '1902', 1, '', 'Supervisor'),
(38, 'Cedula', 1759010620, 'JONATHAN LEONARDO ', 'PADILLA RODRIGUEZ', 'Jleonardo', 1, 'Dfarma', 1, 'Jleonardo@prueba.com', 'Ventas'),
(37, 'Pasaporte', 507205043, 'DANIEL ALEJANDRO', 'PACHECO VASQUEZ', 'Dalejandro', 4, '1234qwer', 1, 'dalejandro@prueba.com', 'Ventas'),
(36, 'Cedula', 127356950, 'GUSTAVO JOSE', 'FLORES HERNANDEZ', 'Gjose', 7, 'qwer12345', 1, 'gjose@prueba.com', 'Ventas'),
(39, 'Cedula', 1758790917, 'MARIA ALEJADRA ', 'SANCHEZ OVALLES', 'Malejandra', 3, 'DFA1234', 1, 'Malejandra@prueba.com', 'Supervisor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `df_zona`
--

DROP TABLE IF EXISTS `df_zona`;
CREATE TABLE `df_zona` (
  `df_codigo_zona` int(11) NOT NULL,
  `df_nombre_zona` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `df_zona`
--

INSERT INTO `df_zona` (`df_codigo_zona`, `df_nombre_zona`) VALUES
(2, 'GRANDA Y CENTENO'),
(1, 'LA GRANJA'),
(3, 'CONCEPCION'),
(4, 'LA FLORIDA'),
(5, 'COTOCOLLAO'),
(6, 'JAIME ROLDOS / MITAD DEL MUNDO '),
(7, 'PONCIANO'),
(8, 'REAL AUDIENCIA'),
(9, 'KENNEDY/LUZ'),
(10, 'COMITÉ DEL PUEBLO'),
(11, 'LA BOTA'),
(12, 'AMAGASI DEL INCA'),
(13, 'MONTESERRIN'),
(14, 'INCA'),
(15, 'EL BATAN'),
(16, 'IÑAQUITO'),
(17, 'MARISCAL FOCH'),
(18, 'GONZALES SUAREZ '),
(19, 'CARAPUNGO'),
(20, 'CALDERON'),
(21, 'SAN JOSE DEL MORAN'),
(22, 'TUMBACO'),
(23, 'CUMBAYA'),
(24, 'PUEMBO'),
(33, 'LA BRETAÑA'),
(25, 'PIFO / YARUQUI'),
(26, 'QUINCHE'),
(27, 'CHIMBACALLE'),
(28, 'LINEA FERROVIARIA'),
(29, 'EL CAPULI '),
(30, 'LUCHA DE LOS POBRES'),
(31, 'PUENTE DE GUAJALO'),
(32, 'LA MENA '),
(34, 'GUAMANI'),
(35, 'CIUDADELA DEL EJERCITO'),
(36, 'QUITUMBE'),
(37, 'CHILLOGALLO'),
(38, 'TURUBAMBA'),
(39, 'SOLANDA'),
(40, 'QUITO SUR'),
(41, 'BILOXI'),
(42, 'EL PINTADO'),
(43, 'MARCO POMBA'),
(44, 'VILLA FLORA'),
(45, 'DOS PUNETES'),
(46, 'PUENGASI'),
(47, 'CONOCOTO'),
(48, 'SAN RAFAEL'),
(49, 'SANGOLQUI'),
(50, 'BENATERIO'),
(51, 'GUAYLLABAMBA'),
(52, 'CAYAMBE'),
(53, 'PUERTO QUITO'),
(54, 'MACHACHI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dp_perfil_banco`
--

DROP TABLE IF EXISTS `dp_perfil_banco`;
CREATE TABLE `dp_perfil_banco` (
  `dp_id_perfil_ban` int(11) NOT NULL,
  `dp_descripcion_per_ban` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `dp_id_banco_per_ban` int(11) NOT NULL,
  `dp_cuenta_per_ban` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `dp_fecha_creacion_per_ban` datetime NOT NULL,
  `dp_creadoby_per_ban` int(11) NOT NULL,
  `dp_fecha_modifica_per_ban` datetime DEFAULT NULL,
  `dp_modificadoby_per_ban` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena las diferentes cuentas que administra la empresa';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edo_compra`
--

DROP TABLE IF EXISTS `edo_compra`;
CREATE TABLE `edo_compra` (
  `id_edo_compra` int(11) NOT NULL,
  `nombre_edo_com` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Estados para compra, venta y retenciones';

--
-- Volcado de datos para la tabla `edo_compra`
--

INSERT INTO `edo_compra` (`id_edo_compra`, `nombre_edo_com`) VALUES
(1, 'Pendiente Entrega'),
(2, 'Recibido'),
(3, 'Por Pagar'),
(4, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `franquicias`
--

DROP TABLE IF EXISTS `franquicias`;
CREATE TABLE `franquicias` (
  `id_franquicia` int(11) NOT NULL,
  `nombre_franq` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Franquicias de las tarjetas';

--
-- Volcado de datos para la tabla `franquicias`
--

INSERT INTO `franquicias` (`id_franquicia`, `nombre_franq`) VALUES
(1, 'Visa'),
(2, 'MasterCard'),
(3, 'Dinners Club'),
(4, 'American Express'),
(5, 'Discover');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_edo_compra`
--

DROP TABLE IF EXISTS `historia_edo_compra`;
CREATE TABLE `historia_edo_compra` (
  `id_hist_edo_com` int(11) NOT NULL,
  `compra_id_hist` int(11) DEFAULT NULL,
  `venta_id_hist` int(11) DEFAULT NULL,
  `retencion_id_hist` int(11) DEFAULT NULL,
  `id_edo_entrega_hist` int(11) DEFAULT NULL COMMENT '1 Pendiente 2 Recibido',
  `id_edo_pago_hist` int(11) DEFAULT NULL COMMENT '3 Por Pagar - 4 Pagado',
  `fecha_hist` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
CREATE TABLE `metodos_pago` (
  `id_metodo_pago` int(11) NOT NULL,
  `nombre_met_pago` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `metodos_pago`
--

INSERT INTO `metodos_pago` (`id_metodo_pago`, `nombre_met_pago`) VALUES
(1, 'CHEQUE'),
(2, 'TRANSFERENCIA'),
(3, 'EFECTIVO'),
(4, 'CREDITO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retencion_compra_venta`
--

DROP TABLE IF EXISTS `retencion_compra_venta`;
CREATE TABLE `retencion_compra_venta` (
  `id_ret_com_ven` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL COMMENT '0 si no es compra, de lo contrario el id',
  `venta_id` int(11) NOT NULL COMMENT '0 si no es venta, de lo contrario el id',
  `serie_retencion` varchar(100) NOT NULL,
  `num_retencion` varchar(100) NOT NULL,
  `autorizacion_ret` varchar(100) NOT NULL,
  `fecha_ingreso_ret` date NOT NULL,
  `fecha_caduca_ret` date NOT NULL,
  `retencion_iva_id` int(11) DEFAULT NULL,
  `porcentaje_iva` float DEFAULT NULL,
  `base_imponible` float DEFAULT NULL,
  `retencion_ir_id` int(11) DEFAULT NULL,
  `porcentaje_ir` int(11) DEFAULT NULL,
  `base_imponible_c_iva` float DEFAULT NULL,
  `base_imponible_s_iva` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retencion_ir`
--

DROP TABLE IF EXISTS `retencion_ir`;
CREATE TABLE `retencion_ir` (
  `id_retencion_ir` int(11) NOT NULL,
  `codigo_ret_ir` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre_ret_ir` text COLLATE utf8_spanish2_ci NOT NULL,
  `porcentaje_ret_ir` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `retencion_ir`
--

INSERT INTO `retencion_ir` (`id_retencion_ir`, `codigo_ret_ir`, `nombre_ret_ir`, `porcentaje_ret_ir`) VALUES
(1, '303', 'Honorarios profesionales y demás pagos por servicios relacionados con el título profesional', 10),
(2, '304', 'Servicios predomina el intelecto no relacionados con el título profesional', 8),
(3, '304A', 'Comisiones y demás pagos por servicios predomina intelecto no relacionados con el título ', 8),
(4, '304B', 'Pagos a notarios y registradores de la propiedad y mercantil por sus actividades ejercidad como tales', 8),
(5, '304C', 'Pagos a deportistas, entrenadores, árbitros, miembros del cuerpo técnico por sus actividades ejercidas como tales', 8),
(6, '304D', 'Pagos a artistas por sus actividades como tales', 8),
(7, '304E', 'Honorarios y demás pagos por servicios de docencia', 8),
(25, '323B1', 'Por RF: depósitos Cta, Ahorross Sociedades', 2),
(26, '323E', 'Por RF: depósito a plazo fijo gravados', 2),
(9, '307', 'Servicios predomina la mano de obra', 2),
(10, '308', 'Utilización o aprovechamiento de la imagen o renombre', 10),
(11, '309', 'Servicios prestados por medios de comunicación y agencias de publicidad', 1),
(12, '310', 'Servicio de transporte privado de pasajeros o transporte público o privado de carga', 1),
(13, '311', 'Por pagos a través de liquidación de copra (nivel cultural o rusticidad)', 2),
(14, '312', 'Transferencia de bienes mueblres de naturaleza corporal', 1),
(15, '312A', 'Compra de bienes de origen agrícola. avícola, pecuario, apícola, cunícola, bioacuática y forestal', 1),
(16, '314A', 'Regalías por conncepto de franquiciasde acuerdo a Ley de Propiedad Intelectual - pago a personas naturales', 8),
(17, '314B', 'Cánones, derechos de autor, marcas, patentes y similares de acuerdo a Ley de Propiedad intelectual - pago a personas naturales', 8),
(18, '314C', 'Regalías por concepto de franquicias de acuerdo a la Ley de Propiedad Intelectual - pago a sociedades', 8),
(19, '314D', 'Cánones, derechos de autor, marcas, patentes y similares de acuerdo a Ley de Propiedad Intelectual - pago a sociedades', 8),
(20, '319', 'Cuotas de arrenddamiento mercantil, inclusive la de opción de compra', 1),
(21, '320', 'Por arrendamiento bienes inmuebles', 8),
(22, '322', 'Seguros y reaseguros (primas y cesiones)', 1),
(23, '323', 'Por rendimientos financieros pagados a naturales y sociedades (No a IFIs)', 2),
(24, '323A', 'Por RF: depóspitos Cta. Corriente', 2),
(27, '323E2', 'Por RF: depósitos a plazo fijo exentos', 0),
(28, '323F', 'Por rendimientos financieros: opreacioes de reporto - repos', 2),
(29, '323G', 'Por RF: inversiones (captaciones) rendimientos distintos de aquellos pgados a IFIs', 2),
(30, '323H', 'Por RF: obligaciones', 2),
(31, '323I', 'Por RF: bonos convertible en acciones', 2),
(32, '323M', 'Por RF: Inversiones en títulos valore en renta fija gravados', 2),
(33, '323N', 'Por RF: Inversiones en títulos valores en renta fija exentos', 0),
(34, '323O', 'Por RF: Intereses pagados a bancosy otras entidades sommetidas al control de la Superintendencia de Bancos y de la Economía Popular y solidaria', 0),
(35, '323P', 'Por RF: Intereses pagados por entidades del sector público a favor de sujetos pasivos', 2),
(36, '323Q', 'Por RF: Otros intereses y rendimientos financiero gravados', 2),
(37, '323R', 'Por RF: Otros intereses y rendimientos financiero exentos', 0),
(38, '324A', 'Por RF: Intereses en operaciones de crédito entre instituciones del sistema financiero y entidades economía popular y solidaria', 1),
(39, '324B', 'Por RF: por inversiones entre instituciones del sistema financiero y entidades economía popular y solidaria', 1),
(40, '325', 'Anticipo dividendos', 22),
(41, '325A', 'Dividendos anticipados préstamos accionistas, beneficiarios o partícipes', 22),
(42, '326', 'Dividendos distribuidos que correspondan al impuesto a la renta único establecido en el art. 27 de la LRTI', 100),
(43, '327', 'Dividendos distribuidos a personas naturales residentes', 13),
(44, '328', 'Dividendos distribuidos a sociedades residentes', 0),
(45, '329', 'Dividendos distribuidos a fidecomisos residentes', 0),
(46, '330', 'Dividendos gravados distribuidos en acciones (reinversión de utilidades sin derecho a reducción tarifa IR)', 25),
(47, '331', 'Dividendos exentos distribuidos en acciones (reinversión de utilidades con derecho a reducción tarifa IR)', 0),
(48, '332', 'Otras compras de bienes y servicios no sujetas a retención', 0),
(49, '332A', 'Enajenación de derechos representativos de capital y otros derechos exentos (mayo 2016)', 0),
(50, '332B', 'Compra de bienes inmuebles', 0),
(51, '332C', 'Transporte público de pasajeros', 0),
(52, '332D', 'Pagos en el país por transporte de pasajeros o transporte internaciona de carga, a compañías naconales o extranjeras de aviación o marítimas', 0),
(53, '332E', 'Valores entregados por las cooperativas de transporte a sus socios', 0),
(54, '332F', 'Compraventa de divisas distintas al dólar de los Estados Unidos de América', 0),
(55, '332G', 'Pagos con tarjeta de crédito', 0),
(56, '332H', 'Pago al exterior tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo RECAP', 0),
(57, '333', 'Enajenación de derechos representativos de capital y otros derechos cotizados en bolsa ecuatoriana', 0.2),
(58, '334', 'Enajenación de derechos representativos de capital y otros derechos o cotizados en bolsa ecuatoriana', 1),
(59, '335', 'Por loterías, rifas, apuestas y similares', 15),
(60, '336', 'Por venta de combustibles a comercializadoras', 0.002),
(61, '337', 'Por venta de combustibles a distribuidores', 0.003),
(62, '338', 'Compra local de banano a productor', 2),
(63, '339', 'Liquidación impuesto único a la venta local de banano de producción propia', 100),
(64, '340', 'Impuesto único a la exportación de banano de producción propia - componente 1', 1),
(65, '341', 'Impuesto único a la exportación de banano de producción propia - componente 2', 2),
(66, '342', 'Impuesto único a la exportación de banano producido ppor terceros', 2),
(67, '343A', 'Por energía eléctrica', 1),
(68, '343B', 'Por actividades de construcción de obra material inmueble, urbanización, lotización o actividades similares', 1),
(69, '344', 'Otras retenciones aplicables', 2),
(70, '344A', 'Pago local tarjeta de crédito reportada por la Emisora de tarjeta de crédito, solo RECAP', 2),
(71, '346A', 'Ganancias de capital', 10),
(72, '347', 'Donaciones en dinero - Impuesto a la donaciones', 2),
(73, '348', 'Retención a cargo del propio sujeto pasivo por la exportación de concentrados y/o elementos metálicos', 10),
(74, '349', 'Retención a cargo del propio sujeto pasivo por la comercialización de productos forestales', 0),
(75, '500', 'Pago al exterior - Rentas Inmobiliarias', 22),
(76, '501', 'Pago al exterior - Beneficios Empresariales', 22),
(77, '502', 'Pago al exterior - Servicios Empresariales', 22),
(78, '503', 'Pago al exterior - Navegación MArítima y/o aérea', 22),
(79, '504', 'Pago al exterior - Dividendos distribuidos a personas naturales', 0),
(80, '504A', 'Pago al exterior - Dividendos a sociedades', 0),
(81, '504B', 'Pago al exterior - Anticipo dividendos (excepto paraísos fiscales o de régimen de menor imposición)', 22),
(82, '504C', 'Pago al exterior - Dividendos anticipados préstamos accionistas, beneficiarios o pastícipes (paraísos fiscales o regímenes de menor imposición)', 22),
(83, '504D', 'Pago al exterior - Dividendos a fidecomisos', 0),
(84, '504F', 'Pago al exterior - Dividendos a sociedades (paraísos fiscales)', 0),
(85, '504G', 'Pago al exterior - Anticipo dividendos (paraísos fiscales)', 0),
(86, '504H', 'Pago al exterior - Dividendos a fidecomisos (paraísos fiscales)', 13),
(87, '505', 'Pago al exterior - Rendimientos financieros', 22),
(88, '505A', 'Pago al exterior - Intereses de créditos de Instituciones financieras del exterior', 22),
(89, '505B', 'Pago al exterior - Intereses de créditos de gobierno a gobierno', 22),
(90, '505C', 'Pago al exterior - Intereses de créditos de arganismos multilaterales', 22),
(91, '505D', 'Pago al exterior - Intereses por financiamiento de proveedores externos', 22),
(92, '505E', 'Pago al exterior - Intereses de otros créditos externos', 22),
(93, '505F', 'Pago al exterior - Otros Intereses y Rendimientos Financieros', 22),
(94, '509', 'Pago al exterior - Cánones, derecho de autor, marcas, patentes y similares', 22),
(95, '509A', 'Pago al exterior - Regalías por concepto de franquicias', 22),
(96, '510', 'Pago al exterior - Ganancias de capital', 22),
(97, '511', 'Pago al exterior - Servicios profesionales independientes', 22),
(98, '512', 'Pago al exterior - Servicios profesionales dependientes', 22),
(99, '513', 'Pago al exterior - Artistas', 22),
(100, '514', 'Pago al exterior - Participación de consejeros', 22),
(101, '515', 'Pago al exterior - Entretenimieto Público', 22),
(102, '516', 'Pago al exterior - Pensiones', 22),
(103, '517', 'Pago al exterior - Reembolso de Gastos', 22),
(104, '518', 'Pago al exterior - Funciones Públicas', 22),
(105, '519', 'Pago al exterior - Estudiantes', 22),
(106, '520', 'Pago al exterior - Otros conceptos de ingresos gravados', 22),
(107, '520A', 'Pago al exterior - Pago a proveedores de servicios hoteleros y turísticos en el exterior', 22),
(108, '520B', 'Pago al exterior - Arrendamientos mercantil internacional', 22),
(109, '520D', 'Pago al exterior - Comisiones por exportaciones y por promoción de turismo receptivo', 22),
(110, '520E', 'Pago al exterior - Por las empresas de transport marítimo o aéreo y por empresas pesqueras de alta mar, por su actividad', 22),
(111, '520G', 'Pago al exterior - Contratos de fletamento de naves para empresas de transporte aéreo o marítimo internacional', 22),
(112, '521', 'Pago al exterior - Enajenación de derechos representativos de capital y otros derechos', 5),
(113, '522A', 'Pago al exterior - Servicios técnicos, administrativos o de consultoría y regalías con convenio de doble tributación', 22),
(114, '523A', 'Pago al exterior - Seguros y reaseguros (primas y cesiones) con convenio de doble tributación', 22),
(115, '524', 'Pago al exterior - Otros pagos al exterior o sujetos a retención', 22),
(116, '525', 'Pago al exterior - Donaciones en dinero - Impuestos a las donaciones', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retencion_iva`
--

DROP TABLE IF EXISTS `retencion_iva`;
CREATE TABLE `retencion_iva` (
  `id_retencion_iva` int(11) NOT NULL,
  `nombre_ret_iva` varchar(300) NOT NULL,
  `porcentaje_ret_iva` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retencion_iva`
--

INSERT INTO `retencion_iva` (`id_retencion_iva`, `nombre_ret_iva`, `porcentaje_ret_iva`) VALUES
(1, 'IVA 100% Arrendamiento de Inm.a Per.Naturales', 100),
(2, 'IVA 100% Compras Bien.y Serv.con Liq.Compras', 100),
(3, 'IVA 100% OTRAS VENTAS', 100),
(4, 'IVA 100% Prestación Serv. Profesionales', 100),
(5, 'IVA 10%  Por la Compra de Bienes', 10),
(6, 'IVA 20%  Prestación de Otros Servicios', 20),
(7, 'IVA 30%  Por la Compra de Bienes', 30),
(8, 'IVA 50%  Prestación de Otros Servicios', 50),
(9, 'IVA 70%  Prestación de Otros Servicios', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustento_tributario`
--

DROP TABLE IF EXISTS `sustento_tributario`;
CREATE TABLE `sustento_tributario` (
  `id_sustento` int(11) NOT NULL,
  `nombre_sustento` varchar(400) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sustento_tributario`
--

INSERT INTO `sustento_tributario` (`id_sustento`, `nombre_sustento`) VALUES
(1, 'Créditos tributarios para declaración de IVA (servicios y bienes distintos de inventarios y activos fijos)'),
(2, 'Costo o Gasto para declaración de IR (servicios y bienes distintos de inventarios y activos fijos)'),
(3, 'Activo fijo - Crédito tributario para declaración de IVA'),
(4, 'Activo Fijo - Costo o Gasto para declaración de IR'),
(5, 'Liquidación gastos de viaje hospedaje y alimentación Gastos IR (a nombre de empleados y no de la empresa)'),
(6, 'Inventario - Crédito tributario para declaración de IVA'),
(7, 'Inventario - Costo o Gasto para declaración de IR'),
(8, 'Valor pagado para solicitar reembolso de Gasto (Intermediario)'),
(9, 'Reembolso por siniestro'),
(10, 'Distribución de Dividendos, Banaficios o Utilidades'),
(11, 'Convenios de débito o recaudación para IFI''s');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_compra`
--

DROP TABLE IF EXISTS `tipo_compra`;
CREATE TABLE `tipo_compra` (
  `id_tipocompra` int(11) NOT NULL,
  `nombre_tipocompra` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_compra`
--

INSERT INTO `tipo_compra` (`id_tipocompra`, `nombre_tipocompra`) VALUES
(1, 'Gasto'),
(2, 'Producto'),
(3, 'Retención'),
(4, 'Egresos relacionados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobante`
--

DROP TABLE IF EXISTS `tipo_comprobante`;
CREATE TABLE `tipo_comprobante` (
  `id_tipocomprobante` int(11) NOT NULL,
  `nombre_tipocomprobante` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_comprobante`
--

INSERT INTO `tipo_comprobante` (`id_tipocomprobante`, `nombre_tipocomprobante`) VALUES
(1, 'Factura'),
(2, 'Liquidación de compra de bienes o prestación de servicios'),
(3, 'Nota de crédito'),
(4, 'Nota de débito'),
(5, 'Pasajes expedidos por empresas de aviación'),
(6, 'Documentos emitidos por instituciones financieras'),
(7, 'Carta de porte aéreo'),
(8, 'Liquidación para explotación y exploración de hidrocarburos'),
(9, 'Nota de crédito por reembolso emitida por intermediario'),
(10, 'Nota de débito por reembolso emitida por intermediario'),
(11, 'Nota o boleta de venta'),
(12, 'Liquidación de compra de bienes o prestación de servicios'),
(13, 'Tiquetes o vales emitidos por máquinas registradoras'),
(14, 'Comprobante de venta emitido en el Exterior'),
(15, 'Comprobante de pago de cuotas o aportes'),
(16, 'Documentos por servicios administrativos emitidos por institución del Estado'),
(17, 'Liquidación por reclamos de aseguradoras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tarjeta`
--

DROP TABLE IF EXISTS `tipo_tarjeta`;
CREATE TABLE `tipo_tarjeta` (
  `id_tipo_tarjeta` int(11) NOT NULL,
  `nombre_tipo_tarjeta` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_tarjeta`
--

INSERT INTO `tipo_tarjeta` (`id_tipo_tarjeta`, `nombre_tipo_tarjeta`) VALUES
(1, 'Débito'),
(2, 'Crédito');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id_bancos`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `detalle_compra_gasto`
--
ALTER TABLE `detalle_compra_gasto`
  ADD PRIMARY KEY (`id_dcg`);

--
-- Indices de la tabla `detalle_compra_producto`
--
ALTER TABLE `detalle_compra_producto`
  ADD PRIMARY KEY (`id_dcp`);

--
-- Indices de la tabla `detalle_pagos_compra`
--
ALTER TABLE `detalle_pagos_compra`
  ADD PRIMARY KEY (`id_dpc`);

--
-- Indices de la tabla `detalle_sustento_comprobante`
--
ALTER TABLE `detalle_sustento_comprobante`
  ADD PRIMARY KEY (`id_dsc`);

--
-- Indices de la tabla `df_banco`
--
ALTER TABLE `df_banco`
  ADD PRIMARY KEY (`df_id_banco`);

--
-- Indices de la tabla `df_bodega`
--
ALTER TABLE `df_bodega`
  ADD PRIMARY KEY (`df_id_bodega`);

--
-- Indices de la tabla `df_caja_chica_gasto`
--
ALTER TABLE `df_caja_chica_gasto`
  ADD PRIMARY KEY (`df_id_gasto`);

--
-- Indices de la tabla `df_caja_chica_ingreso`
--
ALTER TABLE `df_caja_chica_ingreso`
  ADD PRIMARY KEY (`df_id_ingreso_cc`);

--
-- Indices de la tabla `df_cat_movimiento`
--
ALTER TABLE `df_cat_movimiento`
  ADD PRIMARY KEY (`df_id_cat_movimiento`);

--
-- Indices de la tabla `df_ciudad`
--
ALTER TABLE `df_ciudad`
  ADD PRIMARY KEY (`df_codigo_ciudad`);

--
-- Indices de la tabla `df_cliente`
--
ALTER TABLE `df_cliente`
  ADD PRIMARY KEY (`df_id_cliente`);

--
-- Indices de la tabla `df_cuotas_compra`
--
ALTER TABLE `df_cuotas_compra`
  ADD PRIMARY KEY (`df_id_cc`);

--
-- Indices de la tabla `df_detalle_ciudad`
--
ALTER TABLE `df_detalle_ciudad`
  ADD PRIMARY KEY (`df_id_detalle_ciudad`);

--
-- Indices de la tabla `df_detalle_entrega`
--
ALTER TABLE `df_detalle_entrega`
  ADD PRIMARY KEY (`df_id_detent`);

--
-- Indices de la tabla `df_detalle_factura`
--
ALTER TABLE `df_detalle_factura`
  ADD PRIMARY KEY (`df_id_factura_detfac`);

--
-- Indices de la tabla `df_detalle_mercancia`
--
ALTER TABLE `df_detalle_mercancia`
  ADD PRIMARY KEY (`df_mercancia_detmer`);

--
-- Indices de la tabla `df_detalle_personal`
--
ALTER TABLE `df_detalle_personal`
  ADD PRIMARY KEY (`df_id_detper`);

--
-- Indices de la tabla `df_detalle_recepcion`
--
ALTER TABLE `df_detalle_recepcion`
  ADD PRIMARY KEY (`df_id_detrec`);

--
-- Indices de la tabla `df_detalle_remision`
--
ALTER TABLE `df_detalle_remision`
  ADD PRIMARY KEY (`df_id_detrem`);

--
-- Indices de la tabla `df_edo_kardex`
--
ALTER TABLE `df_edo_kardex`
  ADD PRIMARY KEY (`df_id_edo_kardex`);

--
-- Indices de la tabla `df_edo_mercancia`
--
ALTER TABLE `df_edo_mercancia`
  ADD PRIMARY KEY (`df_id_edo_mercancia`);

--
-- Indices de la tabla `df_estado_factura`
--
ALTER TABLE `df_estado_factura`
  ADD PRIMARY KEY (`df_id_estado`);

--
-- Indices de la tabla `df_estado_impresion`
--
ALTER TABLE `df_estado_impresion`
  ADD PRIMARY KEY (`df_estado_imp_id`);

--
-- Indices de la tabla `df_factura`
--
ALTER TABLE `df_factura`
  ADD PRIMARY KEY (`df_num_factura`);

--
-- Indices de la tabla `df_factura_recepcion`
--
ALTER TABLE `df_factura_recepcion`
  ADD PRIMARY KEY (`df_id_factura_rec`);

--
-- Indices de la tabla `df_guia_entrega`
--
ALTER TABLE `df_guia_entrega`
  ADD PRIMARY KEY (`df_num_guia_entrega`);

--
-- Indices de la tabla `df_guia_recepcion`
--
ALTER TABLE `df_guia_recepcion`
  ADD PRIMARY KEY (`df_guia_recepcion`);

--
-- Indices de la tabla `df_guia_remision`
--
ALTER TABLE `df_guia_remision`
  ADD PRIMARY KEY (`df_guia_remision`);

--
-- Indices de la tabla `df_historia_edo_factura`
--
ALTER TABLE `df_historia_edo_factura`
  ADD PRIMARY KEY (`df_id_hist_edo_factura`);

--
-- Indices de la tabla `df_impuesto`
--
ALTER TABLE `df_impuesto`
  ADD PRIMARY KEY (`df_id_impuesto`);

--
-- Indices de la tabla `df_ingreso_mercancia`
--
ALTER TABLE `df_ingreso_mercancia`
  ADD PRIMARY KEY (`df_mercancia_codigo`);

--
-- Indices de la tabla `df_inventario`
--
ALTER TABLE `df_inventario`
  ADD PRIMARY KEY (`df_id_inventario`);

--
-- Indices de la tabla `df_kardex`
--
ALTER TABLE `df_kardex`
  ADD PRIMARY KEY (`df_kardex_id`);

--
-- Indices de la tabla `df_libro_diario`
--
ALTER TABLE `df_libro_diario`
  ADD PRIMARY KEY (`df_id_libro_diario`);

--
-- Indices de la tabla `df_personal`
--
ALTER TABLE `df_personal`
  ADD PRIMARY KEY (`df_id_personal`);

--
-- Indices de la tabla `df_producto`
--
ALTER TABLE `df_producto`
  ADD PRIMARY KEY (`df_id_producto`);

--
-- Indices de la tabla `df_producto_precio`
--
ALTER TABLE `df_producto_precio`
  ADD PRIMARY KEY (`df_id_precio`);

--
-- Indices de la tabla `df_producto_proveedor`
--
ALTER TABLE `df_producto_proveedor`
  ADD PRIMARY KEY (`df_id_producto_pp`);

--
-- Indices de la tabla `df_proveedor`
--
ALTER TABLE `df_proveedor`
  ADD PRIMARY KEY (`df_id_proveedor`);

--
-- Indices de la tabla `df_provincia`
--
ALTER TABLE `df_provincia`
  ADD PRIMARY KEY (`df_id_provincia`);

--
-- Indices de la tabla `df_sector`
--
ALTER TABLE `df_sector`
  ADD PRIMARY KEY (`df_codigo_sector`);

--
-- Indices de la tabla `df_usuario`
--
ALTER TABLE `df_usuario`
  ADD PRIMARY KEY (`df_id_usuario`);

--
-- Indices de la tabla `df_zona`
--
ALTER TABLE `df_zona`
  ADD PRIMARY KEY (`df_codigo_zona`);

--
-- Indices de la tabla `dp_perfil_banco`
--
ALTER TABLE `dp_perfil_banco`
  ADD PRIMARY KEY (`dp_id_perfil_ban`);

--
-- Indices de la tabla `edo_compra`
--
ALTER TABLE `edo_compra`
  ADD PRIMARY KEY (`id_edo_compra`);

--
-- Indices de la tabla `franquicias`
--
ALTER TABLE `franquicias`
  ADD PRIMARY KEY (`id_franquicia`);

--
-- Indices de la tabla `historia_edo_compra`
--
ALTER TABLE `historia_edo_compra`
  ADD PRIMARY KEY (`id_hist_edo_com`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `retencion_compra_venta`
--
ALTER TABLE `retencion_compra_venta`
  ADD PRIMARY KEY (`id_ret_com_ven`);

--
-- Indices de la tabla `retencion_ir`
--
ALTER TABLE `retencion_ir`
  ADD PRIMARY KEY (`id_retencion_ir`);

--
-- Indices de la tabla `retencion_iva`
--
ALTER TABLE `retencion_iva`
  ADD PRIMARY KEY (`id_retencion_iva`);

--
-- Indices de la tabla `sustento_tributario`
--
ALTER TABLE `sustento_tributario`
  ADD PRIMARY KEY (`id_sustento`);

--
-- Indices de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  ADD PRIMARY KEY (`id_tipocompra`);

--
-- Indices de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  ADD PRIMARY KEY (`id_tipocomprobante`);

--
-- Indices de la tabla `tipo_tarjeta`
--
ALTER TABLE `tipo_tarjeta`
  ADD PRIMARY KEY (`id_tipo_tarjeta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id_bancos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_compra_gasto`
--
ALTER TABLE `detalle_compra_gasto`
  MODIFY `id_dcg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_compra_producto`
--
ALTER TABLE `detalle_compra_producto`
  MODIFY `id_dcp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_pagos_compra`
--
ALTER TABLE `detalle_pagos_compra`
  MODIFY `id_dpc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_sustento_comprobante`
--
ALTER TABLE `detalle_sustento_comprobante`
  MODIFY `id_dsc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT de la tabla `df_banco`
--
ALTER TABLE `df_banco`
  MODIFY `df_id_banco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_bodega`
--
ALTER TABLE `df_bodega`
  MODIFY `df_id_bodega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `df_caja_chica_gasto`
--
ALTER TABLE `df_caja_chica_gasto`
  MODIFY `df_id_gasto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_caja_chica_ingreso`
--
ALTER TABLE `df_caja_chica_ingreso`
  MODIFY `df_id_ingreso_cc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_cat_movimiento`
--
ALTER TABLE `df_cat_movimiento`
  MODIFY `df_id_cat_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `df_ciudad`
--
ALTER TABLE `df_ciudad`
  MODIFY `df_codigo_ciudad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_cliente`
--
ALTER TABLE `df_cliente`
  MODIFY `df_id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT de la tabla `df_cuotas_compra`
--
ALTER TABLE `df_cuotas_compra`
  MODIFY `df_id_cc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `df_detalle_ciudad`
--
ALTER TABLE `df_detalle_ciudad`
  MODIFY `df_id_detalle_ciudad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_detalle_entrega`
--
ALTER TABLE `df_detalle_entrega`
  MODIFY `df_id_detent` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_detalle_factura`
--
ALTER TABLE `df_detalle_factura`
  MODIFY `df_id_factura_detfac` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_detalle_mercancia`
--
ALTER TABLE `df_detalle_mercancia`
  MODIFY `df_mercancia_detmer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_detalle_personal`
--
ALTER TABLE `df_detalle_personal`
  MODIFY `df_id_detper` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `df_detalle_recepcion`
--
ALTER TABLE `df_detalle_recepcion`
  MODIFY `df_id_detrec` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_detalle_remision`
--
ALTER TABLE `df_detalle_remision`
  MODIFY `df_id_detrem` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_edo_kardex`
--
ALTER TABLE `df_edo_kardex`
  MODIFY `df_id_edo_kardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `df_edo_mercancia`
--
ALTER TABLE `df_edo_mercancia`
  MODIFY `df_id_edo_mercancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `df_estado_factura`
--
ALTER TABLE `df_estado_factura`
  MODIFY `df_id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `df_estado_impresion`
--
ALTER TABLE `df_estado_impresion`
  MODIFY `df_estado_imp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `df_factura`
--
ALTER TABLE `df_factura`
  MODIFY `df_num_factura` bigint(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15112;
--
-- AUTO_INCREMENT de la tabla `df_factura_recepcion`
--
ALTER TABLE `df_factura_recepcion`
  MODIFY `df_id_factura_rec` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_guia_entrega`
--
ALTER TABLE `df_guia_entrega`
  MODIFY `df_num_guia_entrega` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_guia_recepcion`
--
ALTER TABLE `df_guia_recepcion`
  MODIFY `df_guia_recepcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_guia_remision`
--
ALTER TABLE `df_guia_remision`
  MODIFY `df_guia_remision` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_historia_edo_factura`
--
ALTER TABLE `df_historia_edo_factura`
  MODIFY `df_id_hist_edo_factura` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_impuesto`
--
ALTER TABLE `df_impuesto`
  MODIFY `df_id_impuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `df_ingreso_mercancia`
--
ALTER TABLE `df_ingreso_mercancia`
  MODIFY `df_mercancia_codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_inventario`
--
ALTER TABLE `df_inventario`
  MODIFY `df_id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT de la tabla `df_kardex`
--
ALTER TABLE `df_kardex`
  MODIFY `df_kardex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `df_libro_diario`
--
ALTER TABLE `df_libro_diario`
  MODIFY `df_id_libro_diario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_personal`
--
ALTER TABLE `df_personal`
  MODIFY `df_id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `df_producto`
--
ALTER TABLE `df_producto`
  MODIFY `df_id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1121;
--
-- AUTO_INCREMENT de la tabla `df_producto_precio`
--
ALTER TABLE `df_producto_precio`
  MODIFY `df_id_precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT de la tabla `df_producto_proveedor`
--
ALTER TABLE `df_producto_proveedor`
  MODIFY `df_id_producto_pp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_proveedor`
--
ALTER TABLE `df_proveedor`
  MODIFY `df_id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `df_provincia`
--
ALTER TABLE `df_provincia`
  MODIFY `df_id_provincia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `df_sector`
--
ALTER TABLE `df_sector`
  MODIFY `df_codigo_sector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT de la tabla `df_usuario`
--
ALTER TABLE `df_usuario`
  MODIFY `df_id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `df_zona`
--
ALTER TABLE `df_zona`
  MODIFY `df_codigo_zona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `dp_perfil_banco`
--
ALTER TABLE `dp_perfil_banco`
  MODIFY `dp_id_perfil_ban` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `edo_compra`
--
ALTER TABLE `edo_compra`
  MODIFY `id_edo_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `franquicias`
--
ALTER TABLE `franquicias`
  MODIFY `id_franquicia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `historia_edo_compra`
--
ALTER TABLE `historia_edo_compra`
  MODIFY `id_hist_edo_com` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `retencion_compra_venta`
--
ALTER TABLE `retencion_compra_venta`
  MODIFY `id_ret_com_ven` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `retencion_ir`
--
ALTER TABLE `retencion_ir`
  MODIFY `id_retencion_ir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT de la tabla `retencion_iva`
--
ALTER TABLE `retencion_iva`
  MODIFY `id_retencion_iva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `sustento_tributario`
--
ALTER TABLE `sustento_tributario`
  MODIFY `id_sustento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `tipo_compra`
--
ALTER TABLE `tipo_compra`
  MODIFY `id_tipocompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  MODIFY `id_tipocomprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `tipo_tarjeta`
--
ALTER TABLE `tipo_tarjeta`
  MODIFY `id_tipo_tarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
