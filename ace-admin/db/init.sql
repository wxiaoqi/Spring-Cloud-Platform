/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : ag_admin

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-06-25 00:09:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_element
-- ----------------------------
DROP TABLE IF EXISTS `base_element`;
CREATE TABLE `base_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_element
-- ----------------------------
INSERT INTO `base_element` VALUES ('3', 'userManager:btn_add', 'button', '新增', '/user', '1', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('4', 'userManager:btn_edit', 'button', '编辑', '/user', '1', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('5', 'userManager:btn_del	', 'button', '删除', '/user', '1', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('9', 'menuManager:element', 'uri', '按钮页面', '/element', '6', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('10', 'menuManager:btn_add', 'button', '新增', '/menu', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('11', 'menuManager:btn_edit', 'button', '编辑', '/menu', '6', '', '', 'PUT', '', '2017-06-24', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('12', 'menuManager:btn_del	', 'button', '删除', '/menu', '6', '', '', 'DELETE', '', '2017-06-24', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `base_element` VALUES ('13', 'menuManager:btn_element_add', 'button', '新增元素', '/element', '6', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('14', 'menuManager:btn_element_edit', 'button', '编辑元素', '/element', '6', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('15', 'btn_element_del', 'button', '删除元素', '/element', '6', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('16', 'groupManager:btn_add', 'button', '新增', '/group', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('17', 'groupManager:btn_edit', 'button', '编辑', '/group', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('18', 'groupManager:btn_del', 'button', '删除', '/group', '7', null, null, 'DELETE', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('19', 'groupManager:btn_userManager', 'button', '分配用户', '/group/{*}/user', '7', null, null, 'PUT', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('20', 'groupManager:btn_resourceManager', 'button', '分配权限', '/group/{*}/authority', '7', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('21', 'groupManager:menu', 'uri', '分配菜单', '/group/{*}/authority/menu', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('22', 'groupManager:element', 'uri', '分配资源', '/group/{*}/authority/element', '7', null, null, 'POST', '', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_element` VALUES ('25', '123', 'button', '12', '123', '6', null, null, 'GET', '', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group
-- ----------------------------
DROP TABLE IF EXISTS `base_group`;
CREATE TABLE `base_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `group_type` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group
-- ----------------------------
INSERT INTO `base_group` VALUES ('1', 'adminRole', '管理员', '-1', '/adminRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('3', 'testGroup', '体验组', '-1', '/testGroup', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('4', 'visitorRole', '游客', '3', '/testGroup/visitorRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('5', 'freeRole', '试用', '3', '/testGroup/freeRole', null, '1', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('6', 'company', 'AG集团', '-1', '/company', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('7', 'financeDepart', '财务部', '6', '/company/financeDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group` VALUES ('8', 'hrDepart', '人力资源部', '6', '/company/hrDepart', null, '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_leader
-- ----------------------------
DROP TABLE IF EXISTS `base_group_leader`;
CREATE TABLE `base_group_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_leader
-- ----------------------------
INSERT INTO `base_group_leader` VALUES ('3', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_member
-- ----------------------------
DROP TABLE IF EXISTS `base_group_member`;
CREATE TABLE `base_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_member
-- ----------------------------
INSERT INTO `base_group_member` VALUES ('2', '4', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_member` VALUES ('5', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_group_type
-- ----------------------------
DROP TABLE IF EXISTS `base_group_type`;
CREATE TABLE `base_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_group_type
-- ----------------------------
INSERT INTO `base_group_type` VALUES ('1', 'role', '角色类型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_type` VALUES ('2', 'depart', '部门类型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_group_type` VALUES ('3', 'group', '自定义类型', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `order_num` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES ('1', 'userManager', '用户管理', '5', 'user', 'fa fa-user', null, '0', '', '/adminSys/baseManager/userManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('5', 'baseManager', '基础配置管理', '13', '', 'fa fa-cog fa-spin', null, '0', '', '/adminSys/baseManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('6', 'menuManager', '菜单管理', '5', 'menu', 'fa fa-list', null, '0', '', '/adminSys/baseManager/menuManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('7', 'groupManager', '用户组管理', '5', 'group', 'fa fa-users', null, '0', '', '/adminSys/baseManager/groupManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('8', 'groupTypeManager', '组类型管理', '5', 'groupType', 'fa fa-address-card-o', null, '0', '', '/adminSys/baseManager/groupTypeManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('9', 'monitorManager', '系统监控', '13', '', 'fa fa-area-chart', null, '0', '', '/adminSys/monitorManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('10', 'bootMonitor', 'Spring-Boot监控', '9', 'http://localhost:8764', 'fa fa-line-chart', null, '0', '', '/adminSys/monitorManager/bootMonitor', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('11', 'hystrixMonitor', 'Hystrix监控', '9', 'http://localhost:8764/hystrix', 'fa fa-bar-chart', null, '0', '', '/adminSys/monitorManager/hystrixMonitor', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('13', 'adminSys', '权限管理系统', '-1', '', 'fa fa-terminal', null, '0', '', '/adminSys', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('14', 'contentSys', '内容管理系统', '-1', '', 'fa-newspaper-o', null, '0', '', '/contentSys', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('17', 'articleManger', '文章管理', '20', '', '', null, '0', '', '/contentSys/artComManger/articleManger', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('18', 'commentManager', '评论管理', '20', '', '', null, '0', '', '/contentSys/artComManger/commentManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('20', 'artComManger', '文章评论管理', '14', '', 'fa fa-bookmark', null, '0', '', '/contentSys/artComManger', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('21', 'dictManager', '数据字典', '5', '', 'fa fa-book', null, '0', '', '/adminSys/baseManager/dictManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('22', 'apiManager', '服务端api文档', '13', '', 'fa fa-folder', null, '0', '', '/adminSys/apiManager', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('23', 'adminAPI', 'Admin Rest API', '22', '/back/swagger-ui.html', 'fa fa-file-code-o', null, '0', '', '/adminSys/apiManager/adminAPI', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_menu` VALUES ('24', 'druidMonitor', 'Admin Druid数据监控', '9', '/back/druid/datasource.html', 'fa fa-line-chart', null, '0', '', '/adminSys/monitorManager/druidMonitor', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_resource_authority
-- ----------------------------
DROP TABLE IF EXISTS `base_resource_authority`;
CREATE TABLE `base_resource_authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_id` varchar(255) DEFAULT NULL,
  `authority_type` varchar(255) DEFAULT NULL,
  `resource_id` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `path` varchar(2000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crt_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_resource_authority
-- ----------------------------
INSERT INTO `base_resource_authority` VALUES ('285', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('286', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('287', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('288', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('289', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('290', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('291', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('292', '1', 'group', '3', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('293', '1', 'group', '4', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('294', '1', 'group', '5', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('295', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('296', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('297', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('298', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('299', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('300', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('301', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('302', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('303', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('304', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('305', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('306', '1', 'group', '10', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('307', '1', 'group', '11', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('308', '1', 'group', '12', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('309', '1', 'group', '13', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('310', '1', 'group', '14', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('311', '1', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('312', '1', 'group', '15', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('313', '1', 'group', '16', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('314', '1', 'group', '17', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('315', '1', 'group', '18', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('316', '1', 'group', '19', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('317', '1', 'group', '20', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('318', '1', 'group', '21', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('319', '1', 'group', '22', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('320', '1', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('321', '1', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('322', '1', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('323', '1', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('324', '1', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('325', '1', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('326', '1', 'group', '21', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('327', '1', 'group', '9', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('328', '1', 'group', '10', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('329', '1', 'group', '11', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('330', '1', 'group', '24', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('331', '1', 'group', '22', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('332', '1', 'group', '23', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('333', '1', 'group', '14', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('334', '1', 'group', '20', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('335', '1', 'group', '17', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('336', '1', 'group', '18', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('349', '4', 'group', '9', 'button', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('360', '4', 'group', '13', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('361', '4', 'group', '5', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('362', '4', 'group', '1', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('363', '4', 'group', '6', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('364', '4', 'group', '7', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('365', '4', 'group', '8', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('366', '4', 'group', '21', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('367', '4', 'group', '9', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('368', '4', 'group', '24', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('369', '4', 'group', '22', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_resource_authority` VALUES ('370', '4', 'group', '23', 'menu', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for base_user
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
  `crt_time` date DEFAULT NULL,
  `crt_user` varchar(255) DEFAULT NULL,
  `crt_name` varchar(255) DEFAULT NULL,
  `crt_host` varchar(255) DEFAULT NULL,
  `upd_time` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_user
-- ----------------------------
INSERT INTO `base_user` VALUES ('1', 'admin', '$2a$12$phuHRCCgXJwNJEhGd.euE./1J.orK1ildZa3KtbT6djqWRLPKKI9K', 'admin', '', null, '', null, '', '男', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `base_user` VALUES ('2', 'test', '$2a$12$D5Zm4IuXokN9N4P1Xgx6HuPgRqxe27QjkiEVMauZrNQnhMNQVvXSG', 'test', '', null, '', null, '', '男', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
