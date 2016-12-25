
-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(36) NOT NULL COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` integer NOT NULL COMMENT '排序（升序）',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `valid` tinyint NOT NULL DEFAULT 1 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_type` (`type`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

INSERT INTO `sys_dict` VALUES ('028a8b1f6c674a0bb92605e8888c56ec', '正常', '1', 'valid', '状态值', '10', '2016-11-14 15:58:33', '2016-11-14 15:58:33', '', '1');
INSERT INTO `sys_dict` VALUES ('873bb7bed6dc43d8ba8ed0053301ce9c', '禁用', '2', 'valid', '状态值', '20', '2016-11-14 15:59:00', '2016-11-14 15:59:00', '', '1');
INSERT INTO `sys_dict` VALUES ('13417212df624f12aa4dfa282ef68080', '精确匹配', '1', 'rule_type', '匹配策略', '10', '2016-11-14 23:21:02', '2016-11-14 23:21:02', '', '1');
INSERT INTO `sys_dict` VALUES ('f915d2baa9c142f897e808223b399dd3', '正则匹配', '2', 'rule_type', '匹配策略', '20', '2016-11-14 23:21:14', '2016-11-14 23:21:14', '', '1');
INSERT INTO `sys_dict` VALUES ('e27f07b79cac46f681be800d1f9170ec', '普通用户', '1', 'user_type', '用户类型', '10', '2016-11-14 16:02:50', '2016-11-14 16:02:50', '', '1');
INSERT INTO `sys_dict` VALUES ('0c249442dd8e451f8543cca9710d860d', '管理员', '2', 'user_type', '用户类型', '20', '2016-11-14 16:03:03', '2016-11-14 16:03:03', '', '1');
INSERT INTO `sys_dict` VALUES ('028a8b1f6c674a0bb92605e8888c569c', '是', '1', 'yes_no', '', '10', '2016-11-14 15:58:33', '2016-11-14 15:58:33', '', '1');
INSERT INTO `sys_dict` VALUES ('873bb7bed6dc43d8ba8ed0053301ceec', '否', '0', 'yes_no', '', '20', '2016-11-14 15:59:00', '2016-11-14 15:59:00', '', '1');