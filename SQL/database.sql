-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 06:49 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eco_`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `bill_ship` char(1) DEFAULT NULL,
  `address_1` varchar(30) DEFAULT NULL,
  `address_2` varchar(30) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `bill_ship`, `address_1`, `address_2`, `country`, `state`, `zip`, `customer_id`) VALUES
(73, 'X', 'B/33 phase 1 First floor near ', '2323', 'Pakistan', 'Sindh', 71000, 19),
(74, 'X', 'B/33 phase 1 First floor near ', 'dasdas', 'Pakistan', 'Sindh', 71000, 22),
(75, 'X', 'B/33 phase 1 Qasim', 'sdsdsada', 'pakistan', 'sfdsdsf', 710000, 23),
(76, 'S', 'SDSADSA', 'Q2W321312', 'Pakistan', '31231231', 12, 24),
(77, 'S', 'B/33 phase 1 First floor near ', 'B/33 phase 1 First floor near ', 'Pakistan', 'Sindh', 71000, 25),
(78, 'S', '0', '0', 'India', '0', 0, 27),
(79, 'B', '0', '0', 'India', '0', 0, 27),
(80, 'S', 'house no c/80', 'street 11 , phase 3 , habib so', 'Pakistan', 'sindh', 12345, 28),
(81, 'B', 'house no c/80', 'street 11 , phase 3 , habib so', 'Pakistan', 'sindh', 12345, 28),
(82, 'S', 'house no c/90', 'street 12 , phase 3 , khan soc', 'UK', 'sindh', 12345, 29),
(83, 'B', 'house no c/90', 'street  66, phase 4 , khan soc', 'UK', 'sindh', 12345, 29),
(84, 'S', 'house no d/80', 'street 12 , phase 3 , memon so', 'UK', 'punjab', 3233, 30),
(85, 'B', 'house no s/001', 'street 11 , phase 3 ,habib soc', 'Pakistan', 'punjab', 3233, 30),
(86, 'S', 'house no d/80', 'street 12 , phase 3 , khan soc', 'Nigeria', 'balochistan', 45467, 31),
(87, 'B', 'house no s/001', 'street 11 , phase 3 , hareem s', 'Pakistan', 'balochistan', 45467, 31),
(88, 'X', 'house no e/65', 'street 11 , phase 5, habib soc', 'USA', 'punjab', 3233, 32),
(89, 'X', 'house no d/80', 'street 12 , phase 3 , khan soc', 'Pakistan', 'balochistan', 45467, 33),
(90, 'S', 'house no v/51', 'street 11 , phase 3 , habib so', 'Pakistan', 'sindh', 12345, 34),
(91, 'B', 'house no v/71', 'street 11 , phase 3 , habib so', 'Pakistan', 'sindh', 12345, 34),
(92, 'X', 'house no p/89', 'street 134 , phase 6 , memon s', 'USA', 'kpk', 56789, 35);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `role` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Electronic Devices'),
(2, 'Electronic Accessories'),
(3, 'TV & HOME APPLIANCES'),
(4, 'HEALTH & BEAUTY'),
(5, 'BABIES & TOYS'),
(6, 'PETS');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `company`, `phone_number`, `mobile_number`) VALUES
(19, NULL, '03332747037', '3332747037'),
(22, NULL, '03332747037', '3332747037'),
(23, NULL, '03456987', '3332747066'),
(24, NULL, '323232', '232323232'),
(25, NULL, '03332747037', '3332747037'),
(27, NULL, '0', '0'),
(28, NULL, '03132323829', '3363001311'),
(29, NULL, '03344594959', '3363001311'),
(30, NULL, '0453442434', '364393903'),
(31, NULL, '03383843884', '3373483933'),
(32, NULL, '03848585898', '3363885858'),
(33, NULL, '03383843884', '3373483933'),
(34, NULL, '03822390902', '3434384789'),
(35, NULL, '03344594959', '3373483933');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_no` int(11) NOT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `creationTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `cust_id` int(11) DEFAULT NULL,
  `amountPayable` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_no`, `order_status`, `creationTime`, `cust_id`, `amountPayable`) VALUES
