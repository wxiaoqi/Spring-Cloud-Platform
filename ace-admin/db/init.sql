CREATE SCHEMA `ag_admin` DEFAULT CHARACTER SET utf8 ;

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

CREATE TABLE `base_menu` (
`id`  int NOT NULL AUTO_INCREMENT ,
`code`  varchar(255) NULL ,
`title`  varchar(255) NULL ,
`parent_id`  int NOT NULL ,
`href`  varchar(255) NULL ,
`icon`  varchar(255) NULL,
`type`  char(1) NULL ,
`order_num`  int NOT NULL ,
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
CREATE TABLE `base_group` (
`id`  int NOT NULL AUTO_INCREMENT ,
`code`  varchar(255) NULL ,
`title`  varchar(255) NULL ,
`parent_id`  int NOT NULL ,
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
CREATE TABLE `base_group_type` (
`id`  int NOT NULL AUTO_INCREMENT ,
`code`  varchar(255) NULL ,
`title`  varchar(255) NULL ,
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
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (1,'userManager','用户管理',5,'user','fa-user',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/baseManager/userManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (5,'baseManager','基础配置管理',13,'','fa fa-cog fa-spin',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/baseManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (6,'menuManager','菜单管理',5,'menu','fa-list',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/baseManager/menuManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (7,'groupManager','用户组管理',5,'','fa-users',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/baseManager/groupManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (8,'dictManager','数据字典',5,'','fa-book',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/baseManager/dictManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (9,'monitorManager','系统监控',13,'','fa-area-chart',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/monitorManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (10,'bootMonitor','Spring-Boot监控',9,'http://localhost:8764','fa-line-chart',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/monitorManager/bootMonitor');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (11,'hystrixMonitor','Hystrix监控',9,'http://localhost:8764/hystrix','fa-bar-chart',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys/monitorManager/hystrixMonitor');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (13,'adminSys','权限管理系统',-1,'','fa-terminal',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/adminSys');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (14,'contentSys','内容管理系统',-1,'','fa-newspaper-o',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/contentSys');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (17,'articleManger','文章管理',20,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/contentSys/artComManger/articleManger');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (18,'commentManager','评论管理',20,'','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/contentSys/artComManger/commentManager');
INSERT INTO `base_menu` (`id`,`code`,`title`,`parent_id`,`href`,`icon`,`type`,`description`,`crt_time`,`crt_user`,`crt_name`,`crt_host`,`upd_time`,`upd_user`,`upd_name`,`upd_host`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`path`) VALUES (20,'artComManger','文章评论管理',14,'','fa-bookmark',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/contentSys/artComManger');
