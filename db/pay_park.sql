-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 07, 2020 at 01:42 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pay_park`
--

-- --------------------------------------------------------

--
-- Table structure for table `pp_agent_location`
--

CREATE TABLE `pp_agent_location` (
  `record_id` bigint(20) NOT NULL,
  `avenue_id` int(11) NOT NULL,
  `agent_id` bigint(20) NOT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `agent_loc_status` enum('Active','Closed') NOT NULL DEFAULT 'Active',
  `closed_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pp_agent_location`
--

INSERT INTO `pp_agent_location` (`record_id`, `avenue_id`, `agent_id`, `start_date`, `end_date`, `agent_loc_status`, `closed_by`) VALUES
(8, 10, 2, '2019-10-17 18:12:49', NULL, 'Active', 1),
(9, 5, 1, '2019-10-19 12:36:27', NULL, 'Active', 1),
(17, 111003, 5, '2020-01-08 16:47:38', NULL, 'Active', 1),
(18, 1, 6, '2020-01-08 16:58:04', NULL, 'Active', 1),
(19, 14, 4, '2020-01-09 14:12:40', NULL, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pp_car_plates`
--

CREATE TABLE `pp_car_plates` (
  `plate_num` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_car_plates`
--

INSERT INTO `pp_car_plates` (`plate_num`, `user_id`, `registration_date`) VALUES
('RAA001', 5, '2020-02-03 15:37:26'),
('RAC247C', 1, '2019-11-11 14:04:47'),
('RAC247D', 2, '2020-01-08 15:53:17'),
('RAC247E', 2, '2020-02-03 10:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `pp_locations`
--

CREATE TABLE `pp_locations` (
  `location_id` bigint(20) NOT NULL,
  `region` varchar(256) NOT NULL,
  `location_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pp_locations`
--

INSERT INTO `pp_locations` (`location_id`, `region`, `location_name`) VALUES
(5, 'Gasabo', 'Kimihurura'),
(6, 'Gasabo', 'kacyiru'),
(7, 'Gasabo', 'kimironko'),
(8, 'Gasabo', 'Nyabugogo'),
(10, 'Nyarugenge', 'Nyamirambo'),
(11, '0', 'Musanze'),
(12, '0', 'Remera'),
(13, '0', 'Kibagabaga'),
(15, 'yves', 'Gatsata'),
(17, '0', 'Kibuye');

-- --------------------------------------------------------

--
-- Table structure for table `pp_parking_agents`
--

CREATE TABLE `pp_parking_agents` (
  `agent_id` bigint(20) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `telephone_number` varchar(15) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `nid_number` varchar(255) NOT NULL,
  `agent_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `PIN` varchar(100) NOT NULL,
  `created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pp_parking_agents`
--

INSERT INTO `pp_parking_agents` (`agent_id`, `agent_name`, `telephone_number`, `date_of_birth`, `gender`, `nid_number`, `agent_status`, `PIN`, `created_At`, `updated_At`) VALUES
(13, 'as', '0782980090', '2019-10-16', 'Female', '12345678909', 'Active', '$argon2i$v=19$m=65536,t=4,p=1$OXg0SVh2M0NTZEE2TmtCZQ$+gXE49Ph85NSK3A9W4k5gfqontmb4YfkJKrPIp3O/Q4', '2020-02-15 13:01:12', '2020-02-16 10:55:10'),
(14, 'as', '0782981090', '2019-10-16', 'Female', '12345678909', 'Active', '$argon2i$v=19$m=65536,t=4,p=1$bWxwYWU1MlBZbXhxMTJyaA$f7elKJsFIQ+gyTV3jE4i8Bab7SRBubc8ALOwSkJ+dRU', '2020-02-15 13:03:42', '2020-02-15 13:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `pp_parking_products`
--

CREATE TABLE `pp_parking_products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` float(10,2) NOT NULL,
  `product_icon` varchar(255) NOT NULL,
  `fine_value` float NOT NULL,
  `apply_after` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pp_parking_products`
--

INSERT INTO `pp_parking_products` (`product_id`, `product_name`, `product_price`, `product_icon`, `fine_value`, `apply_after`) VALUES
(1, 'car', 500.00, '/images', 10, 1),
(2, 'MOTO', 100.00, '/images', 10, 30),
(3, 'Bus', 600.00, '/images', 2, 2),
(4, 'Moto', 1000.00, '/images', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pp_parking_supervisors`
--

CREATE TABLE `pp_parking_supervisors` (
  `supervisor_id` int(11) NOT NULL,
  `supervisor_name` varchar(255) NOT NULL,
  `telephone_number` varchar(15) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `nid_number` varchar(255) NOT NULL,
  `supervisor_status` enum('Active','Inactive') NOT NULL,
  `quartier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_parking_supervisors`
--

INSERT INTO `pp_parking_supervisors` (`supervisor_id`, `supervisor_name`, `telephone_number`, `gender`, `nid_number`, `supervisor_status`, `quartier_id`) VALUES
(1, 'Yves', '0780348088', 'male', '77777777777', 'Active', 11);

-- --------------------------------------------------------

--
-- Table structure for table `pp_parking_tickets`
--

CREATE TABLE `pp_parking_tickets` (
  `ticket_no` bigint(20) NOT NULL,
  `number_plate` varchar(10) NOT NULL,
  `location_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `status` enum('IN_PARKING','PAID','OUT_PARKING','') NOT NULL DEFAULT 'IN_PARKING',
  `date_time_out` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_At` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pp_parking_tickets`
--

INSERT INTO `pp_parking_tickets` (`ticket_no`, `number_plate`, `location_id`, `agent_id`, `status`, `date_time_out`, `product_id`, `created_At`, `updated_At`) VALUES
(1, '1090494090', 6, 1, 'PAID', '2020-01-08 17:48:08', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(2, '10049000', 5, 1, 'PAID', '2019-10-18 19:21:07', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(3, '90784578', 7, 0, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(4, 'RAD545V', 5, 1, 'OUT_PARKING', '2019-10-18 19:21:39', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(5, '8987', 5, 1, 'PAID', '2019-10-18 18:11:03', 2, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(6, 'RAC#$%Z', 11, 1, 'PAID', '2019-11-15 10:37:09', 2, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(7, 'RAC500Z', 7, 2, 'PAID', '2020-01-05 21:22:55', 3, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(8, 'RAC500Z', 5, 2, 'IN_PARKING', NULL, 2, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(9, 'RAC500Z', 5, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(10, 'RAC500Z', 5, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(11, 'RAC500Z', 5, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(12, 'RAC500Z', 5, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(13, 'RAC500Z', 5, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(14, 'RAC247A', 5, 1, 'PAID', NULL, 1, '2020-02-08 16:07:20', '2020-02-15 10:27:41'),
(15, 'RAC600Z', 5, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(16, 'RAC500Z', 6, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(17, 'RAC500G', 6, 2, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(18, 'RAC500Y', 1, 2, 'PAID', '2020-01-10 13:48:12', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(19, 'RAC500A', 14, 1, 'PAID', '2020-01-10 13:47:18', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(20, 'RAC500N', 19, 2, 'PAID', '2020-01-13 13:34:30', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(21, 'RAC247E', 5, 1, 'PAID', '2020-02-03 17:47:25', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(22, 'RAA001A', 5, 1, 'OUT_PARKING', '2020-02-04 15:34:20', 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05'),
(23, 'RAA001A', 5, 1, 'IN_PARKING', NULL, 1, '2020-02-08 16:07:20', '2020-02-08 18:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `pp_sms`
--

CREATE TABLE `pp_sms` (
  `smsId` int(11) NOT NULL,
  `telephone_number` varchar(25) NOT NULL,
  `body` varchar(100) NOT NULL,
  `sent` int(11) NOT NULL,
  `created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_At` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_sms`
--

INSERT INTO `pp_sms` (`smsId`, `telephone_number`, `body`, `sent`, `created_At`, `updated_At`) VALUES
(1, '0782980090', 'Your PIN is : 9185', 0, '2020-02-15 11:20:38', '2020-02-15 11:20:38'),
(2, '0782980090', 'Your PIN is : 3495', 0, '2020-02-15 13:01:12', '2020-02-15 13:01:12'),
(3, '0782981090', 'Your PIN is : 9844', 0, '2020-02-15 13:03:42', '2020-02-15 13:03:42'),
(4, '0782980090', 'Your PIN is : 1451', 0, '2020-02-15 13:24:24', '2020-02-15 13:24:24'),
(5, '0782980090', 'Your PIN is : 8999', 0, '2020-02-15 13:24:42', '2020-02-15 13:24:42'),
(6, '0782980090', 'Your PIN is : 6042', 0, '2020-02-16 10:55:10', '2020-02-16 10:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `pp_supervisor_location`
--

CREATE TABLE `pp_supervisor_location` (
  `record_id` int(11) NOT NULL,
  `quartier_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `agent_loc_status` varchar(20) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pp_supervisor_location`
--

INSERT INTO `pp_supervisor_location` (`record_id`, `quartier_id`, `supervisor_id`, `start_date`, `end_date`, `agent_loc_status`) VALUES
(1, 14, 1, '2020-01-29 08:54:08', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sm_geolocation`
--

CREATE TABLE `sm_geolocation` (
  `record_id` int(11) NOT NULL,
  `commune_id` int(11) NOT NULL,
  `commune_name` varchar(255) NOT NULL,
  `quartier_id` int(11) NOT NULL,
  `quartier_name` varchar(255) NOT NULL,
  `cellule_id` int(11) NOT NULL,
  `cellule_name` varchar(255) NOT NULL,
  `avenue_id` int(11) NOT NULL,
  `avenue_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sm_geolocation`
--

INSERT INTO `sm_geolocation` (`record_id`, `commune_id`, `commune_name`, `quartier_id`, `quartier_name`, `cellule_id`, `cellule_name`, `avenue_id`, `avenue_name`) VALUES
(1, 1, 'Goma', 11, 'MAPENDO', 111, 'RUMANGABO', 111001, 'LUBUMBASHI'),
(2, 1, 'Goma', 11, 'MAPENDO', 111, 'RUMANGABO', 111002, 'KISANGANI'),
(3, 1, 'Goma', 11, 'MAPENDO', 111, 'RUMANGABO', 111003, 'RUZIZI'),
(4, 1, 'Goma', 11, 'MAPENDO', 111, 'RUMANGABO', 111004, 'SIKUSIKAANA'),
(5, 1, 'Goma', 11, 'MAPENDO', 111, 'RUMANGABO', 111005, 'RUMANGABO'),
(6, 1, 'Goma', 11, 'MAPENDO', 112, 'MAPENDO', 112006, 'BWEREMANA'),
(7, 1, 'Goma', 11, 'MAPENDO', 112, 'MAPENDO', 112007, 'APENDEKI'),
(8, 1, 'Goma', 11, 'MAPENDO', 112, 'MAPENDO', 112008, 'MINOVA'),
(9, 1, 'Goma', 11, 'MAPENDO', 112, 'MAPENDO', 112009, 'IDJWI'),
(10, 1, 'Goma', 11, 'MAPENDO', 112, 'MAPENDO', 112010, 'MWANGAZA'),
(11, 1, 'Goma', 11, 'MAPENDO', 112, 'MAPENDO', 112011, 'KIRAMBO'),
(12, 1, 'Goma', 12, 'MIKENO', 121, 'KIBABI', 121012, 'LUBUTU'),
(13, 1, 'Goma', 12, 'MIKENO', 121, 'KIBABI', 121013, 'KAMINA'),
(14, 1, 'Goma', 12, 'MIKENO', 121, 'KIBABI', 121014, 'KITONA'),
(15, 1, 'Goma', 12, 'MIKENO', 122, 'BISHOGO', 122015, 'KASONGO'),
(16, 1, 'Goma', 12, 'MIKENO', 122, 'BISHOGO', 122016, 'KALEHE'),
(17, 1, 'Goma', 12, 'MIKENO', 122, 'BISHOGO', 122017, 'BUKAVU'),
(18, 1, 'Goma', 12, 'MIKENO', 123, 'FERUZI', 123018, 'DU 20 MAI'),
(19, 1, 'Goma', 12, 'MIKENO', 123, 'FERUZI', 123019, 'MUGUNGA'),
(20, 1, 'Goma', 12, 'MIKENO', 123, 'FERUZI', 123020, 'KIBOKO'),
(21, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131021, 'ROND POINT 1'),
(22, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131022, 'JACARANDAS'),
(23, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131023, 'BOUGAINVILLIER'),
(24, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131024, 'ACCACIAS'),
(25, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131025, 'CIRCULAIRE'),
(26, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131026, 'GREVELLIAS'),
(27, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131027, 'TULIPIER'),
(28, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131028, 'LES ORCHIDES 1'),
(29, 1, 'Goma', 13, 'LES VOLCANS', 131, 'SUD EST', 131029, 'BLV KANYAMUHANGA'),
(30, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132030, 'LA CORNICHE'),
(31, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132031, 'GRVELLIAS'),
(32, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132032, 'TULIPIER 1 ET 2'),
(33, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132033, 'ORCHIDEES 1 ET 2'),
(34, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132034, 'DU GOUVERNEUR'),
(35, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132035, 'BLV KARISIMBI'),
(36, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132036, 'ACCACIAS'),
(37, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132037, 'BOUGAINVILLIER'),
(38, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132038, 'JACARANDAS'),
(39, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132039, 'BLV KANYAMUHANA'),
(40, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132040, 'LA CORNICHE'),
(41, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132041, 'BLV KARISIMBI'),
(42, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132042, 'TULIPIER 3'),
(43, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132043, 'GREVELLIAS'),
(44, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132044, 'ACCACIAS'),
(45, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132045, 'BOUGAINVILLIER'),
(46, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132046, 'DES IBIS'),
(47, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132047, 'MONT GOMA'),
(48, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132048, 'WALIKALE'),
(49, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132049, 'ROND POINT'),
(50, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132050, 'PELICAN'),
(51, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132051, 'MESSAGER'),
(52, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132052, 'BENI'),
(53, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132053, 'PORT'),
(54, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132054, 'GOLF'),
(55, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132055, 'BLV SAKE'),
(56, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132056, 'DES ECOLES'),
(57, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132057, 'TOURISTE'),
(58, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132058, 'BUTEMBO'),
(59, 1, 'Goma', 13, 'LES VOLCANS', 132, 'MULEMBERI', 132059, 'BLV KANYAMUHANGA'),
(60, 1, 'Goma', 14, 'KATINDO', 141, 'RVA', 141060, 'MASISI'),
(61, 1, 'Goma', 14, 'KATINDO', 141, 'RVA', 141061, 'DU LAC'),
(62, 1, 'Goma', 14, 'KATINDO', 142, 'DU GOLF', 142062, 'BUNAGANA'),
(63, 1, 'Goma', 14, 'KATINDO', 142, 'DU GOLF', 142063, 'LA FRONTIERE'),
(64, 1, 'Goma', 14, 'KATINDO', 142, 'DU GOLF', 142064, 'ISHASHA'),
(65, 1, 'Goma', 14, 'KATINDO', 143, 'DU 20 MAI', 143065, 'MANIEMA'),
(66, 1, 'Goma', 14, 'KATINDO', 143, 'DU 20 MAI', 143066, 'BENI'),
(67, 1, 'Goma', 14, 'KATINDO', 143, 'DU 20 MAI', 143067, 'CARMEL'),
(68, 1, 'Goma', 15, 'HIMBI', 151, 'UNIVERSITAIRE', 151068, 'DU 30 JUIN'),
(69, 1, 'Goma', 15, 'HIMBI', 151, 'UNIVERSITAIRE', 151069, 'DE LA MISSION '),
(70, 1, 'Goma', 15, 'HIMBI', 151, 'UNIVERSITAIRE', 151070, 'DU LAC'),
(71, 1, 'Goma', 15, 'HIMBI', 151, 'UNIVERSITAIRE', 151071, 'WALIKALE'),
(72, 1, 'Goma', 15, 'HIMBI', 151, 'UNIVERSITAIRE', 151072, 'UVIRA'),
(73, 1, 'Goma', 15, 'HIMBI', 152, 'BUKAVU', 152073, 'DE GOMA'),
(74, 1, 'Goma', 15, 'HIMBI', 152, 'BUKAVU', 152074, 'DU LAC'),
(75, 1, 'Goma', 15, 'HIMBI', 152, 'BUKAVU', 152075, 'PRESIDENTIELLE'),
(76, 1, 'Goma', 15, 'HIMBI', 153, 'LUMUMBA', 153076, 'ALINDI'),
(77, 1, 'Goma', 15, 'HIMBI', 153, 'LUMUMBA', 153077, 'DE LA PAIX'),
(78, 1, 'Goma', 15, 'HIMBI', 153, 'LUMUMBA', 153078, 'DU MUSE'),
(79, 1, 'Goma', 16, 'KESHERO', 161, 'BUHUMIRA', 161079, 'MAENDELEO'),
(80, 1, 'Goma', 16, 'KESHERO', 161, 'BUHUMIRA', 161080, 'LEMERA'),
(81, 1, 'Goma', 16, 'KESHERO', 161, 'BUHUMIRA', 161081, 'KIBATI'),
(82, 1, 'Goma', 16, 'KESHERO', 161, 'BUHUMIRA', 161082, 'NZIYUMVIRA'),
(83, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162083, 'DU LAC'),
(84, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162084, 'DES ENSEIGNENTS'),
(85, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162085, 'BUKAMA SUD'),
(86, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162086, 'BUKAMA NORD'),
(87, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162087, 'RIVUZI MWAMI'),
(88, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162088, 'KITUKU 1'),
(89, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162089, 'KITUKU 2'),
(90, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162090, 'IRENGETI'),
(91, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162091, 'POLYCLINIQUE 1'),
(92, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162092, 'POLYCLINIQUE 2'),
(93, 1, 'Goma', 16, 'KESHERO', 162, 'GASIZA', 162093, 'POLYCLINIQUE 3'),
(94, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163094, 'KINSHASA'),
(95, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163095, 'MAYI MOTO'),
(96, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163096, 'TOPOGRAPHE'),
(97, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163097, 'LUBUMBASHI'),
(98, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163098, 'KISANGANI'),
(99, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163099, 'RUMIMBI'),
(100, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163100, 'RUMIMBI 2'),
(101, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163101, 'TCHOPO'),
(102, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163102, 'LUSAMBO'),
(103, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163103, 'KACHECHE'),
(104, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163104, 'BOBILA DAWA'),
(105, 1, 'Goma', 16, 'KESHERO', 163, 'KACHECHE', 163105, 'MBUJI MAYI'),
(106, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164106, 'AMANI BIGIRI'),
(107, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164107, 'ABATOIRE'),
(108, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164108, 'RWAMICHACHA'),
(109, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164109, 'KIZITO'),
(110, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164110, 'DU LAC 3'),
(111, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164111, 'MBAU'),
(112, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164112, 'KIRIBUNYE'),
(113, 1, 'Goma', 16, 'KESHERO', 164, 'BURENGE', 164113, 'KESHENI'),
(114, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165114, 'DE SPORT 1'),
(115, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165115, 'RUSIZI'),
(116, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165116, 'DE CHRISTINE'),
(117, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165117, 'MULU'),
(118, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165118, 'KARIBU'),
(119, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165119, 'DU LAC 1'),
(120, 1, 'Goma', 16, 'KESHERO', 165, 'KARIBU', 165120, 'DE L?UNITE'),
(121, 1, 'Goma', 16, 'KESHERO', 166, 'NYARUBANDE', 166121, 'RUZUBA'),
(122, 1, 'Goma', 16, 'KESHERO', 166, 'NYARUBANDE', 166122, 'DU MARCHE'),
(123, 1, 'Goma', 16, 'KESHERO', 166, 'NYARUBANDE', 166123, 'DE SPORT 2'),
(124, 1, 'Goma', 16, 'KESHERO', 166, 'NYARUBANDE', 166124, 'DES EGLISES'),
(125, 1, 'Goma', 16, 'KESHERO', 166, 'NYARUBANDE', 166125, 'FACULTE DR'),
(126, 1, 'Goma', 16, 'KESHERO', 166, 'NYARUBANDE', 166126, 'KESHERO'),
(127, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167127, 'MUSIENENE'),
(128, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167128, 'MIAKANO'),
(129, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167129, 'DE LA CONFERENCE'),
(130, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167130, 'MAGENE'),
(131, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167131, 'PACIFICATION'),
(132, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167132, 'MIRUGI 1'),
(133, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167133, 'MIRUGI 2'),
(134, 1, 'Goma', 16, 'KESHERO', 167, 'CHAMAHANE', 167134, 'LUSAKA'),
(135, 1, 'Goma', 17, 'LAC VERT', 171, 'MUGUNGA', 171135, 'LUSHAGALA'),
(136, 1, 'Goma', 17, 'LAC VERT', 171, 'MUGUNGA', 171136, 'KATWA'),
(137, 1, 'Goma', 17, 'LAC VERT', 171, 'MUGUNGA', 171137, 'RUTANDA'),
(138, 1, 'Goma', 17, 'LAC VERT', 172, 'SHABAKUNGU', 172138, 'XAVERIE'),
(139, 1, 'Goma', 17, 'LAC VERT', 172, 'SHABAKUNGU', 172139, 'KABUTEMBO'),
(140, 1, 'Goma', 17, 'LAC VERT', 172, 'SHABAKUNGU', 172140, 'BURORA'),
(141, 1, 'Goma', 17, 'LAC VERT', 173, 'PAY PAY', 173141, 'KIMBANGUISTE'),
(142, 1, 'Goma', 17, 'LAC VERT', 173, 'PAY PAY', 173142, 'UNIVERSITAIRE'),
(143, 1, 'Goma', 17, 'LAC VERT', 173, 'PAY PAY', 173143, 'MUNGIRIMA'),
(144, 1, 'Goma', 17, 'LAC VERT', 174, 'BULENGO', 174144, 'MABANGA'),
(145, 1, 'Goma', 17, 'LAC VERT', 174, 'BULENGO', 174145, 'BURUNGU'),
(146, 1, 'Goma', 17, 'LAC VERT', 175, 'NYABYUNYU', 175146, 'MAJENGO'),
(147, 1, 'Goma', 17, 'LAC VERT', 175, 'NYABYUNYU', 175147, 'KABANDE'),
(148, 1, 'Goma', 17, 'LAC VERT', 175, 'NYABYUNYU', 175148, 'NYARUTSHIRU'),
(149, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211001, 'DES AVAIATEURS'),
(150, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211002, 'DES ANALYSES'),
(151, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211003, 'KIBATI'),
(152, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211004, 'IDJUWI'),
(153, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211005, 'SEMILIKI'),
(154, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211006, 'DU PARC'),
(155, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211007, 'DE SPORT'),
(156, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211008, 'NYIRAGONGO'),
(157, 2, 'Karisimbi', 21, 'VIRUNGA', 211, 'VIRUNGA CENTRE', 211009, 'MONIGI'),
(158, 2, 'Karisimbi', 21, 'VIRUNGA', 212, 'VIRUNGA-NORD', 212010, 'MULAMBA'),
(159, 2, 'Karisimbi', 21, 'VIRUNGA', 212, 'VIRUNGA-NORD', 212011, 'POTO POTO'),
(160, 2, 'Karisimbi', 21, 'VIRUNGA', 212, 'VIRUNGA-NORD', 212012, 'PIC BOEUF'),
(161, 2, 'Karisimbi', 21, 'VIRUNGA', 213, 'VIRUNGA-SUD', 213013, 'BIGARUKA'),
(162, 2, 'Karisimbi', 21, 'VIRUNGA', 213, 'VIRUNGA-SUD', 213014, 'KAGEPHAR'),
(163, 2, 'Karisimbi', 21, 'VIRUNGA', 213, 'VIRUNGA-SUD', 213015, 'MUTEBERWA'),
(164, 2, 'Karisimbi', 21, 'VIRUNGA', 213, 'VIRUNGA-SUD', 213016, 'COIN DU MARCHE'),
(165, 2, 'Karisimbi', 21, 'VIRUNGA', 214, 'KIMBUNGU', 214017, 'MUZINDUZI'),
(166, 2, 'Karisimbi', 21, 'VIRUNGA', 214, 'KIMBUNGU', 214018, 'BUHIMBA'),
(167, 2, 'Karisimbi', 21, 'VIRUNGA', 214, 'KIMBUNGU', 214019, 'KINDU 1'),
(168, 2, 'Karisimbi', 21, 'VIRUNGA', 214, 'KIMBUNGU', 214020, 'DE LA LAVE'),
(169, 2, 'Karisimbi', 21, 'VIRUNGA', 214, 'KIMBUNGU', 214021, 'SABINYO'),
(170, 2, 'Karisimbi', 22, 'BUJOVU', 221, 'TYAZO', 221022, 'CYIRAMBO'),
(171, 2, 'Karisimbi', 22, 'BUJOVU', 221, 'TYAZO', 221023, 'BITEKO'),
(172, 2, 'Karisimbi', 22, 'BUJOVU', 221, 'TYAZO', 221024, 'BASUNGA'),
(173, 2, 'Karisimbi', 22, 'BUJOVU', 221, 'TYAZO', 221025, 'NYAKAGOZI'),
(174, 2, 'Karisimbi', 22, 'BUJOVU', 222, 'NYARUBANDE', 222026, 'MBAYIKI'),
(175, 2, 'Karisimbi', 22, 'BUJOVU', 222, 'NYARUBANDE', 222027, 'GAKUBA'),
(176, 2, 'Karisimbi', 22, 'BUJOVU', 222, 'NYARUBANDE', 222028, 'GASIZA'),
(177, 2, 'Karisimbi', 22, 'BUJOVU', 222, 'NYARUBANDE', 222029, 'BUHEKA'),
(178, 2, 'Karisimbi', 22, 'BUJOVU', 223, 'BYAHI', 223030, 'BULENGERA'),
(179, 2, 'Karisimbi', 22, 'BUJOVU', 223, 'BYAHI', 223031, 'HANIKA'),
(180, 2, 'Karisimbi', 22, 'BUJOVU', 223, 'BYAHI', 223032, 'BUNYEREZO'),
(181, 2, 'Karisimbi', 22, 'BUJOVU', 223, 'BYAHI', 223033, 'BUHIMBA'),
(182, 2, 'Karisimbi', 22, 'BUJOVU', 223, 'BYAHI', 223034, 'JOLI BOIS'),
(183, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231035, 'DU FLEUVE'),
(184, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231036, 'KABENGA'),
(185, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231037, 'MULIGE'),
(186, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231038, 'KASIKA'),
(187, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231039, 'KIBATI'),
(188, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231040, 'BOBOSO'),
(189, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231041, 'MUCHACHA'),
(190, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231042, 'BOTETI'),
(191, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231043, 'LEMBI'),
(192, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231044, 'MULAMBA'),
(193, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231045, 'NYAMASEKO'),
(194, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231046, 'DIKUTA'),
(195, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231047, 'MUDIAYI'),
(196, 2, 'Karisimbi', 23, 'KASIKA', 231, 'KONDE', 231048, 'MUKALAY'),
(197, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232049, 'GEOMETRE 1'),
(198, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232050, 'BAKISI'),
(199, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232051, 'NDARA'),
(200, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232052, 'TONGIL'),
(201, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232053, 'KILIMANYOKA'),
(202, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232054, 'KATOYI'),
(203, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232055, 'BULENDE'),
(204, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232056, 'LWAMA'),
(205, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232057, 'LUKWETI'),
(206, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232058, 'LUOTU'),
(207, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232059, 'MWESO'),
(208, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232060, 'NGULO'),
(209, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232061, 'BAMATE'),
(210, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232062, 'BIKINDWE'),
(211, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232063, 'NYANDONDO'),
(212, 2, 'Karisimbi', 23, 'KASIKA', 232, 'BEAD', 232064, 'KYAMBOGHO'),
(213, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233065, 'MBATI'),
(214, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233066, 'ITALA'),
(215, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233067, 'MONT BLEU'),
(216, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233068, 'BWISHA'),
(217, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233069, 'DE GEOMETRIE 2'),
(218, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233070, 'RWINDI'),
(219, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233071, 'KIRUMBA'),
(220, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233072, 'LUALABA'),
(221, 2, 'Karisimbi', 23, 'KASIKA', 233, 'KATSAMBYA', 233073, 'NYAKAKOMA'),
(222, 2, 'Karisimbi', 24, 'KAHEMBE', 241, 'BIRERE-NORD', 241074, 'BAHIZI'),
(223, 2, 'Karisimbi', 24, 'KAHEMBE', 241, 'BIRERE-NORD', 241075, 'KANYAMANJANJA'),
(224, 2, 'Karisimbi', 24, 'KAHEMBE', 242, 'KASIKA', 242076, 'MIKUNDI 1'),
(225, 2, 'Karisimbi', 24, 'KAHEMBE', 242, 'KASIKA', 242077, 'MIKUNDI 2'),
(226, 2, 'Karisimbi', 24, 'KAHEMBE', 243, 'KALINDA', 243078, '4 JANVIER'),
(227, 2, 'Karisimbi', 24, 'KAHEMBE', 243, 'KALINDA', 243079, 'DE LA RWINDI'),
(228, 2, 'Karisimbi', 24, 'KAHEMBE', 243, 'KALINDA', 243080, 'LUBERO'),
(229, 2, 'Karisimbi', 24, 'KAHEMBE', 244, 'LES VOLCANS', 244081, 'RUTSHURU'),
(230, 2, 'Karisimbi', 24, 'KAHEMBE', 244, 'LES VOLCANS', 244082, 'KAHIRA'),
(231, 2, 'Karisimbi', 24, 'KAHEMBE', 244, 'LES VOLCANS', 244083, 'KINGI'),
(232, 2, 'Karisimbi', 24, 'KAHEMBE', 245, 'BIRERE-SUD', 245084, 'KITOVU'),
(233, 2, 'Karisimbi', 24, 'KAHEMBE', 245, 'BIRERE-SUD', 245085, 'BUTEMBO'),
(234, 2, 'Karisimbi', 24, 'KAHEMBE', 245, 'BIRERE-SUD', 245086, 'MONT HOYO'),
(235, 2, 'Karisimbi', 25, 'MUGUNGA', 251, 'DESARCHEVEQUES', 251087, 'KAHOGOZI'),
(236, 2, 'Karisimbi', 25, 'MUGUNGA', 251, 'DESARCHEVEQUES', 251088, 'C.E.A. VU'),
(237, 2, 'Karisimbi', 25, 'MUGUNGA', 251, 'DESARCHEVEQUES', 251089, 'NDILI 01'),
(238, 2, 'Karisimbi', 25, 'MUGUNGA', 251, 'DESARCHEVEQUES', 251090, 'NDLI 02'),
(239, 2, 'Karisimbi', 25, 'MUGUNGA', 252, 'DE LA PAIX', 252091, 'MUSHEBERE'),
(240, 2, 'Karisimbi', 25, 'MUGUNGA', 252, 'DE LA PAIX', 252092, 'DU MARCHE'),
(241, 2, 'Karisimbi', 25, 'MUGUNGA', 252, 'DE LA PAIX', 252093, 'KALAMO'),
(242, 2, 'Karisimbi', 25, 'MUGUNGA', 252, 'DE LA PAIX', 252094, 'KITCHANGA'),
(243, 2, 'Karisimbi', 25, 'MUGUNGA', 253, 'TULIYA', 253095, 'RUSAYO 01'),
(244, 2, 'Karisimbi', 25, 'MUGUNGA', 253, 'TULIYA', 253096, 'RUSAYO 02'),
(245, 2, 'Karisimbi', 25, 'MUGUNGA', 253, 'TULIYA', 253097, 'MAENDELEO 01'),
(246, 2, 'Karisimbi', 25, 'MUGUNGA', 253, 'TULIYA', 253098, 'MAENDELEO 02'),
(247, 2, 'Karisimbi', 25, 'MUGUNGA', 254, 'KIBIRIZI', 254099, '17/ JANVIER'),
(248, 2, 'Karisimbi', 25, 'MUGUNGA', 254, 'KIBIRIZI', 254100, 'KASHAKA'),
(249, 2, 'Karisimbi', 25, 'MUGUNGA', 254, 'KIBIRIZI', 254101, 'BARAKA'),
(250, 2, 'Karisimbi', 25, 'MUGUNGA', 255, 'NYABIREHE', 255102, 'HEWA-BORA 1'),
(251, 2, 'Karisimbi', 25, 'MUGUNGA', 255, 'NYABIREHE', 255103, 'HEWA-BORA 2'),
(252, 2, 'Karisimbi', 25, 'MUGUNGA', 256, 'LUTALE', 256104, 'SHABINDU'),
(253, 2, 'Karisimbi', 25, 'MUGUNGA', 256, 'LUTALE', 256105, 'RUTANDA'),
(254, 2, 'Karisimbi', 25, 'MUGUNGA', 256, 'LUTALE', 256106, 'LUSHAGALA'),
(255, 2, 'Karisimbi', 26, 'MABANGA-NORD', 261, 'SALONGO', 261107, 'SALONGO 1'),
(256, 2, 'Karisimbi', 26, 'MABANGA-NORD', 261, 'SALONGO', 261108, 'SALONGO 2'),
(257, 2, 'Karisimbi', 26, 'MABANGA-NORD', 261, 'SALONGO', 261109, 'SALONGO 3'),
(258, 2, 'Karisimbi', 26, 'MABANGA-NORD', 262, 'OSSO', 262110, 'ITEBERO'),
(259, 2, 'Karisimbi', 26, 'MABANGA-NORD', 262, 'OSSO', 262111, 'KATOYI 1'),
(260, 2, 'Karisimbi', 26, 'MABANGA-NORD', 262, 'OSSO', 262112, 'LUBANGO'),
(261, 2, 'Karisimbi', 26, 'MABANGA-NORD', 262, 'OSSO', 262113, 'OSSO 2'),
(262, 2, 'Karisimbi', 26, 'MABANGA-NORD', 262, 'OSSO', 262114, 'KINDU 2'),
(263, 2, 'Karisimbi', 27, 'MAJENGO', 271, 'KINYAGULE', 271115, 'SANGILO'),
(264, 2, 'Karisimbi', 27, 'MAJENGO', 271, 'KINYAGULE', 271116, 'MAHINDULE'),
(265, 2, 'Karisimbi', 27, 'MAJENGO', 271, 'KINYAGULE', 271117, 'MUNZENZE'),
(266, 2, 'Karisimbi', 27, 'MAJENGO', 271, 'KINYAGULE', 271118, 'PINDUZI'),
(267, 2, 'Karisimbi', 27, 'MAJENGO', 271, 'KINYAGULE', 271119, 'TENGENEZA'),
(268, 2, 'Karisimbi', 27, 'MAJENGO', 272, 'DON BOSCO', 272120, 'KIBINDA'),
(269, 2, 'Karisimbi', 27, 'MAJENGO', 272, 'DON BOSCO', 272121, 'BAKUNGU'),
(270, 2, 'Karisimbi', 27, 'MAJENGO', 272, 'DON BOSCO', 272122, 'MULUMBA'),
(271, 2, 'Karisimbi', 27, 'MAJENGO', 272, 'DON BOSCO', 272123, 'BITWAYIKI'),
(272, 2, 'Karisimbi', 27, 'MAJENGO', 272, 'DON BOSCO', 272124, 'MULINDWA'),
(273, 2, 'Karisimbi', 27, 'MAJENGO', 273, 'GISIGARI', 273125, 'BWISHA'),
(274, 2, 'Karisimbi', 27, 'MAJENGO', 273, 'GISIGARI', 273126, 'MAENDELEO'),
(275, 2, 'Karisimbi', 27, 'MAJENGO', 273, 'GISIGARI', 273127, 'KABINGWA'),
(276, 2, 'Karisimbi', 27, 'MAJENGO', 273, 'GISIGARI', 273128, 'KABASHA'),
(277, 2, 'Karisimbi', 27, 'MAJENGO', 274, 'KISIMA', 274129, 'OPTIGO'),
(278, 2, 'Karisimbi', 27, 'MAJENGO', 274, 'KISIMA', 274130, 'DE LA PAIX'),
(279, 2, 'Karisimbi', 27, 'MAJENGO', 274, 'KISIMA', 274131, 'TUHESHIMIANE'),
(280, 2, 'Karisimbi', 27, 'MAJENGO', 274, 'KISIMA', 274132, 'MUGARA'),
(281, 2, 'Karisimbi', 27, 'MAJENGO', 274, 'KISIMA', 274133, 'BUGITI'),
(282, 2, 'Karisimbi', 27, 'MAJENGO', 275, 'UMOJA', 275134, 'BWEZA'),
(283, 2, 'Karisimbi', 27, 'MAJENGO', 275, 'UMOJA', 275135, 'KIMBILIO'),
(284, 2, 'Karisimbi', 27, 'MAJENGO', 275, 'UMOJA', 275136, 'KAVUMU'),
(285, 2, 'Karisimbi', 27, 'MAJENGO', 275, 'UMOJA', 275137, 'BUTSITSI'),
(286, 2, 'Karisimbi', 28, 'MURARA', 281, 'ANGLICANE', 281138, 'MURARA'),
(287, 2, 'Karisimbi', 28, 'MURARA', 281, 'ANGLICANE', 281139, 'MUKOSASENGE'),
(288, 2, 'Karisimbi', 28, 'MURARA', 281, 'ANGLICANE', 281140, 'BUNIA'),
(289, 2, 'Karisimbi', 28, 'MURARA', 281, 'ANGLICANE', 281141, 'TSHELLA'),
(290, 2, 'Karisimbi', 28, 'MURARA', 281, 'ANGLICANE', 281142, 'FIKIRI'),
(291, 2, 'Karisimbi', 28, 'MURARA', 281, 'ANGLICANE', 281143, 'NDURUMO'),
(292, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282144, 'KABARE'),
(293, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282145, 'PANGI'),
(294, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282146, 'UVIRA'),
(295, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282147, 'KASAVUBU'),
(296, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282148, 'LUMUMBA'),
(297, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282149, 'ROUTE GOMA SAKE'),
(298, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282150, 'NYIRAGONGO 2'),
(299, 2, 'Karisimbi', 28, 'MURARA', 282, 'CEPAC', 282151, 'LOWASHI'),
(300, 2, 'Karisimbi', 28, 'MURARA', 283, 'OFFICE 1 NORD', 283152, 'BUSIMBA'),
(301, 2, 'Karisimbi', 28, 'MURARA', 283, 'OFFICE 1 NORD', 283153, 'DE LA PLAINE NORD'),
(302, 2, 'Karisimbi', 28, 'MURARA', 283, 'OFFICE 1 NORD', 283154, 'LOWA'),
(303, 2, 'Karisimbi', 28, 'MURARA', 283, 'OFFICE 1 NORD', 283155, 'NYAMULAGIRA'),
(304, 2, 'Karisimbi', 28, 'MURARA', 283, 'OFFICE 1 NORD', 283156, 'HAUT CONGO'),
(305, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284157, 'COOPERATIVE'),
(306, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284158, 'PALMIER'),
(307, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284159, 'BANANIER'),
(308, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284160, 'MANIEMA'),
(309, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284161, 'LAC KIVU'),
(310, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284162, 'DU MARCHE'),
(311, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284163, 'UELE'),
(312, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284164, 'ACCACIAS'),
(313, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284165, 'D?ALLIAS'),
(314, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284166, 'RWENZORI'),
(315, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284167, 'DU COLLEGE'),
(316, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284168, 'DE COMMERCE'),
(317, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284169, 'DE LA PLAINE SUD'),
(318, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284170, 'MIKENO'),
(319, 2, 'Karisimbi', 28, 'MURARA', 284, 'OFFICE 1 SUD', 284171, 'NYIRAGONGO'),
(320, 2, 'Karisimbi', 29, 'NDOSHO', 291, 'MUNANIRA', 291172, 'RULENGA'),
(321, 2, 'Karisimbi', 29, 'NDOSHO', 291, 'MUNANIRA', 291173, 'KITO'),
(322, 2, 'Karisimbi', 29, 'NDOSHO', 291, 'MUNANIRA', 291174, 'MUWANGA'),
(323, 2, 'Karisimbi', 29, 'NDOSHO', 291, 'MUNANIRA', 291175, 'GARAMBA'),
(324, 2, 'Karisimbi', 29, 'NDOSHO', 291, 'MUNANIRA', 291176, '5 CHANTIERS'),
(325, 2, 'Karisimbi', 29, 'NDOSHO', 292, 'DES ECOLES', 292177, 'MITUMBA'),
(326, 2, 'Karisimbi', 29, 'NDOSHO', 292, 'DES ECOLES', 292178, 'KAKO'),
(327, 2, 'Karisimbi', 29, 'NDOSHO', 292, 'DES ECOLES', 292179, 'DEMOCRATIE'),
(328, 2, 'Karisimbi', 29, 'NDOSHO', 292, 'DES ECOLES', 292180, 'DE LA CARRIERE'),
(329, 2, 'Karisimbi', 29, 'NDOSHO', 293, 'NDEBO', 293181, 'KIWANJA'),
(330, 2, 'Karisimbi', 29, 'NDOSHO', 293, 'NDEBO', 293182, 'ITIMBIRI'),
(331, 2, 'Karisimbi', 29, 'NDOSHO', 293, 'NDEBO', 293183, 'RENGA'),
(332, 2, 'Karisimbi', 29, 'NDOSHO', 293, 'NDEBO', 293184, 'UBANGI'),
(333, 2, 'Karisimbi', 29, 'NDOSHO', 293, 'NDEBO', 293185, 'LUAPULA'),
(334, 2, 'Karisimbi', 29, 'NDOSHO', 294, 'CAJED', 294186, 'LULUA'),
(335, 2, 'Karisimbi', 29, 'NDOSHO', 294, 'CAJED', 294187, 'NGUNGU'),
(336, 2, 'Karisimbi', 29, 'NDOSHO', 294, 'CAJED', 294188, 'MINOVA'),
(337, 2, 'Karisimbi', 29, 'NDOSHO', 294, 'CAJED', 294189, 'KALIMA'),
(338, 2, 'Karisimbi', 29, 'NDOSHO', 294, 'CAJED', 294190, 'ORPHELINAT'),
(339, 2, 'Karisimbi', 29, 'NDOSHO', 295, 'DES OKAPI', 295191, 'MAENDELEO'),
(340, 2, 'Karisimbi', 29, 'NDOSHO', 295, 'DES OKAPI', 295192, 'KISASU'),
(341, 2, 'Karisimbi', 29, 'NDOSHO', 295, 'DES OKAPI', 295193, 'LUSULI'),
(342, 2, 'Karisimbi', 29, 'NDOSHO', 296, 'SALAMA', 296194, 'KABASHA 2'),
(343, 2, 'Karisimbi', 29, 'NDOSHO', 296, 'SALAMA', 296195, 'KABASHA 1'),
(344, 2, 'Karisimbi', 29, 'NDOSHO', 296, 'SALAMA', 296196, 'MUHABURA'),
(345, 2, 'Karisimbi', 29, 'NDOSHO', 296, 'SALAMA', 296197, 'BUGAMBA'),
(346, 2, 'Karisimbi', 29, 'NDOSHO', 297, 'NDIHIRA', 297198, 'KANYAMUHANGA'),
(347, 2, 'Karisimbi', 29, 'NDOSHO', 297, 'NDIHIRA', 297199, 'KALONJI'),
(348, 2, 'Karisimbi', 29, 'NDOSHO', 297, 'NDIHIRA', 297200, 'RWASAMA'),
(349, 2, 'Karisimbi', 29, 'NDOSHO', 297, 'NDIHIRA', 297201, 'ILEO-SONGO'),
(350, 2, 'Karisimbi', 29, 'NDOSHO', 297, 'NDIHIRA', 297202, 'KASAVUBU'),
(351, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2101, 'TMK', 2101203, 'MUKOTO'),
(352, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2101, 'TMK', 2101204, 'IKOBO'),
(353, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2101, 'TMK', 2101205, 'KINSHASA'),
(354, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2101, 'TMK', 2101206, 'INDUSTRIELLE'),
(355, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2101, 'TMK', 2101207, 'MUSHUNGANYA'),
(356, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2101, 'TMK', 2101208, 'KISIMBA'),
(357, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2102, 'KAKURU', 2102209, 'MUTAKATO'),
(358, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2102, 'KAKURU', 2102210, 'VITWAIKI'),
(359, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2102, 'KAKURU', 2102211, 'MULINGA'),
(360, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2102, 'KAKURU', 2102212, 'RUYANGE'),
(361, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2102, 'KAKURU', 2102213, 'LOWA'),
(362, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2103, 'ROBA', 2103214, 'RUTOBOKO'),
(363, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2103, 'ROBA', 2103215, 'CIRCULAIRE'),
(364, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2103, 'ROBA', 2103216, 'AMANI'),
(365, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2103, 'ROBA', 2103217, 'MUTONGO'),
(366, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2103, 'ROBA', 2103218, 'NDALAGA'),
(367, 2, 'Karisimbi', 210, 'MABANGA-SUD', 2103, 'ROBA', 2103219, 'NTOTO'),
(368, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111220, 'VITSHUMBI 1'),
(369, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111221, 'VITSHUMBI 2'),
(370, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111222, 'LOASHI'),
(371, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111223, 'MAKENGELE'),
(372, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111224, 'PINGA'),
(373, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111225, 'RWISOMA'),
(374, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111226, 'VISOKE'),
(375, 2, 'Karisimbi', 211, 'KATOYI', 2111, 'NYABUSHONGO', 2111227, 'ZIZI'),
(376, 2, 'Karisimbi', 211, 'KATOYI', 2112, 'KIBWE', 2112228, 'KISIBANGI'),
(377, 2, 'Karisimbi', 211, 'KATOYI', 2112, 'KIBWE', 2112229, 'BUKOHWA'),
(378, 2, 'Karisimbi', 211, 'KATOYI', 2112, 'KIBWE', 2112230, 'BILATI'),
(379, 2, 'Karisimbi', 211, 'KATOYI', 2112, 'KIBWE', 2112231, 'DES PLATEAUX'),
(380, 2, 'Karisimbi', 211, 'KATOYI', 2112, 'KIBWE', 2112232, 'KASINDI 3'),
(381, 2, 'Karisimbi', 211, 'KATOYI', 2112, 'KIBWE', 2112233, 'MAENDELEO'),
(382, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113234, 'KIBUKWE'),
(383, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113235, 'MUHAVURA'),
(384, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113236, 'KILIMANDJARO 1'),
(385, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113237, 'DES TECHNIQUES'),
(386, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113238, 'NDOWE'),
(387, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113239, 'MULONGWE'),
(388, 2, 'Karisimbi', 211, 'KATOYI', 2113, 'CHAMP DE TIRE', 2113240, 'BUKONDE'),
(389, 2, 'Karisimbi', 211, 'KATOYI', 2114, 'DE L?UNITE', 2114241, 'KASINDI 1'),
(390, 2, 'Karisimbi', 211, 'KATOYI', 2114, 'DE L?UNITE', 2114242, 'KASINDI 2'),
(391, 2, 'Karisimbi', 211, 'KATOYI', 2114, 'DE L?UNITE', 2114243, 'DES GEOMETRIES'),
(392, 2, 'Karisimbi', 211, 'KATOYI', 2114, 'DE L?UNITE', 2114244, 'KILIMANDJARO 2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `phonenum` bigint(12) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'CUSTOMER',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `phonenum`, `email`, `firstname`, `lastname`, `type`, `created`, `modified`, `password`) VALUES
(1, 250780348089, NULL, 'yves', 'mugenga', 'CUSTOMER', '2020-01-08 15:54:08', '2020-01-08 15:54:08', NULL),
(2, 250780348090, 'ymugenga@gmail.com', 'yves', 'mugenga', 'CUSTOMER', '2019-11-11 14:03:05', '2019-11-11 14:03:05', '123'),
(3, 250780348087, 'ymugenga17@alustudent.com', '', '', 'ADMIN', '2020-01-26 20:31:31', '2020-01-26 20:31:31', '$2y$10$kh7HSXZC1ozXSOr91m1ctuDpEVKovu/mxZ9g9laIj.1C.VhmiF.wm'),
(4, 250780348088, 'admin@paypark.com', '', '', 'ADMIN', '2020-01-26 20:39:22', '2020-01-26 20:39:22', '$2y$10$RJfuy2zybtkH2/RRoEHFU.yKAfhIMo.Cv.9k4k.94zAbXwPPiHugO'),
(5, 250780348099, 'y@test.com', 'james', 'musoni', 'CUSTOMER', '2020-02-03 15:37:25', '2020-02-03 15:37:25', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pp_agent_location`
--
ALTER TABLE `pp_agent_location`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `pp_car_plates`
--
ALTER TABLE `pp_car_plates`
  ADD PRIMARY KEY (`plate_num`);

--
-- Indexes for table `pp_locations`
--
ALTER TABLE `pp_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `pp_parking_agents`
--
ALTER TABLE `pp_parking_agents`
  ADD PRIMARY KEY (`agent_id`),
  ADD UNIQUE KEY `unik` (`telephone_number`);

--
-- Indexes for table `pp_parking_products`
--
ALTER TABLE `pp_parking_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `pp_parking_supervisors`
--
ALTER TABLE `pp_parking_supervisors`
  ADD PRIMARY KEY (`supervisor_id`);

--
-- Indexes for table `pp_parking_tickets`
--
ALTER TABLE `pp_parking_tickets`
  ADD PRIMARY KEY (`ticket_no`);

--
-- Indexes for table `pp_sms`
--
ALTER TABLE `pp_sms`
  ADD PRIMARY KEY (`smsId`);

--
-- Indexes for table `pp_supervisor_location`
--
ALTER TABLE `pp_supervisor_location`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `sm_geolocation`
--
ALTER TABLE `sm_geolocation`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phonenum_2` (`phonenum`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `phonenum` (`phonenum`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pp_agent_location`
--
ALTER TABLE `pp_agent_location`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `pp_locations`
--
ALTER TABLE `pp_locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pp_parking_agents`
--
ALTER TABLE `pp_parking_agents`
  MODIFY `agent_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pp_parking_products`
--
ALTER TABLE `pp_parking_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pp_parking_supervisors`
--
ALTER TABLE `pp_parking_supervisors`
  MODIFY `supervisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pp_sms`
--
ALTER TABLE `pp_sms`
  MODIFY `smsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pp_supervisor_location`
--
ALTER TABLE `pp_supervisor_location`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sm_geolocation`
--
ALTER TABLE `sm_geolocation`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
