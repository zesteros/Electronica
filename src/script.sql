-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.14-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5174
-- --------------------------------------------------------

-- Volcando estructura de base de datos para electronica
CREATE DATABASE IF NOT EXISTS `electronica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `electronica`;

-- Volcando estructura para tabla electronica.shop_cart
CREATE TABLE IF NOT EXISTS `shop_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla electronica.shop_cart: ~2 rows (aproximadamente)
INSERT INTO `shop_cart` (`id`, `name`, `price`, `image`) VALUES
	(7, 'Raspberry PI', 1250, 'resources/product-images/raspberry.jpg'),
	(9, 'Conector Epicentro', 50, 'resources/product-images/conector_epicentro.jpg'),
	(10, 'Arduino Uno', 250, 'resources/product-images/arduino.jpg'),
	(11, 'Arduino Mega', 390, 'resources/product-images/arduino_mega.jpg'),
	(12, 'Bateria 5V', 800, 'resources/product-images/bateria_5.jpg'),
	(13, 'Bateria 12V', 1000, 'resources/product-images/bateria_12.jpg');

