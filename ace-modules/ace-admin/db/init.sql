
CREATE DATABASE cloud_admin_v1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Use cloud_admin_v1;
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
INSERT INTO auth_client (id,code,secret,name,locked,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'ace-gate','123456','ace-gate','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(3,'ace-admin','123456','ace-admin','0','',NULL,NULL,NULL,NULL,'2017-07-06 21:42:17','1','管理员','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(6,'ace-auth','123456','ace-auth','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(11,'ace-config','fXHsssa2','ace-config','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(13,'ace-template','bZf8yvj8','ace-template','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(14,'ace-trace','wKTl6GGE','ace-trace','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(15,'ace-monitor','eEQBUcnW','ace-monitor','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(16,'ace-gateway','PHK3CLfo','ace-gateway','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO auth_client_service (id,service_id,client_id,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(21,'4','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(23,'3','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(41,'3','1',NULL,'2017-12-31 08:58:03','null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(42,'6','1',NULL,'2017-12-31 08:58:03','null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(3,'userManager:btn_add','button','新增','/admin/user','1',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(4,'userManager:btn_edit','button','编辑','/admin/user/{*}','1',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(5,'userManager:btn_del','button','删除','/admin/user/{*}','1',NULL,NULL,'DELETE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(9,'menuManager:element','uri','按钮页面','/admin/element','6',NULL,NULL,'GET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(10,'menuManager:btn_add','button','新增','/admin/menu/{*}','6',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(11,'menuManager:btn_edit','button','编辑','/admin/menu/{*}','6','','','PUT','','2017-06-24 00:00:00','','','','','','','','','','','')
,(12,'menuManager:btn_del','button','删除','/admin/menu/{*}','6','','','DELETE','','2017-06-24 00:00:00','','','','','','','','','','','')
,(13,'menuManager:btn_element_add','button','新增元素','/admin/element','6',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(14,'menuManager:btn_element_edit','button','编辑元素','/admin/element/{*}','6',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(15,'menuManager:btn_element_del','button','删除元素','/admin/element/{*}','6',NULL,NULL,'DELETE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(16,'groupManager:btn_add','button','新增','/admin/group','7',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(17,'groupManager:btn_edit','button','编辑','/admin/group/{*}','7',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(18,'groupManager:btn_del','button','删除','/admin/group/{*}','7',NULL,NULL,'DELETE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(19,'groupManager:btn_userManager','button','分配用户','/admin/group/{*}/user','7',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(20,'groupManager:btn_resourceManager','button','分配权限','/admin/group/{*}/authority','7',NULL,NULL,'GET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(21,'groupManager:menu','uri','分配菜单','/admin/group/{*}/authority/menu','7',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(22,'groupManager:element','uri','分配资源','/admin/group/{*}/authority/element','7',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(23,'userManager:view','uri','查看','/admin/user/{*}','1','','','GET','','2017-06-26 00:00:00','','','','','','','','','','','')
,(24,'menuManager:view','uri','查看','/admin/menu/{*}','6','','','GET','','2017-06-26 00:00:00','','','','','','','','','','','')
,(27,'menuManager:element_view','uri','查看','/admin/element/{*}','6',NULL,NULL,'GET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(28,'groupManager:view','uri','查看','/admin/group/{*}','7',NULL,NULL,'GET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(32,'groupTypeManager:view','uri','查看','/admin/groupType/{*}','8',NULL,NULL,'GET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(33,'groupTypeManager:btn_add','button','新增','/admin/groupType','8',NULL,NULL,'POST',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(34,'groupTypeManager:btn_edit','button','编辑','/admin/groupType/{*}','8',NULL,NULL,'PUT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(35,'groupTypeManager:btn_del','button','删除','/admin/groupType/{*}','8',NULL,NULL,'DELETE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(41,'gateLogManager:view','button','查看','/admin/gateLog','27',NULL,NULL,'GET','','2017-07-01 00:00:00','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(42,'serviceManager:view','URI','查看','/auth/service/{*}','30',NULL,NULL,'GET',NULL,'2017-12-26 20:17:42','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(43,'serviceManager:btn_add','button','新增','/auth/service','30',NULL,NULL,'POST',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(44,'serviceManager:btn_edit','button','编辑','/auth/service/{*}','30',NULL,NULL,'PUT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(45,'serviceManager:btn_del','button','删除','/auth/service/{*}','30',NULL,NULL,'DELETE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(46,'serviceManager:btn_clientManager','button','服务授权','/auth/service/{*}/client','30',NULL,NULL,'POST',NULL,'2017-12-30 16:32:48','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(47,'onlineManager:btn_forceLogout','button','强退','/auth/online/{*}','39',NULL,NULL,'DELETE',NULL,'2020-08-16 03:37:02','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group (id,code,name,parent_id,`path`,`type`,group_type,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'adminRole','管理员',-1,'/adminRole',NULL,1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(3,'testGroup','体验组',-1,'/testGroup',NULL,1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(4,'visitorRole','游客',3,'/testGroup/visitorRole',NULL,1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(6,'company','中华大集团',-1,'/company',NULL,2,'',NULL,NULL,NULL,NULL,'2020-07-26 07:58:58','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(7,'financeDepart','财务部',6,'/company/financeDepart',NULL,2,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(8,'hrDepart','人力资源部',6,'/company/hrDepart',NULL,2,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(9,'blogAdmin','博客管理员',-1,'/blogAdmin',NULL,1,'','2017-07-16 16:59:30','1','Mr.AG','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group_leader (id,group_id,user_id,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(6,'9','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(13,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group_member (id,group_id,user_id,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(9,'9','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(10,'1','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(12,'4','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group_type (id,code,name,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'role','角色类型','role',NULL,NULL,NULL,NULL,'2017-08-25 17:52:37','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(2,'depart','部门类型',NULL,NULL,NULL,NULL,NULL,'2017-08-25 17:52:43','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(3,'free','自定义类型','sadf',NULL,NULL,NULL,NULL,'2017-08-26 08:22:25','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_menu (id,code,title,parent_id,href,icon,`type`,order_num,description,`path`,enabled,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'userManager','用户管理',5,'/admin/user','user','menu',0,'','/adminSys/baseManager/userManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 10:40:37','1','admin','0:0:0:0:0:0:0:1','pages/admin/user/index','{"title": "角色管理","cache": true}','userManager',NULL,NULL,NULL,NULL,NULL)
,(5,'baseManager','基础配置管理',13,'/admin','list','dirt',0,'','/adminSys/baseManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:18:35','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(6,'menuManager','菜单管理',5,'/admin/menu','list-ul','menu',0,'','/adminSys/baseManager/menuManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:21:57','1','admin','0:0:0:0:0:0:0:1','pages/admin/menu/index','{"title": "角色管理","cache": true}','menuManager',NULL,NULL,NULL,NULL,NULL)
,(7,'groupManager','角色权限管理',5,'/admin/group','address-card','menu',0,'','/adminSys/baseManager/groupManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:50:32','1','admin','0:0:0:0:0:0:0:1','pages/admin/group/index','{"title": "角色管理","cache": true}','groupManager',NULL,NULL,NULL,NULL,NULL)
,(8,'groupTypeManager','角色类型管理',5,'/admin/groupType','user-secret','menu',0,'','/adminSys/baseManager/groupTypeManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:51:00','1','admin','0:0:0:0:0:0:0:1','pages/admin/groupType/index','{"title": "角色管理","cache": true}','groupTypeManager',NULL,NULL,NULL,NULL,NULL)
,(13,'adminSys','权限管理系统',-1,'/admin','chrome','sys',0,'','/adminSys',NULL,NULL,NULL,NULL,NULL,'2020-07-18 10:42:08','1','admin','0:0:0:0:0:0:0:1','','{"title": "角色管理","cache": true}','',NULL,NULL,NULL,NULL,NULL)
,(27,'gateLogManager','操作日志',5,'/admin/gateLog','file-archive-o','menu',0,'','/adminSys/baseManager/gateLogManager',NULL,'2017-07-01 00:00:00','1','admin','0:0:0:0:0:0:0:1','2020-07-18 14:51:30','1','admin','0:0:0:0:0:0:0:1','pages/admin/gateLog/index','{"title": "角色管理","cache": true}','gateLogManager',NULL,NULL,NULL,NULL,NULL)
,(29,'authManager','服务权限管理',13,'/admin','server','dirt',0,'服务权限管理','/adminSys/authManager',NULL,'2017-12-26 19:54:45','1','Mr.AG','127.0.0.1','2020-07-18 14:51:52','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(30,'serviceManager','服务管理',29,'/admin/service','cubes','menu',0,'服务管理','/adminSys/authManager/serviceManager',NULL,'2017-12-26 19:56:06','1','Mr.AG','127.0.0.1','2020-07-18 14:52:31','1','admin','0:0:0:0:0:0:0:1','pages/auth/gateLog/index','{"title": "角色管理","cache": true}','serviceManager',NULL,NULL,NULL,NULL,NULL)
,(31,'monitorManager','监控模块管理',13,'/admin','shield','dirt',0,NULL,'/adminSys/monitorManager',NULL,'2018-02-25 09:36:35','1','Mr.AG','127.0.0.1','2020-07-18 14:54:19','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_menu (id,code,title,parent_id,href,icon,`type`,order_num,description,`path`,enabled,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(32,'serviceEurekaManager','服务注册中心',31,'http://localhost:8848/nacos','paw','menu',0,NULL,'/adminSys/monitorManager/serviceEurekaManager',NULL,'2018-02-25 09:37:04','1','Mr.AG','127.0.0.1','2020-07-18 14:54:50','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(33,'serviceMonitorManager','服务状态监控',31,'http://localhost:8764','heartbeat','menu',0,NULL,'/adminSys/monitorManager/serviceEurekaManager',NULL,'2018-02-25 09:37:05','1','Mr.AG','127.0.0.1','2020-07-18 14:55:07','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(34,'serviceZipkinManager','服务链路监控',31,'','line-chart','menu',0,NULL,'/adminSys/monitorManager/serviceZipkinManager',NULL,'2018-02-25 09:38:05','1','Mr.AG','127.0.0.1','2020-07-18 14:55:37','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(35,'codeManager','开发管理系统',-1,'/dev','connectdevelop','sys',0,NULL,'/codeManager',NULL,'2020-07-21 14:35:29','1','admin','0:0:0:0:0:0:0:1','2020-07-21 15:00:23','1','admin','0:0:0:0:0:0:0:1',NULL,'{"title": "角色管理","cache": true}',NULL,NULL,NULL,NULL,NULL,NULL)
,(36,'devFormManager','表单设计器',37,'/dev/form','wpforms','menu',0,NULL,'/codeManager/devFormManager',NULL,'2020-07-21 14:59:25','1','admin','0:0:0:0:0:0:0:1','2020-07-21 15:00:49','1','admin','0:0:0:0:0:0:0:1','pages/dev/build/index','{"title": "角色管理","cache": true}','devFormManager',NULL,NULL,NULL,NULL,NULL)
,(37,'devBaseManager','开发基础配置',35,'/dev','code','dirt',0,NULL,'/codeManager/devBaseManager',NULL,'2020-07-21 15:07:15','1','admin','0:0:0:0:0:0:0:1','2020-07-21 15:07:15','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(38,'codeManager','代码生成器',37,'/dev/code','code-fork','menu',0,NULL,'/codeManager/devBaseManager/codeManager',NULL,'2020-07-25 06:56:19','1','admin','0:0:0:0:0:0:0:1','2020-07-25 06:56:19','1','admin','0:0:0:0:0:0:0:1','pages/dev/code/index','{"cache":"true"}','codeManager',NULL,NULL,NULL,NULL,NULL)
,(39,'onlineManager','在线用户',5,'/admin/online','user-secret','menu',0,NULL,'/adminSys/baseManager/onlineManager',NULL,'2020-08-01 10:10:21','1','admin','0:0:0:0:0:0:0:1','2020-08-01 10:10:35','1','admin','0:0:0:0:0:0:0:1','pages/admin/online/index','{"cache":true}','onlineManager',NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(287,'1','group','5','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(288,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(289,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(290,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(291,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(294,'1','group','5','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(295,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(296,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(297,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(298,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(299,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(300,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(301,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(302,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(303,'1','group','13','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(304,'1','group','14','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(305,'1','group','15','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(306,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(307,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(308,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(309,'1','group','13','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(310,'1','group','14','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(311,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(312,'1','group','15','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(313,'1','group','16','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(314,'1','group','17','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(315,'1','group','18','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(317,'1','group','20','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(318,'1','group','21','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(319,'1','group','22','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(349,'4','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(371,'1','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(372,'1','group','24','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(373,'1','group','27','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(374,'1','group','28','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(375,'1','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(378,'1','group','5','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(379,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(380,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(381,'1','group','14','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(382,'1','group','13','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(383,'1','group','15','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(384,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(385,'1','group','24','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(386,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(387,'1','group','27','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(388,'1','group','16','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(389,'1','group','18','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(390,'1','group','17','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(392,'1','group','20','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(393,'1','group','28','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(394,'1','group','22','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(395,'1','group','21','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(396,'4','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(397,'4','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(398,'4','group','27','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(399,'4','group','24','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(400,'4','group','28','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(401,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(402,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(403,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(421,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(422,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(423,'4','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(424,'4','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(436,'1','group','32','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(437,'1','group','33','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(438,'1','group','34','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(439,'1','group','35','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(440,'4','group','32','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(464,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(465,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(466,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(467,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(468,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(469,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(470,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(471,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(472,'1','group','40','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(492,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(493,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(494,'1','group','40','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(517,'4','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(518,'4','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(519,'4','group','40','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(611,'4','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(612,'4','group','36','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(666,'1','group','41','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(689,'1','group','43','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(691,'1','group','44','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(710,'9','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(711,'9','group','43','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(712,'9','group','44','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(713,'9','group','45','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(718,'9','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(719,'9','group','44','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(720,'9','group','45','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(721,'9','group','43','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(722,'1','group','41','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(749,'10','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(750,'10','group','14','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(751,'10','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(752,'10','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(753,'10','group','6','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(754,'10','group','17','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(755,'10','group','20','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(774,'1','group','3','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(775,'1','group','4','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(812,'1','group','19','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(924,'1','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(945,'1','group','45','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(956,'1','group','46','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(981,'9','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(982,'9','group','1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(983,'9','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(984,'9','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(985,'9','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(994,'4','group','41','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(995,'4','group','1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(996,'4','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(997,'4','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(998,'4','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(999,'4','group','27','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1000,'4','group','6','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1001,'4','group','7','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1002,'4','group','8','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1106,'1','group','47','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1107,'1','group','33','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1108,'1','group','34','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1109,'1','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1110,'1','group','35','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1111,'1','group','36','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1112,'1','group','37','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1113,'1','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1114,'1','group','27','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1115,'1','group','38','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1116,'1','group','39','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1117,'1','group','29','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1118,'1','group','1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1119,'1','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1120,'1','group','6','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1121,'1','group','7','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1122,'1','group','8','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1123,'1','group','30','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1124,'1','group','31','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1125,'1','group','32','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_user (id,username,password,name,birthday,address,mobile_phone,tel_phone,email,sex,`type`,status,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'admin','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','Mr.AG','',NULL,'',NULL,'','男',NULL,NULL,'',NULL,NULL,NULL,NULL,'2017-11-16 23:23:49','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(2,'test','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','测试账户','',NULL,'',NULL,'','男',NULL,NULL,'',NULL,NULL,NULL,NULL,'2017-07-15 19:18:07','1','管理员','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(4,'blog','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','Mr.AG(博主)','',NULL,'',NULL,'','男',NULL,NULL,'123
556',NULL,NULL,NULL,NULL,'2020-07-25 05:28:51','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO auth_client (id,code,secret,name,locked,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'ace-gate','123456','ace-gate','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(3,'ace-admin','123456','ace-admin','0','',NULL,NULL,NULL,NULL,'2017-07-06 21:42:17','1','管理员','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(6,'ace-auth','123456','ace-auth','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(11,'ace-config','fXHsssa2','ace-config','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(13,'ace-template','bZf8yvj8','ace-template','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(14,'ace-trace','wKTl6GGE','ace-trace','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(15,'ace-monitor','eEQBUcnW','ace-monitor','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(16,'ace-gateway','PHK3CLfo','ace-gateway','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(17,'ace-sample','123456','ace-sample','0','ace-sample','2020-09-05 03:33:35','1','admin','0:0:0:0:0:0:0:1','2020-09-05 03:33:35','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO auth_client_service (id,service_id,client_id,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(21,'4','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(23,'3','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(41,'3','1',NULL,'2017-12-31 08:58:03','null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(42,'6','1',NULL,'2017-12-31 08:58:03','null','null','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(3,'userManager:btn_add','button','新增','/admin/user','1',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(4,'userManager:btn_edit','button','编辑','/admin/user/{*}','1',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(5,'userManager:btn_del','button','删除','/admin/user/{*}','1',NULL,NULL,'DELETE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(9,'menuManager:element','uri','按钮页面','/admin/element','6',NULL,NULL,'GET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(10,'menuManager:btn_add','button','新增','/admin/menu/{*}','6',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(11,'menuManager:btn_edit','button','编辑','/admin/menu/{*}','6','','','PUT','','2017-06-24 00:00:00','','','','','','','','','','','')
,(12,'menuManager:btn_del','button','删除','/admin/menu/{*}','6','','','DELETE','','2017-06-24 00:00:00','','','','','','','','','','','')
,(13,'menuManager:btn_element_add','button','新增元素','/admin/element','6',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(14,'menuManager:btn_element_edit','button','编辑元素','/admin/element/{*}','6',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(15,'menuManager:btn_element_del','button','删除元素','/admin/element/{*}','6',NULL,NULL,'DELETE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(16,'groupManager:btn_add','button','新增','/admin/group','7',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(17,'groupManager:btn_edit','button','编辑','/admin/group/{*}','7',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(18,'groupManager:btn_del','button','删除','/admin/group/{*}','7',NULL,NULL,'DELETE','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(19,'groupManager:btn_userManager','button','分配用户','/admin/group/{*}/user','7',NULL,NULL,'PUT','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(20,'groupManager:btn_resourceManager','button','分配权限','/admin/group/{*}/authority','7',NULL,NULL,'GET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(21,'groupManager:menu','uri','分配菜单','/admin/group/{*}/authority/menu','7',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(22,'groupManager:element','uri','分配资源','/admin/group/{*}/authority/element','7',NULL,NULL,'POST','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(23,'userManager:view','uri','查看','/admin/user/{*}','1','','','GET','','2017-06-26 00:00:00','','','','','','','','','','','')
,(24,'menuManager:view','uri','查看','/admin/menu/{*}','6','','','GET','','2017-06-26 00:00:00','','','','','','','','','','','')
,(27,'menuManager:element_view','uri','查看','/admin/element/{*}','6',NULL,NULL,'GET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(28,'groupManager:view','uri','查看','/admin/group/{*}','7',NULL,NULL,'GET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(32,'groupTypeManager:view','uri','查看','/admin/groupType/{*}','8',NULL,NULL,'GET','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(33,'groupTypeManager:btn_add','button','新增','/admin/groupType','8',NULL,NULL,'POST',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(34,'groupTypeManager:btn_edit','button','编辑','/admin/groupType/{*}','8',NULL,NULL,'PUT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(35,'groupTypeManager:btn_del','button','删除','/admin/groupType/{*}','8',NULL,NULL,'DELETE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(41,'gateLogManager:view','button','查看','/admin/gateLog','27',NULL,NULL,'GET','','2017-07-01 00:00:00','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(42,'serviceManager:view','URI','查看','/auth/service/{*}','30',NULL,NULL,'GET',NULL,'2017-12-26 20:17:42','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(43,'serviceManager:btn_add','button','新增','/auth/service','30',NULL,NULL,'POST',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(44,'serviceManager:btn_edit','button','编辑','/auth/service/{*}','30',NULL,NULL,'PUT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(45,'serviceManager:btn_del','button','删除','/auth/service/{*}','30',NULL,NULL,'DELETE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_element (id,code,`type`,name,uri,menu_id,parent_id,`path`,`method`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(46,'serviceManager:btn_clientManager','button','服务授权','/auth/service/{*}/client','30',NULL,NULL,'POST',NULL,'2017-12-30 16:32:48','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(47,'onlineManager:btn_forceLogout','button','强退','/auth/online/{*}','39',NULL,NULL,'DELETE',NULL,'2020-08-16 03:37:02','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group (id,code,name,parent_id,`path`,`type`,group_type,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'adminRole','管理员',-1,'/adminRole',NULL,1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(3,'testGroup','体验组',-1,'/testGroup',NULL,1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(4,'visitorRole','游客',3,'/testGroup/visitorRole',NULL,1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(6,'company','中华大集团',-1,'/company',NULL,2,'',NULL,NULL,NULL,NULL,'2020-07-26 07:58:58','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(7,'financeDepart','财务部',6,'/company/financeDepart',NULL,2,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(8,'hrDepart','人力资源部',6,'/company/hrDepart',NULL,2,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(9,'blogAdmin','博客管理员',-1,'/blogAdmin',NULL,1,'','2017-07-16 16:59:30','1','Mr.AG','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group_leader (id,group_id,user_id,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(6,'9','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(13,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group_member (id,group_id,user_id,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(9,'9','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(10,'1','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(12,'4','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_group_type (id,code,name,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'role','角色类型','role',NULL,NULL,NULL,NULL,'2017-08-25 17:52:37','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(2,'depart','部门类型',NULL,NULL,NULL,NULL,NULL,'2017-08-25 17:52:43','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(3,'free','自定义类型','sadf',NULL,NULL,NULL,NULL,'2017-08-26 08:22:25','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_menu (id,code,title,parent_id,href,icon,`type`,order_num,description,`path`,enabled,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'userManager','用户管理',5,'/admin/user','user','menu',0,'','/adminSys/baseManager/userManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 10:40:37','1','admin','0:0:0:0:0:0:0:1','pages/admin/user/index','{"title": "角色管理","cache": true}','userManager',NULL,NULL,NULL,NULL,NULL)
,(5,'baseManager','基础配置管理',13,'/admin','list','dirt',0,'','/adminSys/baseManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:18:35','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(6,'menuManager','菜单管理',5,'/admin/menu','list-ul','menu',0,'','/adminSys/baseManager/menuManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:21:57','1','admin','0:0:0:0:0:0:0:1','pages/admin/menu/index','{"title": "角色管理","cache": true}','menuManager',NULL,NULL,NULL,NULL,NULL)
,(7,'groupManager','角色权限管理',5,'/admin/group','address-card','menu',0,'','/adminSys/baseManager/groupManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:50:32','1','admin','0:0:0:0:0:0:0:1','pages/admin/group/index','{"title": "角色管理","cache": true}','groupManager',NULL,NULL,NULL,NULL,NULL)
,(8,'groupTypeManager','角色类型管理',5,'/admin/groupType','user-secret','menu',0,'','/adminSys/baseManager/groupTypeManager',NULL,NULL,NULL,NULL,NULL,'2020-07-18 14:51:00','1','admin','0:0:0:0:0:0:0:1','pages/admin/groupType/index','{"title": "角色管理","cache": true}','groupTypeManager',NULL,NULL,NULL,NULL,NULL)
,(13,'adminSys','权限管理系统',-1,'/admin','chrome','sys',0,'','/adminSys',NULL,NULL,NULL,NULL,NULL,'2020-07-18 10:42:08','1','admin','0:0:0:0:0:0:0:1','','{"title": "角色管理","cache": true}','',NULL,NULL,NULL,NULL,NULL)
,(27,'gateLogManager','操作日志',5,'/admin/gateLog','file-archive-o','menu',0,'','/adminSys/baseManager/gateLogManager',NULL,'2017-07-01 00:00:00','1','admin','0:0:0:0:0:0:0:1','2020-07-18 14:51:30','1','admin','0:0:0:0:0:0:0:1','pages/admin/gateLog/index','{"title": "角色管理","cache": true}','gateLogManager',NULL,NULL,NULL,NULL,NULL)
,(29,'authManager','服务权限管理',13,'/admin','server','dirt',0,'服务权限管理','/adminSys/authManager',NULL,'2017-12-26 19:54:45','1','Mr.AG','127.0.0.1','2020-07-18 14:51:52','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(30,'serviceManager','服务管理',29,'/admin/service','cubes','menu',0,'服务管理','/adminSys/authManager/serviceManager',NULL,'2017-12-26 19:56:06','1','Mr.AG','127.0.0.1','2020-07-18 14:52:31','1','admin','0:0:0:0:0:0:0:1','pages/auth/gateLog/index','{"title": "角色管理","cache": true}','serviceManager',NULL,NULL,NULL,NULL,NULL)
,(31,'monitorManager','监控模块管理',13,'/admin','shield','dirt',0,NULL,'/adminSys/monitorManager',NULL,'2018-02-25 09:36:35','1','Mr.AG','127.0.0.1','2020-07-18 14:54:19','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_menu (id,code,title,parent_id,href,icon,`type`,order_num,description,`path`,enabled,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(32,'serviceEurekaManager','服务注册中心',31,'http://localhost:8848/nacos','paw','menu',0,NULL,'/adminSys/monitorManager/serviceEurekaManager',NULL,'2018-02-25 09:37:04','1','Mr.AG','127.0.0.1','2020-07-18 14:54:50','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(33,'serviceMonitorManager','服务状态监控',31,'http://localhost:8764','heartbeat','menu',0,NULL,'/adminSys/monitorManager/serviceEurekaManager',NULL,'2018-02-25 09:37:05','1','Mr.AG','127.0.0.1','2020-07-18 14:55:07','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(34,'serviceZipkinManager','服务链路监控',31,'http://localhost:8080','line-chart','menu',0,NULL,'/adminSys/monitorManager/serviceZipkinManager',NULL,'2018-02-25 09:38:05','1','Mr.AG','127.0.0.1','2020-08-23 07:45:03','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(35,'codeManager','开发管理系统',-1,'/dev','connectdevelop','sys',0,NULL,'/codeManager',NULL,'2020-07-21 14:35:29','1','admin','0:0:0:0:0:0:0:1','2020-07-21 15:00:23','1','admin','0:0:0:0:0:0:0:1',NULL,'{"title": "角色管理","cache": true}',NULL,NULL,NULL,NULL,NULL,NULL)
,(36,'devFormManager','表单设计器',37,'/dev/form','wpforms','menu',0,NULL,'/codeManager/devFormManager',NULL,'2020-07-21 14:59:25','1','admin','0:0:0:0:0:0:0:1','2020-07-21 15:00:49','1','admin','0:0:0:0:0:0:0:1','pages/dev/build/index','{"title": "角色管理","cache": true}','devFormManager',NULL,NULL,NULL,NULL,NULL)
,(37,'devBaseManager','开发基础配置',35,'/dev','code','dirt',0,NULL,'/codeManager/devBaseManager',NULL,'2020-07-21 15:07:15','1','admin','0:0:0:0:0:0:0:1','2020-07-21 15:07:15','1','admin','0:0:0:0:0:0:0:1','layout/header-aside/layout','{"title": "角色管理","cache": true}','layoutHeaderAside',NULL,NULL,NULL,NULL,NULL)
,(38,'codeManager','代码生成器',37,'/dev/code','code-fork','menu',0,NULL,'/codeManager/devBaseManager/codeManager',NULL,'2020-07-25 06:56:19','1','admin','0:0:0:0:0:0:0:1','2020-07-25 06:56:19','1','admin','0:0:0:0:0:0:0:1','pages/dev/code/index','{"cache":"true"}','codeManager',NULL,NULL,NULL,NULL,NULL)
,(39,'onlineManager','在线用户',5,'/admin/online','user-secret','menu',0,NULL,'/adminSys/baseManager/onlineManager',NULL,'2020-08-01 10:10:21','1','admin','0:0:0:0:0:0:0:1','2020-08-01 10:10:35','1','admin','0:0:0:0:0:0:0:1','pages/admin/online/index','{"cache":true}','onlineManager',NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(287,'1','group','5','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(288,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(289,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(290,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(291,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(294,'1','group','5','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(295,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(296,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(297,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(298,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(299,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(300,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(301,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(302,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(303,'1','group','13','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(304,'1','group','14','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(305,'1','group','15','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(306,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(307,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(308,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(309,'1','group','13','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(310,'1','group','14','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(311,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(312,'1','group','15','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(313,'1','group','16','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(314,'1','group','17','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(315,'1','group','18','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(317,'1','group','20','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(318,'1','group','21','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(319,'1','group','22','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(349,'4','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(371,'1','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(372,'1','group','24','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(373,'1','group','27','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(374,'1','group','28','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(375,'1','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(378,'1','group','5','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(379,'1','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(380,'1','group','11','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(381,'1','group','14','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(382,'1','group','13','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(383,'1','group','15','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(384,'1','group','12','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(385,'1','group','24','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(386,'1','group','10','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(387,'1','group','27','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(388,'1','group','16','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(389,'1','group','18','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(390,'1','group','17','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(392,'1','group','20','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(393,'1','group','28','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(394,'1','group','22','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(395,'1','group','21','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(396,'4','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(397,'4','group','9','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(398,'4','group','27','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(399,'4','group','24','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(400,'4','group','28','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(401,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(402,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(403,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(421,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(422,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(423,'4','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(424,'4','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(436,'1','group','32','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(437,'1','group','33','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(438,'1','group','34','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(439,'1','group','35','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(440,'4','group','32','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(464,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(465,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(466,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(467,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(468,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(469,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(470,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(471,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(472,'1','group','40','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(492,'1','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(493,'1','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(494,'1','group','40','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(517,'4','group','30','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(518,'4','group','31','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(519,'4','group','40','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(611,'4','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(612,'4','group','36','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(666,'1','group','41','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(689,'1','group','43','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(691,'1','group','44','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(710,'9','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(711,'9','group','43','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(712,'9','group','44','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(713,'9','group','45','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(718,'9','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(719,'9','group','44','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(720,'9','group','45','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(721,'9','group','43','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(722,'1','group','41','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(749,'10','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(750,'10','group','14','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(751,'10','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(752,'10','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(753,'10','group','6','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(754,'10','group','17','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(755,'10','group','20','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(774,'1','group','3','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(775,'1','group','4','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(812,'1','group','19','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(924,'1','group','42','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(945,'1','group','45','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(956,'1','group','46','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(981,'9','group','23','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(982,'9','group','1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(983,'9','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(984,'9','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(985,'9','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(994,'4','group','41','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(995,'4','group','1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(996,'4','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(997,'4','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(998,'4','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(999,'4','group','27','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1000,'4','group','6','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1001,'4','group','7','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1002,'4','group','8','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1106,'1','group','47','button','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1107,'1','group','33','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1108,'1','group','34','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1109,'1','group','13','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1110,'1','group','35','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1111,'1','group','36','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1112,'1','group','37','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1113,'1','group','-1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1114,'1','group','27','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1115,'1','group','38','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1116,'1','group','39','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1117,'1','group','29','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1118,'1','group','1','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1119,'1','group','5','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;
INSERT INTO base_resource_authority (id,authority_id,authority_type,resource_id,resource_type,parent_id,`path`,description,crt_time,crt_user,crt_name,crt_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1120,'1','group','6','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1121,'1','group','7','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1122,'1','group','8','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1123,'1','group','30','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1124,'1','group','31','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(1125,'1','group','32','menu','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO base_user (id,username,password,name,birthday,address,mobile_phone,tel_phone,email,sex,`type`,status,description,crt_time,crt_user,crt_name,crt_host,upd_time,upd_user,upd_name,upd_host,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8) VALUES
(1,'admin','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','Mr.AG','',NULL,'',NULL,'','男',NULL,NULL,'',NULL,NULL,NULL,NULL,'2017-11-16 23:23:49','1','Mr.AG','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(2,'test','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','测试账户','',NULL,'',NULL,'','男',NULL,NULL,'',NULL,NULL,NULL,NULL,'2017-07-15 19:18:07','1','管理员','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
,(4,'blog','jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=','Mr.AG(博主)','',NULL,'',NULL,'','男',NULL,NULL,'123
456
789',NULL,NULL,NULL,NULL,'2020-08-23 08:28:41','1','admin','0:0:0:0:0:0:0:1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;INSERT INTO gate_log (id,menu,opt,uri,crt_time,crt_user,crt_name,crt_host,body) VALUES
(1,'用户管理','编辑','/admin/user/{*}','2020-08-23 08:20:24','1','Mr.AG','/0:0:0:0:0:0:0:1:58035','{"id":4,"username":"blog","name":"Mr.AG(博主)","birthday":"","mobilePhone":"","email":"","sex":"男","description":"123\\n456","updTime":"2020-08-23 16:17:13","updUser":"1","updName":"admin","updHost":"0:0:0:0:0:0:0:1"}')
,(2,'用户管理','编辑','/admin/user/{*}','2020-08-23 08:28:41','1','Mr.AG','/0:0:0:0:0:0:0:1:60395','{"id":4,"username":"blog","name":"Mr.AG(博主)","birthday":"","mobilePhone":"","email":"","sex":"男","description":"123\\n456\\n789","updTime":"2020-08-23 16:20:24","updUser":"1","updName":"admin","updHost":"0:0:0:0:0:0:0:1"}')
,(3,'服务管理','新增','/auth/service','2020-09-05 03:33:35','1','Mr.AG','/0:0:0:0:0:0:0:1:54224','{"name":"ace-sample","sex":"男","description":"ace-sample","code":"ace-sample","secret":"123456"}')
;
COMMIT;


SET FOREIGN_KEY_CHECKS = 1;
