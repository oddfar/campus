/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : oddfar_campus

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 21/02/2023 10:15:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for campus_category
-- ----------------------------
DROP TABLE IF EXISTS `campus_category`;
CREATE TABLE `campus_category` (
  `category_id` bigint NOT NULL COMMENT '分类主键',
  `category_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `parent_id` bigint DEFAULT '0' COMMENT '父分类id',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `slug` varchar(30) NOT NULL COMMENT '缩略名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `icon` varchar(100) DEFAULT NULL COMMENT '分类图标\n',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_category
-- ----------------------------
BEGIN;
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, '最新墙', 0, 1, 'newest', '最近的墙内容(菜单默认选择这个)', 'Y', 'system', '0', b'0', '2022-12-30 20:11:41', 1, '2023-01-01 22:23:49', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (123, '表白墙', 0, 2, 'confes', '表白分类描述', 'N', 'system', '0', b'0', '2021-10-15 10:32:00', NULL, '2023-01-01 22:23:43', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1449212758636646402, '表白子', 123, 0, 'debunk', '吐槽描述', 'N', 'system', '0', b'0', '2021-10-16 11:17:01', NULL, '2023-01-01 22:26:29', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1465662542308495361, '公告', 0, 10, 'solid', '实时最新消息', 'N', 'system', '0', b'0', '2021-11-30 20:42:35', NULL, '2022-12-26 17:57:48', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1602336520042287105, '实讯子', 1465662542308495361, 0, '123', NULL, 'N', 'system', '0', b'0', '2022-12-13 00:16:11', 1, '2022-12-26 17:57:51', NULL);
COMMIT;

-- ----------------------------
-- Table structure for campus_comment
-- ----------------------------
DROP TABLE IF EXISTS `campus_comment`;
CREATE TABLE `campus_comment` (
  `comment_id` bigint NOT NULL COMMENT '评论主键',
  `parent_id` bigint DEFAULT '0' COMMENT '上级id',
  `one_level_id` bigint DEFAULT '-1' COMMENT '所属的一级评论id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `to_user_id` bigint DEFAULT '-1' COMMENT '所回复目标评论的用户id',
  `content_id` bigint DEFAULT NULL COMMENT '内容id',
  `co_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评论内容',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论时的ip',
  `address` varchar(100) DEFAULT NULL COMMENT '评论时的地址',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_comment
-- ----------------------------
BEGIN;
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, 0, -1, 1, -1, 2, 'hello', '127.0.0.1', '内网IP', b'0', '2022-03-05 10:59:15', NULL, '2023-01-08 20:37:42', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, 1, 1, 2, 1, 2, 'world', '127.0.0.1', '内网IP', b'0', '2022-03-05 10:59:26', NULL, '2023-01-11 23:03:03', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, 2, 1, 2, 1, 2, '！！！！', '127.0.0.1', '内网IP', b'0', '2023-01-06 13:28:56', NULL, '2023-01-11 23:03:05', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (4, 0, -1, 1, -1, 2, '你好', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-16 15:40:26', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (5, 1, 1, 2, -1, 2, 'hello子', '127.0.0.1', '内网IP', b'0', '2023-01-11 15:20:20', NULL, '2023-01-18 21:16:07', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (6, 4, 4, 1, -1, 2, '你好子', '127.0.0.1', '内网IP', b'0', '2023-01-12 23:30:37', NULL, '2023-01-18 21:16:08', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (11, 0, -1, 1594285543804383234, -1, 1, '你好11', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:09:50', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (12, 0, -1, 1594285543804383234, -1, 1, '你好12', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:09:52', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (13, 0, -1, 1594285543804383234, -1, 1, '你好13', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:09:53', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (14, 0, -1, 1594285543804383234, -1, 1, '你好14', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:09:55', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (15, 0, -1, 1594285543804383234, -1, 1, '你好15', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:09:57', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (16, 0, -1, 1594285543804383234, -1, 1, '你好16', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:10:00', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (17, 0, -1, 1594285543804383234, -1, 1, '你好17', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:10:02', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (18, 0, -1, 1594285543804383234, -1, 1, '你好18', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-14 20:10:04', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (19, 0, -1, 1594285543804383234, -1, 2, '你好19', '127.0.0.1', '内网IP', b'0', '2023-01-06 15:27:22', NULL, '2023-01-11 23:02:58', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1614908893085827073, 0, -1, 1, -1, 2, '评论内容', '127.0.0.1', '内网IP', b'0', '2023-01-16 16:54:18', 1, '2023-01-16 16:54:18', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1614910220595748865, 1614908893085827073, 1614908893085827073, 1, -1, 2, '评论内容123', '127.0.0.1', '内网IP', b'0', '2023-01-16 16:59:35', 1, '2023-01-16 17:16:59', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1614913549174427650, 1614908893085827073, 1614908893085827073, 1, -1, 2, '你好 hello', '127.0.0.1', '内网IP', b'0', '2023-01-16 17:12:48', 1, '2023-01-16 17:16:58', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1614914347774095361, 1614908893085827073, 1614908893085827073, 1, -1, 2, '你好 hello2', '127.0.0.1', '内网IP', b'0', '2023-01-16 17:15:59', 1, '2023-01-16 17:15:58', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621770821551050753, 0, -1, 1594285543804383234, -1, 2, '11111', '127.0.0.1', '内网IP', b'0', '2023-02-04 15:21:10', 1594285543804383234, '2023-02-04 15:21:09', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621771572549570562, 0, -1, 1594285543804383234, -1, 2, '22222222', '127.0.0.1', '内网IP', b'0', '2023-02-04 15:24:09', 1594285543804383234, '2023-02-04 15:24:08', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621777240232873985, 0, -1, 1594285543804383234, -1, 2, '333333', '127.0.0.1', '内网IP', b'0', '2023-02-04 15:46:40', 1594285543804383234, '2023-02-04 15:46:39', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621860728160178178, 1621777240232873985, 1621777240232873985, 1594285543804383234, -1, 2, '4444', '127.0.0.1', '内网IP', b'0', '2023-02-04 21:18:25', 1594285543804383234, '2023-02-04 21:18:24', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622115709027143682, 1621777240232873985, 1621777240232873985, 1594285543804383234, -1, 2, '5555', '127.0.0.1', '内网IP', b'0', '2023-02-05 14:11:37', 1594285543804383234, '2023-02-05 14:11:37', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622115810097287170, 1621777240232873985, 1621777240232873985, 1594285543804383234, -1, 2, '66666', '127.0.0.1', '内网IP', b'0', '2023-02-05 14:12:01', 1594285543804383234, '2023-02-05 14:12:01', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622116288910643201, 1622115810097287170, 1621777240232873985, 1594285543804383234, 1594285543804383234, 2, '7777', '127.0.0.1', '内网IP', b'0', '2023-02-05 14:13:55', 1594285543804383234, '2023-02-05 14:13:55', NULL);
INSERT INTO `campus_comment` (`comment_id`, `parent_id`, `one_level_id`, `user_id`, `to_user_id`, `content_id`, `co_content`, `ip`, `address`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622117298760634369, 1621777240232873985, 1621777240232873985, 1594285543804383234, -1, 2, 'hell', '127.0.0.1', '内网IP', b'0', '2023-02-05 14:17:56', 1594285543804383234, '2023-02-05 14:17:56', NULL);
COMMIT;

-- ----------------------------
-- Table structure for campus_content
-- ----------------------------
DROP TABLE IF EXISTS `campus_content`;
CREATE TABLE `campus_content` (
  `content_id` bigint NOT NULL COMMENT '内容主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `category_id` bigint DEFAULT NULL COMMENT '类别id',
  `content` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发表的内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0审核,1正常,2下架,3拒绝（审核不通过）',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型：0文字,1图片,2视频',
  `file_count` int DEFAULT NULL COMMENT '文件数量',
  `love_count` int DEFAULT '0' COMMENT '点赞数量',
  `is_anonymous` tinyint(1) DEFAULT '0' COMMENT '0不匿名，1匿名',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_content
-- ----------------------------
BEGIN;
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, 1, 1449212758636646402, '欢迎使用校园信息墙项目\n开源地址：https://gitee.com/oddfar/campus\n欢迎大家 Star 和 Fork 支持~', 1, 0, 0, 0, 0, NULL, b'0', '2022-03-05 10:55:04', NULL, '2022-12-12 23:58:50', 1594285543804383234);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, 1, 1602336520042287105, '你好，welcome\n开源地址：https://gitee.com/oddfar/campus\n欢迎大家 Star 和 Fork 支持~', 1, 2, 1, 1, 0, NULL, b'0', '2022-12-13 00:01:47', NULL, '2023-01-16 13:21:38', 1594285543804383234);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, 1, 1602336520042287105, '我我我我', 1, 0, 0, 0, 0, NULL, b'0', '2023-01-13 23:04:14', NULL, '2023-01-20 22:41:33', NULL);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (4, 1, 1602336520042287105, '欢迎使用校园信息墙项目eeeee', 1, 0, 0, 0, 0, NULL, b'0', '2023-01-13 23:04:14', NULL, '2023-01-13 23:04:42', NULL);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (5, 1, 1602336520042287105, '欢迎使用校园信息墙项目555555', 1, 0, 0, 0, 0, NULL, b'0', '2023-01-13 23:04:14', NULL, '2023-01-13 23:04:42', NULL);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (6, 1, 1602336520042287105, '欢迎使用校园信息墙项目666', 1, 0, 0, 1, 0, NULL, b'0', '2023-01-13 23:04:14', NULL, '2023-01-13 23:04:42', 1594285543804383234);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (7, 1, 1602336520042287105, '欢迎使用校园信息墙项目777777777', 1, 0, 0, 0, 0, NULL, b'0', '2023-01-13 23:04:14', NULL, '2023-01-13 23:04:42', NULL);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1615663562871570434, 1, 123, '你好', 0, 0, 0, 0, 0, NULL, b'0', '2023-01-18 18:53:06', 1, '2023-01-18 19:08:42', NULL);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1615671883527626753, 1, 123, '你好', 1, 1, 1, 0, 1, NULL, b'0', '2023-01-18 19:26:09', 1, '2023-02-20 20:20:36', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622584181381181442, 1594285543804383234, 1449212758636646402, '123', 0, 1, 1, 0, 0, NULL, b'0', '2023-02-06 21:13:10', 1594285543804383234, '2023-02-07 16:55:04', 1594285543804383234);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622881895847366658, 1594285543804383234, 1449212758636646402, '测试', 1, 1, 2, 1, 0, NULL, b'0', '2023-02-07 16:56:10', 1594285543804383234, '2023-02-07 17:09:43', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1622967765937991682, 1594285543804383234, 1449212758636646402, 'hello', 1, 2, 1, 0, 0, NULL, b'0', '2023-02-07 22:37:23', 1594285543804383234, '2023-02-07 22:38:34', 1);
COMMIT;

-- ----------------------------
-- Table structure for campus_content_love
-- ----------------------------
DROP TABLE IF EXISTS `campus_content_love`;
CREATE TABLE `campus_content_love` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `content_id` bigint NOT NULL COMMENT '文章id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_content_love
-- ----------------------------
BEGIN;
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1, 1, '2022-12-28 20:12:32');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1, 2, '2023-01-15 23:41:45');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (2, 1, '2022-12-28 20:12:35');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 2, '2022-12-29 21:21:17');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 6, '2023-02-20 20:13:55');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 1622881895847366658, '2023-02-16 21:09:27');
COMMIT;

