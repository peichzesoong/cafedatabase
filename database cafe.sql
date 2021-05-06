-- --------------------------------------------------------
-- Host:                         eu-cdbr-west-03.cleardb.net
-- Server version:               5.6.49-log - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table heroku_06b55815c2349a2.beverages
CREATE TABLE IF NOT EXISTS `beverages` (
  `bevID` int(10) NOT NULL AUTO_INCREMENT,
  `bevName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `bevPrice` float DEFAULT NULL,
  `bevTemp` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`bevID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table heroku_06b55815c2349a2.beverages: ~2 rows (approximately)
/*!40000 ALTER TABLE `beverages` DISABLE KEYS */;
INSERT INTO `beverages` (`bevID`, `bevName`, `bevPrice`, `bevTemp`) VALUES
	(1, 'Iced Hazelnut Coffee', 7, 'COLD'),
	(2, 'Black Coffee', 4, 'HOT'),
	(3, 'Mocha with Cream', 5.7, 'COLD');
/*!40000 ALTER TABLE `beverages` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `custID` int(10) NOT NULL AUTO_INCREMENT,
  `custName` varchar(50) DEFAULT NULL,
  `custEmail` varchar(50) DEFAULT NULL,
  `custPhone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`custID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.customer: ~2 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`custID`, `custName`, `custEmail`, `custPhone`) VALUES
	(1, 'Ikhwan', 'ikhwanali@gmail.com', '0132276890'),
	(2, 'Amni', 'amnihazwani@gmail.com', '0174502520'),
	(3, 'Zubair', 'zubair256@gmail.com', '0189093447');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.custorder
CREATE TABLE IF NOT EXISTS `custorder` (
  `orderID` int(10) NOT NULL AUTO_INCREMENT,
  `foodID` int(10) DEFAULT NULL,
  `bevID` int(10) DEFAULT NULL,
  `custID` int(10) DEFAULT NULL,
  `staffID` int(10) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK_order_beverage` (`bevID`),
  KEY `FK_order_customer` (`custID`),
  KEY `FK_order_staff` (`staffID`),
  KEY `FK_order_food` (`foodID`),
  CONSTRAINT `FK_order_beverage` FOREIGN KEY (`bevID`) REFERENCES `beverages` (`bevID`),
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`),
  CONSTRAINT `FK_order_food` FOREIGN KEY (`foodID`) REFERENCES `food` (`foodID`),
  CONSTRAINT `FK_order_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.custorder: ~3 rows (approximately)
/*!40000 ALTER TABLE `custorder` DISABLE KEYS */;
INSERT INTO `custorder` (`orderID`, `foodID`, `bevID`, `custID`, `staffID`) VALUES
	(1, 2, 1, 1, 1),
	(2, 2, 2, 2, 2),
	(3, 3, 3, 3, 2);
/*!40000 ALTER TABLE `custorder` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.delivery
CREATE TABLE IF NOT EXISTS `delivery` (
  `deliveryID` int(10) NOT NULL AUTO_INCREMENT,
  `orderID` int(10) DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `deliveryType` varchar(50) DEFAULT NULL,
  `deliveryStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deliveryID`),
  KEY `FK_delivery_order` (`orderID`),
  CONSTRAINT `FK_delivery_order` FOREIGN KEY (`orderID`) REFERENCES `custorder` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.delivery: ~1 rows (approximately)
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` (`deliveryID`, `orderID`, `deliveryDate`, `deliveryType`, `deliveryStatus`) VALUES
	(1, 1, '2020-01-01', 'FoodPanda', 'Delivered'),
	(2, 2, '2020-01-02', 'GrabFood', 'Canceled'),
	(3, 3, '2020-01-03', 'dahmakan', 'On the way');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.food
CREATE TABLE IF NOT EXISTS `food` (
  `foodID` int(10) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(50) DEFAULT NULL,
  `foodPrice` float DEFAULT NULL,
  PRIMARY KEY (`foodID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.food: ~2 rows (approximately)
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` (`foodID`, `foodName`, `foodPrice`) VALUES
	(1, 'Spaghetti Carbonara Beef', 11.5),
	(2, 'Chocolate Indulgences Cake', 9.8),
	(3, 'Double Chips Cookie', 3.6);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.hq
CREATE TABLE IF NOT EXISTS `hq` (
  `hqID` int(10) NOT NULL AUTO_INCREMENT,
  `supplierID` int(10) DEFAULT NULL,
  `poID` int(10) DEFAULT NULL,
  PRIMARY KEY (`hqID`),
  KEY `FK_hq_supplier` (`supplierID`),
  KEY `FK_hq_purchasingorder` (`poID`),
  CONSTRAINT `FK_hq_purchasingorder` FOREIGN KEY (`poID`) REFERENCES `purchasingorder` (`poID`),
  CONSTRAINT `FK_hq_supplier` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.hq: ~2 rows (approximately)
/*!40000 ALTER TABLE `hq` DISABLE KEYS */;
INSERT INTO `hq` (`hqID`, `supplierID`, `poID`) VALUES
	(1, NULL, 1),
	(2, NULL, 2),
	(3, NULL, 3);
/*!40000 ALTER TABLE `hq` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentID` int(10) NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(50) DEFAULT NULL,
  `orderID` int(10) DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `FK_payment_order` (`orderID`),
  CONSTRAINT `FK_payment_order` FOREIGN KEY (`orderID`) REFERENCES `custorder` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.payment: ~2 rows (approximately)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`paymentID`, `paymentType`, `orderID`) VALUES
	(10, 'QR Code Scan', 1),
	(11, 'Cash', 2),
	(12, 'Cash', 3);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.purchasingorder
CREATE TABLE IF NOT EXISTS `purchasingorder` (
  `poID` int(10) NOT NULL AUTO_INCREMENT,
  `poDate` date DEFAULT NULL,
  `staffID` int(10) DEFAULT NULL,
  `hqID` int(10) DEFAULT NULL,
  `ingName` varchar(50) DEFAULT NULL,
  `ingQuantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`poID`),
  KEY `FK_purchasingorder_hq` (`hqID`),
  KEY `FK_purchasing_staff` (`staffID`),
  CONSTRAINT `FK_purchasing_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`),
  CONSTRAINT `FK_purchasingorder_hq` FOREIGN KEY (`hqID`) REFERENCES `hq` (`hqID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.purchasingorder: ~3 rows (approximately)
/*!40000 ALTER TABLE `purchasingorder` DISABLE KEYS */;
INSERT INTO `purchasingorder` (`poID`, `poDate`, `staffID`, `hqID`, `ingName`, `ingQuantity`) VALUES
	(1, '2020-12-15', 1, 1, 'Chocolate Powder', 10),
	(2, '2020-12-15', 1, 2, 'Creamer', 5),
	(3, '2020-12-15', 1, 3, 'Cofee Bean', 15);
/*!40000 ALTER TABLE `purchasingorder` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` int(10) NOT NULL AUTO_INCREMENT,
  `staffName` varchar(50) DEFAULT NULL,
  `staffHours` int(10) DEFAULT NULL,
  `staffPosition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.staff: ~5 rows (approximately)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`staffID`, `staffName`, `staffHours`, `staffPosition`) VALUES
	(1, 'Ahmad', 7, 'Barista'),
	(2, 'Maira', 9, 'Cashier'),
	(3, 'Raja', 8, 'Cleaner'),
	(4, 'Yan Yee', 10, 'Barista'),
	(5, 'Daniel', 6, 'Cooker');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Dumping structure for table heroku_06b55815c2349a2.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplierID` int(10) NOT NULL AUTO_INCREMENT,
  `poID` int(10) DEFAULT NULL,
  `supplierInvoice` int(10) DEFAULT NULL,
  `supplierName` varchar(50) DEFAULT NULL,
  `supplierPhone` varchar(50) DEFAULT NULL,
  `supplierAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`supplierID`),
  KEY `FK_supplier_purchasingorder` (`poID`),
  CONSTRAINT `FK_supplier_purchasingorder` FOREIGN KEY (`poID`) REFERENCES `purchasingorder` (`poID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table heroku_06b55815c2349a2.supplier: ~3 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`supplierID`, `poID`, `supplierInvoice`, `supplierName`, `supplierPhone`, `supplierAddress`) VALUES
	(1, 1, 1001, 'Syarikat Kokomas Sdn. Bhd.', '0126337880', 'No. 15, Jalan Perindustrian Maju, Desa Hartamas, 53100, Kuala Lumpur'),
	(2, 2, 1002, 'F&N Beverages', '0178903552', '80/1, Taman Permai Jaya, 01502 Kangar, Perlis'),
	(3, 3, 1003, 'Kopi Diraja Sdn. Bhd.', '0195576325', '13-2-7, Mutiara Indah, 15502 Kota Bharu, Kelantan');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
