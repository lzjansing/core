---DDL
ALTER TABLE `image`.`user` CHANGE COLUMN `password` `password` VARCHAR(100) NULL DEFAULT NULL ;


---DML
INSERT INTO `image`.`user` (`id`, `user_type`, `username`, `password`, `focus`, `valid`, `create_date`) VALUES ('0c3cb1375be54ed28ee00fc9f66c35aa', '2', 'admin', '2a701fd20e75fa33d4605cfac2cd5171724a7f57fd6fb855d5c074cb', '0', '1', now());