(31, 'pendingConfirmation', '2019-10-15 12:12:42', 19, 3490),
(32, 'pendingConfirmation', '2019-01-05 12:13:04', 19, 20399),
(33, 'pendingConfirmation', '2019-02-07 12:13:41', 19, 234697),
(34, 'pendingConfirmation', '2019-07-27 11:37:29', 19, 207998),
(35, 'pendingConfirmation', '2019-09-22 12:15:12', 19, 164999),
(36, 'pendingConfirmation', '2019-01-01 12:15:40', 19, 225998),
(37, 'pendingConfirmation', '2019-09-05 12:21:05', 19, 250897),
(38, 'pendingConfirmation', '2019-04-11 12:22:44', 19, 187499),
(39, 'pendingConfirmation', '2019-05-10 12:32:49', 19, 187499),
(40, 'pendingConfirmation', '2019-03-23 13:25:37', 28, 261549),
(41, 'pendingConfirmation', '2019-01-07 13:29:35', 29, 73248),
(42, 'pendingConfirmation', '2019-10-31 13:36:43', 30, 134999),
(43, 'pendingConfirmation', '2019-11-02 13:42:01', 31, 100696),
(44, 'pendingConfirmation', '2019-09-01 13:43:21', 31, 84797),
(45, 'pendingConfirmation', '2019-07-19 13:43:59', 31, 6375),
(46, 'pendingConfirmation', '2019-06-17 13:45:01', 28, 96749),
(47, 'pendingConfirmation', '2019-05-16 13:45:38', 28, 166874),
(48, 'pendingConfirmation', '2019-02-13 13:46:05', 28, 63398),
(49, 'pendingConfirmation', '2019-03-31 13:47:04', 29, 222797),
(50, 'pendingConfirmation', '2019-04-28 19:00:00', 29, 9058),
(51, 'pendingConfirmation', '2019-08-30 13:48:41', 29, 195427),
(52, 'pendingConfirmation', '2019-12-25 19:00:00', 30, 118749),
(53, 'pendingConfirmation', '2019-12-08 13:50:30', 30, 1960),
(54, 'pendingConfirmation', '2019-11-07 13:51:47', 30, 4083),
(55, 'pendingConfirmation', '2019-10-24 13:52:57', 30, 134347),
(56, 'pendingConfirmation', '2019-12-21 13:58:48', 33, 6858),
(57, 'pendingConfirmation', '2019-09-19 13:59:38', 33, 161398),
(58, 'pendingConfirmation', '2019-08-10 14:00:20', 33, 191378),
(59, 'pendingConfirmation', '2019-07-08 14:01:21', 33, 6543),
(60, 'pendingConfirmation', '2019-06-14 14:02:29', 33, 446020),
(61, 'pendingConfirmation', '2019-05-22 14:03:27', 33, 95381),
(62, 'pendingConfirmation', '2019-04-04 14:03:59', 33, 50173),
(63, 'pendingConfirmation', '2019-03-12 14:04:26', 33, 63398),
(64, 'pendingConfirmation', '2019-02-15 14:08:00', 34, 171611),
(65, 'pendingConfirmation', '2019-12-01 14:08:39', 34, 3678),
(66, 'pendingConfirmation', '2019-01-29 14:09:12', 34, 5559),
(67, 'pendingConfirmation', '2019-05-10 14:09:42', 34, 84818),
(68, 'pendingConfirmation', '2019-11-05 14:10:17', 34, 435),
(69, 'pendingConfirmation', '2019-03-06 14:11:09', 34, 359131),
(70, 'pendingConfirmation', '2019-01-20 14:11:39', 34, 101229),
(71, 'Order Confirmed', '2019-12-11 05:19:43', 19, 128997),
(72, 'Order Confirmed', '2019-12-11 05:20:47', 19, 250997),
(73, 'Order Confirmed', '2019-12-11 05:23:50', 19, 214995),
(74, 'Order Confirmed', '2019-12-11 06:35:18', 19, 208796),
(75, 'Order Confirmed', '2019-12-11 17:23:51', 19, 237680),
(76, 'Order Confirmed', '2019-12-11 17:26:19', 19, 164999),
(77, 'Order Confirmed', '2019-12-11 17:27:07', 19, 187499),
(78, 'Order Confirmed', '2019-12-12 17:19:24', 19, 276196),
(79, 'Order Confirmed', '2019-12-12 17:19:29', 19, 42999),
(80, 'Order Confirmed', '2019-12-12 17:33:29', 19, 42999),
(81, 'Order Confirmed', '2019-12-12 17:39:14', 19, 128997),
(82, 'Order Confirmed', '2019-12-12 17:41:26', 19, 352498),
(83, 'Order Confirmed', '2019-12-12 17:44:12', 19, 207998),
(84, 'Order Confirmed', '2019-12-12 17:44:49', 19, 207998),
(85, 'Order Confirmed', '2019-12-12 17:45:07', 19, 42999),
(86, 'Order Confirmed', '2019-12-12 17:46:50', 19, 42999),
(87, 'Order Confirmed', '2019-12-12 17:48:40', 19, 20399),
(88, 'Order Confirmed', '2019-12-12 17:49:12', 19, 164999);

