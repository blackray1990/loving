/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : review

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-05 17:07:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` longtext,
  `marks` varchar(1024) DEFAULT NULL,
  `menuid` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '语法规范', '<b>测试数据嗖嗖嗖<i>xcvsdfs舒服-haha<br></i></b>', null, '6');
INSERT INTO `article` VALUES ('2', '测试页面', '先取个名字，等待完善', null, '11');
INSERT INTO `article` VALUES ('4', 'html基础知识', '<br><blockquote style=\'margin: 0 0 0 40px; border: none; padding: 0px;\'><div style=\'text-align: center;\'><b><br></b></div><div style=\'text-align: center;\'><b><a href=\'http://www.cnblogs.com\'>先取个名字，等待完善</a></b></div></blockquote>', null, '15');
INSERT INTO `article` VALUES ('5', '学习链接整理', '<div style=\'text-align: left;\'><br></div><div style=\'text-align: left;\'><u><a href=\'http://www.csdn.net\'>CSDN</a></u></div><div style=\'text-align: left;\'><br></div><div style=\'text-align: left;\'><a href=\'http://www.cnblogs.com\'>博客园</a></div><div style=\'text-align: left;\'><br></div><div style=\'text-align: left;\'><a href=\'http://www.hjenglish.com\'>沪江英语</a></div>', null, '17');

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `location` int(5) DEFAULT NULL,
  `isFolder` int(1) DEFAULT NULL,
  `parent` int(5) DEFAULT NULL,
  `template` varchar(100) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `opentype` int(1) DEFAULT NULL COMMENT '1：tab打开 2：新标签打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '主菜单', null, '1', '1', '0', null, '1', '1');
INSERT INTO `menus` VALUES ('3', '系统设置', null, null, '1', '1', '', null, '1');
INSERT INTO `menus` VALUES ('4', '菜单管理', 'menu/manager.do', '2', '0', '3', '', '1', '1');
INSERT INTO `menus` VALUES ('5', 'JAVA基础', null, null, '1', '1', '', null, '1');
INSERT INTO `menus` VALUES ('6', '语法规范', 'article/common.do', null, '0', '5', 'views/article/iframe.jsp', null, '1');
INSERT INTO `menus` VALUES ('7', 'web前端', null, null, '1', '1', '', null, '1');
INSERT INTO `menus` VALUES ('8', '友情链接', null, null, '1', '1', '', null, '1');
INSERT INTO `menus` VALUES ('9', '百度', 'http://www.baidu.com', null, '0', '8', '', null, '2');
INSERT INTO `menus` VALUES ('11', '测试页面', 'article/common.do', null, '0', '5', 'views/article/iframe.jsp', null, '1');
INSERT INTO `menus` VALUES ('13', '登录日志3', 'gethistory', '3', '0', '3', '', null, '1');
INSERT INTO `menus` VALUES ('14', '聊天室', 'chat/chatRoom.do', null, '0', '8', '', null, '2');
INSERT INTO `menus` VALUES ('15', 'html基础知识', 'article/common.do', null, '0', '7', 'views/article/iframe.jsp', null, '1');
INSERT INTO `menus` VALUES ('17', '学习链接整理', 'article/common.do', null, '0', '8', 'views/article/iframe.jsp', null, '1');
INSERT INTO `menus` VALUES ('18', '其他功能模块', 'setting/other', null, '0', '3', '', null, '1');
INSERT INTO `menus` VALUES ('19', '主页', 'index', '1', '0', '1', null, null, null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(128) DEFAULT NULL COMMENT '角色名说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '总公司', '0', '0/', '1');
INSERT INTO `sys_organization` VALUES ('2', '分公司1', '1', '0/1/', '1');
INSERT INTO `sys_organization` VALUES ('3', '分公司2', '1', '0/1/', '1');
INSERT INTO `sys_organization` VALUES ('4', '分公司11', '2', '0/1/2/', '1');

-- ----------------------------
-- Table structure for `sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '资源', 'menu', '', '0', '0/', '', '1');
INSERT INTO `sys_resource` VALUES ('11', '组织机构管理', 'menu', '/organization', '1', '0/1/', 'organization:*', '1');
INSERT INTO `sys_resource` VALUES ('12', '组织机构新增', 'button', '', '11', '0/1/11/', 'organization:create', '1');
INSERT INTO `sys_resource` VALUES ('13', '组织机构修改', 'button', '', '11', '0/1/11/', 'organization:update', '1');
INSERT INTO `sys_resource` VALUES ('14', '组织机构删除', 'button', '', '11', '0/1/11/', 'organization:delete', '1');
INSERT INTO `sys_resource` VALUES ('15', '组织机构查看', 'button', '', '11', '0/1/11/', 'organization:view', '1');
INSERT INTO `sys_resource` VALUES ('21', '用户管理', 'menu', '/user', '1', '0/1/', 'user:*', '1');
INSERT INTO `sys_resource` VALUES ('22', '用户新增', 'button', '', '21', '0/1/21/', 'user:create', '1');
INSERT INTO `sys_resource` VALUES ('23', '用户修改', 'button', '', '21', '0/1/21/', 'user:update', '1');
INSERT INTO `sys_resource` VALUES ('24', '用户删除', 'button', '', '21', '0/1/21/', 'user:delete', '1');
INSERT INTO `sys_resource` VALUES ('25', '用户查看', 'button', '', '21', '0/1/21/', 'user:view', '1');
INSERT INTO `sys_resource` VALUES ('31', '资源管理', 'menu', '/resource', '1', '0/1/', 'resource:*', '1');
INSERT INTO `sys_resource` VALUES ('32', '资源新增', 'button', '', '31', '0/1/31/', 'resource:create', '1');
INSERT INTO `sys_resource` VALUES ('33', '资源修改', 'button', '', '31', '0/1/31/', 'resource:update', '1');
INSERT INTO `sys_resource` VALUES ('34', '资源删除', 'button', '', '31', '0/1/31/', 'resource:delete', '1');
INSERT INTO `sys_resource` VALUES ('35', '资源查看', 'button', '', '31', '0/1/31/', 'resource:view', '1');
INSERT INTO `sys_resource` VALUES ('41', '角色管理', 'menu', '/role', '1', '0/1/', 'role:*', '1');
INSERT INTO `sys_resource` VALUES ('42', '角色新增', 'button', '', '41', '0/1/41/', 'role:create', '1');
INSERT INTO `sys_resource` VALUES ('43', '角色修改', 'button', '', '41', '0/1/41/', 'role:update', '1');
INSERT INTO `sys_resource` VALUES ('44', '角色删除', 'button', '', '41', '0/1/41/', 'role:delete', '1');
INSERT INTO `sys_resource` VALUES ('45', '角色查看', 'button', '', '41', '0/1/41/', 'role:view', '1');
INSERT INTO `sys_resource` VALUES ('46', '外部链接', 'button', 'http://www.baidu.com', '41', '0/1/41/', 'role:baidu', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '超级管理员', '11,21,31,41', '1');
INSERT INTO `sys_role` VALUES ('2', '游客', '阿', '13,35,45,', '0');
INSERT INTO `sys_role` VALUES ('3', '办游客', '办游客', '31,35,', '0');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `organization_id` int(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `role` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `desc` varchar(1024) DEFAULT NULL,
  `isEnable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, '升升', 'admin', 'hejinsheng', 'e10adc3949ba59abbe56e057f20f883e', null, 'admin', '1');
INSERT INTO `sys_user` VALUES ('2', null, '小帅帅', 'admin', 'hejinshuai', 'e10adc3949ba59abbe56e057f20f883e', null, 'admin', '1');
