-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 10:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theds`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `passenger` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `pickup_time` time NOT NULL,
  `origin` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `distance` int(2) NOT NULL,
  `price` int(11) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `large_luggage` int(2) NOT NULL,
  `medium_luggage` int(11) NOT NULL,
  `small_luggage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `passenger`, `date_time`, `pickup_time`, `origin`, `destination`, `status`, `distance`, `price`, `coords`, `large_luggage`, `medium_luggage`, `small_luggage`) VALUES
(8, 2, '2022-12-07 00:28:26', '23:54:00', 'Calinog Terminal Complex, Cali', 'Cabagiao Barangay Hall, Calino', 'accepted', 2, 438, '{\"originCords\":{\"latitude\":11.1281976,\"longitude\":122.5384521,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01},\"distCords\":{\"latitude\":11.1293852,\"longitude\":122.5584854,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01}}', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `account_id` int(9) NOT NULL,
  `motorcycle_brand` varchar(50) NOT NULL,
  `model` varchar(10) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `color` varchar(30) NOT NULL,
  `engineCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `account_id`, `motorcycle_brand`, `model`, `plate_number`, `color`, `engineCC`) VALUES
(1, 2, 'Kaksm', 'Lxlzl', 'Zk2929', 'Red', 203),
(2, 1, 'Mio', '2019', 'abc12345', 'Violet ', 125),
(3, 1, 'mio', '2019', 'abc12345', 'violet ', 125),
(4, 1, 'mio', '2019', 'abc12345', 'violet ', 125),
(5, 1, 'mio', '2019', 'abc12345', 'violet ', 125);

-- --------------------------------------------------------

--
-- Table structure for table `hailings`
--

CREATE TABLE `hailings` (
  `id` int(11) NOT NULL,
  `passenger` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `pickup_time` time NOT NULL,
  `origin` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `distance` int(2) NOT NULL,
  `price` int(11) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coords`)),
  `num_passenger` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hailings`
--

INSERT INTO `hailings` (`id`, `passenger`, `date_time`, `pickup_time`, `origin`, `destination`, `status`, `distance`, `price`, `coords`, `num_passenger`) VALUES
(1, 2, '2022-11-27 07:25:55', '09:30:00', 'Brgy. Gama Grande Elementary S', 'Calinog Public Market, Old Ilo', 'accepted', 2, 184, '{\"originCords\":0,\"distCords\":{\"latitude\":11.1238506,\"longitude\":122.5392187,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01}}', 4),
(5, 2, '2022-12-06 19:08:11', '19:06:00', 'Savemore Market Calinog, Calin', 'Cabagiao Barangay Hall, Calino', 'accepted', 2, 170, '{\"originCords\":{\"latitude\":11.1276612,\"longitude\":122.5391351,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01},\"distCords\":{\"latitude\":11.1293852,\"longitude\":122.5584854,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01}}', 4),
(6, 2, '2022-12-07 02:20:42', '06:20:00', 'Calinog Terminal Complex, Cali', 'Calinog Municipal Hall, Quezon', 'accepted', 1, 13, '{\"originCords\":{\"latitude\":11.1281976,\"longitude\":122.5384521,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01},\"distCords\":{\"latitude\":11.122473,\"longitude\":122.536692,\"latitudeDelta\":0.01,\"longitudeDelta\":0.01}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `trip_id`, `type`, `user_id`, `seen`) VALUES
(1, 1, 'service', 2, 1),
(2, 5, 'service', 2, 1),
(3, 8, 'delivery', 2, 1),
(4, 6, 'service', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id`, `firstname`, `middlename`, `lastname`, `age`, `gender`, `birthday`, `phone_number`, `username`, `password`) VALUES
(1, 'Michelle Grace ', 'Paren', 'Tayo', 21, 'Female', '2000-10-22', '9151735576', 'michelleparen@gmail.com', 'tayotata15'),
(2, 'Emmanuel', 'Despi', 'Katipunan', 21, 'Male', '2000-11-18', '09183939399', 'emma@gmail.com', '1234'),
(3, 'Evy Jean', 'Alcarde', 'Pelale', 22, 'Female', '2000-09-02', '09071135030', 'evyjeanpelale@gmail.com', 'evy22'),
(4, 'Evy Jean ', 'Alcarde ', 'Pelale', 22, 'Female', '2001-09-02', '63907113503', 'Evy Jean', 'Sachi');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `service_id` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'accepted',
  `driver` int(11) DEFAULT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `type`, `service_id`, `status`, `driver`, `date_time`) VALUES
(1, 'service', '1', 'accepted', 1, '2022-12-07 01:32:00'),
(2, 'service', '5', 'accepted', 1, '2022-12-07 02:15:12'),
(3, 'delivery', '8', 'accepted', 1, '2022-12-07 02:58:03'),
(4, 'service', '6', 'accepted', 1, '2022-12-07 03:22:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hailings`
--
ALTER TABLE `hailings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hailings`
--
ALTER TABLE `hailings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