-- --------------------------------------------------------

--
-- Stand-in structure for view `data`
-- (See below for the actual view)
--
CREATE TABLE `data` (
`DATE(creationTime)` date
);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `item_stock` int(11) DEFAULT NULL,
  `item_price` int(11) DEFAULT NULL,
  `item_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `category_id`, `item_name`, `item_stock`, `item_price`, `item_description`) VALUES
(32, 1, 'NOKIA 2.2', 25, 20399, '5.7 HD+ Display-3GB RAM-32GB ROM-Face Unlock'),
(33, 1, 'NOKIA 7.2', 30, 42999, '6.3 FHD Display-6GB RAM-128GB ROM-Fingerprint Sensor'),
(35, 1, 'SAMSUNG GALAXY S10', 49, 164999, '6.4 Dynamic AMOLED Display-8GB RAM-512GB ROM'),
(36, 1, 'SAMSUNG GALAXY A10', 20, 22500, '6.2 Display-2GB RAM-32GB ROM'),
(37, 1, 'ONE PLUS 6T', 40, 93999, '6.41 Display-8GB RAM-128GB ROM'),
(38, 1, 'HP OMEN-15', 20, 131999, '8th Gen i5 8300H quad core, 3GB Nvidia'),
(39, 1, 'LENOVO IDEAPAD 330', 25, 41499, 'Inter Celeron, 15.6HD Display-4GB RAM- 1TB HDD'),
(40, 1, 'PLAYSTATION 4 SLIM', 50, 49299, 'Jet Black Ps4 500GB- Region 2'),
(41, 1, 'D5600, DSLAR CAMERA', 10, 96000, '24.2 MP with AF-P DX NIKKOR LENS, Black'),
(42, 2, 'SAMSUNG NOTE 8 CASE', 50, 350, 'Shock proof phone case'),
(43, 2, 'IPHONE X SILICON COVER', 60, 399, 'Matte soft, Ultra thin'),
(44, 2, 'MI AIRPOD SILICON CASE', 30, 299, 'Scratch proof cover'),
(45, 2, 'RONIN POWERBANK 11000MAh', 25, 2099, 'Dual USB power bank'),
(46, 2, 'ASPOR POWERBANK 12000MAh', 30, 1950, 'Dual USB, fast charging'),
(47, 3, 'SONY BRAVIA REMOTE CONTROL', 20, 550, 'Universal remote for lcd/led TV'),
(48, 3, 'X96 ANDROID SMART TV', 30, 3480, 'Quadcore 1GB/8GB TV Box'),
(49, 3, 'DAWLANCE BLENDER', 40, 5999, 'DWT-510W'),
(50, 3, 'WESTPOINT ELECTRIC KETTLE', 15, 4999, '2.0 Litre silver'),
(51, 4, 'VASELINE HAND CREAM', 60, 550, 'Advanced repair hand cream 75ml'),
(52, 4, 'FOG SCENT PERFUME', 50, 235, 'Perfume for men 100ml'),
(53, 4, 'ROYALE BLUE PERFUME', 40, 425, 'for women, 24 hour lasting, 100ml'),
(54, 5, 'NESTLE NIDO', 100, 150, '150gm-Growing up formula'),
(55, 5, 'BF-2 POWDER MILK', 150, 2250, '400gm-Growing up formula milk powder'),
(56, 5, 'BABY WALKER', 50, 1450, 'Walking assistance, Safety belt'),
(57, 5, 'ALPHABET PLAY MAT', 30, 2100, 'Soft foam, NON-slip'),
(58, 6, 'CAT FOOD BOWL', 50, 194, 'Double bowl, available in various colours'),
(59, 6, 'CAT PERFUME SHAMPOO', 30, 320, 'Luxury scented perfume'),
(60, 6, 'DOG CHAIN NECKLACE', 20, 3134, 'stainless steel necklace'),
(61, 6, 'CAT COLLAR', 50, 119, 'New leather look');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `quantity` int(11) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`quantity`, `order_no`, `item_id`, `timestamp`) VALUES
(1, 31, 48, '2019-12-07 12:12:42'),
(1, 32, 32, '2019-12-07 12:13:04'),
(1, 33, 40, '2019-12-07 12:13:41'),
(1, 33, 35, '2019-12-07 12:13:41'),
(1, 33, 32, '2019-12-07 12:13:41'),
(1, 34, 33, '2019-12-10 11:37:29'),
(1, 34, 35, '2019-12-10 11:37:29'),
(5, 35, 35, '2019-12-10 12:15:12'),
(1, 35, 36, '2019-12-10 12:15:12'),
(1, 35, 36, '2019-12-10 12:15:12'),
(1, 35, 33, '2019-12-10 12:15:12'),
(5, 35, 35, '2019-12-10 12:15:12'),
(5, 35, 35, '2019-12-10 12:15:12'),
(2, 36, 37, '2019-12-10 12:15:40'),
(2, 36, 38, '2019-12-10 12:15:40'),
(4, 37, 33, '2019-12-10 12:21:05'),
(2, 37, 35, '2019-12-10 12:21:05'),
(2, 37, 32, '2019-12-10 12:21:05'),
(2, 37, 36, '2019-12-10 12:21:05'),
(1, 38, 36, '2019-12-10 12:22:44'),
(1, 38, 35, '2019-12-10 12:22:44'),
(1, 39, 48, '2019-12-10 12:32:49'),
(1, 39, 48, '2019-12-10 12:32:49'),
(1, 39, 48, '2019-12-10 12:32:49'),
(1, 39, 33, '2019-12-10 12:32:49'),
(1, 39, 33, '2019-12-10 12:32:49'),
(1, 39, 33, '2019-12-10 12:32:49'),
(1, 39, 35, '2019-12-10 12:32:49'),
(1, 39, 36, '2019-12-10 12:32:49'),
(1, 40, 35, '2019-12-10 13:25:38'),
(1, 40, 41, '2019-12-10 13:25:38'),
(1, 40, 51, '2019-12-10 13:25:38'),
(1, 41, 32, '2019-12-10 13:29:35'),
(1, 41, 40, '2019-12-10 13:29:35'),
(1, 41, 46, '2019-12-10 13:29:35'),
(1, 41, 56, '2019-12-10 13:29:35'),
(1, 41, 54, '2019-12-10 13:29:35'),
(1, 42, 57, '2019-12-10 13:36:43'),
(1, 42, 38, '2019-12-10 13:36:43'),
(3, 42, 42, '2019-12-10 13:36:43'),
(2, 42, 47, '2019-12-10 13:36:43'),
(6, 43, 43, '2019-12-10 13:42:01'),
(3, 43, 44, '2019-12-10 13:42:01'),
(1, 43, 37, '2019-12-10 13:42:01'),
(1, 43, 49, '2019-12-10 13:42:01'),
(3, 44, 32, '2019-12-10 13:43:21'),
(5, 44, 39, '2019-12-10 13:43:21'),
(2, 44, 43, '2019-12-10 13:43:21'),
(2, 44, 36, '2019-12-10 13:43:21'),
(10, 45, 57, '2019-12-10 13:43:59'),
(1, 45, 48, '2019-12-10 13:44:00'),
(2, 45, 47, '2019-12-10 13:44:00'),
(1, 45, 52, '2019-12-10 13:44:00'),
(2, 46, 37, '2019-12-10 13:45:01'),
(1, 46, 42, '2019-12-10 13:45:01'),
(4, 46, 55, '2019-12-10 13:45:01'),
(2, 46, 54, '2019-12-10 13:45:01'),
(6, 47, 53, '2019-12-10 13:45:38'),
(3, 47, 56, '2019-12-10 13:45:38'),
(1, 47, 35, '2019-12-10 13:45:38'),
(1, 48, 33, '2019-12-10 13:46:05'),
(1, 48, 32, '2019-12-10 13:46:05'),
(2, 49, 40, '2019-12-10 13:47:04'),
(2, 49, 38, '2019-12-10 13:47:04'),
(2, 49, 39, '2019-12-10 13:47:04'),
(1, 50, 46, '2019-12-10 13:47:32'),
(1, 50, 45, '2019-12-10 13:47:32'),
(1, 50, 50, '2019-12-10 13:47:32'),
(5, 51, 47, '2019-12-10 13:48:41'),
(5, 51, 48, '2019-12-10 13:48:41'),
(2, 51, 49, '2019-12-10 13:48:41'),
(1, 51, 35, '2019-12-10 13:48:41'),
(1, 51, 32, '2019-12-10 13:48:41'),
(7, 52, 37, '2019-12-10 13:50:05'),
(10, 52, 54, '2019-12-10 13:50:05'),
(2, 52, 57, '2019-12-10 13:50:05'),
(1, 52, 36, '2019-12-10 13:50:05'),
(4, 53, 46, '2019-12-10 13:50:30'),
(9, 54, 58, '2019-12-10 13:51:47'),
(2, 54, 60, '2019-12-10 13:51:47'),
(2, 54, 53, '2019-12-10 13:51:47'),
(3, 54, 59, '2019-12-10 13:51:47'),
(3, 55, 51, '2019-12-10 13:52:57'),
(5, 55, 39, '2019-12-10 13:52:57'),
(1, 55, 40, '2019-12-10 13:52:57'),
(1, 55, 33, '2019-12-10 13:52:58'),
(1, 56, 42, '2019-12-10 13:58:48'),
(3, 56, 47, '2019-12-10 13:58:48'),
(1, 56, 46, '2019-12-10 13:58:48'),
(1, 56, 59, '2019-12-10 13:58:48'),
(2, 56, 60, '2019-12-10 13:58:49'),
(1, 56, 53, '2019-12-10 13:58:49'),
(1, 56, 61, '2019-12-10 13:58:49'),
(1, 57, 32, '2019-12-10 13:59:38'),
(1, 57, 33, '2019-12-10 13:59:38'),
(5, 57, 41, '2019-12-10 13:59:38'),
(2, 57, 51, '2019-12-10 13:59:38'),
(2, 57, 56, '2019-12-10 13:59:38'),
(1, 58, 43, '2019-12-10 14:00:20'),
(0, 58, 36, '2019-12-10 14:00:20'),
(1, 58, 35, '2019-12-10 14:00:20'),
(1, 58, 48, '2019-12-10 14:00:20'),
(1, 59, 44, '2019-12-10 14:01:21'),
(1, 59, 52, '2019-12-10 14:01:21'),
(2, 59, 49, '2019-12-10 14:01:21'),
(1, 60, 38, '2019-12-10 14:02:29'),
(1, 60, 40, '2019-12-10 14:02:29'),
(1, 60, 54, '2019-12-10 14:02:29'),
(3, 60, 59, '2019-12-10 14:02:29'),
(3, 60, 60, '2019-12-10 14:02:29'),
(1, 60, 61, '2019-12-10 14:02:29'),
(2, 60, 41, '2019-12-10 14:02:29'),
(1, 60, 35, '2019-12-10 14:02:29'),
(3, 61, 58, '2019-12-10 14:03:27'),
(3, 61, 59, '2019-12-10 14:03:27'),
(1, 61, 61, '2019-12-10 14:03:27'),
(1, 61, 37, '2019-12-10 14:03:27'),
(4, 61, 42, '2019-12-10 14:03:27'),
(1, 61, 43, '2019-12-10 14:03:27'),
(1, 62, 53, '2019-12-10 14:03:59'),
(1, 62, 54, '2019-12-10 14:03:59'),
(1, 62, 40, '2019-12-10 14:03:59'),
(1, 62, 44, '2019-12-10 14:03:59'),
(8, 63, 32, '2019-12-10 14:04:26'),
(9, 63, 33, '2019-12-10 14:04:26'),
(1, 64, 61, '2019-12-10 14:08:00'),
(1, 64, 58, '2019-12-10 14:08:00'),
(1, 64, 55, '2019-12-10 14:08:00'),
(1, 64, 45, '2019-12-10 14:08:00'),
(1, 64, 46, '2019-12-10 14:08:00'),
(1, 64, 35, '2019-12-10 14:08:00'),
(1, 65, 44, '2019-12-10 14:08:39'),
(2, 65, 52, '2019-12-10 14:08:39'),
(4, 65, 60, '2019-12-10 14:08:39'),
(15, 66, 51, '2019-12-10 14:09:12'),
(1, 66, 50, '2019-12-10 14:09:13'),
(1, 67, 33, '2019-12-10 14:09:42'),
(1, 67, 39, '2019-12-10 14:09:42'),
(4, 67, 59, '2019-12-10 14:09:42'),
(7, 68, 53, '2019-12-10 14:10:17'),
(3, 69, 52, '2019-12-10 14:11:09'),
(2, 69, 39, '2019-12-10 14:11:09'),
(1, 69, 38, '2019-12-10 14:11:09'),
(1, 69, 35, '2019-12-10 14:11:09'),
(1, 69, 32, '2019-12-10 14:11:09'),
(1, 70, 41, '2019-12-10 14:11:39'),
(1, 70, 44, '2019-12-10 14:11:39'),
(1, 70, 48, '2019-12-10 14:11:39'),
(1, 70, 56, '2019-12-10 14:11:39'),
(3, 71, 33, '2019-12-11 05:19:43'),
(2, 72, 33, '2019-12-11 05:20:47'),
(1, 72, 35, '2019-12-11 05:20:47'),
(5, 73, 33, '2019-12-11 05:23:50'),
(2, 74, 43, '2019-12-11 06:35:18'),
(1, 74, 33, '2019-12-11 06:35:18'),
(1, 74, 35, '2019-12-11 06:35:18'),
(1, 75, 33, '2019-12-11 17:23:51'),
(1, 75, 35, '2019-12-11 17:23:51'),
(1, 75, 36, '2019-12-11 17:23:51'),
(18, 75, 43, '2019-12-11 17:23:51'),
(1, 76, 35, '2019-12-11 17:26:19'),
(1, 77, 35, '2019-12-11 17:27:07'),
(1, 77, 36, '2019-12-11 17:27:07'),
(1, 78, 32, '2019-12-12 17:19:24'),
(1, 78, 35, '2019-12-12 17:19:24'),
(1, 78, 39, '2019-12-12 17:19:24'),
(1, 78, 40, '2019-12-12 17:19:24'),
(1, 79, 33, '2019-12-12 17:19:29'),
(1, 80, 33, '2019-12-12 17:33:29'),
(3, 81, 33, '2019-12-12 17:39:14'),
(2, 82, 35, '2019-12-12 17:41:26'),
(1, 82, 36, '2019-12-12 17:41:26'),
(1, 83, 33, '2019-12-12 17:44:12'),
(1, 83, 35, '2019-12-12 17:44:12'),
(1, 84, 33, '2019-12-12 17:44:49'),
(1, 84, 35, '2019-12-12 17:44:49'),
(1, 85, 33, '2019-12-12 17:45:07'),
(1, 86, 33, '2019-12-12 17:46:50'),
(1, 87, 32, '2019-12-12 17:48:40'),
(1, 88, 35, '2019-12-12 17:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `item_rating` int(11) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`item_rating`, `comment`, `customer_id`, `item_id`, `timestamp`) VALUES
(10, 'Excellent!', 19, 48, '2019-12-12 16:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_partner` varchar(20) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipping_partner`, `method`, `cost`, `order_no`, `address_id`, `timestamp`) VALUES
(NULL, NULL, 10, 31, 73, '2019-12-07 12:12:42'),
(NULL, NULL, 0, 32, 73, '2019-12-07 12:13:04'),
(NULL, NULL, 0, 33, 73, '2019-12-07 12:13:41'),
(NULL, NULL, 0, 34, 73, '2019-12-10 11:37:29'),
(NULL, NULL, 0, 35, 73, '2019-12-10 12:15:12'),
(NULL, NULL, 0, 36, 73, '2019-12-10 12:15:40'),
(NULL, NULL, 0, 37, 73, '2019-12-10 12:21:05'),
(NULL, NULL, 0, 38, 73, '2019-12-10 12:22:44'),
(NULL, NULL, 0, 39, 73, '2019-12-10 12:32:49'),
(NULL, NULL, 0, 40, 80, '2019-12-10 13:25:38'),
(NULL, NULL, 0, 41, 82, '2019-12-10 13:29:35'),
(NULL, NULL, 0, 42, 84, '2019-12-10 13:36:43'),
(NULL, NULL, 0, 43, 86, '2019-12-10 13:42:01'),
(NULL, NULL, 0, 44, 86, '2019-12-10 13:43:21'),
(NULL, NULL, 10, 45, 86, '2019-12-10 13:44:00'),
(NULL, NULL, 0, 46, 80, '2019-12-10 13:45:01'),
(NULL, NULL, 0, 47, 80, '2019-12-10 13:45:39'),
(NULL, NULL, 0, 48, 80, '2019-12-10 13:46:06'),
(NULL, NULL, 0, 49, 82, '2019-12-10 13:47:05'),
(NULL, NULL, 10, 50, 82, '2019-12-10 13:47:32'),
(NULL, NULL, 0, 51, 82, '2019-12-10 13:48:41'),
(NULL, NULL, 0, 52, 84, '2019-12-10 13:50:05'),
(NULL, NULL, 10, 53, 84, '2019-12-10 13:50:30'),
(NULL, NULL, 10, 54, 84, '2019-12-10 13:51:48'),
(NULL, NULL, 0, 55, 84, '2019-12-10 13:52:58'),
(NULL, NULL, 10, 56, 89, '2019-12-10 13:58:49'),
(NULL, NULL, 0, 57, 89, '2019-12-10 13:59:38'),
(NULL, NULL, 0, 58, 89, '2019-12-10 14:00:21'),
(NULL, NULL, 10, 59, 89, '2019-12-10 14:01:21'),
(NULL, NULL, 0, 60, 89, '2019-12-10 14:02:29'),
(NULL, NULL, 0, 61, 89, '2019-12-10 14:03:27'),
(NULL, NULL, 0, 62, 89, '2019-12-10 14:04:00'),
(NULL, NULL, 0, 63, 89, '2019-12-10 14:04:26'),
(NULL, NULL, 0, 64, 90, '2019-12-10 14:08:00'),
(NULL, NULL, 10, 65, 90, '2019-12-10 14:08:40'),
(NULL, NULL, 10, 66, 90, '2019-12-10 14:09:13'),
(NULL, NULL, 0, 67, 90, '2019-12-10 14:09:42'),
(NULL, NULL, 10, 68, 90, '2019-12-10 14:10:17'),
(NULL, NULL, 0, 69, 90, '2019-12-10 14:11:09'),
(NULL, NULL, 0, 70, 90, '2019-12-10 14:11:39'),
(NULL, NULL, 0, 71, 73, '2019-12-11 05:19:43'),
(NULL, NULL, 0, 72, 73, '2019-12-11 05:20:47'),
(NULL, NULL, 0, 73, 73, '2019-12-11 05:23:50'),
(NULL, NULL, 0, 74, 73, '2019-12-11 06:35:18'),
(NULL, NULL, 0, 75, 73, '2019-12-11 17:23:51'),
('TCS', 'Cash On Delivery', 0, 77, 73, '2019-12-11 17:27:07'),
('TCS', 'Cash On Delivery', 0, 78, 73, '2019-12-12 17:19:24'),
('TCS', 'Cash On Delivery', 0, 79, 73, '2019-12-12 17:19:29'),
('TCS', 'Cash On Delivery', 0, 80, 73, '2019-12-12 17:33:29'),
('TCS', 'Cash On Delivery', 0, 81, 73, '2019-12-12 17:39:14'),
('TCS', 'Cash On Delivery', 0, 82, 73, '2019-12-12 17:41:26'),
('TCS', 'Cash On Delivery', 0, 83, 73, '2019-12-12 17:44:12'),
('TCS', 'Cash On Delivery', 0, 84, 73, '2019-12-12 17:44:49'),
('TCS', 'Cash On Delivery', 0, 85, 73, '2019-12-12 17:45:07'),
('TCS', 'Cash On Delivery', 0, 86, 73, '2019-12-12 17:46:50'),
('TCS', 'Cash On Delivery', 0, 87, 73, '2019-12-12 17:48:40'),
('TCS', 'Cash On Delivery', 0, 88, 73, '2019-12-12 17:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_item`
--

