-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2024 at 02:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant_reservation_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `RestaurantID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Name`, `Email`, `Password`, `RestaurantID`) VALUES
(1, 'Admin1', 'admin1.kfc@gmail.com', 'password123', 1),
(2, 'Admin2', 'admin2.pizzahut@gmail.com', 'password456', 2),
(3, 'Admin3', 'admin3.burgerking@gmail.com', 'password789', 3),
(4, 'Admin4', 'admin4.dominos@gmail.com', 'password101', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Name`, `Phone`, `Email`) VALUES
(1, 'Tasnim Era', '01611744381', 'jarin@gmail.com'),
(2, 'Rakib Hasan', '01789834538', 'rakib@gmail.com'),
(3, 'Nadia Islam', '01812345678', 'nadia@gmail.com'),
(4, 'Asif Mahmud', '01912345678', 'asif@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `MenuItemID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MenuItemID`, `Name`, `Price`) VALUES
(1, 'Chicken Fry', 80.99),
(2, 'Burger', 300.00),
(3, 'Pizza', 250.00),
(4, 'Pasta', 150.00),
(5, 'Soft Drink', 50.00),
(6, 'Ice Cream', 120.00),
(7, 'Chicken Chowmein', 300.00),
(8, 'Fried Rice', 80.00),
(9, 'Caesar Salad', 180.00),
(10, 'Wonton', 220.00),
(11, 'Cold Coffee', 100.00),
(12, 'Fish and Chips', 350.00),
(13, 'French Fry', 400.00),
(14, 'Lemonade', 60.00),
(15, 'Thai Soup', 150.00),
(16, ' Chicken Momo', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderID`, `MenuItemID`, `Quantity`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 5, 2),
(3, 4, 1),
(3, 6, 1),
(4, 1, 3),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_`
--

CREATE TABLE `order_` (
  `OrderID` int(11) NOT NULL,
  `ReservationID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_`
--

INSERT INTO `order_` (`OrderID`, `ReservationID`, `CustomerID`, `OrderDate`) VALUES
(1, 1, 1, '2024-09-05'),
(2, 2, 2, '2024-09-06'),
(3, 3, 3, '2024-09-07'),
(4, 4, 4, '2024-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `TableID` int(11) DEFAULT NULL,
  `ReservationDate` date NOT NULL,
  `ReservationTime` time NOT NULL
) ;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `CustomerID`, `TableID`, `ReservationDate`, `ReservationTime`) VALUES
(1, 1, 1, '2024-09-05', '19:00:00'),
(2, 2, 3, '2024-09-06', '18:00:00'),
(3, 3, 5, '2024-09-07', '19:30:00'),
(4, 4, 7, '2024-09-08', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `RestaurantID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`RestaurantID`, `Name`, `Location`) VALUES
(1, 'KFC', 'Mohammadpur'),
(2, 'Pizza Hut', 'Dhanmondi'),
(3, 'Burger King', 'Banani'),
(4, 'Domino\'s', 'Gulshan');

-- --------------------------------------------------------

--
-- Table structure for table `tableofrestaurent`
--

CREATE TABLE `tableofrestaurent` (
  `TableID` int(11) NOT NULL,
  `RestaurantID` int(11) DEFAULT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tableofrestaurent`
--

INSERT INTO `tableofrestaurent` (`TableID`, `RestaurantID`, `Capacity`) VALUES
(1, 1, 4),
(2, 1, 2),
(3, 2, 4),
(4, 2, 6),
(5, 3, 2),
(6, 3, 4),
(7, 4, 8),
(8, 4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuItemID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderID`,`MenuItemID`),
  ADD KEY `MenuItemID` (`MenuItemID`);

--
-- Indexes for table `order_`
--
ALTER TABLE `order_`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ReservationID` (`ReservationID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`),
  ADD KEY `TableID` (`TableID`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`RestaurantID`);

--
-- Indexes for table `tableofrestaurent`
--
ALTER TABLE `tableofrestaurent`
  ADD PRIMARY KEY (`TableID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order_` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`MenuItemID`) REFERENCES `menu` (`MenuItemID`);

--
-- Constraints for table `order_`
--
ALTER TABLE `order_`
  ADD CONSTRAINT `order__ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`),
  ADD CONSTRAINT `order__ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`TableID`) REFERENCES `tableofrestaurent` (`TableID`);

--
-- Constraints for table `tableofrestaurent`
--
ALTER TABLE `tableofrestaurent`
  ADD CONSTRAINT `tableofrestaurent_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
