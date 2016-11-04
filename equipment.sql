/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : equipment

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-11-04 18:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accessory`
-- ----------------------------
DROP TABLE IF EXISTS `accessory`;
CREATE TABLE `accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `measure` varchar(4) NOT NULL,
  `num` int(11) NOT NULL,
  `acc_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//1-上线、2-封存、3-闲置、4-报废、5-待修、 6-备用',
  `version` varchar(255) NOT NULL COMMENT '//型号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配件';

-- ----------------------------
-- Records of accessory
-- ----------------------------

-- ----------------------------
-- Table structure for `allot`
-- ----------------------------
DROP TABLE IF EXISTS `allot`;
CREATE TABLE `allot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '//1-借出，2-归还, 3-回收维护',
  `user_id` int(11) NOT NULL COMMENT '//操作人',
  `dev_usage` text COMMENT '用途',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dep_id` int(11) NOT NULL COMMENT '//使用部门',
  `remark` text COMMENT '//备注',
  `access_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '//1-通过，2-审核中，3-不通过',
  `master` varchar(50) DEFAULT NULL COMMENT '//审核人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allot
-- ----------------------------
INSERT INTO `allot` VALUES ('1', '1', '1', '1', 'qqqq', '2016-10-19 11:23:37', '2016-10-19 11:23:37', '1', '1', null, '1', null);
INSERT INTO `allot` VALUES ('2', '2', '3', '1', '维修', '2016-10-19 17:57:49', '2016-10-19 17:57:49', '1', '1', null, '3', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='//分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '自主研发', '2016-10-11 18:04:48', '2016-10-11 18:04:48', '1');
INSERT INTO `category` VALUES ('2', '购买', '2016-10-11 18:05:03', '2016-10-11 18:05:03', '1');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `decription` text NOT NULL,
  `master` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '部门1', '0', '12', 'qzz', '2016-10-19 15:44:34', '2016-10-19 15:44:34', '1');

-- ----------------------------
-- Table structure for `device`
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '//设备名称',
  `type_id` int(11) NOT NULL COMMENT '//设备类型',
  `version` varchar(255) NOT NULL COMMENT '//型号',
  `code` varchar(255) NOT NULL COMMENT '//编号',
  `maker_id` int(11) NOT NULL COMMENT '//制造商',
  `master` varchar(50) NOT NULL COMMENT '//负责人',
  `measure` varchar(50) DEFAULT NULL COMMENT '//计量单位',
  `dev_status` tinyint(1) NOT NULL DEFAULT '3' COMMENT '//1-上线、2-封存、3-闲置、4-报废、5-待修、 6-备用',
  `user_id` int(11) DEFAULT NULL,
  `last_user` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//0-禁用 1-可用',
  `maker` varchar(255) DEFAULT NULL COMMENT '//生产商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'dell', '1', 'dell 2.3', '21312', '1', '21312', 'tai', '3', '1', '1', '2016-10-11 13:59:29', '2016-10-11 13:59:29', '1', null);
INSERT INTO `device` VALUES ('2', 'dell2', '1', 'dell 3.23 ', '123', '2', '21312312', 'tai', '3', '1', '1', '2016-10-11 14:03:35', '2016-10-11 14:03:35', '1', null);
INSERT INTO `device` VALUES ('3', 'dell233', '1', 'dell 3.23', '21312', '2', '21312', 'tai', '3', '1', '1', '2016-10-11 14:34:35', '2016-10-11 14:34:35', '1', null);
INSERT INTO `device` VALUES ('4', '21321', '2', '21312', '21321', '1', '12312', 'tai', '3', '1', '1', '2016-10-11 14:36:32', '2016-10-11 14:36:32', '1', null);
INSERT INTO `device` VALUES ('5', 'deds', '2', 'sd', 'wqe', '1', 'wqe', 'tai', '3', '1', '1', '2016-10-11 14:39:53', '2016-10-11 14:39:53', '1', null);
INSERT INTO `device` VALUES ('6', 'dell', '2', '21312', '123213124', '1', '21321', 'tai', '3', '1', '1', '2016-10-11 14:44:38', '2016-10-11 14:44:38', '1', null);
INSERT INTO `device` VALUES ('7', 'lenv', '2', 'lenv 2.32', '12312', '1', '21321', 'tai', '3', '1', '1', '2016-10-11 15:00:24', '2016-10-11 15:00:24', '1', null);
INSERT INTO `device` VALUES ('8', 'Haier', '2', 'Haier2.3', '123123', '2', '21312', '213', '3', '1', '1', '2016-10-12 09:29:48', '2016-10-12 09:29:48', '1', null);
INSERT INTO `device` VALUES ('9', '12', '1', '12', '213', '1', '12', '12', '3', '1', '1', '2016-10-13 19:54:49', '2016-10-13 19:54:49', '1', null);

