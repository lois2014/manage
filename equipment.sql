-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-16 11:10:40
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
-- 表的结构 `accessory`
--

CREATE TABLE `accessory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `measure` varchar(4) NOT NULL,
  `num` int(11) NOT NULL,
  `acc_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//1-上线、2-封存、3-闲置、4-报废、5-待修、 6-备用',
  `version` varchar(255) NOT NULL COMMENT '//型号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配件';

-- --------------------------------------------------------

--
-- 表的结构 `allot`
--

CREATE TABLE `allot` (
  `id` int(11) NOT NULL,
  `dev_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '//1-借出，2-借入，3-归还',
  `user_id` int(11) NOT NULL COMMENT '//操作人',
  `dev_usage` text COMMENT '用途',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dep_id` int(11) NOT NULL COMMENT '//使用部门',
  `remark` text NOT NULL COMMENT '//备注',
  `access_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '//1-通过，2-审核中，3-不通过',
  `master` varchar(50) NOT NULL COMMENT '//审核人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='//分类';

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `decription` text NOT NULL,
  `master` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '//设备名称',
  `type_id` int(11) NOT NULL COMMENT '//设备类型',
  `version` varchar(255) NOT NULL COMMENT '//型号',
  `code` varchar(255) NOT NULL COMMENT '//编号',
  `maker_id` int(11) NOT NULL COMMENT '//制造商',
  `master` varchar(50) NOT NULL COMMENT '//负责人',
  `measure` varchar(4) NOT NULL COMMENT '//计量单位',
  `dev_status` tinyint(1) NOT NULL DEFAULT '3' COMMENT '//1-上线、2-封存、3-闲置、4-报废、5-待修、 6-备用',
  `user_id` int(11) NOT NULL,
  `last_user` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//0-禁用 1-可用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `device`
--

INSERT INTO `device` (`id`, `name`, `type_id`, `version`, `code`, `maker_id`, `master`, `measure`, `dev_status`, `user_id`, `last_user`, `create_time`, `update_time`, `status`) VALUES
(1, 'dell', 1, 'del 2.3', 'A12321321312', 1, 'Tager', '台', 3, 1, 1, '2016-10-14 12:56:22', '2016-10-14 12:56:22', 1);

-- --------------------------------------------------------

--
-- 表的结构 `device_detail`
--

CREATE TABLE `device_detail` (
  `id` int(11) NOT NULL,
  `dev_id` int(11) NOT NULL COMMENT '//设备id',
  `available` int(11) NOT NULL DEFAULT '0'COMMENT
) ;

-- --------------------------------------------------------

--
-- 表的结构 `device_status_log`
--

CREATE TABLE `device_status_log` (
  `id` int(11) NOT NULL,
  `dev_id` int(11) NOT NULL,
  `old_status` tinyint(1) NOT NULL COMMENT '//1-上线、2-封存、3-闲置、4-报废、5-待修、 6-备用',
  `new_status` tinyint(1) NOT NULL COMMENT '//1-上线、2-封存、3-闲置、4-报废、5-待修、6-备用',
  `reason` text NOT NULL,
  `dep_id` int(11) NOT NULL,
  `dep_advice` text NOT NULL,
  `master` varchar(50) NOT NULL,
  `charge_advice` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `doc_path` varchar(255) DEFAULT NULL,
  `dev_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dev_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//1-购买，2-自主研发',
  `last_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备文档';

-- --------------------------------------------------------

--
-- 表的结构 `linkman`
--

CREATE TABLE `linkman` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `moblie` varchar(11) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联系人';

-- --------------------------------------------------------

--
-- 表的结构 `production`
--

CREATE TABLE `production` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pro_status` tinyint(1) NOT NULL COMMENT '//1-新建项目，2-研发中，3-完成,4-失败',
  `type_id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL COMMENT '//型号',
  `description` text NOT NULL,
  `master` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

--
-- 转存表中的数据 `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `description`, `address`, `create_time`, `update_time`, `status`) VALUES
(1, '戴尔', '戴尔（Dell），是一家总部位于美国德克萨斯州朗德罗克的世界五百强企业，由迈克尔·戴尔于1984年创立。戴尔以生产、设计、销售家用以及办公室电脑而闻名，不过它同时也涉足高端电脑市场，生产与销售服务器、数据储存设备、网络设备等。', '美国德克萨斯州朗德罗克', '2016-10-14 12:39:52', '2016-10-14 12:39:52', 1),
(2, '海尔', '海尔集团创业于1984年，是全球大型家电第一品牌，目前已从传统制造家电产品的企业转型为面向全社会孵化创客的平台。在互联网时代，海尔致力于成为互联网企业，颠覆传统企业自成体系的封闭系统，变成网络互联中的节点，互联互通各种资源，打造共创共赢新平台，实现攸关各方的共赢增', '中国山东青岛', '2016-10-14 12:39:52', '2016-10-14 12:39:52', 1);

-- --------------------------------------------------------

--
-- 表的结构 `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `type`
--

INSERT INTO `type` (`id`, `type_name`, `create_time`, `update_time`, `status`) VALUES
(1, '电脑', '2016-10-14 12:36:22', '2016-10-14 12:36:22', 1),
(2, '空调', '2016-10-14 12:36:22', '2016-10-14 12:36:22', 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_ip` varchar(255) NOT NULL,
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-删除 1-正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `reg_ip`, `reg_time`, `update_time`, `status`) VALUES
(1, 'qzz', 'e10adc3949ba59abbe56e057f20f883e', '12', '2016-10-14 00:00:00', '2016-10-14 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessory`
--
ALTER TABLE `accessory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allot`
--
ALTER TABLE `allot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_status_log`
--
ALTER TABLE `device_status_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linkman`
--
ALTER TABLE `linkman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `accessory`
--
ALTER TABLE `accessory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `allot`
--
ALTER TABLE `allot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `device_detail`
--
ALTER TABLE `device_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `device_status_log`
--
ALTER TABLE `device_status_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `linkman`
--
ALTER TABLE `linkman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `production`
--
ALTER TABLE `production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
