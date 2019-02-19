
CREATE DATABASE ag_auth_v1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Use ag_auth_v1;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ag_auth_v1

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 02/05/2019 21:40:34 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_client`
-- ----------------------------
DROP TABLE IF EXISTS `auth_client`;
CREATE TABLE `auth_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '服务编码',
  `secret` varchar(255) DEFAULT NULL COMMENT '服务密钥',
  `name` varchar(255) DEFAULT NULL COMMENT '服务名',
  `locked` char(1) DEFAULT NULL COMMENT '是否锁定',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `crt_time` datetime DEFAULT NULL COMMENT '创建时间',
  `crt_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `crt_name` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `crt_host` varchar(255) DEFAULT NULL COMMENT '创建主机',
  `upd_time` datetime DEFAULT NULL COMMENT '更新时间',
  `upd_user` varchar(255) DEFAULT NULL COMMENT '更新人',
  `upd_name` varchar(255) DEFAULT NULL COMMENT '更新姓名',
  `upd_host` varchar(255) DEFAULT NULL COMMENT '更新主机',
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `auth_client`
-- ----------------------------
BEGIN;
INSERT INTO `auth_client` VALUES ('1', 'ace-gate', '123456', 'ace-gate', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('3', 'ace-admin', '123456', 'ace-admin', '0', '', null, null, null, null, '2017-07-06 21:42:17', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null), ('6', 'ace-auth', '123456', 'ace-auth', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('11', 'ace-config', 'fXHsssa2', 'ace-config', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('13', 'ace-template', 'bZf8yvj8', 'ace-template', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('14', 'ace-trace', 'wKTl6GGE', 'ace-trace', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('15', 'ace-monitor', 'eEQBUcnW', 'ace-monitor', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `auth_client_service`
-- ----------------------------
DROP TABLE IF EXISTS `auth_client_service`;
CREATE TABLE `auth_client_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `auth_client_service`
-- ----------------------------
BEGIN;
INSERT INTO `auth_client_service` VALUES ('21', '4', '5', null, null, null, null, null, null, null, null, null, null, null, null, null), ('23', '3', '6', null, null, null, null, null, null, null, null, null, null, null, null, null), ('41', '3', '1', null, '2017-12-31 08:58:03', 'null', 'null', 'null', null, null, null, null, null, null, null, null), ('42', '6', '1', null, '2017-12-31 08:58:03', 'null', 'null', 'null', null, null, null, null, null, null, null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
