-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 17, 2020 at 03:14 AM
-- Server version: 10.1.44-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_category`
--

CREATE TABLE `{prefix}_category` (
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT 0,
  `topic` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_category`
--

INSERT INTO `{prefix}_category` (`type`, `category_id`, `topic`, `color`, `published`) VALUES
('model_id', 2, 'Asus', '', 1),
('type_id', 3, 'โปรเจ็คเตอร์', '', 1),
('type_id', 2, 'เครื่องพิมพ์', '', 1),
('model_id', 3, 'Cannon', '', 1),
('category_id', 1, 'เครื่องใช้ไฟฟ้า', '', 1),
('category_id', 2, 'วัสดุสำนักงาน', '', 1),
('model_id', 1, 'Apple', '', 1),
('type_id', 1, 'เครื่องคอมพิวเตอร์', '', 1),
('model_id', 4, 'ACER', '', 1),
('type_id', 4, 'จอมอนิเตอร์', '', 1),
('unit', 1, 'ชิ้น', NULL, 1),
('unit', 2, 'อัน', NULL, 1),
('unit', 3, 'กล่อง', NULL, 1),
('unit', 4, 'เครื่อง', NULL, 1),
('unit', 5, 'แพ็ค', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_language`
--

CREATE TABLE `{prefix}_language` (
  `id` int(11) NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text COLLATE utf8_unicode_ci,
  `en` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_borrow`
--

CREATE TABLE `{prefix}_borrow` (
  `id` int(11) NOT NULL,
  `borrow_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เลขที่ใบเบิก',
  `transaction_date` date NOT NULL COMMENT 'วันเวลาที่ทำรายการ',
  `borrower_id` int(11) NOT NULL COMMENT 'ผู้เบิก',
  `borrow_date` date NOT NULL COMMENT 'วันที่ต้องการเบิก',
  `return_date` date DEFAULT NULL COMMENT 'กำหนดคืน'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_borrow_items`
--

CREATE TABLE `{prefix}_borrow_items` (
  `id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `topic` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `num_requests` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_inventory`
--

CREATE TABLE `{prefix}_inventory` (
  `id` int(11) NOT NULL,
  `topic` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_no` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `stock` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `detail` text COLLATE utf8_unicode_ci,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_inventory`
--

INSERT INTO `{prefix}_inventory` (`id`, `topic`, `product_no`, `create_date`, `unit`, `stock`, `status`, `detail`, `category_id`) VALUES
(1, 'จอมอนิเตอร์ ACER S220HQLEBD', '1108-365D', '2018-08-28 19:49:33', 1, 1, 1, NULL, 1),
(2, 'ASUS A550JX', '0000-0001', '2018-08-28 19:49:33', 1, 1, 1, NULL, 1),
(3, 'Crucial 4GB DDR3L&amp;1600 SODIMM', 'IF111/036/1', '2018-08-28 19:49:33', 1, 1, 1, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_number`
--

CREATE TABLE `{prefix}_number` (
  `id` int(11) NOT NULL,
  `product_no` int(11) DEFAULT '0',
  `borrow_no` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_number`
--

INSERT INTO `{prefix}_number` (`id`, `product_no`, `borrow_no`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_user`
--

CREATE TABLE `{prefix}_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `permission` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceID` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited` int(11) DEFAULT 0,
  `lastvisited` int(11) DEFAULT 0,
  `session_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `social` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Indexes for table `{prefix}_category`
--
ALTER TABLE `{prefix}_category`
  ADD KEY `type` (`type`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `{prefix}_language`
--
ALTER TABLE `{prefix}_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_borrow`
--
ALTER TABLE `{prefix}_borrow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_borrow_items`
--
ALTER TABLE `{prefix}_borrow_items`
  ADD PRIMARY KEY (`borrow_id`,`id`) USING BTREE;

--
-- Indexes for table `{prefix}_inventory`
--
ALTER TABLE `{prefix}_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_no` (`product_no`);

--
-- Indexes for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `id_card` (`id_card`);

--
-- AUTO_INCREMENT for table `{prefix}_language`
--
ALTER TABLE `{prefix}_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_borrow`
--
ALTER TABLE `{prefix}_borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_inventory`
--
ALTER TABLE `{prefix}_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
