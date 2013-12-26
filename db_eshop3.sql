/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : db_eshop3

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2011-07-18 10:24:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(2) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_pwd` varchar(50) NOT NULL,
  `admin_type` int(1) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'ISMvKXpXpadDiUoOSoAfww==', '1');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(5) NOT NULL AUTO_INCREMENT,
  `cart_mem_id` int(5) DEFAULT NULL,
  `cart_mer_id` int(6) DEFAULT NULL,
  `cart_num` int(3) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK2E7B205EE14CBC` (`cart_mem_id`),
  KEY `FK2E7B20B77D049F` (`cart_mer_id`),
  CONSTRAINT `FK2E7B205EE14CBC` FOREIGN KEY (`cart_mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `FK2E7B20B77D049F` FOREIGN KEY (`cart_mer_id`) REFERENCES `merchantable` (`mer_id`),
  CONSTRAINT `FK_CART_ID` FOREIGN KEY (`cart_mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `FK_CART_MER_ID` FOREIGN KEY (`cart_mer_id`) REFERENCES `merchantable` (`mer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `eval_id` int(3) NOT NULL AUTO_INCREMENT,
  `eval_mem_id` int(5) DEFAULT NULL,
  `eval_mer_id` int(6) DEFAULT NULL,
  `eval_date` varchar(20) DEFAULT NULL,
  `eval_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`eval_id`),
  KEY `FK9A4AC997B1C33C0` (`eval_mem_id`),
  KEY `FK9A4AC99D3B7EBA3` (`eval_mer_id`),
  CONSTRAINT `FK9A4AC997B1C33C0` FOREIGN KEY (`eval_mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `FK9A4AC99D3B7EBA3` FOREIGN KEY (`eval_mer_id`) REFERENCES `merchantable` (`mer_id`),
  CONSTRAINT `FK_EVALUATE_MEN_ID` FOREIGN KEY (`eval_mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `FK_EVALUATE_MER_ID` FOREIGN KEY (`eval_mer_id`) REFERENCES `merchantable` (`mer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '1', '23', '2011-07-09:11:24:22', '');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mem_id` int(5) NOT NULL AUTO_INCREMENT,
  `mem_name` varchar(50) NOT NULL,
  `mem_pwd` varchar(50) NOT NULL,
  `mem_type` int(11) DEFAULT '1',
  `mem_tel` varchar(15) DEFAULT NULL,
  `mem_address` varchar(50) DEFAULT NULL,
  `mem_regist_date` varchar(10) DEFAULT NULL,
  `mem_post` varchar(10) DEFAULT NULL,
  `mem_email` varchar(20) DEFAULT NULL,
  `mem_cart_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', 'zhangxinghua', '1VER0sLyi1QHzfVubTUFsQ==', '1', '15873828111', '湖南株洲', '2010-9-30', '412100', 'edwin492@163.com', null);
INSERT INTO `member` VALUES ('2', 'chenkang', '1VER0sLyi1QHzfVubTUFsQ==', null, '13766344789', 'ganzhou', '2011-07-12', '341000', '714106749@qq.com', null);
INSERT INTO `member` VALUES ('3', 'huazai', '1VER0sLyi1QHzfVubTUFsQ==', null, '13766344796', 'ganzhou', '2011-07-12', '341000', '456346@qq.com', null);

-- ----------------------------
-- Table structure for `merchantable`
-- ----------------------------
DROP TABLE IF EXISTS `merchantable`;
CREATE TABLE `merchantable` (
  `mer_id` int(6) NOT NULL AUTO_INCREMENT,
  `mer_name` varchar(50) NOT NULL,
  `mer_type_id` int(3) DEFAULT NULL,
  `mer_place` varchar(50) DEFAULT NULL,
  `mer_price` decimal(8,2) NOT NULL,
  `mer_discount` decimal(2,1) DEFAULT NULL,
  `mer_picture` varchar(50) DEFAULT NULL,
  `mer_desc` varchar(50) DEFAULT NULL,
  `mer_producter` varchar(60) DEFAULT NULL,
  `mer_leave_date` varchar(10) DEFAULT NULL,
  `mer_add_date` varchar(10) DEFAULT NULL,
  `mer_num` int(11) DEFAULT '0',
  PRIMARY KEY (`mer_id`),
  KEY `FK25053B222D2E8336` (`mer_type_id`),
  CONSTRAINT `FK25053B222D2E8336` FOREIGN KEY (`mer_type_id`) REFERENCES `types` (`type_id`),
  CONSTRAINT `FK_MERCHANTABLE_TYPE_ID` FOREIGN KEY (`mer_type_id`) REFERENCES `types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of merchantable
-- ----------------------------
INSERT INTO `merchantable` VALUES ('1', '精通Spring2.x:企业应用开发', '1', '湖南株洲', '79.00', '8.0', 'image/1.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('2', 'EJB3实战', '1', '湖南株洲', '79.00', '8.0', 'image/2.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('3', 'Spring in Action', '1', '湖南株洲', '79.00', '8.0', 'image/3.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('4', 'Flex3权威指南', '1', '湖南株洲', '79.00', '8.0', 'image/4.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('5', '被子', '8', '湖南株洲', '79.00', '8.0', 'image/5.png', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('6', '被子', '8', '湖南株洲', '79.00', '8.0', 'image/9.png', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('7', '蓝魔 W7 MID移动互联网娱乐终端', '6', '湖南株洲', '79.00', '8.0', 'image/10.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('8', '智器 V7 MID 移动互联网终端', '6', '湖南株洲', '79.00', '8.0', 'image/11.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('9', 'ARCHOS 9 MID 移动互联网终端', '6', '湖南株洲', '79.00', '8.0', 'image/12.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('10', '智器 V5 MID 移动互联网终端', '6', '湖南株洲', '79.00', '8.0', 'image/13.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('11', '三星 SAMSUNG NP-N148-DP01CN（时尚酷黑）10.1寸笔记电脑', '6', '湖南株洲', '79.00', '8.0', 'image/14.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('12', '三星 SAMSUNG NP-N148-DP03CN（经典炫红）10.1寸', '6', '湖南株洲', '79.00', '8.0', 'image/15.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('13', '联想(Lenovo) IdeaPad S10-3(格调黑)10.1英寸LED', '6', '湖南株洲', '79.00', '8.0', 'image/16.jpg', 'good', '某某工厂', '2009-9-30', null, '0');
INSERT INTO `merchantable` VALUES ('14', '王力宏-《十八般武艺》 影音庆功版 CD+DVD+MV写真集+照片 钥匙', '2', '北京', '50.00', '5.0', 'image/18.jpg', 'good', '北京绍桐文化传播有限公司', '2011-4-20', '2011-07-04', '0');
INSERT INTO `merchantable` VALUES ('15', '林海 大明宫词 影视原声配乐专辑 10周年限量版 黑胶CD 现货发售', '3', '广东', '50.00', '7.0', 'image/19.jpg', 'good', '天风音像专营店', '2011-2-3', '2011-07-04', '0');
INSERT INTO `merchantable` VALUES ('16', '【HI-END】独一无二纪念精选: 迈克尔杰克逊-《流行乐之王》 2CD', '2', '浙江', '60.00', '6.0', 'image/20.jpg', '', '缙云县海岸地音像有限公司 ', '2008-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('17', '包邮【商城夏季大促】安踏/ANTA 跑步系列 男跑步鞋|1025519-1', '4', '东莞', '134.00', '8.0', 'image/21.jpg', '', '安踏官方网店', '2009-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('18', '【商城夏季大促】安踏/ANTA 篮球系列 男篮球套装|5011401-3', '4', '北京', '80.00', '8.5', 'image/22.jpg', '', '厦门安踏电子商务有限公司 ', '2009-5-', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('19', '鑫喆 梅花鹿茸 血沙片 0.29元 半价秒杀！腊片血片粉片鹿茸片', '9', '北京', '150.00', '6.0', 'image/23.jpg', '', '鑫喆土特产旗舰店', '2008-8-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('20', 'Jack Jones/杰克琼斯纯棉两粒扣单开叉西服B(灰)|211172007100', '7', '天津', '400.00', '8.5', 'image/24.jpg', '', '绫致时装销售（天津）有限公司', '2011-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('21', 'The Face Shop米水亮白泡沫洁面乳/大米洗面奶 男女美白补水正品', '5', '浙江杭州', '200.00', '8.0', 'image/25.jpg', '', '杭州宁久微贸易有限公司', '2011-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('22', 'The Face Shop爽洁柔和洁面泡沫凝胶/控油祛痘洗面奶 男女用正品', '5', '浙江', '200.00', '8.0', 'image/26.jpg', '', '杭州宁久微贸易有限公司', '2011-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('23', 'WB特价!华纳正版全区赠品蓝光:Inception 盗梦空间(2010)国英双语', '3', '四川', '80.00', '8.0', 'image/27.jpg', '', '成都博鲁锐科技有限公司', '2011-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('24', '[商城★正版]加勒比海盗1-3合集 3D9 DVD 全球26亿票房', '3', '北京', '80.00', '8.0', 'image/28.jpg', '', '北京飞龙恒诚电子商务有限公司', '2011-6-23', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('25', 'WB特价!华纳正版全区赠品蓝光:指环王123/魔戒三部曲套装 中文', '3', '四川', '100.00', '6.0', 'image/29.jpg', '', '成都博鲁锐科技有限公司', '2011-2-3', '2011-07-07', '0');
INSERT INTO `merchantable` VALUES ('26', '【HI-END】送礼绝佳:林俊杰-《她说》预购版2CD+DVD+预购卡+水杯', '2', '浙江，丽水', '75.00', '6.0', 'image/30.jpg', '', '缙云县海岸地音像有限公司 ', '2010-2-3', '2011-07-07', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(6) NOT NULL AUTO_INCREMENT,
  `order_date` varchar(20) DEFAULT NULL,
  `order_mem_id` int(5) DEFAULT NULL,
  `order_status` int(1) DEFAULT NULL,
  `order_send_time` varchar(60) DEFAULT NULL,
  `order_remark` varchar(100) DEFAULT NULL,
  `order_sum` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKC3DF62E5F3EED0CE` (`order_mem_id`),
  CONSTRAINT `FKC3DF62E5F3EED0CE` FOREIGN KEY (`order_mem_id`) REFERENCES `member` (`mem_id`),
  CONSTRAINT `FK_ORDER_MEM_ID` FOREIGN KEY (`order_mem_id`) REFERENCES `member` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2011-07-09', '1', '0', '工作日、双休日、假日皆可', '无', '64.00');
INSERT INTO `orders` VALUES ('2', '2011-07-09', '1', '0', '工作日、双休日、假日皆可', '无', '25.00');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(6) NOT NULL AUTO_INCREMENT,
  `record_mer_id` int(6) DEFAULT NULL,
  `record_mer_num` int(3) DEFAULT NULL,
  `record_order_id` int(6) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FKC8466C51D4DD8A4E` (`record_mer_id`),
  KEY `FKC8466C51816BF71D` (`record_order_id`),
  CONSTRAINT `FKC8466C51816BF71D` FOREIGN KEY (`record_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FKC8466C51D4DD8A4E` FOREIGN KEY (`record_mer_id`) REFERENCES `merchantable` (`mer_id`),
  CONSTRAINT `FK_RECORD_MER_ID` FOREIGN KEY (`record_mer_id`) REFERENCES `merchantable` (`mer_id`),
  CONSTRAINT `FK_RECORD_ORDER_ID` FOREIGN KEY (`record_order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '23', '1', '1');
INSERT INTO `record` VALUES ('2', '14', '1', '2');

-- ----------------------------
-- Table structure for `types`
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `type_id` int(3) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL,
  `type_desc` varchar(100) DEFAULT NULL,
  `type_recommend` int(11) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES ('1', '图书', '各类图书', '1');
INSERT INTO `types` VALUES ('2', '音乐', '各类音乐', '1');
INSERT INTO `types` VALUES ('3', '影视', '各类影视', '0');
INSERT INTO `types` VALUES ('4', '运动', '各类运动', '0');
INSERT INTO `types` VALUES ('5', '美容化妆', '各类美容化妆', '0');
INSERT INTO `types` VALUES ('6', '电子数码', '各类电子数码', '0');
INSERT INTO `types` VALUES ('7', '服饰', '各类服饰', '0');
INSERT INTO `types` VALUES ('8', '家居', '各类家居', '0');
INSERT INTO `types` VALUES ('9', '食品', '各类食品', '0');
