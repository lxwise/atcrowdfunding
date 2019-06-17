/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : atcrowdfunding

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-06-17 19:05:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_p` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '系统菜单', '0', null, 'fa fa-fw fa-sitemap');
INSERT INTO `t_permission` VALUES ('2', '控制面板', '1', null, 'glyphicon glyphicon-dashboard');
INSERT INTO `t_permission` VALUES ('3', '权限管理', '1', null, 'glyphicon glyphicon glyphicon-tasks');
INSERT INTO `t_permission` VALUES ('4', '用户维护', '3', '/user/index', 'glyphicon glyphicon-user');
INSERT INTO `t_permission` VALUES ('5', '角色维护', '3', '/role/role', 'glyphicon glyphicon-king');
INSERT INTO `t_permission` VALUES ('6', '许可维护', '3', '/permission/index', 'glyphicon glyphicon-lock');
INSERT INTO `t_permission` VALUES ('7', '增加用户', '4', null, '\r\nglyphicon glyphicon-plus');
INSERT INTO `t_permission` VALUES ('8', '修改用户', '4', null, '\r\nglyphicon glyphicon-pencil');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'PM-项目经理');
INSERT INTO `t_role` VALUES ('2', 'SE-软件工程师');
INSERT INTO `t_role` VALUES ('3', 'PG-程序员');
INSERT INTO `t_role` VALUES ('4', 'TL-组长');
INSERT INTO `t_role` VALUES ('5', 'GL-组长');
INSERT INTO `t_role` VALUES ('6', 'QC-品质控制');
INSERT INTO `t_role` VALUES ('7', 'SA-软件架构师');
INSERT INTO `t_role` VALUES ('8', 'CMO/CMS-配置管理员');
INSERT INTO `t_role` VALUES ('9', 'SYSTEM-系统管理员');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('70', '4', '1');
INSERT INTO `t_role_permission` VALUES ('71', '4', '3');
INSERT INTO `t_role_permission` VALUES ('72', '4', '6');
INSERT INTO `t_role_permission` VALUES ('73', '9', '1');
INSERT INTO `t_role_permission` VALUES ('74', '9', '2');
INSERT INTO `t_role_permission` VALUES ('75', '9', '3');
INSERT INTO `t_role_permission` VALUES ('76', '9', '4');
INSERT INTO `t_role_permission` VALUES ('77', '9', '7');
INSERT INTO `t_role_permission` VALUES ('78', '9', '8');
INSERT INTO `t_role_permission` VALUES ('79', '9', '5');
INSERT INTO `t_role_permission` VALUES ('80', '9', '6');
INSERT INTO `t_role_permission` VALUES ('81', '6', '1');
INSERT INTO `t_role_permission` VALUES ('82', '6', '2');
INSERT INTO `t_role_permission` VALUES ('83', '7', '1');
INSERT INTO `t_role_permission` VALUES ('84', '7', '3');
INSERT INTO `t_role_permission` VALUES ('85', '7', '4');
INSERT INTO `t_role_permission` VALUES ('86', '7', '8');
INSERT INTO `t_role_permission` VALUES ('89', '3', '1');
INSERT INTO `t_role_permission` VALUES ('90', '3', '3');
INSERT INTO `t_role_permission` VALUES ('91', '3', '4');
INSERT INTO `t_role_permission` VALUES ('92', '3', '7');
INSERT INTO `t_role_permission` VALUES ('93', '8', '1');
INSERT INTO `t_role_permission` VALUES ('94', '8', '3');
INSERT INTO `t_role_permission` VALUES ('95', '8', '4');
INSERT INTO `t_role_permission` VALUES ('96', '8', '7');
INSERT INTO `t_role_permission` VALUES ('97', '1', '1');
INSERT INTO `t_role_permission` VALUES ('98', '1', '2');
INSERT INTO `t_role_permission` VALUES ('99', '1', '3');
INSERT INTO `t_role_permission` VALUES ('100', '1', '5');
INSERT INTO `t_role_permission` VALUES ('101', '2', '1');
INSERT INTO `t_role_permission` VALUES ('102', '2', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userpswd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', 'admin@test.com', '2019-05-02 19:27:10');
INSERT INTO `t_user` VALUES ('2', 'shangsan', 'zhangsan', 'zhangsan', 'zhangsan@qq.com', '2019-04-05 19:26:06');
INSERT INTO `t_user` VALUES ('3', 'lisi', 'lisi', 'lisi', 'lisi@qq.com', '2019-04-05 19:26:06');
INSERT INTO `t_user` VALUES ('4', 'wangwu', 'wangwu', 'wnagwu', 'wangwu@test.com', '2019-04-05 19:26:06');
INSERT INTO `t_user` VALUES ('5', 'maliu', 'maliu', 'maliu', 'qqqq@test.com', '2019-04-05 19:26:06');
INSERT INTO `t_user` VALUES ('37', 'asd', 'asd', 'asd', 'asd@qq.com', '2019-06-03 20:51:17');
INSERT INTO `t_user` VALUES ('38', '68686868', '123456', '王五', '686868@qq.com', '2019-06-05 10:47:06');
INSERT INTO `t_user` VALUES ('39', '1735861200', 'liwei123321', 'liwei', '555@qq.com', '2019-06-05 11:16:00');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `roleid` int(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('22', '3', '7');
INSERT INTO `t_user_role` VALUES ('23', '4', '4');
INSERT INTO `t_user_role` VALUES ('24', '1', '9');
INSERT INTO `t_user_role` VALUES ('25', '2', '6');
INSERT INTO `t_user_role` VALUES ('26', '5', '7');
INSERT INTO `t_user_role` VALUES ('27', '6', '3');
INSERT INTO `t_user_role` VALUES ('28', '37', '8');
INSERT INTO `t_user_role` VALUES ('29', '38', '2');
INSERT INTO `t_user_role` VALUES ('59', '39', '6');
INSERT INTO `t_user_role` VALUES ('60', '39', '5');