-- ----------------------------
-- Table structure for `device_detail`
-- ----------------------------
DROP TABLE IF EXISTS `device_detail`;
CREATE TABLE `device_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` int(11) NOT NULL COMMENT '//设备id',
  `available` int(11) NOT NULL DEFAULT '0',
  `buy_time` datetime DEFAULT NULL COMMENT '//购买日期',
  `check_time` datetime DEFAULT NULL COMMENT '//验收日期',
  `weight` double DEFAULT NULL COMMENT '//重量',
  `unit` varchar(4) DEFAULT NULL COMMENT '//单位',
  `maintence` double DEFAULT NULL COMMENT '//保修期限 月',
  `pay` double DEFAULT NULL COMMENT '//原价',
  `value` double DEFAULT NULL COMMENT '//现价',
  `user_id` int(11) NOT NULL COMMENT '//录入操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_user` int(11) NOT NULL COMMENT '//最近的操作人',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `device_status_log`
-- ----------------------------
DROP TABLE IF EXISTS `device_status_log`;
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
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_status_log
-- ----------------------------

-- ----------------------------
-- Table structure for `dev_order`
-- ----------------------------
DROP TABLE IF EXISTS `dev_order`;
CREATE TABLE `dev_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) DEFAULT NULL,
  `dev_name` varchar(50) NOT NULL COMMENT '//设备名称',
  `version` varchar(255) NOT NULL COMMENT '//型号',
  `maker` varchar(255) NOT NULL COMMENT '//制造商',
  `dep_id` int(11) NOT NULL COMMENT '//申请部门',
  `user_id` int(11) NOT NULL COMMENT '//申请人',
  `get_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '//申请收货时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '//数量',
  `sup_id` int(11) NOT NULL COMMENT '//供应商',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//0-丢弃, 1-可用',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//1-待审核，2-待购置, 3-待验收，4-待确认，5-待入库, 6-入库',
  `price` int(11) NOT NULL COMMENT '//费用',
  `real_get_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '//实际到货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dev_order
-- ----------------------------
INSERT INTO `dev_order` VALUES ('2', 'FA21429067648862', 'dell', 'dell v2.1', '戴尔', '1', '1', '2016-10-21 17:41:46', '2016-10-21 17:41:46', '2', '1', '1', '2016-10-21 17:41:46', '1', '10000', null);
INSERT INTO `dev_order` VALUES ('3', 'FA25724411961516', 'dell', 'dell2.3', 'daier', '1', '1', '2016-10-25 13:14:01', '2016-10-25 13:14:01', '2', '1', '1', '2016-10-25 13:14:01', '1', '10000', null);
INSERT INTO `dev_order` VALUES ('4', 'FA25727091013935', 'qew', '21321', '12312', '1', '1', '2016-10-25 13:18:29', '2016-10-25 13:18:29', '1', '1', '1', '2016-10-25 13:18:29', '1', '10000', null);

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `doc_path` varchar(255) DEFAULT NULL,
  `dev_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `dev_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//1-购买，2-自主研发',
  `last_user` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '//1-设备原始文档 2-附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备文档';

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for `linkman`
-- ----------------------------
DROP TABLE IF EXISTS `linkman`;
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
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联系人';

-- ----------------------------
-- Records of linkman
-- ----------------------------

-- ----------------------------
-- Table structure for `order_log`
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL,
  `reason` text,
  `memo` text,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `production`
-- ----------------------------
DROP TABLE IF EXISTS `production`;
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
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of production
-- ----------------------------

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '戴尔', '戴尔（Dell），是一家总部位于美国德克萨斯州朗德罗克的世界五百强企业，由迈克尔·戴尔于1984年创立。戴尔以生产、设计、销售家用以及办公室电脑而闻名，不过它同时也涉足高端电脑市场，生产与销售服务器、数据储存设备、网络设备等。', '美国德克萨斯州朗德罗克', '2016-10-11 18:35:27', '2016-10-11 18:35:27', '1');
INSERT INTO `supplier` VALUES ('2', '海尔', '海尔集团创业于1984年，是全球大型家电第一品牌，目前已从传统制造家电产品的企业转型为面向全社会孵化创客的平台。在互联网时代，海尔致力于成为互联网企业，颠覆传统企业自成体系的封闭系统，变成网络互联中的节点，互联互通各种资源，打造共创共赢新平台，实现攸关各方的共赢增值', '中国山东青岛', '2016-10-11 18:38:27', '2016-10-11 18:38:27', '1');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-删除，1-正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '电脑', '2016-10-11 18:21:29', '2016-10-11 18:21:29', '1');
INSERT INTO `type` VALUES ('2', '空调', '2016-10-11 18:24:40', '2016-10-11 18:24:40', '1');
INSERT INTO `type` VALUES ('3', '洗衣机', '2016-10-11 18:31:50', '2016-10-11 18:31:50', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_ip` varchar(255) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-删除 1-正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'qzz', 'c20ad4d76fe97759aa27a0c99bff6710', '12', '2016-10-11 09:20:38', '2016-10-11 09:20:52', '1');

