/*
Navicat MySQL Data Transfer

Source Server         : project
Source Server Version : 50628
Source Host           : 583ba32e6cbae.sh.cdb.myqcloud.com:5993
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-09-14 22:36:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `phone` varchar(11) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别标志【0-女 1-男】',
  `birth` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `now_home` varchar(255) DEFAULT NULL COMMENT '现居地',
  `old_home` varchar(255) DEFAULT NULL COMMENT '曾住地',
  `signature` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT '评论人ID',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父级Id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for golden
-- ----------------------------
DROP TABLE IF EXISTS `golden`;
CREATE TABLE `golden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT '用户关联表ID',
  `amount` bigint(20) DEFAULT '0' COMMENT '金币数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`) USING BTREE,
  CONSTRAINT `tk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for line
-- ----------------------------
DROP TABLE IF EXISTS `line`;
CREATE TABLE `line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `bg_url` varchar(255) DEFAULT NULL COMMENT '背景图',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for line-link-ways
-- ----------------------------
DROP TABLE IF EXISTS `line-link-ways`;
CREATE TABLE `line-link-ways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) DEFAULT NULL COMMENT '路线Id',
  `ways_id` int(11) DEFAULT NULL COMMENT '行程Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(255) DEFAULT NULL COMMENT '视频地址',
  `account_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `tips` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for travel_link_comment
-- ----------------------------
DROP TABLE IF EXISTS `travel_link_comment`;
CREATE TABLE `travel_link_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_id` int(11) DEFAULT NULL COMMENT '视频Id',
  `comment_id` int(11) DEFAULT NULL COMMENT '评论Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ways
-- ----------------------------
DROP TABLE IF EXISTS `ways`;
CREATE TABLE `ways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_place` varchar(255) DEFAULT NULL COMMENT '出发地',
  `end_place` varchar(255) DEFAULT NULL COMMENT '目的地',
  `date_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  `place` varchar(0) DEFAULT NULL COMMENT '地名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
