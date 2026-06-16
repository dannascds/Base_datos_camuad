-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2026 a las 00:11:56
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
-- Base de datos: `camuad_ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Productos de PVC'),
(2, 'Herramientas eléctricas'),
(3, 'Herramientas manuales'),
(4, 'Artículos de gasfitería'),
(5, 'Pernería y herrería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `numero_documento` int(11) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(30) DEFAULT NULL,
  `correo_cliente` varchar(70) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`numero_documento`, `nombre_cliente`, `tipo_documento`, `correo_cliente`, `fecha_registro`) VALUES
(371855, 'Juan Perez', 'C.E', 'juanpe@yahoo.es', '2026-05-14 13:25:38'),
(875632, 'Diego Bohorquez', 'C.C', 'diebo@hotmail.com', '2026-05-14 13:25:38'),
(12345678, 'Esteban Ramirez', 'C.C', 'estebanra@gmail.com', '2026-05-14 13:25:38'),
(87654321, 'Diana Medina', 'NIT', 'dianame@gmail.com', '2026-05-14 13:25:38'),
(96548712, 'Paola Maldonado', 'NIT', 'paoma@gmail.com', '2026-05-14 13:25:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `estado_venta` varchar(50) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle_venta`, `cantidad`, `precio_unitario`, `subtotal`, `estado_venta`, `id_producto`) VALUES
(1, 5, 15000.00, 75000.00, 'Entregado', 1),
(2, 2, 10000.00, 20000.00, 'Entregado', 2),
(3, 1, 13000.00, 13000.00, 'Entregado', 3),
(4, 2, 6000.00, 12000.00, 'Pendiente', 4),
(5, 3, 1000.00, 3000.00, 'Pendiente', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas`
--

CREATE TABLE `estadisticas` (
  `id_estadisticas` int(11) NOT NULL,
  `tipo_estadistica` varchar(30) DEFAULT NULL,
  `fecha_generacion` datetime DEFAULT current_timestamp(),
  `id_compra` int(11) DEFAULT NULL,
  `id_reporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadisticas`
--

INSERT INTO `estadisticas` (`id_estadisticas`, `tipo_estadistica`, `fecha_generacion`, `id_compra`, `id_reporte`) VALUES
(1, 'Diagrama de barras', '2026-05-14 13:41:18', 1, 1),
(2, 'Grafico circular', '2026-05-14 13:41:18', 2, 2),
(3, 'Diagrama de lineas', '2026-05-14 13:41:18', 3, 3),
(4, 'Diagrama de barras', '2026-05-14 13:41:18', 4, 4),
(5, 'Grafico circular', '2026-05-14 13:41:18', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `metodo_pago` varchar(35) DEFAULT NULL,
  `monto_recibido` decimal(10,2) DEFAULT NULL,
  `cambio` decimal(10,2) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT current_timestamp(),
  `descuento` decimal(10,2) DEFAULT NULL,
  `IVA` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `numero_documento` int(11) NOT NULL,
  `id_detalle_venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `metodo_pago`, `monto_recibido`, `cambio`, `fecha_factura`, `descuento`, `IVA`, `total`, `numero_documento`, `id_detalle_venta`) VALUES
