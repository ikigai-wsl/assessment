/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 127.0.0.1:3306
 Source Schema         : assessment

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 24/05/2019 11:55:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kpi
-- ----------------------------
DROP TABLE IF EXISTS `kpi`;
CREATE TABLE `kpi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `completion` double(10, 2) NULL DEFAULT NULL COMMENT '完成率',
  `completion_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '完成率备注',
  `score` double(10, 2) NULL DEFAULT NULL COMMENT '完成质量得分',
  `score_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '完成质量得分备注',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kpi
-- ----------------------------
INSERT INTO `kpi` VALUES (29, 14, 1.25, 'test', 1.00, 'test', '2019-05-24 08:00:00');

-- ----------------------------
-- Table structure for overview
-- ----------------------------
DROP TABLE IF EXISTS `overview`;
CREATE TABLE `overview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `overview` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of overview
-- ----------------------------
INSERT INTO `overview` VALUES (1, 14, 'testaaaaaaaaa', '2019-05-24 11:07:37');
INSERT INTO `overview` VALUES (2, 18, 'test', '2019-05-24 11:27:09');
INSERT INTO `overview` VALUES (3, 21, 'testtetdawdawdwa', '2019-05-24 11:27:51');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL COMMENT '0：管理员，1：组长，2：员工',
  `pid` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '管理员', 0, -1, '2019-05-18 14:12:02');
INSERT INTO `user` VALUES (14, 'yc2587', 'wei2587', '李炎超', 1, 1, '2019-05-18 17:12:31');
INSERT INTO `user` VALUES (15, 'yb2587', 'wei2587', '杨博', 1, 1, '2019-05-18 16:30:50');
INSERT INTO `user` VALUES (16, 'ln2587', 'wei2587', '李南', 1, 1, '2019-05-18 16:31:06');
INSERT INTO `user` VALUES (17, 'hl2587', 'wei2587', '贺令', 1, 1, '2019-05-18 16:31:25');
INSERT INTO `user` VALUES (18, 'test01', 'wei2587', 'test01', 2, NULL, '2019-05-20 16:24:25');
INSERT INTO `user` VALUES (19, 'test02', 'wei2587', 'test02', 2, NULL, '2019-05-20 16:24:31');
INSERT INTO `user` VALUES (20, 'test03', 'wei2587', 'test03', 2, NULL, '2019-05-20 16:24:32');
INSERT INTO `user` VALUES (21, 'test04', 'wei2587', 'test04', 2, 14, '2019-05-20 11:01:22');
INSERT INTO `user` VALUES (22, 'test05', 'wei2587', 'test05', 2, 14, '2019-05-18 17:49:07');
INSERT INTO `user` VALUES (23, 'test06', 'wei2587', 'test06', 2, 15, '2019-05-18 17:49:09');
INSERT INTO `user` VALUES (24, 'test07', 'wei2587', 'test07', 2, 16, '2019-05-18 17:49:12');
INSERT INTO `user` VALUES (26, 'test09', 'wei2587', 'test09', 2, 17, '2019-05-18 17:49:14');

SET FOREIGN_KEY_CHECKS = 1;
