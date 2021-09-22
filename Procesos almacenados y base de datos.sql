-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla venta_estadia.detalleventa
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `folioD` int(11) NOT NULL,
  `fechaventa` date DEFAULT NULL,
  `t_prodvendidos` int(11) NOT NULL,
  PRIMARY KEY (`folioD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla venta_estadia.detalleventa: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` (`folioD`, `fechaventa`, `t_prodvendidos`) VALUES
	(1, '2021-09-08', 20),
	(2, '2021-03-07', 70),
	(3, '2021-09-01', 15),
	(4, '2021-04-10', 80),
	(5, '2021-04-10', 22),
	(6, '2021-11-01', 96),
	(7, '2021-09-20', 102);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;

-- Volcando estructura para procedimiento venta_estadia.SP_GetTicket
DELIMITER //
CREATE PROCEDURE `SP_GetTicket`(
	IN `FolioTT` INT (2)
)
SELECT totaltickets_dia FROM ticketventa WHERE folioT = FolioTT//
DELIMITER ;

-- Volcando estructura para procedimiento venta_estadia.SP_GETVentaDiaC
DELIMITER //
CREATE PROCEDURE `SP_GETVentaDiaC`(
	IN `FolioC` INT (2)
)
SELECT t_prodvendidos FROM detalleventa WHERE folioD = FolioC//
DELIMITER ;

-- Volcando estructura para procedimiento venta_estadia.SP_SetGeneraVenta
DELIMITER //
CREATE PROCEDURE `SP_SetGeneraVenta`(
	IN `Folio_NVenta` INT(2),
	IN `xNombreprod` VARCHAR(18)
)
BEGIN

insert into venta(folioV,nombre_prod)
values(Folio_NVenta,xNombreprod);

END//
DELIMITER ;

-- Volcando estructura para tabla venta_estadia.ticketventa
CREATE TABLE IF NOT EXISTS `ticketventa` (
  `folioT` int(11) NOT NULL,
  `fechaticket` date DEFAULT NULL,
  `totaltickets_dia` int(11) DEFAULT NULL,
  PRIMARY KEY (`folioT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla venta_estadia.ticketventa: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `ticketventa` DISABLE KEYS */;
INSERT INTO `ticketventa` (`folioT`, `fechaticket`, `totaltickets_dia`) VALUES
	(1, '2021-09-08', 20),
	(2, '2021-03-07', 70),
	(3, '2021-09-01', 15),
	(4, '2021-04-10', 80),
	(5, '2021-04-10', 22),
	(6, '2021-11-01', 96),
	(7, '2021-09-20', 102);
/*!40000 ALTER TABLE `ticketventa` ENABLE KEYS */;

-- Volcando estructura para tabla venta_estadia.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `folioV` int(11) NOT NULL,
  `nombre_prod` varchar(20) NOT NULL,
  PRIMARY KEY (`folioV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla venta_estadia.venta: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` (`folioV`, `nombre_prod`) VALUES
	(1, 'barmicil'),
	(2, 'creatina'),
	(3, 'prot WHEY'),
	(4, 'guten'),
	(5, 'danonino'),
	(6, 'squirt 600ml'),
	(7, 'CocaCola'),
	(8, 'te verde');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
