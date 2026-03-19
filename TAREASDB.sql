-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.13.0.7147
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para growpal_gdvo
CREATE DATABASE IF NOT EXISTS `growpal_gdvo` /*!40100 DEFAULT CHARACTER SET gb2312 COLLATE gb2312_bin */;
USE `growpal_gdvo`;

-- Volcando estructura para tabla growpal_gdvo.tareas
CREATE TABLE IF NOT EXISTS `tareas` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL DEFAULT '',
  `descripcion` text NOT NULL,
  `fecha_limite` date NOT NULL,
  `estado` enum('pendiente','en progreso','completado') NOT NULL DEFAULT 'pendiente',
  `realizada` tinyint(1) DEFAULT 0,
  `clasificacion` enum('deporte','trabajo','estudio','personal','otros') DEFAULT 'otros',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `hora_limite` time NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_tarea`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- Volcando datos para la tabla growpal_gdvo.tareas: ~3 rows (aproximadamente)
DELETE FROM `tareas`;
INSERT INTO `tareas` (`id_tarea`, `id_usuario`, `titulo`, `descripcion`, `fecha_limite`, `estado`, `realizada`, `clasificacion`, `fecha_creacion`, `hora_limite`) VALUES
	(1, 1, '', 'Correr 5km', '2026-03-19', '', 0, 'deporte', '2026-03-19 17:28:18', '18:05:30'),
	(2, 1, '', 'Leer un libro de dise?o', '2026-03-19', '', 0, 'estudio', '2026-03-19 17:28:18', '18:05:30'),
	(3, 1, '', 'Organizar archivos del proyecto', '2026-03-19', '', 1, 'trabajo', '2026-03-19 17:28:18', '18:05:30');

-- Volcando estructura para tabla growpal_gdvo.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `telefono` varchar(16) DEFAULT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `rol` enum('administrador','usuario') DEFAULT 'usuario',
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `ultimo_acceso` timestamp NULL DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- Volcando datos para la tabla growpal_gdvo.usuarios: ~0 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `nombre_usuario`, `contrasena`, `correo`, `rol`, `fecha_registro`, `ultimo_acceso`, `foto_perfil`, `activo`) VALUES
	(1, NULL, NULL, NULL, NULL, 'admin', 'admin123', '', 'administrador', NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