-- ----------------------------
-- Table structure for campus_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `campus_content_tag`;
CREATE TABLE `campus_content_tag` (
  `content_id` bigint NOT NULL COMMENT '内容id',
  `tag_id` bigint NOT NULL COMMENT '标签id',
  PRIMARY KEY (`content_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of campus_content_tag
-- ----------------------------
BEGIN;
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (1, 1);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (1, 3);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (2, 1);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for campus_file
-- ----------------------------
DROP TABLE IF EXISTS `campus_file`;
CREATE TABLE `campus_file` (
  `file_id` bigint NOT NULL,
  `content_id` bigint DEFAULT NULL COMMENT '文章id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '储存url',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_file
-- ----------------------------
BEGIN;
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1610308806190125057, 1, 1594285543804383234, '/profile/CampusFile/2023/01/04/wallhaven-e7jj6r_20230104001512A001.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1610836486480285698, 1, 1, '/profile/CampusFile/2023/01/05/beijing_20230105111200A002.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1610836561180839938, NULL, 1, '/profile/CampusFile/2023/01/05/beijing_20230105111218A003.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1611010937093996545, 2, 1, '/profile/CampusFile/2023/01/05/a7865021bcb3434eafbfdba0b690444f_20230105224513A001.mp4', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1615597579263811586, 1615671883527626753, 1, '/profile/CampusFile/2023/01/18/beijing_20230118143053A001.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1622580542860210178, NULL, 1594285543804383234, '/profile/CampusFile/2023/02/06/beijing_20230206205842A001.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1622583164828692482, NULL, 1594285543804383234, '/profile/CampusFile/2023/02/06/beijing_20230206210907A002.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1622584163316314113, 1622584181381181442, 1594285543804383234, '/profile/CampusFile/2023/02/06/beijing_20230206211305A003.jpg', NULL);
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1622881813882277889, 1622881895847366658, 1594285543804383234, '/profile/CampusFile/2023/02/07/beijing_20230207165550A001.jpg', '2023-02-07 16:56:10');
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1622881833482260482, 1622881895847366658, 1594285543804383234, '/profile/CampusFile/2023/02/07/wallhaven-e7jj6r_20230207165555A002.jpg', '2023-02-07 16:56:10');
INSERT INTO `campus_file` (`file_id`, `content_id`, `user_id`, `url`, `create_time`) VALUES (1622967685327663106, 1622967765937991682, 1594285543804383234, '/profile/CampusFile/2023/02/07/a7865021bcb3434eafbfdba0b690444f_20230207223704A001.mp4', '2023-02-07 22:37:23');
COMMIT;

-- ----------------------------
-- Table structure for campus_tag
-- ----------------------------
DROP TABLE IF EXISTS `campus_tag`;
CREATE TABLE `campus_tag` (
  `tag_id` bigint NOT NULL COMMENT '标签主键',
  `tag_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_tag
-- ----------------------------
BEGIN;
INSERT INTO `campus_tag` (`tag_id`, `tag_name`, `description`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, '测试标签', '测试', '0', b'0', '2022-11-29 20:03:08', 1, '2022-12-01 18:16:16', NULL);
INSERT INTO `campus_tag` (`tag_id`, `tag_name`, `description`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, '梅西', '利昂内尔·梅西（Lionel Messi）\n全名利昂内尔·安德烈斯·梅西·库西蒂尼（Lionel Andrés Messi Cuccitini）\n昵称莱奥·梅西（Leo Messi）', '0', b'0', '2022-11-29 20:03:28', 1, '2023-01-16 20:38:34', 1);
INSERT INTO `campus_tag` (`tag_id`, `tag_name`, `description`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, '蔡徐坤', '中国内地男歌手、演员、原创音乐制作人、MV导演', '0', b'0', '2023-01-16 20:12:20', 1, '2023-01-16 20:13:54', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `group_code` varchar(100) DEFAULT NULL COMMENT '所属分类的编码',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1621419076555640835 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, 'Mac本地文件路径', 'sys.local.profile.mac', '~/uploadPath', 'Y', 'file_config', NULL, b'0', '2022-11-10 14:06:44', 1, '2022-11-10 14:07:49', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, 'Linux本地文件路径', 'sys.local.profile.linux', '/data/uploadPath', 'Y', 'file_config', NULL, b'0', '2022-01-14 10:59:39', NULL, '2022-01-16 14:11:53', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, 'Windows本地文件路径', 'sys.local.profile.win', 'D:\\uploadPath', 'Y', 'file_config', NULL, b'0', '2022-01-14 11:00:39', NULL, '2022-01-16 14:11:53', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (4, '默认存储文件的bucket名称', 'sys.file.default.bucket', 'defaultBucket', 'Y', 'file_config', NULL, b'0', '2022-01-14 11:03:10', NULL, '2022-01-16 14:11:54', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (5, '文件默认部署的环境地址', 'sys.server.deploy.host', 'http://localhost:8160', 'Y', 'file_config', NULL, b'0', '2022-01-16 14:11:45', NULL, '2022-01-16 14:18:55', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (6, '文件访问是否用nginx映射', 'sys.file.visit.nginx', 'false', 'Y', 'file_config', 'true真，false假', b'0', '2022-01-16 14:40:00', NULL, '2022-01-16 14:40:20', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (7, '信息墙删除且对应文件也删除', 'sys.file.is.delete', 'false', 'Y', 'file_config', 'true墙和文件都删除，false文件转移到别的目录', b'0', '2022-01-17 14:29:11', NULL, '2022-01-18 15:02:14', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (8, '文件默认转移的bucket名称', 'sys.file.move.default.bucket', 'moveBucket', 'Y', 'file_config', NULL, b'0', '2022-01-17 14:31:05', NULL, '2022-01-18 15:09:48', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (101, '阿里云邮件服务accessKeyId', 'sys.aliyun.mail.accessKeyId', '', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:04:08', NULL, '2022-01-19 10:49:30', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (102, '阿里云邮件服务accessKeySecret', 'sys.aliyun.mail.accessKeySecret', '', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:07:28', NULL, '2022-01-19 10:49:31', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (113, 'smtp服务器地址', 'sys.email.smtp.host', 'smtp.qq.com', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:33:50', NULL, '2022-01-24 11:28:13', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (114, 'smtp服务端口', 'sys.email.smtp.port', '465', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:35:29', NULL, '2022-01-24 11:28:14', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (115, '邮箱的发送方邮箱', 'sys.email.send.account', '3066693006@qq.com', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:38:17', NULL, '2022-01-24 11:28:15', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (116, '邮箱的密码或者授权码', 'sys.email.password', 'qiwoefvuklkkddej', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:07:31', NULL, '2022-01-19 12:02:57', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (117, '邮箱发送时的用户名', 'sys.email.name', '致远', 'Y', 'mail_config', NULL, b'0', '2022-01-19 11:10:47', NULL, '2022-01-24 11:28:19', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (202, '用户默认头像', 'sys.user.default.avatar', 'https://img0.baidu.com/it/u=1183896628,1403534286&fm=253&fmt=auto&app=138&f=PNG', 'Y', 'sys_config', NULL, b'0', '2022-02-08 11:35:31', NULL, '2022-02-08 11:40:15', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (206, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'sys_config', '初始化密码 123456', b'0', '2022-11-09 01:41:52', 1, '2022-11-09 15:42:09', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (300, '验证码类型', 'sys.login.captchaType', 'math', 'Y', 'sys_config', 'math 数组计算 char 字符验证', b'0', '2022-11-10 09:32:40', 1, '2022-11-30 12:14:30', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (301, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'sys_config', '是否开启验证码功能（true开启，false关闭）', b'0', '2023-02-01 21:48:05', 1, '2023-02-01 21:48:34', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (302, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'sys_config', '是否开启注册用户功能（true开启，false关闭）', b'0', '2023-02-01 21:47:39', 1, '2023-02-01 21:48:31', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621419076555640833, '绑定邮箱模板', 'campus.mail.bindTemplate', '<h3>您好，#{[userName]}</h3><br />请在#{[expiration]}分内点击以下链接完成邮箱验证<br /><a href=\"#{[url]}\">#{[url]}</a>', 'Y', 'campus_config', '#{[userName]}用户，#{[url]}邮箱验证的链接，#{[expiration]}，有效期', b'0', '2023-02-03 16:03:27', 1, '2023-02-03 16:03:27', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621419076555640834, '用户匿名头像', 'campus.user.anonymous.image', 'https://gcore.jsdelivr.net/gh/oddfar/static/campus/image/anonymous.jpeg', 'Y', 'campus_config', NULL, b'0', '2022-02-08 11:36:36', NULL, '2023-02-21 08:33:07', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1621418087714918402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1, 1, '男', '0', 'sys_user_sex', NULL, 'default', 'Y', '0', '性别男', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (2, 2, '女', '1', 'sys_user_sex', NULL, 'default', 'N', '0', '性别女', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (3, 1, '是', 'Y', 'sys_yes_no', NULL, 'success', 'N', '0', NULL, '2022-11-06 06:37:31', 1, '2022-11-06 06:39:34', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (4, 2, '否', 'N', 'sys_yes_no', NULL, 'danger', 'N', '0', NULL, '2022-11-06 06:37:42', 1, '2022-11-06 06:39:34', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', NULL, 'primary', 'Y', '0', '正常状态', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', NULL, 'danger', 'N', '0', '停用状态', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (41, 1, '显示', '0', 'sys_show_hide', NULL, 'primary', 'N', '0', '显示菜单', '2022-12-26 21:49:47', 1, '2022-12-26 21:49:47', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (42, 2, '隐藏', '1', 'sys_show_hide', NULL, 'danger', 'N', '0', '隐藏菜单', '2022-12-26 21:50:10', 1, '2022-12-26 21:50:10', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (101, 1, '系统配置', 'sys_config', 'sys_config_group', NULL, 'primary', 'N', '0', '配置群组的系统配置', '2022-11-06 19:27:23', NULL, '2022-11-06 06:07:20', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (102, 2, '邮件配置', 'mail_config', 'sys_config_group', NULL, 'primary', 'N', '0', NULL, '2022-11-06 05:38:04', 1, '2022-11-06 06:07:20', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (103, 3, '文件配置', 'file_config', 'sys_config_group', NULL, 'primary', 'N', '0', NULL, '2022-11-06 06:32:45', 1, '2022-11-06 20:32:44', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597931830248570882, 1, '审核', '0', 'campus_content_status', NULL, 'warning', 'N', '0', NULL, '2022-11-30 20:33:31', 1, '2022-11-30 20:33:31', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597931939476635650, 2, '正常', '1', 'campus_content_status', NULL, 'success', 'N', '0', NULL, '2022-11-30 20:33:57', 1, '2022-11-30 20:33:57', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932004085694466, 3, '下架', '2', 'campus_content_status', NULL, 'danger', 'N', '0', NULL, '2022-11-30 20:34:13', 1, '2022-11-30 20:34:12', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932393732341761, 1, '不匿', '0', 'campus_anonymous', NULL, 'primary', 'N', '0', NULL, '2022-11-30 20:35:45', 1, '2022-11-30 20:35:45', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932469577940994, 2, '匿名', '1', 'campus_anonymous', NULL, 'primary', 'N', '0', NULL, '2022-11-30 20:36:04', 1, '2022-11-30 20:36:03', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392185411743745, 0, '文字', '0', 'campus_content_type', NULL, 'primary', 'N', '0', '', '2022-12-04 21:16:27', 1, '2022-12-04 21:16:26', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392255200768001, 2, '图片', '1', 'campus_content_type', NULL, 'success', 'N', '0', NULL, '2022-12-04 21:16:44', 1, '2022-12-04 21:16:43', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392552258154497, 3, '视频', '2', 'campus_content_type', NULL, 'info', 'N', '0', NULL, '2022-12-04 21:17:54', 1, '2022-12-04 21:17:54', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1609558539133521922, 4, '拒绝', '3', 'campus_content_status', NULL, 'danger', 'N', '0', '审核不通过', '2023-01-01 22:33:55', 1, '2023-01-01 22:33:54', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1621418087714918401, 10, 'campus配置', 'campus_config', 'sys_config_group', NULL, 'primary', 'N', '0', NULL, '2023-02-03 15:59:31', 1, '2023-02-03 15:59:31', NULL, b'0');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1607372974271246338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1, '用户性别', 'sys_user_sex', '0', '用户性别列表', NULL, NULL, '2022-11-06 01:10:21', 1, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (2, '系统是否', 'sys_yes_no', '0', '系统是否列表', '2022-11-06 06:37:05', 1, '2022-11-06 20:37:04', 1, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (3, '系统开关', 'sys_normal_disable', '0', '系统开关列表', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (4, '菜单状态', 'sys_show_hide', '0', '菜单状态列表', '2022-12-26 21:49:15', 1, '2022-12-26 21:49:15', NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (101, '配置群组', 'sys_config_group', '0', '配置群组', '2022-11-06 05:32:37', 1, '2022-11-06 19:32:37', 1, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597931685624774657, '校园墙内容状态', 'campus_content_status', '0', '校园墙内容状态', '2022-11-30 20:32:57', 1, '2022-11-30 20:32:56', NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932303005351938, '是否匿名', 'campus_anonymous', '0', '校园信息墙是否匿名', '2022-11-30 20:35:24', 1, '2022-11-30 20:35:23', NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392072043900930, '校园内类型', 'campus_content_type', '0', '0文字,1图片,2视频', '2022-12-04 21:16:00', 1, '2022-12-04 21:15:59', NULL, b'0');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1597931148678365187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', '系统管理目录', '2022-10-05 15:28:43', 1, '2022-11-14 14:41:50', b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', '系统监控目录', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', '系统工具目录', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (4, '源码地址', 0, 10, 'http://gitee.com/oddfar', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', '若依官网地址', '2022-10-05 15:28:43', 1, '2022-11-21 17:11:40', b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', '用户管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '角色管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '菜单管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', '部门管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', '岗位管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', '字典管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', '参数设置菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', '通知公告菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', '日志管理菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', '在线用户菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', '定时任务菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', '数据监控菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', '服务监控菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', '缓存监控菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', '缓存列表菜单', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', '表单构建菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', '代码生成菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', '系统接口菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', '操作日志菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', '登录日志菜单', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'1', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', '', '2022-10-05 15:28:43', NULL, NULL, b'0', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1597918884311171073, '校园信息墙', 0, 5, 'campus', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'education', '', '2022-11-30 19:42:05', NULL, '2022-11-30 19:42:04', b'0', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1597929330846040066, '内容管理', 1597918884311171073, 2, 'content', 'campus/content/index', NULL, 1, 0, 'C', '0', '0', 'campus:content:list', 'content', '', '2022-11-30 20:23:35', 1, '2022-11-30 20:23:35', b'0', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1597930331497922562, '评论管理', 1597918884311171073, 6, 'comment', 'campus/comment/index', NULL, 1, 0, 'C', '0', '0', 'campus:comment:list', 'comment', '', '2022-11-30 20:27:34', 1, '2022-11-30 20:27:33', b'0', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1597930928431267841, '类别管理', 1597918884311171073, 3, 'category', 'campus/category/index', NULL, 1, 0, 'C', '0', '0', 'campus:category:list', 'category', '', '2022-11-30 20:29:56', 1, '2022-11-30 20:29:56', b'0', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `create_time`, `update_user`, `update_time`, `del_flag`, `create_user`) VALUES (1597931148678365186, '标签管理', 1597918884311171073, 4, 'tag', 'campus/tag/index', NULL, 1, 0, 'C', '0', '0', 'campus:tag:list', 'tag', '', '2022-11-30 20:30:49', 1, '2022-11-30 20:30:48', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` bigint NOT NULL COMMENT '资源id',
  `app_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用编码',
  `resource_code` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源编码',
  `resource_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源名称',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类名称',
  `method_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `modular_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资源url',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'http请求方法',
  `resource_biz_type` tinyint DEFAULT '1' COMMENT '资源的业务类型：1-业务类，2-系统类',
  `required_permission_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`resource_id`) USING BTREE,
  KEY `RESOURCE_CODE_URL` (`resource_code`,`url`) USING BTREE COMMENT '资源code和url的联合索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='需要认证的接口资源controller';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773630095361, 'oddfar', 'oddfar.sys_dict_type.edit', 'edit', 'SysDictTypeController', 'edit', '字典类型管理', '/system/dict/type', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773638483969, 'campus', 'campus.content_info.get_own_content', '查询自己的信息墙列表', 'ContentInfoController', 'getOwnContent', '信息墙api', '/campus/getOwnContent', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773638483970, 'oddfar', 'oddfar.sys_config.get_info', 'getInfo', 'SysConfigController', 'getInfo', '参数配置管理', '/system/config/{id}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773642678273, 'oddfar', 'oddfar.sys_dict_type.optionselect', 'optionselect', 'SysDictTypeController', 'optionselect', '字典类型管理', '/system/dict/type/optionselect', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773642678274, 'campus', 'campus.comment.list', 'list', 'CommentController', 'list', '评论管理', '/admin/comment/list', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773646872577, 'oddfar', 'oddfar.sys_config.remove', 'remove', 'SysConfigController', 'remove', '参数配置管理', '/system/config/{configIds}', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773646872578, 'campus', 'campus.category.edit', '修改分类', 'CategoryController', 'edit', '分类管理', '/admin/category', 'put', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773651066881, 'oddfar', 'oddfar.sys_menu.tree_select', 'treeSelect', 'SysMenuController', 'treeSelect', '菜单管理', '/system/menu/treeselect', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773655261185, 'campus', 'campus.user_action.image_upload', '图片文件上传', 'UserActionController', 'imageUpload', '用户操作api', '/campus/imageUpload', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773655261186, 'oddfar', 'oddfar.sys_role.remove', 'remove', 'SysRoleController', 'remove', '角色管理', '/system/role/{roleIds}', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773655261187, 'campus', 'campus.content.edit', 'edit', 'ContentController', 'edit', '内容管理', '/admin/content', 'put', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773655261188, 'oddfar', 'oddfar.sys_menu.role_menu_treeselect', 'roleMenuTreeselect', 'SysMenuController', 'roleMenuTreeselect', '菜单管理', '/system/menu/roleMenuTreeselect/{roleId}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773659455490, 'oddfar', 'oddfar.sys_profile.update_profile', 'updateProfile', 'SysProfileController', 'updateProfile', '个人信息管理', '/system/user/profile', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773659455491, 'oddfar', 'oddfar.sys_dict_data.add', 'add', 'SysDictDataController', 'add', '字典数据管理', '/system/dict/data', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773659455492, 'oddfar', 'oddfar.sys_dict_data.dict_type', 'dictType', 'SysDictDataController', 'dictType', '字典数据管理', '/system/dict/data/type/{dictType}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773663649794, 'campus', 'campus.content_info.own_contents', 'ownContents', 'ContentInfoController', 'ownContents', '信息墙api', '/campus/ownContents', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773667844098, 'oddfar', 'oddfar.sys_config.get_config_key', 'getConfigKey', 'SysConfigController', 'getConfigKey', '参数配置管理', '/system/config/configKey/{configKey:.+}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773667844099, 'oddfar', 'oddfar.sys_profile.avatar', 'avatar', 'SysProfileController', 'avatar', '个人信息管理', '/system/user/profile/avatar', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773667844100, 'oddfar', 'oddfar.sys_role.add', 'add', 'SysRoleController', 'add', '角色管理', '/system/role', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773672038401, 'campus', 'campus.category.list', '查询分类列表', 'CategoryController', 'list', '分类管理', '/admin/category/list', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773672038402, 'oddfar', 'oddfar.sys_user.get_info', 'getInfo', 'SysUserController', 'getInfo', '用户管理', '/system/user/{userId}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773672038403, 'campus', 'campus.comment.edit', 'edit', 'CommentController', 'edit', '评论管理', '/admin/comment', 'put', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773672038404, 'campus', 'campus.comment_info.get_one_level_comment', '查询一级评论', 'CommentInfoController', 'getOneLevelComment', '评论api', '/campus/getOneLevelComment', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773676232706, 'oddfar', 'oddfar.sys_config.page', '分页', 'SysConfigController', 'page', '参数配置管理', '/system/config/page', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773676232707, 'campus', 'campus.comment_info.to_comment', '添加评论', 'CommentInfoController', 'toComment', '评论api', '/campus/toComment', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773676232708, 'campus', 'campus.comment_info.get_comment_children', '查询一级评论的子评论', 'CommentInfoController', 'getCommentChildren', '评论api', '/campus/getCommentChildren', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773676232709, 'oddfar', 'oddfar.sys_menu.list', 'list', 'SysMenuController', 'list', '菜单管理', '/system/menu/list', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773676232710, 'oddfar', 'oddfar.sys_role.get_info', 'getInfo', 'SysRoleController', 'getInfo', '角色管理', '/system/role/{roleId}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773680427010, 'oddfar', 'oddfar.sys_user.auth_role', 'authRole', 'SysUserController', 'authRole', '用户管理', '/system/user/authRole/{userId}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773680427011, 'oddfar', 'oddfar.sys_config.edit', 'edit', 'SysConfigController', 'edit', '参数配置管理', '/system/config', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773680427012, 'campus', 'campus.user_action.zan_content', '点赞', 'UserActionController', 'zanContent', '用户操作api', '/campus/zan/{contentId}', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773680427013, 'oddfar', 'oddfar.sys_menu.edit', 'edit', 'SysMenuController', 'edit', '菜单管理', '/system/menu', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773684621314, 'campus', 'campus.content.page', '分页', 'ContentController', 'page', '内容管理', '/admin/content/list', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773684621315, 'oddfar', 'oddfar.sys_user.insert_auth_role', 'insertAuthRole', 'SysUserController', 'insertAuthRole', '用户管理', '/system/user/authRole', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773684621316, 'oddfar', 'oddfar.sys_dict_type.list', 'list', 'SysDictTypeController', 'list', '字典类型管理', '/system/dict/type/list', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773684621317, 'oddfar', 'oddfar.sys_config.refresh_cache', 'refreshCache', 'SysConfigController', 'refreshCache', '参数配置管理', '/system/config/refreshCache', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773684621318, 'oddfar', 'oddfar.sys_role.cancel_auth_user_all', 'cancelAuthUserAll', 'SysRoleController', 'cancelAuthUserAll', '角色管理', '/system/role/authUser/cancelAll', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773688815617, 'campus', 'campus.content_info.get_content_list', '查询信息墙内容列表', 'ContentInfoController', 'getContentList', '信息墙api', '/campus/contentList', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773688815618, 'oddfar', 'oddfar.sys_profile.update_pwd', 'updatePwd', 'SysProfileController', 'updatePwd', '个人信息管理', '/system/user/profile/updatePwd', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773688815619, 'oddfar', 'oddfar.sys_user.remove', 'remove', 'SysUserController', 'remove', '用户管理', '/system/user/{userIds}', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773688815620, 'oddfar', 'oddfar.sys_dict_type.get_info', 'getInfo', 'SysDictTypeController', 'getInfo', '字典类型管理', '/system/dict/type/{dictId}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773688815621, 'oddfar', 'oddfar.sys_user.update', 'update', 'SysUserController', 'update', '用户管理', '/system/user', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773693009921, 'campus', 'campus.user_account.email_validate', 'emailValidate', 'UserAccountController', 'emailValidate', '用户账户操作api', '/campus/email-validate', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773693009922, 'oddfar', 'oddfar.sys_role.unallocated_list', 'unallocatedList', 'SysRoleController', 'unallocatedList', '角色管理', '/system/role/authUser/unallocatedList', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773693009923, 'campus', 'campus.campus_info.category_list', '查询分类列表', 'CampusInfoController', 'categoryList', '校园墙信息api', '/campus/categoryList', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773693009924, 'campus', 'campus.content_info.del_content', 'delContent', 'ContentInfoController', 'delContent', '信息墙api', '/campus/delContent/{contentIds}', 'delete', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773693009925, 'oddfar', 'oddfar.sys_role.change_status', 'changeStatus', 'SysRoleController', 'changeStatus', '角色管理', '/system/role/changeStatus', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773697204226, 'campus', 'campus.content_info.to_content', '发表信息墙', 'ContentInfoController', 'toContent', '信息墙api', '/campus/sendContent', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773697204227, 'campus', 'campus.tag.add', 'add', 'TagController', 'add', '标签管理', '/admin/tag', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773697204228, 'campus', 'campus.content_info.get_simple_hot_content', '查询信息墙内容列表', 'ContentInfoController', 'getSimpleHotContent', '信息墙api', '/campus/simpleHotContent', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773697204229, 'oddfar', 'oddfar.sys_user.add', 'add', 'SysUserController', 'add', '用户管理', '/system/user', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773697204230, 'campus', 'campus.category.list_select', '查询分类列表选择器', 'CategoryController', 'listSelect', '分类管理', '/admin/category/listSelect', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773697204231, 'oddfar', 'oddfar.sys_dict_data.remove', 'remove', 'SysDictDataController', 'remove', '字典数据管理', '/system/dict/data/{dictCodes}', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773701398530, 'campus', 'campus.content_info.get_content_by_id', '查询信息墙详细内容', 'ContentInfoController', 'getContentById', '信息墙api', '/campus/getContent', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773701398531, 'campus', 'campus.user_action.video_upload', '视频文件上传', 'UserActionController', 'videoUpload', '用户操作api', '/campus/videoUpload', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773701398532, 'oddfar', 'oddfar.sys_dict_data.get_info', 'getInfo', 'SysDictDataController', 'getInfo', '字典数据管理', '/system/dict/data/{dictCode}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773701398533, 'oddfar', 'oddfar.sys_user.change_status', 'changeStatus', 'SysUserController', 'changeStatus', '用户管理', '/system/user/changeStatus', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773701398534, 'campus', 'campus.content_info.get_own_love_content', '查询点赞的信息墙列表', 'ContentInfoController', 'getOwnLoveContent', '信息墙api', '/campus/getOwnLoveContent', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773701398535, 'oddfar', 'oddfar.sys_dict_data.page', 'page', 'SysDictDataController', 'page', '字典数据管理', '/system/dict/data/list', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773705592833, 'campus', 'campus.comment.add', 'add', 'CommentController', 'add', '评论管理', '/admin/comment', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773705592834, 'campus', 'campus.tag.list', 'list', 'TagController', 'list', '标签管理', '/admin/tag/list', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773705592835, 'campus', 'campus.campus_info.category_children', '查询分类子列表', 'CampusInfoController', 'categoryChildren', '校园墙信息api', '/campus/categoryChildren/{categoryId}', 'get', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773705592836, 'campus', 'campus.category.get_info', '获取分类详细信息', 'CategoryController', 'getInfo', '分类管理', '/admin/category/{categoryId}', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773705592837, 'oddfar', 'oddfar.sys_user.reset_pwd', 'resetPwd', 'SysUserController', 'resetPwd', '用户管理', '/system/user/resetPwd', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773705592838, 'campus', 'campus.content.get_info', 'getInfo', 'ContentController', 'getInfo', '内容管理', '/admin/content/{contentId}', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787137, 'oddfar', 'oddfar.sys_menu.get_info', 'getInfo', 'SysMenuController', 'getInfo', '菜单管理', '/system/menu/{menuId}', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787138, 'oddfar', 'oddfar.sys_role.cancel_auth_user', 'cancelAuthUser', 'SysRoleController', 'cancelAuthUser', '角色管理', '/system/role/authUser/cancel', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787139, 'campus', 'campus.comment.get_info', 'getInfo', 'CommentController', 'getInfo', '评论管理', '/admin/comment/{commentId}', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787140, 'oddfar', 'oddfar.sys_menu.remove', 'remove', 'SysMenuController', 'remove', '菜单管理', '/system/menu/{menuId}', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787141, 'oddfar', 'oddfar.sys_role.list', 'list', 'SysRoleController', 'list', '角色管理', '/system/role/list', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787142, 'oddfar', 'oddfar.sys_profile.profile', 'profile', 'SysProfileController', 'profile', '个人信息管理', '/system/user/profile', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773709787143, 'oddfar', 'oddfar.sys_dict_type.refresh_cache', 'refreshCache', 'SysDictTypeController', 'refreshCache', '字典类型管理', '/system/dict/type/refreshCache', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981441, 'oddfar', 'oddfar.sys_menu.add', 'add', 'SysMenuController', 'add', '菜单管理', '/system/menu', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981442, 'oddfar', 'oddfar.sys_user.page', 'page', 'SysUserController', 'page', '用户管理', '/system/user/list', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981443, 'oddfar', 'oddfar.sys_role.allocated_list', 'allocatedList', 'SysRoleController', 'allocatedList', '角色管理', '/system/role/authUser/allocatedList', 'get', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981444, 'campus', 'campus.tag.remove', 'remove', 'TagController', 'remove', '标签管理', '/admin/tag/{tagIds}', 'delete', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981445, 'oddfar', 'oddfar.sys_dict_data.edit', 'edit', 'SysDictDataController', 'edit', '字典数据管理', '/system/dict/data', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981446, 'campus', 'campus.category.remove', '删除分类', 'CategoryController', 'remove', '分类管理', '/admin/category/{categoryId}', 'delete', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773713981447, 'campus', 'campus.user_account.send_mail', 'sendMail', 'UserAccountController', 'sendMail', '用户账户操作api', '/campus/bindMail', 'post', 1, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773718175745, 'oddfar', 'oddfar.sys_dict_type.add', 'add', 'SysDictTypeController', 'add', '字典类型管理', '/system/dict/type', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773718175746, 'campus', 'campus.tag.get_info', 'getInfo', 'TagController', 'getInfo', '标签管理', '/admin/tag/{tagId}', 'get', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773718175747, 'oddfar', 'oddfar.sys_role.select_auth_user_all', 'selectAuthUserAll', 'SysRoleController', 'selectAuthUserAll', '角色管理', '/system/role/authUser/selectAll', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773718175748, 'campus', 'campus.category.add', '新增分类', 'CategoryController', 'add', '分类管理', '/admin/category', 'post', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773718175749, 'campus', 'campus.tag.edit', 'edit', 'TagController', 'edit', '标签管理', '/admin/tag', 'put', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773718175750, 'campus', 'campus.comment.remove', 'remove', 'CommentController', 'remove', '评论管理', '/admin/comment/{commentIds}', 'delete', 1, 'Y', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773722370050, 'oddfar', 'oddfar.sys_config.add', 'add', 'SysConfigController', 'add', '参数配置管理', '/system/config', 'post', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773722370051, 'oddfar', 'oddfar.sys_dict_type.remove', 'remove', 'SysDictTypeController', 'remove', '字典类型管理', '/system/dict/type/{dictIds}', 'delete', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
INSERT INTO `sys_resource` (`resource_id`, `app_code`, `resource_code`, `resource_name`, `class_name`, `method_name`, `modular_name`, `url`, `http_method`, `resource_biz_type`, `required_permission_flag`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1627835773722370052, 'oddfar', 'oddfar.sys_role.edit', 'edit', 'SysRoleController', 'edit', '角色管理', '/system/role', 'put', 2, 'N', b'0', NULL, '2023-02-21 09:01:07', NULL, '2023-02-21 09:01:06');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1594285449147330562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `dept_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1, '超级管理员', 'admin', 1, 1, 1, '0', '超级管理员', b'0', NULL, '2022-10-05 15:28:43', NULL, NULL);
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `dept_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (2, '普通角色', 'common', 2, 1, 0, '0', '普通角色', b'0', NULL, '2022-10-05 15:28:43', 1, '2022-12-19 22:13:17');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `dept_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1594285449147330561, '测试人员', 'test', 0, 0, 0, '0', NULL, b'0', 1, '2022-11-20 19:04:06', 1, '2022-12-19 23:33:28');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597918884311171073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597929330846040066);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597930331497922562);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597930928431267841);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597931148678365186);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1597918884311171073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1597929330846040066);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1597930331497922562);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1597930928431267841);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 1597931148678365186);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `resource_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源编码',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`role_id`,`resource_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色资源关联';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content.page', 2);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.test.test1', 2);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.test.test2', 2);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.category.add', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.category.edit', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.category.get_info', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.category.list', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.category.list_select', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.category.remove', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment.add', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment.edit', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment.get_info', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment.list', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment.remove', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment_info.to_comment', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content.page', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.del_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.get_own_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.get_own_love_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.own_contents', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.to_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.tag.add', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.tag.edit', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.tag.get_info', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.tag.list', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.tag.remove', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.image_upload', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.video_upload', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.zan_content', 1594285449147330561);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620804432292020227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `del_flag`) VALUES (1, 'admin', 'admin', '00', 'zy@163.com', '15888888888', '0', '/profile/avatar/2022/12/12/blob_20221212155420A001.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '127.0.0.1', '2023-02-20 20:19:15', '管理员', 0, '2022-10-05 15:28:43', 1, '2023-02-20 20:19:15', b'0');
INSERT INTO `sys_user` (`user_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `del_flag`) VALUES (2, 'zhiyuan', '致远', '00', 'zyyyy@qq.com', '15666666666', '1', '/profile/avatar/2022/12/12/blob_20221212155420A001.jpeg', '$2a$10$LtM4R7ovl31aBeT8yLrb.uoMFjU4TisUHHSZk4/PsLVkkyZT.Fgf.', '0', '127.0.0.1', '2023-01-11 23:04:36', '测试', 0, '2022-10-05 15:28:43', 2, '2023-01-11 23:04:36', b'0');
INSERT INTO `sys_user` (`user_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `del_flag`) VALUES (1594285543804383234, 'test', '测试账号', '00', '', '', '0', '/profile/avatar/2022/12/12/blob_20221212155420A001.jpeg', '$2a$10$BrEFSG5siwG4A1wBXgPzxeXlEvHFsh2kOQPu69jjQJjNcH7f2PRx6', '0', '127.0.0.1', '2023-02-20 20:13:43', NULL, 1, '2022-11-20 19:04:29', 1594285543804383234, '2023-02-20 20:13:43', b'0');
INSERT INTO `sys_user` (`user_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `del_flag`) VALUES (1620804097062273025, '123', '123', '00', '3066693006@qq.com', '', '0', '/profile/avatar/2023/02/02/blob_20230202215005A003.jpeg', '$2a$10$HxsNJ2LBx5WvQXb5DzwoDuaqZodQd/FV1HRH4H9vQabFJ3uFIGAO2', '0', '127.0.0.1', '2023-02-06 16:31:51', NULL, NULL, '2023-02-01 23:19:44', 1620804097062273025, '2023-02-06 16:31:51', b'0');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1594285543804383234, 1594285449147330561);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
