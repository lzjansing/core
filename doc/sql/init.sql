CREATE DATABASE `image`;

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `user_type` tinyint DEFAULT NULL COMMENT '用户类型\n普通用户	1\n管理员	2',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `focus` int DEFAULT NULL,
  `valid` tinyint DEFAULT NULL COMMENT '无效	0\n有效	1\n禁用	2',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `share` (
  `id` varchar(36) NOT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `content` text,
  `image` varchar(400) DEFAULT NULL,
  `privated` tinyint DEFAULT NULL,
  `permission` tinyint DEFAULT NULL COMMENT '点赞	001\n收藏	010\n评论	100',
  `praise` int DEFAULT NULL,
  `collect` int DEFAULT NULL,
  `comment` int DEFAULT NULL,
  `valid` tinyint DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rule` (
  `id` varchar(36) NOT NULL,
  `type` tinyint DEFAULT NULL COMMENT '过滤策略\n精确匹配	1\n正则匹配	2\n',
  `keyword` varchar(100) DEFAULT NULL,
  `valid` tinyint DEFAULT NULL COMMENT '无效	0\n有效	1\n禁用	2' ,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `praise` (
  `id` varchar(36) NOT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `sid` varchar(36) DEFAULT NULL,
  `is_new` tinyint DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `focus` (
  `id` varchar(36) NOT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `is_new` tinyint DEFAULT NULL,
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
  `is_new` tinyint DEFAULT NULL,
  `valid` tinyint DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `collect` (
  `id` varchar(36) NOT NULL,
  `from_uid` varchar(36) DEFAULT NULL,
  `to_uid` varchar(36) DEFAULT NULL,
  `sid` varchar(36) DEFAULT NULL,
  `is_new` tinyint DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
