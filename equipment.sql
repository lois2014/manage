/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : equipment

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-11-11 18:11:54
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `get_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '//申请收货时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '//数量',
  `sup_id` int(11) NOT NULL COMMENT '//供应商',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//0-丢弃, 1-正常',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//0-新建，1-待审核，2-待购置, 3-待验收，4-待确认，5-待入库, 6-入库',
  `price` int(11) NOT NULL COMMENT '//费用',
  `real_get_time` timestamp NULL DEFAULT NULL COMMENT '//实际到货时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dev_order
-- ----------------------------
INSERT INTO `dev_order` VALUES ('2', 'FA21429067648862', 'dell', 'dell v2.1', '戴尔', '1', '1', '2016-10-21 17:41:46', '2016-10-21 17:41:46', '2', '1', '1', '2016-10-21 17:41:46', '1', '10000', null);
INSERT INTO `dev_order` VALUES ('3', 'FA25724411961516', 'dell', 'dell2.3', 'daier', '1', '1', '2016-10-25 13:14:01', '2016-10-25 13:14:01', '2', '1', '1', '2016-10-25 13:14:01', '1', '10000', null);
INSERT INTO `dev_order` VALUES ('4', 'FA25727091013935', 'qew', '21321', '12312', '1', '1', '2016-10-25 13:18:29', '2016-10-25 13:18:29', '1', '1', '1', '2016-10-25 13:18:29', '1', '10000', null);
INSERT INTO `dev_order` VALUES ('5', 'FB09751039928438', 'dell', '12sw', 'wqewq', '1', '1', '2016-11-09 15:05:04', '2016-11-09 15:05:04', '1', '1', '1', '2016-11-09 15:05:04', '0', '121', null);
INSERT INTO `dev_order` VALUES ('6', 'FB09763874296989', 'q221', '213', '123', '1', '1', '2016-11-09 15:26:27', '2016-11-09 15:26:27', '1', '1', '1', '2016-11-09 15:26:27', '0', '12', null);
INSERT INTO `dev_order` VALUES ('7', 'FB09772751206403', '121', '21312', '213', '1', '1', '2016-11-09 15:41:15', '2016-11-09 15:41:15', '2', '1', '1', '2016-11-09 15:41:15', '0', '21321', null);
INSERT INTO `dev_order` VALUES ('14', 'FB09794486606498', '21321', '21312', '231', '1', '1', '2016-11-09 16:17:28', '2016-11-09 16:17:28', '1', '2', '1', '2016-11-09 16:17:28', '0', '11', null);
INSERT INTO `dev_order` VALUES ('15', 'FB09797013416492', '21321', '21312', '2313', '1', '1', '2016-11-09 16:21:41', '2016-11-09 16:21:41', '1', '1', '1', '2016-11-09 16:21:41', '0', '11', null);
INSERT INTO `dev_order` VALUES ('16', 'FB10414454687217', 'wqeqw', 'wqewq', 'qweqwe', '1', '1', '2016-11-10 09:42:07', '2016-11-10 09:30:45', '1', '1', '1', '2016-11-10 09:46:45', '1', '11', '2016-11-10 09:46:41');

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
-- Table structure for `workflow_definition`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_definition`;
CREATE TABLE `workflow_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '流程名称',
  `handler` varchar(50) DEFAULT NULL COMMENT '流程处理辅助文件',
  `status` tinyint(1) DEFAULT '1' COMMENT '//状态 0-禁用 1-可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_definition
-- ----------------------------
INSERT INTO `workflow_definition` VALUES ('1', '购置', 'Purchase', '1');

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
  `prev_index` varchar(50) DEFAULT NULL COMMENT '前节点序号',
  `next_index` varchar(50) DEFAULT NULL COMMENT '下节点序号',
  `executor` text COMMENT '执行角色，组，人{''group'':{''''}}',
  `execute_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行类型 0-需所有人 1-只需一人',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提醒 0-不提醒 1-邮件',
  `field` text COMMENT '可编辑字段',
  `max_day` int(11) DEFAULT NULL COMMENT '最长时间(天)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_node
-- ----------------------------
INSERT INTO `workflow_node` VALUES ('1', '1', '1', '待审核', '1', 'init', 'run', 'save', 'transit', '0', '2,3', '{\"user\":\"1\"}', '1', '0', null, '1');
INSERT INTO `workflow_node` VALUES ('2', '1', '2', '通过', '1', 'init', 'run', 'save', 'transit', '1', '4', '{\"user\":\"1\"}', '1', '0', null, '1');
INSERT INTO `workflow_node` VALUES ('3', '1', '3', '不通过', '1', 'init', 'run', 'save', 'transit', '1', '4', '{\"user\":\"1\"}', '1', '0', null, '1');
INSERT INTO `workflow_node` VALUES ('4', '1', '4', '结束', '1', 'init', 'run', 'save', 'transit', '2,3', '0', '{\"user\":\"1\"}', '1', '0', null, '1');
INSERT INTO `workflow_node` VALUES ('5', '1', '0', '新建', '1', 'init', 'run', 'save', 'transit', '-1', '1', '{\"user\":\"1\"}', '1', '0', null, '1');