-- ----------------------------
-- Table structure for `workflow_defination`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_defination`;
CREATE TABLE `workflow_defination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '流程名称',
  `handler` varchar(50) DEFAULT NULL COMMENT '流程处理辅助文件',
  `status` tinyint(1) DEFAULT '1' COMMENT '//状态 0-禁用 1-可用',
  `init_function` varchar(50) DEFAULT NULL COMMENT '流程初始化函数',
  `run_function` varchar(50) DEFAULT NULL COMMENT '流程运行函数',
  `save_function` varchar(50) DEFAULT NULL COMMENT '流程保存函数',
  `transit_function` varchar(50) DEFAULT NULL COMMENT '流程流转函数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_defination
-- ----------------------------

-- ----------------------------
-- Table structure for `workflow_node`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_node`;
CREATE TABLE `workflow_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `def_id` int(11) NOT NULL COMMENT '流程id',
  `index` int(11) NOT NULL COMMENT '节点序号',
  `name` varchar(50) NOT NULL COMMENT '节点名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '节点类型 1-人为决策 2-自动决策',
  `init_function` varchar(50) DEFAULT NULL COMMENT '流程初始化函数',
  `run_function` varchar(50) DEFAULT NULL COMMENT '流程运行函数',
  `save_function` varchar(50) DEFAULT NULL COMMENT '流程保存函数',
  `transit_function` varchar(50) DEFAULT NULL COMMENT '流程流转函数',
  `prev_index` int(11) DEFAULT NULL COMMENT '前节点序号',
  `next_index` int(11) DEFAULT NULL COMMENT '下节点序号',
  `executor` text COMMENT '执行角色，组，人{''group'':{''''}}',
  `execute_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行类型 0-需所有人 1-只需一人',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提醒 0-不提醒 1-邮件',
  `field` text NOT NULL COMMENT '可编辑字段',
  `max_day` int(11) DEFAULT NULL COMMENT '最长时间(天)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_node
-- ----------------------------

-- ----------------------------
-- Table structure for `workflow_process`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_process`;
CREATE TABLE `workflow_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `def_id` int(11) NOT NULL COMMENT '流程id',
  `description` text COMMENT '进程描述',
  `node_index` int(11) NOT NULL COMMENT '节点序号',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '流程启动时间',
  `finish_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-运行  2-结束',
  `start_user` varchar(50) DEFAULT NULL COMMENT '发起人',
  `context` varchar(50) DEFAULT NULL COMMENT '上下文 如业务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_process
-- ----------------------------

-- ----------------------------
-- Table structure for `workflow_thread`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_thread`;
CREATE TABLE `workflow_thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL COMMENT '进程id',
  `pro_desc` text COMMENT '进程描述',
  `node_id` int(11) NOT NULL COMMENT '结点id',
  `node_name` varchar(50) DEFAULT NULL COMMENT '结点名称',
  `executor` varchar(11) NOT NULL COMMENT '执行人',
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '线程生成时间',
  `recieve_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '线程接收时间',
  `finish_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '线程完成时间',
  `max_day` int(11) DEFAULT NULL COMMENT '结点规定最长时间(天)',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态 0-未接收 1-已接收 2-已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_thread
-- ----------------------------
