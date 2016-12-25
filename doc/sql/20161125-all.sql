CREATE DATABASE `image`;

USE `image`;

CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL,
  `user_type` tinyint(4) DEFAULT NULL COMMENT '用户类型\n普通用户	1\n管理员	2',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `focus` int(11) DEFAULT NULL,
  `valid` tinyint(4) DEFAULT NULL COMMENT '无效	0\n有效	1',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `useable` tinyint(4) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(36) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(36) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `pid` varchar(36) NOT NULL COMMENT '父级编号',
  `pids` varchar(200) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` tinyint(4) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(36) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(36) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单权限';

CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) NOT NULL COMMENT '用户编号',
  `role_id` varchar(36) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

CREATE TABLE `sys_dict` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `valid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_type` (`type`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

CREATE TABLE `rule` (
  `id` varchar(36) NOT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '过滤策略\n模糊匹配	1\n正则匹配	2\n',
  `keyword` varchar(100) DEFAULT NULL,
  `valid` tinyint(4) DEFAULT NULL COMMENT '无效	0\n有效	1\n禁用	2',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `share` (
  `id` varchar(36) NOT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `content` text,
  `image` varchar(400) DEFAULT NULL,
  `privated` tinyint(1) DEFAULT NULL,
  `permission` tinyint(2) DEFAULT NULL COMMENT '点赞	001\n收藏	010\n评论	100',
  `praise` int(11) DEFAULT NULL,
  `collect` int(11) DEFAULT NULL,
  `comment` int(11) DEFAULT NULL,
  `valid` tinyint(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `praise` (
  `id` varchar(36) NOT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `sid` varchar(36) DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `focus` (
  `id` varchar(36) NOT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `id` varchar(36) NOT NULL,
  `sid` varchar(36) DEFAULT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  `pids` varchar(740) DEFAULT NULL,
  `content` text,
  `is_new` tinyint(4) DEFAULT NULL,
  `valid` tinyint(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `collect` (
  `id` varchar(36) NOT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `sid` varchar(36) DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `sys_dict` VALUES ('028a8b1f6c674a0bb92605e8888c56ec', '正常', '1', 'valid', '状态值', '10', '2016-11-14 15:58:33', '2016-11-14 15:58:33', '', '1');
INSERT INTO `sys_dict` VALUES ('873bb7bed6dc43d8ba8ed0053301ce9c', '禁用', '2', 'valid', '状态值', '20', '2016-11-14 15:59:00', '2016-11-14 15:59:00', '', '1');
INSERT INTO `sys_dict` VALUES ('13417212df624f12aa4dfa282ef68080', '精确匹配', '1', 'rule_type', '匹配策略', '10', '2016-11-14 23:21:02', '2016-11-14 23:21:02', '', '1');
INSERT INTO `sys_dict` VALUES ('f915d2baa9c142f897e808223b399dd3', '正则匹配', '2', 'rule_type', '匹配策略', '20', '2016-11-14 23:21:14', '2016-11-14 23:21:14', '', '1');
INSERT INTO `sys_dict` VALUES ('e27f07b79cac46f681be800d1f9170ec', '普通用户', '1', 'user_type', '用户类型', '10', '2016-11-14 16:02:50', '2016-11-14 16:02:50', '', '1');
INSERT INTO `sys_dict` VALUES ('0c249442dd8e451f8543cca9710d860d', '管理员', '2', 'user_type', '用户类型', '20', '2016-11-14 16:03:03', '2016-11-14 16:03:03', '', '1');
INSERT INTO `sys_dict` VALUES ('028a8b1f6c674a0bb92605e8888c569c', '是', '1', 'yes_no', '', '10', '2016-11-14 15:58:33', '2016-11-14 15:58:33', '', '1');
INSERT INTO `sys_dict` VALUES ('873bb7bed6dc43d8ba8ed0053301ceec', '否', '0', 'yes_no', '', '20', '2016-11-14 15:59:00', '2016-11-14 15:59:00', '', '1');



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



INSERT INTO `image`.`user` (`id`, `user_type`, `username`, `password`, `focus`, `valid`, `create_date`) VALUES ('0c3cb1375be54ed28ee00fc9f66c35aa', '2', 'admin', '2a701fd20e75fa33d4605cfac2cd5171724a7f57fd6fb855d5c074cb', '0', '1', now());


DROP TRIGGER IF EXISTS trigger_on_insert_account;
DROP TABLE IF EXISTS t_account;
CREATE TABLE t_account (
  id          VARCHAR(50)  NOT NULL PRIMARY KEY, -- 主键，与t_user.id必然保持一致
  email       VARCHAR(255) NOT NULL             DEFAULT '', -- 邮箱
  password    VARCHAR(255) NOT NULL             DEFAULT '', -- 密码
  create_date DATETIME     NOT NULL             DEFAULT now(), -- 创建日期
  locked      TINYINT(1)   NOT NULL             DEFAULT 0, -- 是否是被锁定、被封账号
  valid       TINYINT(1)   NOT NULL             DEFAULT 1 -- 是否有效
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 创建组合索引[最左前缀]
CREATE INDEX idx_account_email_is_valid
  ON t_account (email, valid);
ALTER TABLE t_account
  ADD INDEX idx_account_id_is_valid(id, valid);
CREATE INDEX idx_account_id_is_unlock_and_valid
  ON t_account (id, locked, valid);
CREATE INDEX idx_account_email_is_unlock_and_valid
  ON t_account (email, locked, valid);

-- 用户表
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user (
  id           VARCHAR(50)  NOT NULL PRIMARY KEY, -- 主键，与t_account.id保持一致，一个账户必定对应一个用户，逻辑删除不影响这些主键
  nickname     VARCHAR(255) NOT NULL             DEFAULT '', -- 昵称
  real_name    VARCHAR(255) NOT NULL             DEFAULT '', -- 真实姓名
  gender       VARCHAR(10)  NOT NULL             DEFAULT '男', -- 性别
  blood_group  VARCHAR(10)  NOT NULL             DEFAULT 'B血型', -- 血型
  birthday     DATE         NOT NULL             DEFAULT '1990-10-01', -- 诞辰
  interests    VARCHAR(500) NOT NULL             DEFAULT '', -- 兴趣
  blog_address VARCHAR(255) NOT NULL             DEFAULT '', -- 博客地址
  qq           BIGINT, -- QQ，使用bigint只占用8个字节
  portrait_id  BIGINT       NOT NULL             DEFAULT 1 -- 头像图片主键
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE TRIGGER trigger_on_insert_account
AFTER
INSERT
  ON t_account
FOR EACH ROW
  BEGIN
    DECLARE user_id VARCHAR(50);
    DECLARE index_of_at INT;
    DECLARE email_name VARCHAR(255);
    SET user_id := new.id;
    SELECT locate('@', new.email)
    INTO index_of_at;
    SELECT left(new.email, index_of_at - 1)
    INTO email_name;
    INSERT INTO t_user (nickname, id) VALUES (email_name, user_id);
  END$$
DELIMITER ;