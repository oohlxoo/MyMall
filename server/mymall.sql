/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : mymall

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-05-04 17:27:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactsName` varchar(45) DEFAULT NULL,
  `contactsPhone` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `detailAddress` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for appkey
-- ----------------------------
DROP TABLE IF EXISTS `appkey`;
CREATE TABLE `appkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appkey
-- ----------------------------
INSERT INTO `appkey` VALUES ('1', '男装');
INSERT INTO `appkey` VALUES ('2', '女装');
INSERT INTO `appkey` VALUES ('3', '运动');
INSERT INTO `appkey` VALUES ('4', '内衣');
INSERT INTO `appkey` VALUES ('5', '箱包');
INSERT INTO `appkey` VALUES ('6', '户外');
INSERT INTO `appkey` VALUES ('7', '童装');
INSERT INTO `appkey` VALUES ('8', '配饰');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srco` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `href` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'static/b1.png', '第1张图', 'https://baidu.com');
INSERT INTO `banner` VALUES ('2', 'static/b2.png', '第2张图', 'https://baidu.com');
INSERT INTO `banner` VALUES ('3', 'static/b3.png', '第3张图', 'https://baidu.com');
INSERT INTO `banner` VALUES ('4', 'static/b4.png', '第4张图', 'https://baidu.com');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('33', '1', '4', '2018/5/3 上午10:11:43');
INSERT INTO `collect` VALUES ('34', '2', '4', '2018/5/3 上午10:14:34');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `content` longtext,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `describe` longtext,
  `price` varchar(45) DEFAULT NULL,
  `originalCost` varchar(45) DEFAULT NULL,
  `coverImg` longtext,
  `address` longtext,
  `status` int(11) DEFAULT NULL,
  `gt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'static/c4.png', '时尚风衣', '145', '100', '送腰带~夏新款韩版宽松显瘦纯色', '上海', null, '1');
INSERT INTO `goods` VALUES ('2', 'static/c1.png', '连衣裙', '99', '88', '菲梦伊2018夏装新款网纱刺绣钉珠连衣裙', '长沙', null, '1');
INSERT INTO `goods` VALUES ('3', 'static/c2.png', '衬衫', '140', '58', 'DGPZ弹力免烫抗皱衬衫女长袖2018新款', '海南', null, '1');
INSERT INTO `goods` VALUES ('4', 'static/c3.png', '雪纺裙', '218', '188', '森宿2018夏装新品文艺碎花V领雪纺连衣', '金华', null, '2');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `coverImg` longtext,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '冬款上新', '/static/c1.png', '1');
INSERT INTO `goodstype` VALUES ('2', '新款毛呢', '/static/c2.png', '1');
INSERT INTO `goodstype` VALUES ('3', '毛衣', '/static/c3.png', '2');
INSERT INTO `goodstype` VALUES ('4', '靴子', '/static/c4.png', '2');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(45) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', '/static/d1.png', '1');
INSERT INTO `img` VALUES ('2', '/static/d2.png', '1');
INSERT INTO `img` VALUES ('3', '/static/d3.png', '1');
INSERT INTO `img` VALUES ('4', '/static/d4.png', '1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `totalprice` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `createTime` varchar(45) DEFAULT NULL,
  `acceptTime` varchar(45) DEFAULT NULL,
  `completeTime` varchar(45) DEFAULT NULL,
  `adddress` longtext,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `isChoose` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('7', '4', '2', '6', '0');
INSERT INTO `shop` VALUES ('8', '4', '1', '1', '1');
INSERT INTO `shop` VALUES ('17', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('18', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('19', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('20', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('21', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('22', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('23', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('24', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('25', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('26', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('27', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('28', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('29', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('30', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('31', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('32', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('33', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('34', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('35', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('36', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('37', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('38', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('39', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('40', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('41', null, '1', '1', '0');
INSERT INTO `shop` VALUES ('42', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('43', null, '1', '1', '0');
INSERT INTO `shop` VALUES ('44', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('45', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('46', null, '1', '1', '0');
INSERT INTO `shop` VALUES ('47', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('48', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('49', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('50', null, '1', '1', '0');
INSERT INTO `shop` VALUES ('51', null, '1', '1', '0');
INSERT INTO `shop` VALUES ('52', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('53', null, '2', '1', '0');
INSERT INTO `shop` VALUES ('54', null, '2', '1', '0');

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `avatar` longtext,
  `sign` longtext,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18063211111', '123', 'oo', null, null, '0');
INSERT INTO `user` VALUES ('2', '2147483647', '123', 'qq', null, null, '0');
INSERT INTO `user` VALUES ('3', '2147483647', '123', null, null, null, '0');
INSERT INTO `user` VALUES ('4', '18721784087', 'a123456789', null, null, null, '0');