CREATE TABLE `shopping_item` (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_quantity` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(40) DEFAULT NULL,
  `l_name` varchar(40) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `email`, `password`, `timestamp`) VALUES
(19, 'Abdul', 'Basit', 'test@gmail.com', '$2y$10$XAZll9MmIgpm5abZJdzC2OjVO6lxd2e7WQv3WjoYB5dotTtoAJcFO', '2019-09-07 20:55:55'),
(22, 'Abdul', 'Basit', 'webaccess@gmail.com', '$2y$10$PT8gKjf/O2P1LZfDq0Nao.R68tTQT2y8ZRpXMfDZGIzypNnW85SlW', '2019-12-07 13:53:37'),
(23, 'Zaeeem', 'Ahmed', 'zaeemahmed@gmail.com', '$2y$10$pbrcT.9ACP0XJ7YYiN/l3OI/t1lotEuoSxN8ZJq7TuazFEQMeuJ1G', '2019-11-11 11:47:40'),
(24, 'Hamza', 'NaviWala', 'hamza@gmail.com', '$2y$10$oj73.F6fJAYEJneVU6l.vOpE0Fr8UWFLsAuF/qbKBaFmshvy4kdJS', '2019-12-10 12:36:37'),
(25, 'Abdul', 'Basit', 'test1@gmail.com', '$2y$10$1VCu9Y38gInZyYsDO7AkTOro9tLz8MExAZvdfkGhE.3YjzeKCbqeO', '2019-11-03 12:37:57'),
(27, 'Abdul', 'Basit', 'test55@GMAIL.COM', '$2y$10$kcqyk0acImSItMVUO0YN7O8C4dPTHTbFIavzAWyOdChgwCJkQMoAi', '2019-12-10 12:39:32'),
(28, 'Wajih', 'iqbal', 'wajihc12019@yahoo.com', '$2y$10$kTVK6b4mKWvuPK9E0n2a7uNVzLherxaqACiFp5BmzmvXr.fv508gm', '2019-09-08 13:24:48'),
(29, 'ahmed', 'javed', 'ahmed12@yahoo.com', '$2y$10$UreniSwhFar409OtEpapkeGMop7X4.McQbUinGE4iL.yCus1BTngG', '2019-12-10 13:28:51'),
(30, 'KHALID', 'JAMEEL', 'khjameel@gmail.com', '$2y$10$KT187lVhchwX3ZDKOcgz2ORBC5t37QeiGEH8OtqdyuVDH8975BRb6', '2019-12-01 13:35:45'),
(31, 'amaaz', 'arshad', 'arshad66@hotmail.com', '$2y$10$gwtQBM74HwSyd1gTIKi0d.58.trCqM0TBwSu/2yRepZNfXkY88fNO', '2019-09-08 13:41:14'),
(32, 'zahid', 'khalil', 'zahid45@yahoo.com', '$2y$10$3V4JHUe3amwa1wAHxXrHHOtXxINP.6zzARNIxu1Qr7c2FDpWNxcm.', '2019-12-10 13:55:39'),
(33, 'khabib', 'amrish', 'khabib690@gmail.com', '$2y$10$1lPvHSVHE9qDMd.WnnZ85uLftSjpu2BP6EcFETL9sPE7mkSCWANTi', '2019-12-10 13:57:59'),
(34, 'habib', 'ahmed', 'habib900@gmail.com', '$2y$10$ZvoIUwVyDnb0zwZt4wNKeuAmiJVi/rpfrwBguN.oWwphajIodOWQW', '2019-11-03 14:07:16'),
(35, 'akbar ', 'jahangir', 'akbar019@yahoo.com', '$2y$10$CGb4NBaiJTu4nsfbkNVjuOHjJfGqc3v4IX7xPAe1khF3WMCmOPuPa', '2019-12-10 14:17:57');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v1`
-- (See below for the actual view)
--
CREATE TABLE `v1` (
`item_id` int(11)
,`item_quantity` int(11) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

CREATE TABLE `wish_list` (
  `customer_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wish_list`
--

INSERT INTO `wish_list` (`customer_id`, `item_id`) VALUES
(19, 33),
(19, 36),
(19, 42),
(19, 43),
(19, 48),
(19, 50);

-- --------------------------------------------------------

--
-- Structure for view `data`
--
DROP TABLE IF EXISTS `data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data`  AS  select cast(`customer_order`.`creationTime` as date) AS `DATE(creationTime)` from `customer_order` ;

-- --------------------------------------------------------

--
-- Structure for view `v1`
--
DROP TABLE IF EXISTS `v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v1`  AS  select `shopping_item`.`item_id` AS `item_id`,`shopping_item`.`item_quantity` AS `item_quantity` from `shopping_item` where `shopping_item`.`cart_id` in (select `shopping_cart`.`cart_id` from `shopping_cart` where `shopping_cart`.`customer_id` = 19 and `shopping_cart`.`cart_id` is not null) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `Address_Customer` (`customer_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `Admin_User` (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD KEY `Customer_User` (`customer_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `Item_Category` (`category_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD KEY `Order_item_Customer_order` (`order_no`),
  ADD KEY `Order_item_Item` (`item_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`customer_id`,`item_id`),
  ADD KEY `Review_Customer` (`customer_id`),
  ADD KEY `Review_Item` (`item_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`order_no`,`address_id`),
  ADD KEY `Shipping_Customer_order` (`order_no`),
  ADD KEY `Shipping_Address` (`address_id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `Shopping_cart_Customer` (`customer_id`);

--
-- Indexes for table `shopping_item`
--
ALTER TABLE `shopping_item`
  ADD PRIMARY KEY (`cart_id`,`item_id`),
  ADD KEY `Shopping_item_Shopping_cart` (`cart_id`),
  ADD KEY `Shopping_item_Item` (`item_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`customer_id`,`item_id`),
  ADD KEY `Wish_list_Customer` (`customer_id`),
  ADD KEY `Wish_list_Item` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `Address_Customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `Admin_User` FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_User` FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `Item_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `Order_item_Customer_order` FOREIGN KEY (`order_no`) REFERENCES `customer_order` (`order_no`),
  ADD CONSTRAINT `Order_item_Item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `Review_Customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `Review_Item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `Shipping_Address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `Shipping_Customer_order` FOREIGN KEY (`order_no`) REFERENCES `customer_order` (`order_no`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `Shopping_cart_Customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `shopping_item`
--
ALTER TABLE `shopping_item`
  ADD CONSTRAINT `Shopping_item_Item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `Shopping_item_Shopping_cart` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`cart_id`);

--
-- Constraints for table `wish_list`
--
ALTER TABLE `wish_list`
  ADD CONSTRAINT `Wish_list_Customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `Wish_list_Item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
