-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2020 at 05:56 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wallpaper`
--

-- --------------------------------------------------------

--
-- Table structure for table `w_category`
--

CREATE TABLE `w_category` (
  `wc_id` int(11) NOT NULL,
  `wc_category` text NOT NULL,
  `wc_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `w_category`
--

INSERT INTO `w_category` (`wc_id`, `wc_category`, `wc_img`) VALUES
(1, 'Art', 'https://images.unsplash.com/photo-1565279427445-10c13a1d1f82?ixlib=rb-1.2.1&w=1000&q=80'),
(2, 'Beach', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&w=1000&q=80'),
(3, 'Love', 'https://images.unsplash.com/photo-1518568814500-bf0f8d125f46?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(4, 'Music', 'https://images.unsplash.com/photo-1497616987741-7fba8102046e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(5, 'Nature', 'https://images.unsplash.com/photo-1560719168-32825e16d2c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(6, 'Other', 'https://images.unsplash.com/photo-1533613220915-609f661a6fe1?ixlib=rb-1.2.1&w=1000&q=80'),
(7, 'Technology', 'https://images.unsplash.com/photo-1563207153-f403bf289096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80');

-- --------------------------------------------------------

--
-- Table structure for table `w_wallpaper`
--

CREATE TABLE `w_wallpaper` (
  `ww_id` int(11) NOT NULL,
  `wc_id` int(11) NOT NULL,
  `ww_name` text NOT NULL,
  `ww_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `w_wallpaper`
--

INSERT INTO `w_wallpaper` (`ww_id`, `wc_id`, `ww_name`, `ww_img`) VALUES
(1, 1, 'Art Wall Paper', 'https://images.unsplash.com/photo-1543857778-c4a1a3e0b2eb?ixlib=rb-1.2.1&w=1000&q=80'),
(2, 1, 'Art Wallpaper', 'https://images.unsplash.com/photo-1516146544193-b54a65682f16?ixlib=rb-1.2.1&w=1000&q=80'),
(3, 1, 'Art Wallpaper', 'https://images.unsplash.com/photo-1536984456083-d69c8a7d952d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(4, 1, 'Art Wallpaper', 'https://images.unsplash.com/photo-1485796826113-174aa68fd81b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(5, 2, 'Beach Wallpaper', 'https://images.unsplash.com/photo-1527556897832-0c6492fa56cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(6, 2, 'Beach Wallpaper', 'https://images.unsplash.com/photo-1535520371158-a5a192f79831?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(7, 2, 'Beach Wallpaper', 'https://images.unsplash.com/photo-1582108909833-7b908eb5fb29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(8, 3, 'Love Wallpaper', 'https://images.unsplash.com/photo-1517837125937-53bd402f49d6?ixlib=rb-1.2.1&w=1000&q=80'),
(9, 3, 'Love Wallpaper', 'https://images.unsplash.com/photo-1518568740560-333139a27e72?ixlib=rb-1.2.1&w=1000&q=80'),
(10, 3, 'Love Wallpaper', 'https://images.unsplash.com/photo-1515192196389-608dce1784c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(11, 3, 'Love Wallpaper', 'https://images.unsplash.com/photo-1518050346340-aa2ec3bb424b?ixlib=rb-1.2.1&w=1000&q=80'),
(12, 4, 'Music', 'https://images.unsplash.com/photo-1570906166424-698571d1dc15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(13, 4, 'Music', 'https://images.unsplash.com/photo-1526394931762-90052e97b376?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(14, 4, 'Music', 'https://images.unsplash.com/photo-1543945696-4f1116f30c03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(15, 4, 'Music', 'https://images.unsplash.com/photo-1524567248408-cbfd37e65e2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(16, 5, 'Nature', 'https://i.pinimg.com/originals/96/09/f3/9609f35bdc1f5fa2d00cc077fd64daf3.jpg'),
(17, 5, 'Nature', 'https://images.unsplash.com/photo-1536152470836-b943b246224c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(18, 5, 'Nature', 'https://images.unsplash.com/photo-1548625149-720134d51a3a?ixlib=rb-1.2.1&w=1000&q=80'),
(19, 5, 'Nature', 'https://i.pinimg.com/originals/03/a4/98/03a498513ca7bd4c8b4c670fb469c53d.jpg'),
(20, 6, 'Other', 'https://images.unsplash.com/photo-1531604250646-2f0e818c4f06?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(21, 6, 'Other', 'https://images.unsplash.com/photo-1502736842968-bcaab72d0700?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80'),
(22, 6, 'Other', 'https://images.unsplash.com/photo-1533613220915-609f661a6fe1?ixlib=rb-1.2.1&w=1000&q=80'),
(23, 6, 'Other', 'https://images.unsplash.com/photo-1536486239970-277f67f55a11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(24, 6, 'Other', 'https://images.unsplash.com/photo-1530934567261-33ff5bc9d4e9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(25, 6, 'Other', 'https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(26, 6, 'Other', 'https://images.unsplash.com/photo-1536746803623-cef87080bfc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(27, 6, 'Other', 'https://images.unsplash.com/photo-1457089328109-e5d9bd499191?ixlib=rb-1.2.1&w=1000&q=80'),
(28, 6, 'Other', 'https://images.unsplash.com/photo-1552966722-0a3e28ba2735?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&w=1000&q=80'),
(29, 6, 'Other', 'https://images.unsplash.com/photo-1561571994-3c61c554181a?ixlib=rb-1.2.1&w=1000&q=80'),
(30, 7, 'Technology', 'https://images.unsplash.com/photo-1483000805330-4eaf0a0d82da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(31, 7, 'Technology', 'https://images.unsplash.com/photo-1512295767273-ac109ac3acfa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(32, 7, 'Technology', 'https://images.unsplash.com/photo-1579567761406-4684ee0c75b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
(33, 7, 'Technology', 'https://images.unsplash.com/photo-1520509414578-d9cbf09933a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `w_category`
--
ALTER TABLE `w_category`
  ADD UNIQUE KEY `wc_id` (`wc_id`);

--
-- Indexes for table `w_wallpaper`
--
ALTER TABLE `w_wallpaper`
  ADD UNIQUE KEY `ww_id` (`ww_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `w_category`
--
ALTER TABLE `w_category`
  MODIFY `wc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `w_wallpaper`
--
ALTER TABLE `w_wallpaper`
  MODIFY `ww_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
