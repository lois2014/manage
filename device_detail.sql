-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-16 11:21:16
-- 服务器版本： 5.7.11
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `equipment`
--

-- --------------------------------------------------------

--
-- 表的结构 `device_detail`
--

CREATE TABLE `device_detail` (
  `id` int(11) NOT NULL,
  `dev_id` int(11) NOT NULL COMMENT '//设备id',
  `available` int(11) NOT NULL DEFAULT '0',
  `buy_time` datetime DEFAULT NULL COMMENT  '//购买日期',
  `check_time` datetime DEFAULT NULL COMMENT  '//验收日期',
  `weight` double DEFAULT NULL COMMENT  '//重量',
  `unit` varchar(4) DEFAULT NULL COMMENT  '//单位',
  `maintence` double DEFAULT NULL COMMENT  '//保修期限 月',
  `pay` double DEFAULT NULL COMMENT '//原价',
  `value` double DEFAULT NULL COMMENT  '//现价',
  `user_id` int(11) NOT NULL COMMENT '//录入操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_user` int(11) NOT NULL COMMENT '//最近的操作人',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `device_detail`
--
ALTER TABLE `device_detail`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `device_detail`
--
ALTER TABLE `device_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
