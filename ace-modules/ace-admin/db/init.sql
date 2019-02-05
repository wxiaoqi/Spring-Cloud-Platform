
CREATE DATABASE ag_admin_v1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Use ag_admin_v1;
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ag_admin_v1

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 02/05/2019 21:40:27 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `base_element`
-- ----------------------------
DROP TABLE IF EXISTS `base_element`;
CREATE TABLE `base_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '资源编码',
  `type` varchar(255) DEFAULT NULL COMMENT '资源类型',
  `name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `uri` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `menu_id` varchar(255) DEFAULT NULL COMMENT '资源关联菜单',
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL COMMENT '资源树状检索路径',
  `method` varchar(10) DEFAULT NULL COMMENT '资源请求类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_element`
-- ----------------------------
BEGIN;
INSERT INTO `base_element` VALUES ('3', 'userManager:btn_add', 'button', '新增', '/admin/user', '1', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null), ('4', 'userManager:btn_edit', 'button', '编辑', '/admin/user/{*}', '1', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null), ('5', 'userManager:btn_del', 'button', '删除', '/admin/user/{*}', '1', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null), ('9', 'menuManager:element', 'uri', '按钮页面', '/admin/element', '6', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null), ('10', 'menuManager:btn_add', 'button', '新增', '/admin/menu/{*}', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null), ('11', 'menuManager:btn_edit', 'button', '编辑', '/admin/menu/{*}', '6', '', '', 'PUT', '', '2017-06-24 00:00:00', '', '', '', '', '', '', '', '', '', '', ''), ('12', 'menuManager:btn_del', 'button', '删除', '/admin/menu/{*}', '6', '', '', 'DELETE', '', '2017-06-24 00:00:00', '', '', '', '', '', '', '', '', '', '', ''), ('13', 'menuManager:btn_element_add', 'button', '新增元素', '/admin/element', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null), ('14', 'menuManager:btn_element_edit', 'button', '编辑元素', '/admin/element/{*}', '6', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null), ('15', 'menuManager:btn_element_del', 'button', '删除元素', '/admin/element/{*}', '6', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null), ('16', 'groupManager:btn_add', 'button', '新增', '/admin/group', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null), ('17', 'groupManager:btn_edit', 'button', '编辑', '/admin/group/{*}', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null), ('18', 'groupManager:btn_del', 'button', '删除', '/admin/group/{*}', '7', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null), ('19', 'groupManager:btn_userManager', 'button', '分配用户', '/admin/group/{*}/user', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null), ('20', 'groupManager:btn_resourceManager', 'button', '分配权限', '/admin/group/{*}/authority', '7', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null), ('21', 'groupManager:menu', 'uri', '分配菜单', '/admin/group/{*}/authority/menu', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null), ('22', 'groupManager:element', 'uri', '分配资源', '/admin/group/{*}/authority/element', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null), ('23', 'userManager:view', 'uri', '查看', '/admin/user/{*}', '1', '', '', 'GET', '', '2017-06-26 00:00:00', '', '', '', '', '', '', '', '', '', '', ''), ('24', 'menuManager:view', 'uri', '查看', '/admin/menu/{*}', '6', '', '', 'GET', '', '2017-06-26 00:00:00', '', '', '', '', '', '', '', '', '', '', ''), ('27', 'menuManager:element_view', 'uri', '查看', '/admin/element/{*}', '6', null, null, 'GET', null, null, null, null, null, null, null, null, null, null, null, null, null), ('28', 'groupManager:view', 'uri', '查看', '/admin/group/{*}', '7', null, null, 'GET', null, null, null, null, null, null, null, null, null, null, null, null, null), ('32', 'groupTypeManager:view', 'uri', '查看', '/admin/groupType/{*}', '8', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null), ('33', 'groupTypeManager:btn_add', 'button', '新增', '/admin/groupType', '8', null, null, 'POST', null, null, null, null, null, null, null, null, null, null, null, null, null), ('34', 'groupTypeManager:btn_edit', 'button', '编辑', '/admin/groupType/{*}', '8', null, null, 'PUT', null, null, null, null, null, null, null, null, null, null, null, null, null), ('35', 'groupTypeManager:btn_del', 'button', '删除', '/admin/groupType/{*}', '8', null, null, 'DELETE', null, null, null, null, null, null, null, null, null, null, null, null, null), ('41', 'gateLogManager:view', 'button', '查看', '/admin/gateLog', '27', null, null, 'GET', '', '2017-07-01 00:00:00', '1', 'admin', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null), ('42', 'serviceManager:view', 'URI', '查看', '/auth/service/{*}', '30', null, null, 'GET', null, '2017-12-26 20:17:42', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null), ('43', 'serviceManager:btn_add', 'button', '新增', '/auth/service', '30', null, null, 'POST', null, null, null, null, null, null, null, null, null, null, null, null, null), ('44', 'serviceManager:btn_edit', 'button', '编辑', '/auth/service/{*}', '30', null, null, 'PUT', null, null, null, null, null, null, null, null, null, null, null, null, null), ('45', 'serviceManager:btn_del', 'button', '删除', '/auth/service/{*}', '30', null, null, 'DELETE', null, null, null, null, null, null, null, null, null, null, null, null, null), ('46', 'serviceManager:btn_clientManager', 'button', '服务授权', '/auth/service/{*}/client', '30', null, null, 'POST', null, '2017-12-30 16:32:48', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_group`
-- ----------------------------
DROP TABLE IF EXISTS `base_group`;
CREATE TABLE `base_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '角色编码',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `parent_id` int(11) NOT NULL COMMENT '上级节点',
  `path` varchar(2000) DEFAULT NULL COMMENT '树状关系',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `group_type` int(11) NOT NULL COMMENT '角色组类型',
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_group`
-- ----------------------------
BEGIN;
INSERT INTO `base_group` VALUES ('1', 'adminRole', '管理员', '-1', '/adminRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('3', 'testGroup', '体验组', '-1', '/testGroup', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('4', 'visitorRole', '游客', '3', '/testGroup/visitorRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('6', 'company', 'AG集团', '-1', '/company', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('7', 'financeDepart', '财务部', '6', '/company/financeDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('8', 'hrDepart', '人力资源部', '6', '/company/hrDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('9', 'blogAdmin', '博客管理员', '-1', '/blogAdmin', null, '1', '', '2017-07-16 16:59:30', '1', 'Mr.AG', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_group_leader`
-- ----------------------------
DROP TABLE IF EXISTS `base_group_leader`;
CREATE TABLE `base_group_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_group_leader`
-- ----------------------------
BEGIN;
INSERT INTO `base_group_leader` VALUES ('6', '9', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('13', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_group_member`
-- ----------------------------
DROP TABLE IF EXISTS `base_group_member`;
CREATE TABLE `base_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_group_member`
-- ----------------------------
BEGIN;
INSERT INTO `base_group_member` VALUES ('2', '4', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('9', '9', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('10', '1', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_group_type`
-- ----------------------------
DROP TABLE IF EXISTS `base_group_type`;
CREATE TABLE `base_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `crt_time` datetime DEFAULT NULL COMMENT '创建时间',
  `crt_user` varchar(255) DEFAULT NULL COMMENT '创建人ID',
  `crt_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `crt_host` varchar(255) DEFAULT NULL COMMENT '创建主机',
  `upd_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `upd_user` varchar(255) DEFAULT NULL COMMENT '最后更新人ID',
  `upd_name` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  `upd_host` varchar(255) DEFAULT NULL COMMENT '最后更新主机',
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_group_type`
-- ----------------------------
BEGIN;
INSERT INTO `base_group_type` VALUES ('1', 'role', '角色类型', 'role', null, null, null, null, '2017-08-25 17:52:37', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null), ('2', 'depart', '部门类型', null, null, null, null, null, '2017-08-25 17:52:43', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null), ('3', 'free', '自定义类型', 'sadf', null, null, null, null, '2017-08-26 08:22:25', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_menu`
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '路径编码',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `parent_id` int(11) NOT NULL COMMENT '父级节点',
  `href` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` char(10) DEFAULT NULL,
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `path` varchar(500) DEFAULT NULL COMMENT '菜单上下级关系',
  `enabled` char(1) DEFAULT NULL COMMENT '启用禁用',
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_menu`
-- ----------------------------
BEGIN;
INSERT INTO `base_menu` VALUES ('1', 'userManager', '用户管理', '5', '/admin/user', 'fa-user', 'menu', '0', '', '/adminSys/baseManager/userManager', null, null, null, null, null, '2017-09-05 21:06:51', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/user/index\')', null, null, null, null, null, null, null), ('5', 'baseManager', '基础配置管理', '13', '/admin', 'setting', 'dirt', '0', '', '/adminSys/baseManager', null, null, null, null, null, '2017-09-05 21:46:11', '1', 'Mr.AG', '127.0.0.1', 'Layout', null, null, null, null, null, null, null), ('6', 'menuManager', '菜单管理', '5', '/admin/menu', 'category', 'menu', '0', '', '/adminSys/baseManager/menuManager', null, null, null, null, null, '2017-09-05 21:10:25', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/menu/index\')', null, null, null, null, null, null, null), ('7', 'groupManager', '角色权限管理', '5', '/admin/group', 'group_fill', 'menu', '0', '', '/adminSys/baseManager/groupManager', null, null, null, null, null, '2017-09-05 21:11:34', '1', 'Mr.AG', '127.0.0.1', 'import(\'admin/group/index\')', null, null, null, null, null, null, null), ('8', 'groupTypeManager', '角色类型管理', '5', '/admin/groupType', 'fa-users', 'menu', '0', '', '/adminSys/baseManager/groupTypeManager', null, null, null, null, null, '2017-09-05 21:12:28', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/groupType/index\')', null, null, null, null, null, null, null), ('13', 'adminSys', '权限管理系统', '-1', '/base', 'setting', 'dirt', '0', '', '/adminSys', null, null, null, null, null, '2017-09-28 12:09:22', '1', 'Mr.AG', '127.0.0.1', 'Layout', null, null, null, null, null, null, null), ('27', 'gateLogManager', '操作日志', '5', '/admin/gateLog', 'viewlist', 'menu', '0', '', '/adminSys/baseManager/gateLogManager', null, '2017-07-01 00:00:00', '1', 'admin', '0:0:0:0:0:0:0:1', '2017-09-05 22:32:55', '1', 'Mr.AG', '127.0.0.1', '_import(\'admin/gateLog/index\')', null, null, null, null, null, null, null), ('29', 'authManager', '服务权限管理', '13', '/auth', 'service', 'dirt', '0', '服务权限管理', '/adminSys/authManager', null, '2017-12-26 19:54:45', '1', 'Mr.AG', '127.0.0.1', '2019-01-27 12:42:09', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null), ('30', 'serviceManager', '服务管理', '29', '/auth/service', 'client', null, '0', '服务管理', '/adminSys/authManager/serviceManager', null, '2017-12-26 19:56:06', '1', 'Mr.AG', '127.0.0.1', '2017-12-26 19:56:06', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null), ('31', 'monitorManager', '监控模块管理', '13', '/service', 'service', 'dirt', '0', null, '/adminSys/monitorManager', null, '2018-02-25 09:36:35', '1', 'Mr.AG', '127.0.0.1', '2019-01-27 12:42:13', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null), ('32', 'serviceEurekaManager', '服务注册中心', '31', 'http://localhost:8848/nacos', 'client', 'menu', '0', null, '/adminSys/monitorManager/serviceEurekaManager', null, '2018-02-25 09:37:04', '1', 'Mr.AG', '127.0.0.1', '2019-01-27 12:14:35', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null), ('33', 'serviceMonitorManager', '服务状态监控', '31', '', 'client', 'menu', '0', null, '/adminSys/monitorManager/serviceEurekaManager', null, '2018-02-25 09:37:05', '1', 'Mr.AG', '127.0.0.1', '2019-01-27 12:07:14', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null), ('34', 'serviceZipkinManager', '服务链路监控', '31', '', 'client', 'menu', '0', null, '/adminSys/monitorManager/serviceZipkinManager', null, '2018-02-25 09:38:05', '1', 'Mr.AG', '127.0.0.1', '2019-01-27 13:13:33', '1', 'admin', '127.0.0.1', '2121', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_resource_authority`
-- ----------------------------
DROP TABLE IF EXISTS `base_resource_authority`;
CREATE TABLE `base_resource_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_id` varchar(255) DEFAULT NULL COMMENT '角色ID',
  `authority_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `resource_id` varchar(255) DEFAULT NULL COMMENT '资源ID',
  `resource_type` varchar(255) DEFAULT NULL COMMENT '资源类型',
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=986 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_resource_authority`
-- ----------------------------
BEGIN;
INSERT INTO `base_resource_authority` VALUES ('287', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('288', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('289', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('290', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('291', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('294', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('295', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('296', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('297', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('298', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('299', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('300', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('301', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('302', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('303', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('304', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('305', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('306', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('307', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('308', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('309', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('310', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('311', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('312', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('313', '1', 'group', '16', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('314', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('315', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('317', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('318', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('319', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('349', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('371', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('372', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('373', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('374', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('375', '1', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('378', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('379', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('380', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('381', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('382', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('383', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('384', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('385', '1', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('386', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('387', '1', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('388', '1', 'group', '16', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('389', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('390', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('392', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('393', '1', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('394', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('395', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('396', '4', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('397', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('398', '4', 'group', '27', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('399', '4', 'group', '24', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('400', '4', 'group', '28', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('401', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('402', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('403', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('421', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('422', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('423', '4', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('424', '4', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('436', '1', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('437', '1', 'group', '33', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('438', '1', 'group', '34', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('439', '1', 'group', '35', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('440', '4', 'group', '32', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('464', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('465', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('466', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('467', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('468', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('469', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('470', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('471', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('472', '1', 'group', '40', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('492', '1', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('493', '1', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('494', '1', 'group', '40', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('516', '4', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('517', '4', 'group', '30', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('518', '4', 'group', '31', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('519', '4', 'group', '40', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('611', '4', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('612', '4', 'group', '36', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('628', '4', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('629', '4', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('630', '4', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('631', '4', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('632', '4', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('633', '4', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('634', '4', 'group', '27', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('635', '4', 'group', '9', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('636', '4', 'group', '24', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('637', '4', 'group', '22', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('638', '4', 'group', '23', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('639', '4', 'group', '25', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('640', '4', 'group', '26', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('641', '4', 'group', '28', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('666', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('689', '1', 'group', '43', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('691', '1', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('710', '9', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('711', '9', 'group', '43', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('712', '9', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('713', '9', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('718', '9', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('719', '9', 'group', '44', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('720', '9', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('721', '9', 'group', '43', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('722', '1', 'group', '41', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('749', '10', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('750', '10', 'group', '14', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('751', '10', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('752', '10', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('753', '10', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('754', '10', 'group', '17', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('755', '10', 'group', '20', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('774', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('775', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('812', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('924', '1', 'group', '42', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('945', '1', 'group', '45', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('956', '1', 'group', '46', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('967', '1', 'group', '33', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('968', '1', 'group', '34', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('969', '1', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('970', '1', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('971', '1', 'group', '27', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('972', '1', 'group', '29', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('973', '1', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('974', '1', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('975', '1', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('976', '1', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('977', '1', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('978', '1', 'group', '30', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('979', '1', 'group', '31', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('980', '1', 'group', '32', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('981', '9', 'group', '23', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('982', '9', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('983', '9', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('984', '9', 'group', '-1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('985', '9', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `base_user`
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `tel_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` datetime DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` datetime DEFAULT NULL,
  `upd_user` varchar(255) DEFAULT NULL,
  `upd_name` varchar(255) DEFAULT NULL,
  `upd_host` varchar(255) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  `attr4` varchar(255) DEFAULT NULL,
  `attr5` varchar(255) DEFAULT NULL,
  `attr6` varchar(255) DEFAULT NULL,
  `attr7` varchar(255) DEFAULT NULL,
  `attr8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `base_user`
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES ('1', 'admin', '$2a$12$S/yLlj9kzi5Dgsz97H4rAekxrPlk/10eXp1lUJcAVAx.2M9tOpWie', 'Mr.AG', '', null, '', null, '', '男', null, null, '', null, null, null, null, '2017-11-16 23:23:49', '1', 'Mr.AG', '127.0.0.1', null, null, null, null, null, null, null, null), ('2', 'test', '$2a$12$zWe6knO6rGp15UVfdWTTxu.Ykt.k3QnD5FPoj6a1cnL63csHY2A1S', '测试账户', '', null, '', null, '', '男', null, null, '', null, null, null, null, '2017-07-15 19:18:07', '1', '管理员', '0:0:0:0:0:0:0:1', null, null, null, null, null, null, null, null), ('4', 'blog', '$2a$12$S/yLlj9kzi5Dgsz97H4rAekxrPlk/10eXp1lUJcAVAx.2M9tOpWie', 'Mr.AG(博主)', '', null, '', null, '', '男', null, null, '12', null, null, null, null, '2019-01-27 15:33:13', '1', 'admin', '127.0.0.1', null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `gate_log`
-- ----------------------------
DROP TABLE IF EXISTS `gate_log`;
CREATE TABLE `gate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `menu` varchar(255) DEFAULT NULL COMMENT '菜单',
  `opt` varchar(255) DEFAULT NULL COMMENT '操作',
  `uri` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `crt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `crt_user` varchar(255) DEFAULT NULL COMMENT '操作人ID',
  `crt_name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `crt_host` varchar(255) DEFAULT NULL COMMENT '操作主机',
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `gate_log`
-- ----------------------------
BEGIN;
INSERT INTO `gate_log` VALUES ('1', '菜单管理', '新增', '/admin/menu', '2018-02-25 09:36:35', '1', 'Mr.AG', '127.0.0.1', null), ('2', '菜单管理', '新增', '/admin/menu', '2018-02-25 09:37:04', '1', 'Mr.AG', '127.0.0.1', null), ('3', '菜单管理', '新增', '/admin/menu', '2018-02-25 09:37:04', '1', 'Mr.AG', '127.0.0.1', null), ('4', '菜单管理', '编辑', '/admin/menu', '2018-02-25 09:37:20', '1', 'Mr.AG', '127.0.0.1', null), ('5', '菜单管理', '编辑', '/admin/menu', '2018-02-25 09:37:32', '1', 'Mr.AG', '127.0.0.1', null), ('6', '菜单管理', '编辑', '/admin/menu', '2018-02-25 09:37:35', '1', 'Mr.AG', '127.0.0.1', null), ('7', '菜单管理', '编辑', '/admin/menu', '2018-02-25 09:37:40', '1', 'Mr.AG', '127.0.0.1', null), ('8', '菜单管理', '新增', '/admin/menu', '2018-02-25 09:38:04', '1', 'Mr.AG', '127.0.0.1', null), ('9', '角色权限管理', '新增', '/admin/group', '2018-02-25 09:38:21', '1', 'Mr.AG', '127.0.0.1', null), ('10', '菜单管理', '编辑', '/admin/menu', '2018-02-25 09:38:55', '1', 'Mr.AG', '127.0.0.1', null), ('11', '用户管理', '编辑', '/admin/user', '2018-03-06 11:26:28', '1', 'Mr.AG', '127.0.0.1', null), ('12', '用户管理', '编辑', '/admin/user', '2018-03-06 11:26:34', '1', 'Mr.AG', '127.0.0.1', null), ('13', '用户管理', '编辑', '/admin/user', '2018-03-07 11:21:10', '1', 'Mr.AG', '127.0.0.1', null), ('14', '用户管理', '编辑', '/admin/user/{*}', '2019-01-27 15:33:13', '1', 'Mr.AG', '/127.0.0.1:54809', '{\"id\":4,\"username\":\"blog\",\"name\":\"Mr.AG(博主)\",\"birthday\":\"\",\"mobilePhone\":\"\",\"email\":\"\",\"sex\":\"男\",\"description\":\"12\",\"updTime\":\"2019-01-27 15:30:14\",\"updUser\":\"1\",\"updName\":\"admin\",\"updHost\":\"127.0.0.1\"}');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