(1, 'Efectivo', 80000.00, 5000.00, '2026-05-14 13:55:39', 0.00, 0.00, 75000, 875632, 1),
(2, 'Tarjeta de debito', 20000.00, 0.00, '2026-05-14 13:55:39', 0.00, 0.00, 20000, 87654321, 2),
(3, 'Tarjeta de credito', 13000.00, 0.00, '2026-05-14 13:55:39', 0.00, 0.00, 13000, 371855, 3),
(4, 'Efectivo', 20000.00, 8000.00, '2026-05-14 13:55:39', 0.00, 0.00, 12000, 96548712, 4),
(5, 'Efectivo', 5000.00, 2000.00, '2026-05-14 13:55:39', 0.00, 0.00, 3000, 12345678, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre_marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`) VALUES
(1, 'DeWalt'),
(2, 'Makita'),
(3, 'Bosch'),
(4, 'Stanley'),
(5, 'Festool');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `descripcion_producto` varchar(50) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `NIT_proveedor` varchar(30) DEFAULT NULL,
  `id_unidad_medida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio_compra`, `precio_venta`, `cantidad`, `id_categoria`, `id_marca`, `NIT_proveedor`, `id_unidad_medida`) VALUES
(1, 'Martillo', 'Martillo marca stanley', 10000.00, 15000.00, 30, 3, 4, '9757894', 1),
(2, 'Broca', 'Broca marca Bosch', 5000.00, 10000.00, 20, 2, 3, '8756321', 1),
(3, 'Llave 1/4', 'Llave marca stanley', 5000.00, 13000.00, 20, 3, 4, '9757894', 1),
(4, 'Metro de cable #16', 'Cable marca DeWalt', 4000.00, 6000.00, 100, 2, 1, '9652974', 2),
(5, 'Bombillos', 'bombillos marca Bosch', 1000.00, 1500.00, 30, 4, 3, '8756321', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `NIT_proveedor` varchar(30) NOT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo_proveedor` varchar(60) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`NIT_proveedor`, `nombre_proveedor`, `telefono`, `correo_proveedor`, `direccion`) VALUES
('7896214', 'Makita', 7892454, 'makita@gmail.com', 'cra 87 #54 sur'),
('8756321', 'Bosch', 312045787, 'bosch@gmail.com', 'cra 10 #54 occidente'),
('9652974', 'DeWalt', 33025984, 'DeWalt@gmail.com', 'cra 15 #100'),
('9757894', 'Stanley', 2147483647, 'stanley@gmail.com', 'cra 158 #80'),
('9856427', 'Festool', 2147483647, 'festoolo3@gmail.com', 'cra 100 #54 occidente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(11) NOT NULL,
  `tipo_reporte` varchar(50) DEFAULT NULL,
  `total_ingresos` decimal(10,2) DEFAULT NULL,
  `total_egresos` decimal(10,2) DEFAULT NULL,
  `ganancias` decimal(10,2) DEFAULT NULL,
  `producto_vendido` varchar(50) DEFAULT NULL,
  `cantidad_vendida` varchar(50) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `id_solcitud_reposicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`id_reporte`, `tipo_reporte`, `total_ingresos`, `total_egresos`, `ganancias`, `producto_vendido`, `cantidad_vendida`, `id_factura`, `id_solcitud_reposicion`) VALUES
(1, 'Ventas mensuales', 1500000.00, 1200000.00, 300000.00, 'martillo', '100', 1, 1),
(2, 'Ventas diarias', 75000.00, 10000.00, 65000.00, 'martillo', '15', 2, 1),
(3, 'Ventas diarias', 20000.00, 0.00, 20000.00, 'Broca', '2', 3, 2),
(4, 'Ventas diarias', 13000.00, 1000.00, 12000.00, 'Llave 1/4', '1', 4, 3),
(5, 'Ventas diarias', 12000.00, 0.00, 12000.00, 'Cable', '2', 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_stock`
--

CREATE TABLE `solicitud_stock` (
  `id_solcitud_reposicion` int(11) NOT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  `prioridad` varchar(30) DEFAULT NULL,
  `costo_unitario` int(11) DEFAULT NULL,
  `total_compra` int(11) DEFAULT NULL,
  `cantidad_comprar` int(11) DEFAULT NULL,
  `NIT_proveedor` varchar(30) DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitud_stock`
--

INSERT INTO `solicitud_stock` (`id_solcitud_reposicion`, `fecha_solicitud`, `prioridad`, `costo_unitario`, `total_compra`, `cantidad_comprar`, `NIT_proveedor`, `id_compra`) VALUES
(1, '2026-05-14 14:51:37', 'Alta', 10000, 300000, 30, '9757894', 1),
(2, '2026-05-14 14:51:37', 'Alta', 5000, 100000, 20, '8756321', 2),
(3, '2026-05-14 14:51:37', 'Media', 5000, 100000, 20, '9757894', 3),
(4, '2026-05-14 14:51:37', 'Media', 4000, 400000, 100, '9652974', 4),
(5, '2026-05-14 14:51:37', 'Baja', 1000, 30000, 30, '8756321', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_compra` int(11) NOT NULL,
  `fecha_compra` datetime DEFAULT current_timestamp(),
  `cantidad` int(11) DEFAULT NULL,
  `cantidad_min_stock` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id_compra`, `fecha_compra`, `cantidad`, `cantidad_min_stock`, `estado`, `id_producto`) VALUES
(1, '2026-05-14 14:55:18', 30, 5, 'Activo', 1),
(2, '2026-05-14 14:55:18', 20, 5, 'Activo', 2),
(3, '2026-05-14 14:55:18', 20, 5, 'Activo', 3),
(4, '2026-05-14 14:55:18', 100, 5, 'Activo', 4),
(5, '2026-05-14 14:55:18', 30, 5, 'Activo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int(11) NOT NULL,
  `nombre_medida` varchar(50) DEFAULT NULL,
  `abreviatura` varchar(20) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id_unidad_medida`, `nombre_medida`, `abreviatura`, `tipo`) VALUES
(1, 'Unidad', 'und', 'Fisica'),
(2, 'Metro', 'M', 'Longitud'),
(3, 'Litros', 'L', 'Volumen'),
(4, 'Amperios', 'A', 'Corriente'),
(5, 'Kilogramo', 'Kg', 'Masa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula_ciudadania` int(11) NOT NULL,
  `nombre_completo` varchar(50) DEFAULT NULL,
  `contraseña` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula_ciudadania`, `nombre_completo`, `contraseña`, `correo_electronico`, `fecha_registro`, `id_rol`) VALUES
(12345678, 'Pedro Perez', 'pe15488', 'pedro@gmail.com', '2026-05-14 15:06:37', 2),
(15487541, 'Milena Cruz', 'mi15487', 'mile@gmail.com', '2026-05-14 15:06:37', 1),
(78456874, 'Diego Sanchez', 'die32654', 'diego@gmail.com', '2026-05-14 15:06:37', 2),
(96325487, 'Paola Mendez', 'pao6598', 'pedro@gmail.com', '2026-05-14 15:06:37', 2),
(98564752, 'Camila Rodriguez', 'cam4585', 'camiro@gmail.com', '2026-05-14 15:06:37', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`numero_documento`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`),
  ADD KEY `fk_producto` (`id_producto`);

--
-- Indices de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD PRIMARY KEY (`id_estadisticas`),
  ADD KEY `fk_stock` (`id_compra`),
  ADD KEY `fk_reporte` (`id_reporte`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `cliente_fk` (`numero_documento`),
  ADD KEY `fk_detalle_venta` (`id_detalle_venta`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_categoria` (`id_categoria`),
  ADD KEY `fk_marca` (`id_marca`),
  ADD KEY `fk_proveedor` (`NIT_proveedor`),
  ADD KEY `fk_unidad_medida` (`id_unidad_medida`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NIT_proveedor`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `fk_factura` (`id_factura`),
  ADD KEY `fk_solicitud_stock` (`id_solcitud_reposicion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `solicitud_stock`
--
ALTER TABLE `solicitud_stock`
  ADD PRIMARY KEY (`id_solcitud_reposicion`),
  ADD KEY `fk_proveedor_stock` (`NIT_proveedor`),
  ADD KEY `fk_solicitud_stock` (`id_compra`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_productos` (`id_producto`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id_unidad_medida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula_ciudadania`),
  ADD KEY `fk_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  MODIFY `id_estadisticas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitud_stock`
--
ALTER TABLE `solicitud_stock`
  MODIFY `id_solcitud_reposicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD CONSTRAINT `fk_reporte` FOREIGN KEY (`id_reporte`) REFERENCES `reporte` (`id_reporte`),
  ADD CONSTRAINT `fk_stock` FOREIGN KEY (`id_compra`) REFERENCES `stock` (`id_compra`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `cliente_fk` FOREIGN KEY (`numero_documento`) REFERENCES `cliente` (`numero_documento`),
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_detalle_venta`) REFERENCES `detalle_venta` (`id_detalle_venta`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  ADD CONSTRAINT `fk_proveedor` FOREIGN KEY (`NIT_proveedor`) REFERENCES `proveedor` (`NIT_proveedor`),
  ADD CONSTRAINT `fk_unidad_medida` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`);

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `fk_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`);

--
-- Filtros para la tabla `solicitud_stock`
--
ALTER TABLE `solicitud_stock`
  ADD CONSTRAINT `fk_proveedor_stock` FOREIGN KEY (`NIT_proveedor`) REFERENCES `proveedor` (`NIT_proveedor`),
  ADD CONSTRAINT `fk_solicitud_stock` FOREIGN KEY (`id_compra`) REFERENCES `stock` (`id_compra`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
