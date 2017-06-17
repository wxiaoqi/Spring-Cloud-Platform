CREATE SCHEMA `ag_admin` DEFAULT CHARACTER SET utf8 ;
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
`id`  int NOT NULL AUTO_INCREMENT ,
`username`  varchar(255) NULL ,
`password`  varchar(255) NULL ,
`name`  varchar(255) NULL ,
`birthday`  varchar(255) NULL ,
`address`  varchar(255) NULL ,
`mobile_phone`  varchar(255) NULL ,
`tel_phone`  varchar(255) NULL ,
`email`  varchar(255) NULL ,
`sex`  char(1) NULL ,
`type`  char(1) NULL ,
`status`  char(1) NULL ,
`description`  varchar(255) NULL ,
`crt_time`  date NULL ,
`crt_user`  varchar(255) NULL ,
`crt_name`  varchar(255) NULL ,
`crt_host`  varchar(255) NULL ,
`upd_time`  date NULL ,
`upd_user`  varchar(255) NULL ,
`upd_name`  varchar(255) NULL ,
`upd_host`  varchar(255) NULL ,
`attr1`  varchar(255) NULL ,
`attr2`  varchar(255) NULL ,
`attr3`  varchar(255) NULL ,
`attr4`  varchar(255) NULL ,
`attr5`  varchar(255) NULL ,
`attr6`  varchar(255) NULL ,
`attr7`  varchar(255) NULL ,
`attr8`  varchar(255) NULL ,
PRIMARY KEY (`id`)
)
;
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
`id`  int NOT NULL AUTO_INCREMENT ,
`code`  varchar(255) NULL ,
`title`  varchar(255) NULL ,
`parent_id`  int NOT NULL ,
`href`  varchar(255) NULL ,
`icon`  varchar(255) NULL,
`type`  char(1) NULL ,
`order_num`  int NOT NULL DEFAULT 0,
`description`  varchar(255) NULL ,
`path` varchar(500) NULL ,
`enabled` char(1) NULL ,
`crt_time`  date NULL ,
`crt_user`  varchar(255) NULL ,
`crt_name`  varchar(255) NULL ,
`crt_host`  varchar(255) NULL ,
`upd_time`  date NULL ,
`upd_user`  varchar(255) NULL ,
`upd_name`  varchar(255) NULL ,
`upd_host`  varchar(255) NULL ,
`attr1`  varchar(255) NULL ,
`attr2`  varchar(255) NULL ,
`attr3`  varchar(255) NULL ,
`attr4`  varchar(255) NULL ,
`attr5`  varchar(255) NULL ,
`attr6`  varchar(255) NULL ,
`attr7`  varchar(255) NULL ,
`attr8`  varchar(255) NULL ,
PRIMARY KEY (`id`)
)
;
DROP TABLE IF EXISTS `base_group`;
CREATE TABLE `base_group` (
`id`  int NOT NULL AUTO_INCREMENT ,
`code`  varchar(255) NULL ,
`name`  varchar(255) NULL ,
`parent_id`  int NOT NULL ,
`path` varchar(2000) NULL ,
`type`  char(1) NULL,
`group_type`  int NOT NULL ,
`description`  varchar(255) NULL ,
`crt_time`  date NULL ,
`crt_user`  varchar(255) NULL ,
`crt_name`  varchar(255) NULL ,
`crt_host`  varchar(255) NULL ,
`upd_time`  date NULL ,
`upd_user`  varchar(255) NULL ,
`upd_name`  varchar(255) NULL ,
`upd_host`  varchar(255) NULL ,
`attr1`  varchar(255) NULL ,
`attr2`  varchar(255) NULL ,
`attr3`  varchar(255) NULL ,
`attr4`  varchar(255) NULL ,
`attr5`  varchar(255) NULL ,
`attr6`  varchar(255) NULL ,
`attr7`  varchar(255) NULL ,
`attr8`  varchar(255) NULL ,
PRIMARY KEY (`id`)
)
;
DROP TABLE IF EXISTS `base_group_type`;
CREATE TABLE `base_group_type` (
`id`  int NOT NULL AUTO_INCREMENT ,
`code`  varchar(255) NULL ,
`name`  varchar(255) NULL ,
`description`  varchar(255) NULL ,
`crt_time`  date NULL ,
`crt_user`  varchar(255) NULL ,
`crt_name`  varchar(255) NULL ,
`crt_host`  varchar(255) NULL ,
`upd_time`  date NULL ,
`upd_user`  varchar(255) NULL ,
`upd_name`  varchar(255) NULL ,
`upd_host`  varchar(255) NULL ,
`attr1`  varchar(255) NULL ,
`attr2`  varchar(255) NULL ,
`attr3`  varchar(255) NULL ,
`attr4`  varchar(255) NULL ,
`attr5`  varchar(255) NULL ,
`attr6`  varchar(255) NULL ,
`attr7`  varchar(255) NULL ,
`attr8`  varchar(255) NULL ,
PRIMARY KEY (`id`)
)
;
-- 初始化菜单数据
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('1', 'userManager', '用户管理', '5', 'user', 'fa-user', NULL, '0', '', '/adminSys/baseManager/userManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('5', 'baseManager', '基础配置管理', '13', '', 'fa fa-cog fa-spin', NULL, '0', '', '/adminSys/baseManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('6', 'menuManager', '菜单管理', '5', 'menu', 'fa-list', NULL, '0', '', '/adminSys/baseManager/menuManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('7', 'groupManager', '用户组管理', '5', 'group', 'fa-users', NULL, '0', '', '/adminSys/baseManager/groupManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('8', 'groupTypeManager', '组类型管理', '5', 'groupType', 'fa-address-card-o', NULL, '0', '', '/adminSys/baseManager/groupTypeManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('9', 'monitorManager', '系统监控', '13', '', 'fa-area-chart', NULL, '0', '', '/adminSys/monitorManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('10', 'bootMonitor', 'Spring-Boot监控', '9', 'http://localhost:8764', 'fa-line-chart', NULL, '0', '', '/adminSys/monitorManager/bootMonitor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('11', 'hystrixMonitor', 'Hystrix监控', '9', 'http://localhost:8764/hystrix', 'fa-bar-chart', NULL, '0', '', '/adminSys/monitorManager/hystrixMonitor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('13', 'adminSys', '权限管理系统', '-1', '', 'fa-terminal', NULL, '0', '', '/adminSys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('14', 'contentSys', '内容管理系统', '-1', '', 'fa-newspaper-o', NULL, '0', '', '/contentSys', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('17', 'articleManger', '文章管理', '20', '', '', NULL, '0', '', '/contentSys/artComManger/articleManger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('18', 'commentManager', '评论管理', '20', '', '', NULL, '0', '', '/contentSys/artComManger/commentManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('20', 'artComManger', '文章评论管理', '14', '', 'fa-bookmark', NULL, '0', '', '/contentSys/artComManger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_menu` (`id`, `code`, `title`, `parent_id`, `href`, `icon`, `type`, `order_num`, `description`, `path`, `enabled`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('21', 'dictManager', '数据字典', '5', '', 'fa-book', NULL, '0', '', '/adminSys/baseManager/dictManager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- 初始化群组类型数据
INSERT INTO `ag_admin`.`base_group_type` (`id`, `code`, `name`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('1', 'role', '角色类型', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group_type` (`id`, `code`, `name`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('3', 'group', '自定义类型', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group_type` (`id`, `code`, `name`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('2', 'depart', '部门类型', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- 初始化用户组数据
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('1', 'adminRole', '管理员', '-1', '/adminRole', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('3', 'testGroup', '体验组', '-1', '/testGroup', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('4', 'visitorRole', '游客', '3', '/testGroup/visitorRole', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('5', 'freeRole', '试用', '3', '/testGroup/freeRole', NULL, '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('6', 'company', 'AG集团', '-1', '/company', NULL, '2', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('7', 'financeDepart', '财务部', '6', '/company/financeDepart', NULL, '2', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ag_admin`.`base_group` (`id`, `code`, `name`, `parent_id`, `path`, `type`, `group_type`, `description`, `crt_time`, `crt_user`, `crt_name`, `crt_host`, `upd_time`, `upd_user`, `upd_name`, `upd_host`, `attr1`, `attr2`, `attr3`, `attr4`, `attr5`, `attr6`, `attr7`, `attr8`) VALUES ('8', 'hrDepart', '人力资源部', '6', '/company/hrDepart', NULL, '2', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
