-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `pid` varchar(36) NOT NULL COMMENT '父级编号',
  `pids` varchar(200) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` integer NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` tinyint NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(36) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `valid` tinyint NOT NULL DEFAULT 1 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`pid`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `useable` tinyint DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(36) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(36) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `valid` tinyint NOT NULL DEFAULT 1 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(36) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单权限';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) NOT NULL COMMENT '用户编号',
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';


--- DML
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('5ef0c809c87f45d496ae6994dc6513e2','0','0,','功能菜单',0,'','','',1,'','1','2015-09-18 03:29:03','1','2015-09-18 03:29:06','',0);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('47989c10331c49ec8b859115f677043f','5ef0c809c87f45d496ae6994dc6513e2','0,5ef0c809c87f45d496ae6994dc6513e2,','通用功能',30,'','','fa-align-justify',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:21:29','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:21:29','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('ff2eb062a8454f25bad6d0d562ff612e','47989c10331c49ec8b859115f677043f','0,5ef0c809c87f45d496ae6994dc6513e2,47989c10331c49ec8b859115f677043f,','用户管理',30,'/sys/user/list','','fa-user',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:40:39','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:40:39','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('002c45061e9746f59b6eb63ee3203ac7','ff2eb062a8454f25bad6d0d562ff612e','0,5ef0c809c87f45d496ae6994dc6513e2,47989c10331c49ec8b859115f677043f,ff2eb062a8454f25bad6d0d562ff612e,','查看',30,'','','',0,'sys:user:view','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:43:13','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:43:13','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('002c45061e9746f59b6eb63ee3203ac8','ff2eb062a8454f25bad6d0d562ff612e','0,5ef0c809c87f45d496ae6994dc6513e2,47989c10331c49ec8b859115f677043f,ff2eb062a8454f25bad6d0d562ff612e,','修改',60,'','','',0,'sys:user:edit','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:44:15','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:44:15','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('7a37a1c256fa4d8e8b15ed7e6c06e7cb','47989c10331c49ec8b859115f677043f','0,5ef0c809c87f45d496ae6994dc6513e2,47989c10331c49ec8b859115f677043f,','过滤规则管理',60,'/rule/list','','fa-filter',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:41:23','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:41:23','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('3a653d23db014f2f9f8215b9fab09523','7a37a1c256fa4d8e8b15ed7e6c06e7cb','0,5ef0c809c87f45d496ae6994dc6513e2,47989c10331c49ec8b859115f677043f,7a37a1c256fa4d8e8b15ed7e6c06e7cb,','查看',30,'','','',0,'rule:view','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:43:49','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:43:49','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('da15c12e56004ec6a8fa9265e1d6eb47','7a37a1c256fa4d8e8b15ed7e6c06e7cb','0,5ef0c809c87f45d496ae6994dc6513e2,47989c10331c49ec8b859115f677043f,7a37a1c256fa4d8e8b15ed7e6c06e7cb,','修改',60,'','','',0,'rule:edit','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:44:15','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:44:15','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('f0d98eb49d79441baabcca4e22705272','5ef0c809c87f45d496ae6994dc6513e2','0,5ef0c809c87f45d496ae6994dc6513e2,','系统功能',40,'','','fa-cogs',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:28:26','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:28:26','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('347e603b3ea44ba8ad64aabd5ea5870b','f0d98eb49d79441baabcca4e22705272','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,','字典管理',30,'/sys/dict/list','','fa-book',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:47:11','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:47:11','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('c97ce01ec24b4e58be7193a8eecd6db1','f0d98eb49d79441baabcca4e22705272','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,','角色管理',60,'/sys/role/list','','fa-group',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:47:30','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:47:59','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('ac9d0d8e8baf4308b6fa50a1acc3e97a','f0d98eb49d79441baabcca4e22705272','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,','菜单管理',90,'/sys/menu/list','','fa-list-ul',1,'','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:49:19','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:51:51','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('25c31fecd56e4bf2b9d79a9cf220f0e1','c97ce01ec24b4e58be7193a8eecd6db1','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,c97ce01ec24b4e58be7193a8eecd6db1,','修改',30,'','','',0,'sys:role:edit','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:50:32','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:50:32','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('3f32e1b0c25647349a2d47413f093e5f','c97ce01ec24b4e58be7193a8eecd6db1','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,c97ce01ec24b4e58be7193a8eecd6db1,','查看',60,'','','',0,'sys:role:view','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:51:02','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:51:02','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('9501a6a21952458a8be0a45761ce8416','ac9d0d8e8baf4308b6fa50a1acc3e97a','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,ac9d0d8e8baf4308b6fa50a1acc3e97a,','查看',60,'','','',0,'sys:menu:view','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:51:24','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:51:24','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('aa5b90c7da8248c2b3239ac9255b9efa','ac9d0d8e8baf4308b6fa50a1acc3e97a','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,ac9d0d8e8baf4308b6fa50a1acc3e97a,','修改',30,'','','',0,'sys:menu:edit','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:50:45','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:50:45','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('ae7e759b7a0c4c35bf4f062c1282e084','347e603b3ea44ba8ad64aabd5ea5870b','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,347e603b3ea44ba8ad64aabd5ea5870b,','修改',60,'','','',0,'sys:dict:edit','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:50:14','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:50:14','',1);
INSERT INTO `sys_menu` (`id`,`pid`,`pids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`valid`) VALUES ('f364577cad4142488546f1fbcea3d733','347e603b3ea44ba8ad64aabd5ea5870b','0,5ef0c809c87f45d496ae6994dc6513e2,f0d98eb49d79441baabcca4e22705272,347e603b3ea44ba8ad64aabd5ea5870b,','查看',30,'','','',0,'sys:dict:view','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:49:51','0c3cb1375be54ed28ee00fc9f66c35aa','2016-11-18 21:49:51','',1);