-- ----------------------------
-- Table structure for `workflow_process`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_process`;
CREATE TABLE `workflow_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `def_id` int(11) NOT NULL COMMENT '流程id',
  `des` text COMMENT '进程描述',
  `node_index` int(11) NOT NULL COMMENT '节点序号',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '流程启动时间',
  `finish_time` timestamp NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-运行  2-结束',
  `start_user` varchar(50) DEFAULT NULL COMMENT '发起人',
  `context` varchar(50) DEFAULT NULL COMMENT '上下文 如业务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_process
-- ----------------------------
INSERT INTO `workflow_process` VALUES ('10', '1', '运行业务Purchase', '0', '2016-11-07 12:37:10', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('11', '1', '运行业务Purchase', '0', '2016-11-07 12:40:13', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('12', '1', '运行业务Purchase', '0', '2016-11-07 12:42:51', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('13', '1', '运行业务Purchase', '0', '2016-11-07 12:44:38', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('14', '1', '运行业务Purchase', '0', '2016-11-07 12:45:07', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('15', '1', '运行业务Purchase', '0', '2016-11-07 12:50:14', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('16', '1', '运行业务Purchase', '0', '2016-11-07 12:51:01', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('17', '1', '运行业务Purchase', '0', '2016-11-07 12:51:28', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('18', '1', '运行业务Purchase', '0', '2016-11-07 12:53:09', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('19', '1', '运行业务Purchase', '0', '2016-11-07 12:54:37', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('20', '1', '运行业务Purchase', '0', '2016-11-07 12:56:15', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('21', '1', '运行业务Purchase', '0', '2016-11-07 12:57:52', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('22', '1', '运行业务Purchase', '0', '2016-11-07 12:59:19', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('23', '1', '运行业务Purchase', '0', '2016-11-07 13:00:24', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('24', '1', '运行业务Purchase', '0', '2016-11-07 13:05:42', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('25', '1', '运行业务Purchase', '0', '2016-11-07 13:06:00', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('26', '1', '运行业务Purchase', '0', '2016-11-07 13:11:40', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('27', '1', '运行业务Purchase', '0', '2016-11-07 13:12:56', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('28', '1', '运行业务Purchase', '0', '2016-11-07 13:13:25', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('29', '1', '运行业务Purchase', '0', '2016-11-07 13:14:08', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('30', '1', '运行业务Purchase', '1', '2016-11-07 13:14:20', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('31', '1', '运行业务Purchase', '1', '2016-11-07 13:14:29', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('32', '1', '运行业务Purchase', '0', '2016-11-07 13:15:06', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('33', '1', '运行业务Purchase', '1', '2016-11-07 13:16:11', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('34', '1', '运行业务Purchase', '1', '2016-11-07 13:18:36', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('35', '1', '运行业务Purchase', '0', '2016-11-07 13:23:09', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('36', '1', '运行业务Purchase', '0', '2016-11-07 13:23:58', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('37', '1', '运行业务Purchase', '0', '2016-11-07 13:25:18', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('38', '1', '运行业务Purchase', '0', '2016-11-07 13:25:30', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('39', '1', '运行业务Purchase', '1', '2016-11-07 13:25:38', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('40', '1', '运行业务Purchase', '1', '2016-11-07 13:46:54', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('41', '1', '运行业务Purchase', '1', '2016-11-07 14:07:20', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('42', '1', '运行业务Purchase', '1', '2016-11-08 14:37:39', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('43', '1', '运行业务Purchase', '1', '2016-11-08 15:04:01', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('44', '1', '运行业务Purchase', '1', '2016-11-08 15:04:58', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('45', '1', '运行业务Purchase', '1', '2016-11-08 15:05:32', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('46', '1', '运行业务Purchase', '1', '2016-11-08 15:08:11', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('47', '1', '运行业务Purchase', '1', '2016-11-08 15:09:31', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('48', '1', '运行业务Purchase', '1', '2016-11-08 15:52:21', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('49', '1', '运行业务Purchase', '1', '2016-11-08 15:53:29', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('50', '1', '运行业务Purchase', '1', '2016-11-08 15:54:37', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('51', '1', '运行业务Purchase', '1', '2016-11-08 15:56:16', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('52', '1', '运行业务Purchase', '1', '2016-11-08 16:00:19', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('53', '1', '运行业务Purchase', '1', '2016-11-08 16:01:44', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('54', '1', '运行业务Purchase', '1', '2016-11-08 16:24:13', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('55', '1', '运行业务Purchase', '1', '2016-11-08 16:25:29', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('56', '1', '运行业务Purchase', '1', '2016-11-08 16:26:37', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('57', '1', '运行业务Purchase', '1', '2016-11-08 16:27:03', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('58', '1', '运行业务Purchase', '1', '2016-11-08 16:27:26', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('59', '1', '运行业务Purchase', '1', '2016-11-08 16:27:49', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('60', '1', '运行业务Purchase', '1', '2016-11-08 16:28:19', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('61', '1', '运行业务Purchase', '1', '2016-11-08 16:50:59', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('62', '1', '运行业务Purchase', '1', '2016-11-08 16:51:39', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('63', '1', '初始化Purchase', '1', '2016-11-09 14:28:02', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('64', '1', '初始化Purchase', '1', '2016-11-09 14:29:07', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('65', '1', '初始化Purchase', '1', '2016-11-09 14:32:28', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('66', '1', '初始化Purchase', '1', '2016-11-09 14:40:06', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('67', '1', '新建', '0', '2016-11-09 14:47:45', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('68', '1', '新建', '0', '2016-11-09 15:23:58', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('69', '1', '新建', '0', '2016-11-09 15:25:11', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('70', '1', '初始化Purchase', '1', '2016-11-09 15:26:27', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('71', '1', '初始化Purchase', '1', '2016-11-09 15:41:15', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('72', '1', '初始化Purchase', '1', '2016-11-09 15:57:14', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('73', '1', '初始化Purchase', '1', '2016-11-09 16:07:35', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('74', '1', '初始化Purchase', '1', '2016-11-09 16:09:26', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('75', '1', '新建', '0', '2016-11-09 16:10:45', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('76', '1', '新建', '0', '2016-11-09 16:12:37', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('77', '1', '新建', '0', '2016-11-09 16:13:41', null, '1', 'qzz', null);
INSERT INTO `workflow_process` VALUES ('78', '1', '初始化Purchase', '1', '2016-11-09 16:17:28', null, '1', 'qzz', '14');
INSERT INTO `workflow_process` VALUES ('79', '1', '初始化Purchase', '1', '2016-11-09 16:21:41', null, '1', 'qzz', '15');
INSERT INTO `workflow_process` VALUES ('80', '1', '初始化Purchase', '1', '2016-11-10 09:30:45', null, '1', 'qzz', '16');

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
  `executor` varchar(50) NOT NULL COMMENT '执行人',
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '线程生成时间',
  `receive_time` timestamp NULL DEFAULT NULL COMMENT '线程接收时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '线程完成时间',
  `max_day` int(11) DEFAULT NULL COMMENT '结点规定最长时间(天)',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态 0-未接收 1-已接收 2-已处理 3-关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workflow_thread
-- ----------------------------
INSERT INTO `workflow_thread` VALUES ('1', '33', '运行业务Purchase', '2', '通过', '{\"user\":\"1\"}', '2016-11-07 13:16:11', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('2', '34', '运行业务Purchase', '2', '通过', '{\"user\":\"1\"}', '2016-11-07 13:18:36', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('4', '40', '运行业务Purchase', '1', '申请', '{\"user\":\"1\"}', '2016-11-07 13:48:17', null, null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('5', '41', '运行业务Purchase', '1', '申请', '{\"user\":\"1\"}', '2016-11-07 16:12:54', '2016-11-07 18:07:01', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('6', '42', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 14:37:39', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('7', '43', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:04:01', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('8', '44', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:04:58', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('9', '45', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:05:32', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('10', '46', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:08:11', null, '2016-11-08 15:08:11', '1', '3');
INSERT INTO `workflow_thread` VALUES ('11', '47', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:09:31', null, '2016-11-08 15:09:31', '1', '3');
INSERT INTO `workflow_thread` VALUES ('12', '48', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:52:21', '2016-11-08 18:28:37', '2016-11-08 18:26:43', '1', '1');
INSERT INTO `workflow_thread` VALUES ('13', '49', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:53:29', '2016-11-09 13:30:06', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('14', '50', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:54:37', '2016-11-09 13:37:02', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('15', '51', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 15:56:16', '2016-11-09 13:55:51', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('16', '52', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:00:19', '2016-11-09 13:56:55', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('17', '53', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:01:45', '2016-11-09 13:58:10', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('18', '54', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:24:13', '2016-11-09 14:03:40', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('19', '55', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:25:29', '2016-11-09 14:47:37', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('20', '56', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:26:37', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('21', '57', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:27:03', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('22', '58', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:27:26', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('23', '59', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:27:49', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('24', '60', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:28:19', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('25', '61', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:50:59', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('26', '62', '运行业务Purchase', '1', '待审核', '{\"user\":\"1\"}', '2016-11-08 16:51:39', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('27', '63', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 14:28:02', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('28', '64', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 14:29:07', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('29', '65', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 14:32:28', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('30', '66', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 14:40:06', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('31', '70', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 15:26:27', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('32', '71', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 15:41:15', null, null, '1', '0');
INSERT INTO `workflow_thread` VALUES ('33', '72', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 15:57:14', '2016-11-09 15:57:16', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('34', '73', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 16:07:35', '2016-11-09 16:07:37', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('35', '74', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 16:09:26', '2016-11-09 16:09:28', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('36', '78', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 16:17:28', '2016-11-09 16:17:30', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('37', '79', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-09 16:21:41', '2016-11-09 16:21:43', null, '1', '1');
INSERT INTO `workflow_thread` VALUES ('38', '80', '新建', '1', '待审核', '{\"user\":\"1\"}', '2016-11-10 09:30:45', '2016-11-10 09:42:07', null, '1', '1');
