
CREATE DATABASE cloud_sample DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Use cloud_sample;
/*
 Navicat Premium Data Transfer

 Source Server         : ag-admin
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ag_bus_test

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 02/11/2018 15:58:23 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `depart_data_test`
-- ----------------------------
DROP TABLE IF EXISTS `sample_data_test`;
CREATE TABLE `sample_data_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `depart_id` varchar(36) DEFAULT NULL,
  `crt_user_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `crt_user_id` varchar(36) DEFAULT NULL COMMENT '创建人ID',
  `crt_time` datetime DEFAULT NULL COMMENT '创建时间',
  `upd_user_name` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  `upd_user_id` varchar(36) DEFAULT NULL COMMENT '最后更新人ID',
  `upd_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `tenant_id` varchar(36) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0;



SET FOREIGN_KEY_CHECKS = 1;
