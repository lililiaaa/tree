/*
Navicat MySQL Data Transfer

Source Server         : cccc
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : tree

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-06-10 02:00:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车的',
  `car_name` varchar(16) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `price` int(8) NOT NULL DEFAULT '0' COMMENT '价格',
  `img_inside` varchar(255) NOT NULL COMMENT '车内图',
  `img_outside` varchar(255) NOT NULL COMMENT '车外图',
  `kinds` varchar(255) NOT NULL COMMENT '类型',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `friend`
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `friend_id` int(11) NOT NULL,
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT '用户自己的OpenID ',
  `f_u_id` varchar(255) NOT NULL DEFAULT '' COMMENT '朋友的OpenID ',
  PRIMARY KEY (`friend_id`,`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------

-- ----------------------------
-- Table structure for `f_share`
-- ----------------------------
DROP TABLE IF EXISTS `f_share`;
CREATE TABLE `f_share` (
  `f_share_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'uid',
  `f_share_title` varchar(255) DEFAULT NULL COMMENT '分享标题',
  `f_share_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `img` varchar(255) DEFAULT NULL COMMENT '配图',
  PRIMARY KEY (`f_share_id`,`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_share
-- ----------------------------

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL COMMENT '树屋介绍',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `img_inside` varchar(255) NOT NULL COMMENT '内图',
  `img_outside` varchar(255) NOT NULL COMMENT '外图',
  `kind` varchar(255) NOT NULL COMMENT '屋子分类',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------

-- ----------------------------
-- Table structure for `mind_fruit`
-- ----------------------------
DROP TABLE IF EXISTS `mind_fruit`;
CREATE TABLE `mind_fruit` (
  `fruit_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'OpenID ',
  `chance` varchar(5) NOT NULL DEFAULT '5' COMMENT '剩余机会 ',
  `content` varchar(255) NOT NULL COMMENT '状态',
  PRIMARY KEY (`fruit_id`,`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mind_fruit
-- ----------------------------

-- ----------------------------
-- Table structure for `quiz`
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识问答题目ID',
  `quiz_content` varchar(255) NOT NULL COMMENT '知识问答内容',
  `right` varchar(255) NOT NULL COMMENT '正确答案',
  `wrong_1` varchar(255) NOT NULL COMMENT '错误答案1',
  `wrong_2` varchar(255) NOT NULL COMMENT '错误答案2',
  `wrong_3` varchar(255) NOT NULL COMMENT '错误答案3',
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quiz
-- ----------------------------
INSERT INTO `quiz` VALUES ('1', 'Vocabulary', '词汇', 'a', 'b', 'c');

-- ----------------------------
-- Table structure for `share_competition`
-- ----------------------------
DROP TABLE IF EXISTS `share_competition`;
CREATE TABLE `share_competition` (
  `competition_id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_title` char(16) NOT NULL COMMENT '比赛标题',
  `competition_content` char(255) NOT NULL COMMENT '比赛内容',
  `img` varchar(255) NOT NULL COMMENT '比赛宣传图',
  `competition_fee` int(11) NOT NULL DEFAULT '0' COMMENT '报名费 ',
  `award` int(11) DEFAULT '0' COMMENT '奖励',
  PRIMARY KEY (`competition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share_competition
-- ----------------------------

-- ----------------------------
-- Table structure for `sprite`
-- ----------------------------
DROP TABLE IF EXISTS `sprite`;
CREATE TABLE `sprite` (
  `sprite_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '精灵ID',
  `sprite_name` varchar(255) DEFAULT NULL COMMENT '精灵的名字',
  `sex` varchar(8) NOT NULL DEFAULT 'man' COMMENT '性别 man/woman',
  `levels` int(255) NOT NULL DEFAULT '0' COMMENT '等级',
  `price` varchar(255) NOT NULL DEFAULT '0' COMMENT '精灵价格',
  `intro` varchar(255) NOT NULL COMMENT '精灵介绍',
  `img_child` varchar(255) NOT NULL COMMENT '精灵图片（幼年）',
  `img_young` varchar(255) NOT NULL COMMENT '精灵图片（青年）',
  `img_old` varchar(255) NOT NULL COMMENT '精灵图片(老年)',
  `img` varchar(255) NOT NULL COMMENT '商店展示图',
  `dialog` varchar(255) NOT NULL DEFAULT '很高兴见到你！' COMMENT '对话',
  `kinds` varchar(255) NOT NULL COMMENT '精灵种类',
  PRIMARY KEY (`sprite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sprite
-- ----------------------------

-- ----------------------------
-- Table structure for `sprite_dialog`
-- ----------------------------
DROP TABLE IF EXISTS `sprite_dialog`;
CREATE TABLE `sprite_dialog` (
  `dialog_id` varchar(255) NOT NULL COMMENT '用户id',
  `sprite_id` int(11) NOT NULL COMMENT '精灵ID',
  `dialog_content` int(11) NOT NULL COMMENT '对话',
  PRIMARY KEY (`dialog_id`,`sprite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sprite_dialog
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `open_id` varchar(255) NOT NULL COMMENT 'OpenID ',
  `name` varchar(255) NOT NULL DEFAULT '用户' COMMENT '用户名',
  `sex` varchar(8) NOT NULL DEFAULT 'man' COMMENT 'man/woman 性别',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `avatarUrl` varchar(255) NOT NULL COMMENT '头像',
  `mark` int(11) NOT NULL DEFAULT '0' COMMENT '签到情况',
  `desire` varchar(255) DEFAULT NULL COMMENT '愿望',
  `leaves` int(255) NOT NULL DEFAULT '0' COMMENT '金叶子数',
  `words` int(255) NOT NULL DEFAULT '0' COMMENT '单词积累数',
  `quizzes` int(255) NOT NULL DEFAULT '0' COMMENT '知识问答正确题数',
  `steps` int(255) DEFAULT NULL COMMENT '运动步数',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '', '用户', 'man', null, '', '0', null, '20', '0', '0', '1234');
INSERT INTO `user` VALUES ('2', '', '用户', 'man', null, '', '0', null, '0', '0', '0', null);
INSERT INTO `user` VALUES ('3', '', '用户', 'man', null, '', '0', null, '0', '0', '0', null);
INSERT INTO `user` VALUES ('4', '', '用户', 'man', null, '', '0', null, '0', '0', '0', null);
INSERT INTO `user` VALUES ('5', '', '用户', 'man', null, '', '0', null, '0', '0', '0', null);
INSERT INTO `user` VALUES ('6', '', '用户', 'man', null, '', '0', null, '20', '0', '0', null);
INSERT INTO `user` VALUES ('7', '', '用户', 'man', null, '', '0', null, '5', '0', '0', null);

-- ----------------------------
-- Table structure for `user_car`
-- ----------------------------
DROP TABLE IF EXISTS `user_car`;
CREATE TABLE `user_car` (
  `u_id` varchar(255) NOT NULL COMMENT '用户的openid',
  `car_id` int(11) NOT NULL COMMENT '车的id',
  PRIMARY KEY (`u_id`,`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_car
-- ----------------------------

-- ----------------------------
-- Table structure for `user_competition`
-- ----------------------------
DROP TABLE IF EXISTS `user_competition`;
CREATE TABLE `user_competition` (
  `u_id` varchar(255) NOT NULL DEFAULT '' COMMENT '参与比赛的用户的u_id',
  `competition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户参与的比赛',
  PRIMARY KEY (`competition_id`,`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_competition
-- ----------------------------

-- ----------------------------
-- Table structure for `user_house`
-- ----------------------------
DROP TABLE IF EXISTS `user_house`;
CREATE TABLE `user_house` (
  `u_id` varchar(255) NOT NULL COMMENT '用户的u_id',
  `house_id` int(11) NOT NULL COMMENT '屋子id',
  `use_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`,`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_house
-- ----------------------------

-- ----------------------------
-- Table structure for `user_sprite`
-- ----------------------------
DROP TABLE IF EXISTS `user_sprite`;
CREATE TABLE `user_sprite` (
  `u_id` varchar(255) NOT NULL COMMENT '用户u_id',
  `sprite_id` int(11) NOT NULL COMMENT '使用中的精灵ID',
  `use_status` varchar(255) NOT NULL DEFAULT 'false' COMMENT '是否使用',
  `status` varchar(255) NOT NULL DEFAULT 'child' COMMENT '成长阶段',
  `percent` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`,`sprite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_sprite
-- ----------------------------
INSERT INTO `user_sprite` VALUES ('1', '1', 'false', 'child ', '20');

-- ----------------------------
-- Table structure for `word`
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词ID',
  `word_content` varchar(255) NOT NULL COMMENT '单词内容',
  `right` varchar(255) NOT NULL COMMENT '正确答案',
  `wrong_1` varchar(255) NOT NULL COMMENT '错误答案1',
  `wrong_2` varchar(255) NOT NULL COMMENT '错误答案2',
  `wrong_3` varchar(255) NOT NULL COMMENT '错误答案3',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES ('1', 'Vocabulary', '词汇', 'a', 'b', 'c');

-- ----------------------------
-- Table structure for `wrong`
-- ----------------------------
DROP TABLE IF EXISTS `wrong`;
CREATE TABLE `wrong` (
  `wrong_id` int(11) NOT NULL AUTO_INCREMENT,
  `word_id` int(11) NOT NULL COMMENT '题id',
  `open_id` varchar(255) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`wrong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wrong
-- ----------------------------
