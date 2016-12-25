DROP TRIGGER IF EXISTS trigger_on_insert_account;
DROP TABLE IF EXISTS t_account;
CREATE TABLE t_account (
  id          VARCHAR(50)  NOT NULL PRIMARY KEY, -- 主键，与t_user.id必然保持一致
  email       VARCHAR(255) NOT NULL             DEFAULT '', -- 邮箱
  password    VARCHAR(255) NOT NULL             DEFAULT '', -- 密码
  create_date DATETIME     NOT NULL             DEFAULT now(), -- 创建日期
  locked      TINYINT(1)   NOT NULL             DEFAULT 0, -- 是否是被锁定、被封账号
  valid       TINYINT(1)   NOT NULL             DEFAULT 1 -- 是否有效
);
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
);

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