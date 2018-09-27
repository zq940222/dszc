/*
Navicat MySQL Data Transfer

Source Server         : 大山早餐
Source Server Version : 50721
Source Host           : 47.99.89.219:3306
Source Database       : dszc

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-09-27 17:47:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ds_admin
-- ----------------------------
DROP TABLE IF EXISTS `ds_admin`;
CREATE TABLE `ds_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of ds_admin
-- ----------------------------
INSERT INTO `ds_admin` VALUES ('1', 'admin', 'Admin', 'a4a187a878c3972ffadb1d6de3a185d8', 'bc9cab', '/assets/img/avatar.png', 'admin@admin.com', '0', '1538035818', '1492186163', '1538035818', '5ab62bb7-3292-43fd-9f0e-63cfa15ed564', 'normal');
INSERT INTO `ds_admin` VALUES ('2', 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', '0', '1505450906', '1492186163', '1505450906', 'df45fdd5-26f4-45ca-83b3-47e4491a315a', 'normal');
INSERT INTO `ds_admin` VALUES ('3', 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', '0', '1501980868', '1492186201', '1501982377', '', 'normal');
INSERT INTO `ds_admin` VALUES ('4', 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', '0', '0', '1492186240', '1492186240', '', 'normal');
INSERT INTO `ds_admin` VALUES ('5', 'admin32', 'admin32', 'ade94d5d7a7033afa7d84ac3066d0a02', 'FvYK0u', '/assets/img/avatar.png', 'admin32@fastadmin.net', '0', '0', '1492186263', '1492186263', '', 'normal');

-- ----------------------------
-- Table structure for ds_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ds_admin_log`;
CREATE TABLE `ds_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of ds_admin_log
-- ----------------------------
INSERT INTO `ds_admin_log` VALUES ('1', '1', 'admin', '/index.php/admin/auth/rule/del/ids/73', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"73\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442461');
INSERT INTO `ds_admin_log` VALUES ('2', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442461');
INSERT INTO `ds_admin_log` VALUES ('3', '1', 'admin', '/index.php/admin/auth/rule/del/ids/79', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"79\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442466');
INSERT INTO `ds_admin_log` VALUES ('4', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442466');
INSERT INTO `ds_admin_log` VALUES ('5', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/address\",\"title\":\"\\u7528\\u6237\\u5730\\u5740\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442477');
INSERT INTO `ds_admin_log` VALUES ('6', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442477');
INSERT INTO `ds_admin_log` VALUES ('7', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/91?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/coupon\",\"title\":\"\\u4f1a\\u5458\\u4f18\\u60e0\\u5238\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"91\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442495');
INSERT INTO `ds_admin_log` VALUES ('8', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442495');
INSERT INTO `ds_admin_log` VALUES ('9', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/97?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dish\",\"title\":\"\\u65e9\\u9910\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"97\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442802');
INSERT INTO `ds_admin_log` VALUES ('10', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442802');
INSERT INTO `ds_admin_log` VALUES ('11', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/98?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"dish\\/dish\",\"title\":\"\\u65e9\\u9910\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"98\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442818');
INSERT INTO `ds_admin_log` VALUES ('12', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442818');
INSERT INTO `ds_admin_log` VALUES ('13', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/104?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"dish\\/spec\",\"title\":\"\\u5957\\u9910\\u6a21\\u578b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"104\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442830');
INSERT INTO `ds_admin_log` VALUES ('14', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442830');
INSERT INTO `ds_admin_log` VALUES ('15', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/110?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"goods\",\"title\":\"\\u7cbe\\u9009\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"110\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442841');
INSERT INTO `ds_admin_log` VALUES ('16', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442841');
INSERT INTO `ds_admin_log` VALUES ('17', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/111?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"goods\\/goods\",\"title\":\"\\u7cbe\\u9009\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442853');
INSERT INTO `ds_admin_log` VALUES ('18', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442853');
INSERT INTO `ds_admin_log` VALUES ('19', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/117?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"goods\\/spec\",\"title\":\"\\u89c4\\u683c\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"117\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442869');
INSERT INTO `ds_admin_log` VALUES ('20', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442869');
INSERT INTO `ds_admin_log` VALUES ('21', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/123?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"goods\\/comment\",\"title\":\"\\u8bc4\\u8bba\\u7ba1\\u7406\",\"icon\":\"fa fa-comment\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"123\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442878');
INSERT INTO `ds_admin_log` VALUES ('22', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442878');
INSERT INTO `ds_admin_log` VALUES ('23', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/129?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"order\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"129\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442890');
INSERT INTO `ds_admin_log` VALUES ('24', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442890');
INSERT INTO `ds_admin_log` VALUES ('25', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/130?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"129\",\"name\":\"order\\/dish\",\"title\":\"\\u65e9\\u9910\\u8ba2\\u5355\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"130\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442899');
INSERT INTO `ds_admin_log` VALUES ('26', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442900');
INSERT INTO `ds_admin_log` VALUES ('27', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/136?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"129\",\"name\":\"order\\/goods\",\"title\":\"\\u7cbe\\u9009\\u8ba2\\u5355\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"136\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442909');
INSERT INTO `ds_admin_log` VALUES ('28', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537442909');
INSERT INTO `ds_admin_log` VALUES ('29', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/142?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"banner\",\"title\":\"\\u5e7f\\u544a\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"142\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444040');
INSERT INTO `ds_admin_log` VALUES ('30', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444040');
INSERT INTO `ds_admin_log` VALUES ('31', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/143?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"142\",\"name\":\"banner\\/banner\",\"title\":\"\\u5e7f\\u544a\\u4f4d\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"143\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444053');
INSERT INTO `ds_admin_log` VALUES ('32', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444054');
INSERT INTO `ds_admin_log` VALUES ('33', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/149?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"142\",\"name\":\"banner\\/item\",\"title\":\"\\u5e7f\\u544a\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"149\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444064');
INSERT INTO `ds_admin_log` VALUES ('34', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444064');
INSERT INTO `ds_admin_log` VALUES ('35', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/155?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"coupon\",\"title\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"155\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444074');
INSERT INTO `ds_admin_log` VALUES ('36', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444075');
INSERT INTO `ds_admin_log` VALUES ('37', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/156?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"155\",\"name\":\"coupon\\/coupon\",\"title\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"156\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444085');
INSERT INTO `ds_admin_log` VALUES ('38', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444086');
INSERT INTO `ds_admin_log` VALUES ('39', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/162?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"155\",\"name\":\"coupon\\/giveout\",\"title\":\"\\u53d1\\u653e\\u4f18\\u60e0\\u5238\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"162\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444097');
INSERT INTO `ds_admin_log` VALUES ('40', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444097');
INSERT INTO `ds_admin_log` VALUES ('41', '1', 'admin', '/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"categorytype\":\"{\\\"dish\\\":\\\"\\u65e9\\u9910\\u5206\\u7c7b\\\",\\\"goods\\\":\\\"\\u5546\\u54c1\\u5206\\u7c7b\\\"}\",\"configgroup\":\"{\\\"basic\\\":\\\"Basic\\\",\\\"email\\\":\\\"Email\\\",\\\"dictionary\\\":\\\"Dictionary\\\",\\\"user\\\":\\\"User\\\"}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444372');
INSERT INTO `ds_admin_log` VALUES ('42', '1', 'admin', '/index.php/admin/general.config/edit', '常规管理 系统配置 编辑', '{\"row\":{\"categorytype\":\"{\\\"dish\\\":\\\"\\u65e9\\u9910\\u5206\\u7c7b\\\",\\\"goods\\\":\\\"\\u5546\\u54c1\\u5206\\u7c7b\\\"}\",\"configgroup\":\"{\\\"basic\\\":\\\"Basic\\\",\\\"email\\\":\\\"Email\\\",\\\"dictionary\\\":\\\"Dictionary\\\"}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444386');
INSERT INTO `ds_admin_log` VALUES ('43', '1', 'admin', '/index.php/admin/general/config/check', '', '{\"row\":{\"name\":\"customer_service \"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444444');
INSERT INTO `ds_admin_log` VALUES ('44', '1', 'admin', '/index.php/admin/general.config/add', '常规管理 系统配置 添加', '{\"row\":{\"type\":\"string\",\"group\":\"basic\",\"name\":\"customer_service \",\"title\":\"\\u5ba2\\u670d\\u7535\\u8bdd\",\"value\":\"010-33445566\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444457');
INSERT INTO `ds_admin_log` VALUES ('45', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"dish\",\"pid\":\"0\",\"name\":\"\\u9c9c\\u5305\",\"nickname\":\"\\u9c9c\\u5305\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444729');
INSERT INTO `ds_admin_log` VALUES ('46', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"dish\",\"pid\":\"0\",\"name\":\"\\u7c97\\u7cae\",\"nickname\":\"\\u7c97\\u7cae\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444745');
INSERT INTO `ds_admin_log` VALUES ('47', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"dish\",\"pid\":\"0\",\"name\":\"\\u8c46\\u6d46\",\"nickname\":\"\\u8c46\\u6d46\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444755');
INSERT INTO `ds_admin_log` VALUES ('48', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"dish\",\"pid\":\"0\",\"name\":\"\\u597d\\u7ca5\",\"nickname\":\"\\u597d\\u7ca5\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444765');
INSERT INTO `ds_admin_log` VALUES ('49', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"dish\",\"pid\":\"0\",\"name\":\"\\u70b9\\u5fc3\",\"nickname\":\"\\u70b9\\u5fc3\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444773');
INSERT INTO `ds_admin_log` VALUES ('50', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"dish\",\"pid\":\"0\",\"name\":\"\\u5957\\u9910\",\"nickname\":\"\\u5957\\u9910\",\"image\":\"\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537444804');
INSERT INTO `ds_admin_log` VALUES ('51', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"product-dryfruit-a@6.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446273');
INSERT INTO `ds_admin_log` VALUES ('52', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"goods\",\"pid\":\"0\",\"name\":\"\\u5206\\u7c7b\\u4e00\",\"nickname\":\"\\u5206\\u7c7b\\u4e00\",\"image\":\"\\/uploads\\/20180920\\/a3fe84d16d5427ac188ce2d742aafa69.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446278');
INSERT INTO `ds_admin_log` VALUES ('53', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"product-vg@1.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446293');
INSERT INTO `ds_admin_log` VALUES ('54', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"goods\",\"pid\":\"0\",\"name\":\"\\u5206\\u7c7b\\u4e8c\",\"nickname\":\"\\u5206\\u7c7b\\u4e8c\",\"image\":\"\\/uploads\\/20180920\\/03473f8cef4f2d471ff90d184a0e2e4f.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446295');
INSERT INTO `ds_admin_log` VALUES ('55', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"product-vg@5.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446312');
INSERT INTO `ds_admin_log` VALUES ('56', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"goods\",\"pid\":\"0\",\"name\":\"\\u5206\\u7c7b\\u4e09\",\"nickname\":\"\\u5206\\u7c7b\\u4e09\",\"image\":\"\\/uploads\\/20180920\\/907645faaa9980086c4e765b03227753.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446313');
INSERT INTO `ds_admin_log` VALUES ('57', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"product-rice@5.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446330');
INSERT INTO `ds_admin_log` VALUES ('58', '1', 'admin', '/index.php/admin/category/add?dialog=1', '分类管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"goods\",\"pid\":\"0\",\"name\":\"\\u5206\\u7c7b\\u56db\",\"nickname\":\"\\u5206\\u7c7b\\u56db\",\"image\":\"\\/uploads\\/20180920\\/e40f3db079e3f4af8004375e032fb1d3.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446332');
INSERT INTO `ds_admin_log` VALUES ('59', '1', 'admin', '/index.php/admin/index/login', '登录', '{\"__token__\":\"0ce497c01dd168dece10f0f4bdfee13e\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537446421');
INSERT INTO `ds_admin_log` VALUES ('60', '1', 'admin', '/index.php/admin/banner/banner/add?dialog=1', '广告管理 广告位 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u65e9\\u9910\\u8f6e\\u64ad\\u56fe\",\"description\":\"\\u9996\\u9875\\u65e9\\u9910\\u8f6e\\u64ad\\u56fe\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447694');
INSERT INTO `ds_admin_log` VALUES ('61', '1', 'admin', '/index.php/admin/banner/banner/add?dialog=1', '广告管理 广告位 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7cbe\\u9009\\u8f6e\\u64ad\\u56fe\",\"description\":\"\\u5546\\u57ce\\u7cbe\\u9009\\u8f6e\\u64ad\\u56fe\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447722');
INSERT INTO `ds_admin_log` VALUES ('62', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"loginbg\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.1\",\"faversion\":\"1.0.0.20180911_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447874');
INSERT INTO `ds_admin_log` VALUES ('63', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447874');
INSERT INTO `ds_admin_log` VALUES ('64', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"crontab\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.1\",\"faversion\":\"1.0.0.20180911_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447880');
INSERT INTO `ds_admin_log` VALUES ('65', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447880');
INSERT INTO `ds_admin_log` VALUES ('66', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"loginvideo\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20180911_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447895');
INSERT INTO `ds_admin_log` VALUES ('67', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447895');
INSERT INTO `ds_admin_log` VALUES ('68', '1', 'admin', '/index.php/admin/addon/install', '插件管理 安装', '{\"name\":\"alisms\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.2\",\"faversion\":\"1.0.0.20180911_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447914');
INSERT INTO `ds_admin_log` VALUES ('69', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537447915');
INSERT INTO `ds_admin_log` VALUES ('70', '1', 'admin', '/index.php/admin/addon/config?name=alisms&dialog=1', '插件管理 配置', '{\"name\":\"alisms\",\"dialog\":\"1\",\"row\":{\"key\":\"LTAIvifKdFyA4SRn\",\"secret\":\"Y6RA86bLpsUw1JBA89BV707Ail5Exo\",\"sign\":\"\\u5927\\u5c71\\u65e9\\u9910\",\"template\":\"{\\\"register\\\":\\\"SMS_144185124\\\"}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537448030');
INSERT INTO `ds_admin_log` VALUES ('71', '1', 'admin', '/index.php/admin/addon/config?name=loginvideo&dialog=1', '插件管理 配置', '{\"name\":\"loginvideo\",\"dialog\":\"1\",\"row\":{\"background-color\":\"\",\"background-image\":\"https:\\/\\/wx2.sinaimg.cn\\/large\\/0060lm7Tly1fvblyjxs3dj31hc0u0tc1.jpg\",\"background-video\":\"https:\\/\\/t1.aixinxi.net\\/o_1cnh2rofs19skpcq11u6g921qm9a.mp4\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537448067');
INSERT INTO `ds_admin_log` VALUES ('72', '1', 'admin', '/index.php/admin/index/login', '登录', '{\"__token__\":\"245d26b53f9ab4474203277187a6625b\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537448078');
INSERT INTO `ds_admin_log` VALUES ('73', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/12?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"5\",\"name\":\"auth\\/rule\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa fa-bars\",\"weigh\":\"104\",\"condition\":\"\",\"remark\":\"Rule tips\",\"status\":\"normal\"},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537450307');
INSERT INTO `ds_admin_log` VALUES ('74', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537450308');
INSERT INTO `ds_admin_log` VALUES ('75', '1', 'admin', '/index.php/admin/goods/spec/add?dialog=1', '精选管理 规格管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5c3a\\u5bf8\",\"item\":\"\\u5927\\r\\n\\u4e2d\\r\\n\\u5c0f\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537450423');
INSERT INTO `ds_admin_log` VALUES ('76', '1', 'admin', '/index.php/admin/goods/spec/add?dialog=1', '精选管理 规格管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u989c\\u8272\",\"item\":\"\\u767d\\u8272\\r\\n\\u9ed1\\u8272\\r\\n\\u84dd\\u8272\\r\\n\\u7d2b\\u8272\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537450443');
INSERT INTO `ds_admin_log` VALUES ('77', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"90d5e4b4700d5ef94b7ccaa1a42164b6\",\"username\":\"admin\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497639');
INSERT INTO `ds_admin_log` VALUES ('78', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"dish\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497659');
INSERT INTO `ds_admin_log` VALUES ('79', '1', 'admin', '/admin/dish/spec/add?dialog=1', '早餐管理 套餐模型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9c9c\\u5305\",\"choose_num\":\"2\",\"item\":\"\\u83dc\\u5305\\r\\n\\u8089\\u5305\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497756');
INSERT INTO `ds_admin_log` VALUES ('80', '1', 'admin', '/admin/dish/spec/del/ids/17', '早餐管理 套餐模型 删除', '{\"action\":\"del\",\"ids\":\"17\",\"params\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497763');
INSERT INTO `ds_admin_log` VALUES ('81', '1', 'admin', '/admin/dish/spec/del/ids/16', '早餐管理 套餐模型 删除', '{\"action\":\"del\",\"ids\":\"16\",\"params\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497765');
INSERT INTO `ds_admin_log` VALUES ('82', '1', 'admin', '/admin/dish/spec/add?dialog=1', '早餐管理 套餐模型 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u597d\\u7ca5\",\"choose_num\":\"1\",\"item\":\"\\u76ae\\u86cb\\u7626\\u8089\\u7ca5\\r\\n\\u5357\\u74dc\\u7ca5\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497794');
INSERT INTO `ds_admin_log` VALUES ('83', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-rice@5.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497868');
INSERT INTO `ds_admin_log` VALUES ('84', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497871');
INSERT INTO `ds_admin_log` VALUES ('85', '1', 'admin', '/admin/dish/dish/add?dialog=1', '早餐管理 早餐列表 添加', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"1\",\"type\":\"0\",\"name\":\"\\u9e21\\u8089\\u5305\",\"desc\":\"\\u4e0a\\u7b49\\u9e21\\u8089\",\"price\":\"1\",\"dish_image\":\"\\/uploads\\/20180921\\/e40f3db079e3f4af8004375e032fb1d3.png\",\"dish_spec_ids\":\"\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497877');
INSERT INTO `ds_admin_log` VALUES ('86', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"dish\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497885');
INSERT INTO `ds_admin_log` VALUES ('87', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-dryfruit@2.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497924');
INSERT INTO `ds_admin_log` VALUES ('88', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497926');
INSERT INTO `ds_admin_log` VALUES ('89', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497930');
INSERT INTO `ds_admin_log` VALUES ('90', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497932');
INSERT INTO `ds_admin_log` VALUES ('91', '1', 'admin', '/admin/dish/dish/add?dialog=1', '早餐管理 早餐列表 添加', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"6\",\"type\":\"1\",\"name\":\"\\u5957\\u9910A\",\"desc\":\"\\u65e9\\u9910\\u65e0\\u5fe7\",\"price\":\"5\",\"dish_image\":\"\\/uploads\\/20180921\\/5a50a3536f19366e4a23608530016cc7.png\",\"dish_spec_ids\":\"19,18\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497933');
INSERT INTO `ds_admin_log` VALUES ('92', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-rice@5.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497983');
INSERT INTO `ds_admin_log` VALUES ('93', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-rice@6.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497991');
INSERT INTO `ds_admin_log` VALUES ('94', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-rice@2.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537497999');
INSERT INTO `ds_admin_log` VALUES ('95', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-1@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498023');
INSERT INTO `ds_admin_log` VALUES ('96', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-2@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498023');
INSERT INTO `ds_admin_log` VALUES ('97', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-3@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498023');
INSERT INTO `ds_admin_log` VALUES ('98', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498024');
INSERT INTO `ds_admin_log` VALUES ('99', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498024');
INSERT INTO `ds_admin_log` VALUES ('100', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-6@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498024');
INSERT INTO `ds_admin_log` VALUES ('101', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-7@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498024');
INSERT INTO `ds_admin_log` VALUES ('102', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"goods\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498030');
INSERT INTO `ds_admin_log` VALUES ('103', '1', 'admin', '/admin/goods/goods/add?dialog=1', '精选管理 精选列表 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7b28\\u9e21\\u86cb\",\"intro\":\"\\u519c\\u5bb6\\u7b28\\u9e21\\u86cb\",\"cover_image\":\"\\/uploads\\/20180921\\/e40f3db079e3f4af8004375e032fb1d3.png\",\"goods_images\":\"\\/uploads\\/20180921\\/0a68cb0c545102331e467cea998cfc39.png,\\/uploads\\/20180921\\/9d7996b0aebe8f9b520af839779e9eff.png\",\"price\":\"10\",\"detail_images\":\"\\/uploads\\/20180921\\/17bdff847693a6df687a0c2dc10a4cf0.png,\\/uploads\\/20180921\\/7307a7cacfe318981814beacd874fccc.png,\\/uploads\\/20180921\\/583f0f69c438a6cb4add8c77f2fa3b2c.png,\\/uploads\\/20180921\\/59679590fbbe1e928ebc5feea2b9857a.png,\\/uploads\\/20180921\\/988f09da7915ca6c94eba1aae1bf8f3e.png,\\/uploads\\/20180921\\/0c0bad67d546cc2fbadce09c08922611.png,\\/uploads\\/20180921\\/ee18f9ede4e77a5439e5da6d5e64da56.png\",\"sales_sum\":\"0\",\"is_recommend\":\"1\",\"category_id\":\"7\",\"freight\":\"0.00\",\"keywords\":\"\\u9e21\\u86cb\",\"comment_count\":\"0\",\"is_on_sale\":\"1\",\"weigh\":\"0\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498044');
INSERT INTO `ds_admin_log` VALUES ('104', '1', 'admin', '/admin/goods/goods/add?dialog=1', '精选管理 精选列表 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7b28\\u9e21\\u86cb\",\"intro\":\"\\u519c\\u5bb6\\u7b28\\u9e21\\u86cb\",\"cover_image\":\"\\/uploads\\/20180921\\/e40f3db079e3f4af8004375e032fb1d3.png\",\"goods_images\":\"\\/uploads\\/20180921\\/0a68cb0c545102331e467cea998cfc39.png,\\/uploads\\/20180921\\/9d7996b0aebe8f9b520af839779e9eff.png\",\"price\":\"10\",\"detail_images\":\"\\/uploads\\/20180921\\/17bdff847693a6df687a0c2dc10a4cf0.png,\\/uploads\\/20180921\\/7307a7cacfe318981814beacd874fccc.png,\\/uploads\\/20180921\\/583f0f69c438a6cb4add8c77f2fa3b2c.png,\\/uploads\\/20180921\\/59679590fbbe1e928ebc5feea2b9857a.png,\\/uploads\\/20180921\\/988f09da7915ca6c94eba1aae1bf8f3e.png,\\/uploads\\/20180921\\/0c0bad67d546cc2fbadce09c08922611.png,\\/uploads\\/20180921\\/ee18f9ede4e77a5439e5da6d5e64da56.png\",\"sales_sum\":\"0\",\"is_recommend\":\"1\",\"category_id\":\"7\",\"freight\":\"0.00\",\"keywords\":\"\\u9e21\\u86cb\",\"comment_count\":\"0\",\"is_on_sale\":\"1\",\"weigh\":\"0\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498236');
INSERT INTO `ds_admin_log` VALUES ('105', '1', 'admin', '/admin/goods/goods/add?dialog=1', '精选管理 精选列表 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7b28\\u9e21\\u86cb\",\"intro\":\"\\u519c\\u5bb6\\u7b28\\u9e21\\u86cb\",\"cover_image\":\"\\/uploads\\/20180921\\/e40f3db079e3f4af8004375e032fb1d3.png\",\"goods_images\":\"\\/uploads\\/20180921\\/0a68cb0c545102331e467cea998cfc39.png,\\/uploads\\/20180921\\/9d7996b0aebe8f9b520af839779e9eff.png\",\"price\":\"10\",\"detail_images\":\"\\/uploads\\/20180921\\/17bdff847693a6df687a0c2dc10a4cf0.png,\\/uploads\\/20180921\\/7307a7cacfe318981814beacd874fccc.png,\\/uploads\\/20180921\\/583f0f69c438a6cb4add8c77f2fa3b2c.png,\\/uploads\\/20180921\\/59679590fbbe1e928ebc5feea2b9857a.png,\\/uploads\\/20180921\\/988f09da7915ca6c94eba1aae1bf8f3e.png,\\/uploads\\/20180921\\/0c0bad67d546cc2fbadce09c08922611.png,\\/uploads\\/20180921\\/ee18f9ede4e77a5439e5da6d5e64da56.png\",\"sales_sum\":\"0\",\"is_recommend\":\"1\",\"category_id\":\"7\",\"freight\":\"0.00\",\"keywords\":\"\\u9e21\\u86cb\",\"comment_count\":\"0\",\"is_on_sale\":\"1\",\"weigh\":\"0\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498267');
INSERT INTO `ds_admin_log` VALUES ('106', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"7\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"7\",\"searchField\":[\"name\"]}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498294');
INSERT INTO `ds_admin_log` VALUES ('107', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498306');
INSERT INTO `ds_admin_log` VALUES ('108', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498307');
INSERT INTO `ds_admin_log` VALUES ('109', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498307');
INSERT INTO `ds_admin_log` VALUES ('110', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\",\"19\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537498308');
INSERT INTO `ds_admin_log` VALUES ('111', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537515780');
INSERT INTO `ds_admin_log` VALUES ('112', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537515780');
INSERT INTO `ds_admin_log` VALUES ('113', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537515781');
INSERT INTO `ds_admin_log` VALUES ('114', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516638');
INSERT INTO `ds_admin_log` VALUES ('115', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516639');
INSERT INTO `ds_admin_log` VALUES ('116', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516639');
INSERT INTO `ds_admin_log` VALUES ('117', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516640');
INSERT INTO `ds_admin_log` VALUES ('118', '1', 'admin', '/index.php/admin/index/login?url=%2Findex.php%2Fadmin', '登录', '{\"url\":\"\\/index.php\\/admin\",\"__token__\":\"f06333e6294cb158c98a0d93a0f107a5\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516663');
INSERT INTO `ds_admin_log` VALUES ('119', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516673');
INSERT INTO `ds_admin_log` VALUES ('120', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516674');
INSERT INTO `ds_admin_log` VALUES ('121', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516676');
INSERT INTO `ds_admin_log` VALUES ('122', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516679');
INSERT INTO `ds_admin_log` VALUES ('123', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516705');
INSERT INTO `ds_admin_log` VALUES ('124', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516759');
INSERT INTO `ds_admin_log` VALUES ('125', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"],\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516760');
INSERT INTO `ds_admin_log` VALUES ('126', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\",\"19\"],\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516761');
INSERT INTO `ds_admin_log` VALUES ('127', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516763');
INSERT INTO `ds_admin_log` VALUES ('128', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516807');
INSERT INTO `ds_admin_log` VALUES ('129', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516808');
INSERT INTO `ds_admin_log` VALUES ('130', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516814');
INSERT INTO `ds_admin_log` VALUES ('131', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516817');
INSERT INTO `ds_admin_log` VALUES ('132', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516903');
INSERT INTO `ds_admin_log` VALUES ('133', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516903');
INSERT INTO `ds_admin_log` VALUES ('134', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516904');
INSERT INTO `ds_admin_log` VALUES ('135', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\",\"19\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516904');
INSERT INTO `ds_admin_log` VALUES ('136', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537516916');
INSERT INTO `ds_admin_log` VALUES ('137', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517063');
INSERT INTO `ds_admin_log` VALUES ('138', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517066');
INSERT INTO `ds_admin_log` VALUES ('139', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517076');
INSERT INTO `ds_admin_log` VALUES ('140', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517076');
INSERT INTO `ds_admin_log` VALUES ('141', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517078');
INSERT INTO `ds_admin_log` VALUES ('142', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517082');
INSERT INTO `ds_admin_log` VALUES ('143', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517097');
INSERT INTO `ds_admin_log` VALUES ('144', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"],\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517098');
INSERT INTO `ds_admin_log` VALUES ('145', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517099');
INSERT INTO `ds_admin_log` VALUES ('146', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517102');
INSERT INTO `ds_admin_log` VALUES ('147', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517488');
INSERT INTO `ds_admin_log` VALUES ('148', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517489');
INSERT INTO `ds_admin_log` VALUES ('149', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517492');
INSERT INTO `ds_admin_log` VALUES ('150', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\",\"19\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517505');
INSERT INTO `ds_admin_log` VALUES ('151', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517509');
INSERT INTO `ds_admin_log` VALUES ('152', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517672');
INSERT INTO `ds_admin_log` VALUES ('153', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"],\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517673');
INSERT INTO `ds_admin_log` VALUES ('154', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517674');
INSERT INTO `ds_admin_log` VALUES ('155', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517678');
INSERT INTO `ds_admin_log` VALUES ('156', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517762');
INSERT INTO `ds_admin_log` VALUES ('157', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517762');
INSERT INTO `ds_admin_log` VALUES ('158', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517764');
INSERT INTO `ds_admin_log` VALUES ('159', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537517766');
INSERT INTO `ds_admin_log` VALUES ('160', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518196');
INSERT INTO `ds_admin_log` VALUES ('161', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518197');
INSERT INTO `ds_admin_log` VALUES ('162', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518197');
INSERT INTO `ds_admin_log` VALUES ('163', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518207');
INSERT INTO `ds_admin_log` VALUES ('164', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518241');
INSERT INTO `ds_admin_log` VALUES ('165', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518241');
INSERT INTO `ds_admin_log` VALUES ('166', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518242');
INSERT INTO `ds_admin_log` VALUES ('167', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518244');
INSERT INTO `ds_admin_log` VALUES ('168', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518268');
INSERT INTO `ds_admin_log` VALUES ('169', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518268');
INSERT INTO `ds_admin_log` VALUES ('170', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"19\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518269');
INSERT INTO `ds_admin_log` VALUES ('171', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518271');
INSERT INTO `ds_admin_log` VALUES ('172', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518287');
INSERT INTO `ds_admin_log` VALUES ('173', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518288');
INSERT INTO `ds_admin_log` VALUES ('174', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518288');
INSERT INTO `ds_admin_log` VALUES ('175', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518290');
INSERT INTO `ds_admin_log` VALUES ('176', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518300');
INSERT INTO `ds_admin_log` VALUES ('177', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518346');
INSERT INTO `ds_admin_log` VALUES ('178', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518347');
INSERT INTO `ds_admin_log` VALUES ('179', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518347');
INSERT INTO `ds_admin_log` VALUES ('180', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518349');
INSERT INTO `ds_admin_log` VALUES ('181', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518410');
INSERT INTO `ds_admin_log` VALUES ('182', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518411');
INSERT INTO `ds_admin_log` VALUES ('183', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518411');
INSERT INTO `ds_admin_log` VALUES ('184', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518414');
INSERT INTO `ds_admin_log` VALUES ('185', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518447');
INSERT INTO `ds_admin_log` VALUES ('186', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518448');
INSERT INTO `ds_admin_log` VALUES ('187', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518450');
INSERT INTO `ds_admin_log` VALUES ('188', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518480');
INSERT INTO `ds_admin_log` VALUES ('189', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518481');
INSERT INTO `ds_admin_log` VALUES ('190', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518484');
INSERT INTO `ds_admin_log` VALUES ('191', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"23\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518497');
INSERT INTO `ds_admin_log` VALUES ('192', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\",\"23\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518498');
INSERT INTO `ds_admin_log` VALUES ('193', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518500');
INSERT INTO `ds_admin_log` VALUES ('194', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518510');
INSERT INTO `ds_admin_log` VALUES ('195', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518511');
INSERT INTO `ds_admin_log` VALUES ('196', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518511');
INSERT INTO `ds_admin_log` VALUES ('197', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-6@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518514');
INSERT INTO `ds_admin_log` VALUES ('198', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518520');
INSERT INTO `ds_admin_log` VALUES ('199', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518772');
INSERT INTO `ds_admin_log` VALUES ('200', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518773');
INSERT INTO `ds_admin_log` VALUES ('201', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"18\"],\"9\":[\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518773');
INSERT INTO `ds_admin_log` VALUES ('202', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537518776');
INSERT INTO `ds_admin_log` VALUES ('203', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"dish\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537525120');
INSERT INTO `ds_admin_log` VALUES ('204', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537525153');
INSERT INTO `ds_admin_log` VALUES ('205', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537525155');
INSERT INTO `ds_admin_log` VALUES ('206', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537525157');
INSERT INTO `ds_admin_log` VALUES ('207', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537525158');
INSERT INTO `ds_admin_log` VALUES ('208', '1', 'admin', '/admin/dish/dish/add?dialog=1', '早餐管理 早餐列表 添加', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"6\",\"type\":\"1\",\"name\":\"\\u5957\\u9910B\",\"desc\":\"\\u4e13\\u4e1a\\u5957\\u9910B\",\"price\":\"11\",\"dish_image\":\"\\/uploads\\/20180921\\/988f09da7915ca6c94eba1aae1bf8f3e.png\",\"dish_spec_ids\":\"19,18\",\"status\":\"1\"}}', '36.22.229.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537525159');
INSERT INTO `ds_admin_log` VALUES ('209', '1', 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"d6f07287b187aa0824043c24b5b879d8\",\"username\":\"admin\",\"keeplogin\":\"1\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537842206');
INSERT INTO `ds_admin_log` VALUES ('210', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537842735');
INSERT INTO `ds_admin_log` VALUES ('211', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843044');
INSERT INTO `ds_admin_log` VALUES ('212', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843050');
INSERT INTO `ds_admin_log` VALUES ('213', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843055');
INSERT INTO `ds_admin_log` VALUES ('214', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843057');
INSERT INTO `ds_admin_log` VALUES ('215', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843057');
INSERT INTO `ds_admin_log` VALUES ('216', '1', 'admin', '/admin/dish/dish/edit/ids/12?dialog=1', '早餐管理 早餐列表 编辑', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"6\",\"type\":\"1\",\"name\":\"\\u5957\\u9910B\",\"desc\":\"\\u4e13\\u4e1a\\u5957\\u9910B\",\"price\":\"11.00\",\"dish_image\":\"\\/uploads\\/20180921\\/988f09da7915ca6c94eba1aae1bf8f3e.png\",\"dish_spec_ids\":\"19,18\",\"status\":\"1\"},\"ids\":\"12\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843059');
INSERT INTO `ds_admin_log` VALUES ('217', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843061');
INSERT INTO `ds_admin_log` VALUES ('218', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843063');
INSERT INTO `ds_admin_log` VALUES ('219', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843063');
INSERT INTO `ds_admin_log` VALUES ('220', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843064');
INSERT INTO `ds_admin_log` VALUES ('221', '1', 'admin', '/admin/dish/dish/edit/ids/11?dialog=1', '早餐管理 早餐列表 编辑', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"6\",\"type\":\"1\",\"name\":\"\\u5957\\u9910A\",\"desc\":\"\\u65e9\\u9910\\u65e0\\u5fe7\",\"price\":\"5.00\",\"dish_image\":\"\\/uploads\\/20180921\\/5a50a3536f19366e4a23608530016cc7.png\",\"dish_spec_ids\":\"19,18\",\"status\":\"1\"},\"ids\":\"11\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843065');
INSERT INTO `ds_admin_log` VALUES ('222', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"19,18\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"19,18\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843068');
INSERT INTO `ds_admin_log` VALUES ('223', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843068');
INSERT INTO `ds_admin_log` VALUES ('224', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"6\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"6\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843070');
INSERT INTO `ds_admin_log` VALUES ('225', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"19,18\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"19,18\",\"searchField\":[\"name\"]}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843070');
INSERT INTO `ds_admin_log` VALUES ('226', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537843996');
INSERT INTO `ds_admin_log` VALUES ('227', '1', 'admin', '/index.php/admin/index/login.html', '登录', '{\"__token__\":\"2264fafd17ffe3d924f361c1c4349cf4\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844092');
INSERT INTO `ds_admin_log` VALUES ('228', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"banner-1a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844176');
INSERT INTO `ds_admin_log` VALUES ('229', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844288');
INSERT INTO `ds_admin_log` VALUES ('230', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844290');
INSERT INTO `ds_admin_log` VALUES ('231', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844293');
INSERT INTO `ds_admin_log` VALUES ('232', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"banner-1a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844299');
INSERT INTO `ds_admin_log` VALUES ('233', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844301');
INSERT INTO `ds_admin_log` VALUES ('234', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844305');
INSERT INTO `ds_admin_log` VALUES ('235', '1', 'admin', '/index.php/admin/banner/item/add?dialog=1', '广告管理 广告列表 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180925\\/847f69f35141423b0cdbe4354b48530a.png\",\"dish_id\":\"10\",\"banner_id\":\"4\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844309');
INSERT INTO `ds_admin_log` VALUES ('236', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"banner-2a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844315');
INSERT INTO `ds_admin_log` VALUES ('237', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844316');
INSERT INTO `ds_admin_log` VALUES ('238', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844320');
INSERT INTO `ds_admin_log` VALUES ('239', '1', 'admin', '/index.php/admin/banner/item/add?dialog=1', '广告管理 广告列表 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180925\\/8c092c092c451effe078b3780c3b0460.png\",\"dish_id\":\"11\",\"banner_id\":\"4\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844323');
INSERT INTO `ds_admin_log` VALUES ('240', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"banner-3a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844331');
INSERT INTO `ds_admin_log` VALUES ('241', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844332');
INSERT INTO `ds_admin_log` VALUES ('242', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844335');
INSERT INTO `ds_admin_log` VALUES ('243', '1', 'admin', '/index.php/admin/banner/item/add?dialog=1', '广告管理 广告列表 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180925\\/affd6e7bc794bbde7a8b3867c83c3b97.png\",\"dish_id\":\"12\",\"banner_id\":\"4\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844337');
INSERT INTO `ds_admin_log` VALUES ('244', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"banner-4a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844343');
INSERT INTO `ds_admin_log` VALUES ('245', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844344');
INSERT INTO `ds_admin_log` VALUES ('246', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844350');
INSERT INTO `ds_admin_log` VALUES ('247', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844350');
INSERT INTO `ds_admin_log` VALUES ('248', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844356');
INSERT INTO `ds_admin_log` VALUES ('249', '1', 'admin', '/index.php/admin/banner/item/add?dialog=1', '广告管理 广告列表 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180925\\/c05f69d47b67753fc98ea7bc63077574.png\",\"dish_id\":\"10\",\"banner_id\":\"4\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844359');
INSERT INTO `ds_admin_log` VALUES ('250', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"10\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"10\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844995');
INSERT INTO `ds_admin_log` VALUES ('251', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537844995');
INSERT INTO `ds_admin_log` VALUES ('252', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537846840');
INSERT INTO `ds_admin_log` VALUES ('253', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537846873');
INSERT INTO `ds_admin_log` VALUES ('254', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537846875');
INSERT INTO `ds_admin_log` VALUES ('255', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537846877');
INSERT INTO `ds_admin_log` VALUES ('256', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"category-cake.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537847109');
INSERT INTO `ds_admin_log` VALUES ('257', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856029');
INSERT INTO `ds_admin_log` VALUES ('258', '1', 'admin', '/index.php/admin/goods/goods/index', '精选管理 精选列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856032');
INSERT INTO `ds_admin_log` VALUES ('259', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856278');
INSERT INTO `ds_admin_log` VALUES ('260', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856280');
INSERT INTO `ds_admin_log` VALUES ('261', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856337');
INSERT INTO `ds_admin_log` VALUES ('262', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856341');
INSERT INTO `ds_admin_log` VALUES ('263', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856388');
INSERT INTO `ds_admin_log` VALUES ('264', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856390');
INSERT INTO `ds_admin_log` VALUES ('265', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856502');
INSERT INTO `ds_admin_log` VALUES ('266', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856505');
INSERT INTO `ds_admin_log` VALUES ('267', '1', 'admin', '/index.php/admin/goods/goods/index', '精选管理 精选列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856506');
INSERT INTO `ds_admin_log` VALUES ('268', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856508');
INSERT INTO `ds_admin_log` VALUES ('269', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856534');
INSERT INTO `ds_admin_log` VALUES ('270', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856535');
INSERT INTO `ds_admin_log` VALUES ('271', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856538');
INSERT INTO `ds_admin_log` VALUES ('272', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856554');
INSERT INTO `ds_admin_log` VALUES ('273', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856557');
INSERT INTO `ds_admin_log` VALUES ('274', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856574');
INSERT INTO `ds_admin_log` VALUES ('275', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856579');
INSERT INTO `ds_admin_log` VALUES ('276', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856582');
INSERT INTO `ds_admin_log` VALUES ('277', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856592');
INSERT INTO `ds_admin_log` VALUES ('278', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856595');
INSERT INTO `ds_admin_log` VALUES ('279', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856670');
INSERT INTO `ds_admin_log` VALUES ('280', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856673');
INSERT INTO `ds_admin_log` VALUES ('281', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856722');
INSERT INTO `ds_admin_log` VALUES ('282', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856724');
INSERT INTO `ds_admin_log` VALUES ('283', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856840');
INSERT INTO `ds_admin_log` VALUES ('284', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537856842');
INSERT INTO `ds_admin_log` VALUES ('285', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537857257');
INSERT INTO `ds_admin_log` VALUES ('286', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537857266');
INSERT INTO `ds_admin_log` VALUES ('287', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537857286');
INSERT INTO `ds_admin_log` VALUES ('288', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537857781');
INSERT INTO `ds_admin_log` VALUES ('289', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858850');
INSERT INTO `ds_admin_log` VALUES ('290', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858856');
INSERT INTO `ds_admin_log` VALUES ('291', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858874');
INSERT INTO `ds_admin_log` VALUES ('292', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858875');
INSERT INTO `ds_admin_log` VALUES ('293', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858881');
INSERT INTO `ds_admin_log` VALUES ('294', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858886');
INSERT INTO `ds_admin_log` VALUES ('295', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858918');
INSERT INTO `ds_admin_log` VALUES ('296', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858920');
INSERT INTO `ds_admin_log` VALUES ('297', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858954');
INSERT INTO `ds_admin_log` VALUES ('298', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858956');
INSERT INTO `ds_admin_log` VALUES ('299', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858958');
INSERT INTO `ds_admin_log` VALUES ('300', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858990');
INSERT INTO `ds_admin_log` VALUES ('301', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858991');
INSERT INTO `ds_admin_log` VALUES ('302', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858993');
INSERT INTO `ds_admin_log` VALUES ('303', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537858994');
INSERT INTO `ds_admin_log` VALUES ('304', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859049');
INSERT INTO `ds_admin_log` VALUES ('305', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859050');
INSERT INTO `ds_admin_log` VALUES ('306', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859052');
INSERT INTO `ds_admin_log` VALUES ('307', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859054');
INSERT INTO `ds_admin_log` VALUES ('308', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859056');
INSERT INTO `ds_admin_log` VALUES ('309', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859057');
INSERT INTO `ds_admin_log` VALUES ('310', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"category-fry-a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859112');
INSERT INTO `ds_admin_log` VALUES ('311', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859117');
INSERT INTO `ds_admin_log` VALUES ('312', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859230');
INSERT INTO `ds_admin_log` VALUES ('313', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859233');
INSERT INTO `ds_admin_log` VALUES ('314', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"category-fry-a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859240');
INSERT INTO `ds_admin_log` VALUES ('315', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859416');
INSERT INTO `ds_admin_log` VALUES ('316', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859418');
INSERT INTO `ds_admin_log` VALUES ('317', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859421');
INSERT INTO `ds_admin_log` VALUES ('318', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859424');
INSERT INTO `ds_admin_log` VALUES ('319', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859426');
INSERT INTO `ds_admin_log` VALUES ('320', '1', 'admin', '/index.php/admin/banner/banner/index', '广告管理 广告位 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859660');
INSERT INTO `ds_admin_log` VALUES ('321', '1', 'admin', '/index.php/admin/dish/dish/index', '早餐管理 早餐列表 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859660');
INSERT INTO `ds_admin_log` VALUES ('322', '1', 'admin', '/index.php/admin/goods/goods/index', '精选管理 精选列表 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"12\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"12\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859660');
INSERT INTO `ds_admin_log` VALUES ('323', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"category-dryfruit.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859869');
INSERT INTO `ds_admin_log` VALUES ('324', '1', 'admin', '/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859870');
INSERT INTO `ds_admin_log` VALUES ('325', '1', 'admin', '/admin/goods/goods/index', '精选管理 精选列表 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859872');
INSERT INTO `ds_admin_log` VALUES ('326', '1', 'admin', '/admin/banner/item/add?dialog=1', '广告管理 广告列表 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180925\\/96d76df473ce47a51e352270a00ce748.png\",\"banner_id\":\"2\",\"dish_id\":\"\",\"goods_id\":\"5\",\"status\":\"1\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859875');
INSERT INTO `ds_admin_log` VALUES ('327', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"category-fry-a.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859883');
INSERT INTO `ds_admin_log` VALUES ('328', '1', 'admin', '/admin/banner/banner/index', '广告管理 广告位 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859884');
INSERT INTO `ds_admin_log` VALUES ('329', '1', 'admin', '/admin/banner/item/add?dialog=1', '广告管理 广告列表 添加', '{\"dialog\":\"1\",\"row\":{\"image\":\"\\/uploads\\/20180925\\/711211d11edc198bd89a2083b1f2e4dd.png\",\"banner_id\":\"2\",\"dish_id\":\"\",\"goods_id\":\"\",\"status\":\"1\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859887');
INSERT INTO `ds_admin_log` VALUES ('330', '1', 'admin', '/admin/coupon/coupon/add?dialog=1', '优惠券管理 优惠券管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"1\",\"price\":\"5.00\",\"coupon_type\":\"1\",\"name\":\"\\u65e9\\u9910\\u4e13\\u7528\",\"desc\":\"\\u5f53\\u5929\\u539f\\u4ef7,\\u7b2c\\u4e8c\\u5929\\u534a\\u4ef7\",\"expiry_date\":\"0\",\"status\":\"1\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537859995');
INSERT INTO `ds_admin_log` VALUES ('331', '1', 'admin', '/admin/coupon/coupon/add?dialog=1', '优惠券管理 优惠券管理 添加', '{\"dialog\":\"1\",\"row\":{\"type\":\"2\",\"price\":\"3.00\",\"coupon_type\":\"1\",\"name\":\"\\u65e9\\u9910\\u4e13\\u7528\",\"desc\":\"\\u5f53\\u5929\\u539f\\u4ef7,\\u7b2c\\u4e8c\\u5929\\u534a\\u4ef7\",\"expiry_date\":\"0\",\"status\":\"1\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537860029');
INSERT INTO `ds_admin_log` VALUES ('332', '1', 'admin', '/admin/coupon/giveout/add?dialog=1', '优惠券管理 发放优惠券 添加', '{\"dialog\":\"1\",\"row\":{\"stime\":\"2018-09-25\",\"etime\":\"2018-09-30\",\"type\":\"2\",\"expiry_date\":\"7\",\"price\":\"10\",\"name\":\"\\u7cbe\\u9009\\u4e13\\u7528\",\"desc\":\"\\u7cbe\\u9009\\u4e13\\u7528\",\"status\":\"1\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537860063');
INSERT INTO `ds_admin_log` VALUES ('333', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537862852');
INSERT INTO `ds_admin_log` VALUES ('334', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537862887');
INSERT INTO `ds_admin_log` VALUES ('335', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2@theme-head.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537862965');
INSERT INTO `ds_admin_log` VALUES ('336', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863008');
INSERT INTO `ds_admin_log` VALUES ('337', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863148');
INSERT INTO `ds_admin_log` VALUES ('338', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863180');
INSERT INTO `ds_admin_log` VALUES ('339', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863181');
INSERT INTO `ds_admin_log` VALUES ('340', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863200');
INSERT INTO `ds_admin_log` VALUES ('341', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"dish\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863318');
INSERT INTO `ds_admin_log` VALUES ('342', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2@theme.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863653');
INSERT INTO `ds_admin_log` VALUES ('343', '1', 'admin', '/admin/dish/spec/index', '早餐管理 套餐模型 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863654');
INSERT INTO `ds_admin_log` VALUES ('344', '1', 'admin', '/admin/dish/dish/add?dialog=1', '早餐管理 早餐列表 添加', '{\"dialog\":\"1\",\"row\":{\"category_id\":\"5\",\"type\":\"0\",\"name\":\"\\u751c\\u70b9\",\"desc\":\"\\u751c\\u70b9\",\"price\":\"0.01\",\"dish_image\":\"\\/uploads\\/20180925\\/d1156772f6dec6a17d9d7ce7119c2b12.png\",\"dish_spec_ids\":\"\",\"status\":\"1\"}}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863657');
INSERT INTO `ds_admin_log` VALUES ('345', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863708');
INSERT INTO `ds_admin_log` VALUES ('346', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863767');
INSERT INTO `ds_admin_log` VALUES ('347', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"detail-4@1-dryfruit.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863780');
INSERT INTO `ds_admin_log` VALUES ('348', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2@theme.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863798');
INSERT INTO `ds_admin_log` VALUES ('349', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863905');
INSERT INTO `ds_admin_log` VALUES ('350', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"category-fry-a.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863909');
INSERT INTO `ds_admin_log` VALUES ('351', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863929');
INSERT INTO `ds_admin_log` VALUES ('352', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537863961');
INSERT INTO `ds_admin_log` VALUES ('353', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868105');
INSERT INTO `ds_admin_log` VALUES ('354', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868152');
INSERT INTO `ds_admin_log` VALUES ('355', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868162');
INSERT INTO `ds_admin_log` VALUES ('356', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868249');
INSERT INTO `ds_admin_log` VALUES ('357', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868253');
INSERT INTO `ds_admin_log` VALUES ('358', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868303');
INSERT INTO `ds_admin_log` VALUES ('359', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868306');
INSERT INTO `ds_admin_log` VALUES ('360', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868351');
INSERT INTO `ds_admin_log` VALUES ('361', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868353');
INSERT INTO `ds_admin_log` VALUES ('362', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868420');
INSERT INTO `ds_admin_log` VALUES ('363', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"category-fry-a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868424');
INSERT INTO `ds_admin_log` VALUES ('364', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"category-fry-a.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868438');
INSERT INTO `ds_admin_log` VALUES ('365', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868451');
INSERT INTO `ds_admin_log` VALUES ('366', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-6@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868454');
INSERT INTO `ds_admin_log` VALUES ('367', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868485');
INSERT INTO `ds_admin_log` VALUES ('368', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868486');
INSERT INTO `ds_admin_log` VALUES ('369', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868488');
INSERT INTO `ds_admin_log` VALUES ('370', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\",\"22\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868488');
INSERT INTO `ds_admin_log` VALUES ('371', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\",\"22\",\"23\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868489');
INSERT INTO `ds_admin_log` VALUES ('372', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868494');
INSERT INTO `ds_admin_log` VALUES ('373', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-6@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868508');
INSERT INTO `ds_admin_log` VALUES ('374', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868532');
INSERT INTO `ds_admin_log` VALUES ('375', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868543');
INSERT INTO `ds_admin_log` VALUES ('376', '1', 'admin', '/index.php/admin/ajax/upload', '', '{\"name\":\"detail-5@1-dryfruit.png\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537868618');
INSERT INTO `ds_admin_log` VALUES ('377', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537869555');
INSERT INTO `ds_admin_log` VALUES ('378', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537869560');
INSERT INTO `ds_admin_log` VALUES ('379', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"2@theme.png\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537869572');
INSERT INTO `ds_admin_log` VALUES ('380', '1', 'admin', '/admin/goods/goods/detail/ids/5?dialog=1', '', '{\"dialog\":\"1\",\"goods_id\":\"5\",\"row\":{\"item\":{\"17,20\":{\"price\":\"9.80\",\"image\":\"\\/uploads\\/20180921\\/e40f3db079e3f4af8004375e032fb1d3.png\"},\"17,21\":{\"price\":\"8.8\",\"image\":\"\\/uploads\\/20180925\\/d1156772f6dec6a17d9d7ce7119c2b12.png\"}}},\"ids\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537871960');
INSERT INTO `ds_admin_log` VALUES ('381', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '36.24.138.167', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537871963');
INSERT INTO `ds_admin_log` VALUES ('382', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537926328');
INSERT INTO `ds_admin_log` VALUES ('383', '1', 'admin', '/admin/dish/spec/edit/ids/18?dialog=1', '早餐管理 套餐模型 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u9c9c\\u5305\",\"choose_num\":\"2\",\"item\":\"\\u83dc\\u5305\\r\\n\\u8089\\u5305\\r\\n\\u751c\\u5305\",\"status\":\"1\"},\"ids\":\"18\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537926753');
INSERT INTO `ds_admin_log` VALUES ('384', '1', 'admin', '/index.php/admin/order/dish/detail/ids/130?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"status\":\"2\"},\"ids\":\"130\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537930950');
INSERT INTO `ds_admin_log` VALUES ('385', '1', 'admin', '/index.php/admin/order/dish/detail/ids/130?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"status\":\"1\"},\"ids\":\"130\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537930961');
INSERT INTO `ds_admin_log` VALUES ('386', '1', 'admin', '/index.php/admin/order/dish/detail/ids/130?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"status\":\"2\"},\"ids\":\"130\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537930966');
INSERT INTO `ds_admin_log` VALUES ('387', '1', 'admin', '/index.php/admin/order/goods/edit/ids/24?dialog=1', '订单管理 精选订单 编辑', '{\"dialog\":\"1\",\"row\":{\"order_sn\":\"2018925770142342163\",\"status\":\"1\",\"product_total_price\":\"9.80\",\"order_total_price\":\"9.80\",\"shipping_price\":\"0.00\",\"pay_price\":\"9.80\",\"consignee\":\"\\u6700\\u6743\\u5a01\",\"address\":\"\\u5317\\u4eac\\u5e02\\u5317\\u4eac\\u5e02\\u4e1c\\u57ce\\u533a\\u4eb2\\u543b\\u9752\\u86d9\",\"mobile\":\"15138328395\"},\"ids\":\"24\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537933899');
INSERT INTO `ds_admin_log` VALUES ('388', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"0\",\"pid\":\"111\",\"name\":\"goods\\/goods\\/detail\",\"title\":\"\\u5546\\u54c1\\u8be6\\u60c5\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934116');
INSERT INTO `ds_admin_log` VALUES ('389', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934116');
INSERT INTO `ds_admin_log` VALUES ('390', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"0\",\"pid\":\"130\",\"name\":\"order\\/dish\\/detail\",\"title\":\"\\u65e9\\u9910\\u8ba2\\u5355\\u8be6\\u60c5\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934153');
INSERT INTO `ds_admin_log` VALUES ('391', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934153');
INSERT INTO `ds_admin_log` VALUES ('392', '1', 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"0\",\"pid\":\"136\",\"name\":\"order\\/goods\\/detail\",\"title\":\"\\u7cbe\\u9009\\u8ba2\\u5355\\u8be6\\u60c5\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934176');
INSERT INTO `ds_admin_log` VALUES ('393', '1', 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934176');
INSERT INTO `ds_admin_log` VALUES ('394', '1', 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537934189');
INSERT INTO `ds_admin_log` VALUES ('395', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/177?dialog=1', '权限管理 菜单管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"apply\",\"title\":\"\\u5ba1\\u6838\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"177\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537942859');
INSERT INTO `ds_admin_log` VALUES ('396', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537942860');
INSERT INTO `ds_admin_log` VALUES ('397', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/178?dialog=1', '权限管理 菜单管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"177\",\"name\":\"apply\\/goods\",\"title\":\"\\u7cbe\\u9009\\u5165\\u9a7b\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"178\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537942890');
INSERT INTO `ds_admin_log` VALUES ('398', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537942891');
INSERT INTO `ds_admin_log` VALUES ('399', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/184?dialog=1', '权限管理 菜单管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"177\",\"name\":\"apply\\/horseman\",\"title\":\"\\u9a91\\u624b\\u7533\\u8bf7\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"184\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537942902');
INSERT INTO `ds_admin_log` VALUES ('400', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537942903');
INSERT INTO `ds_admin_log` VALUES ('401', '1', 'admin', '/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"finance\",\"title\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa fa-bar-chart-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537943112');
INSERT INTO `ds_admin_log` VALUES ('402', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537943112');
INSERT INTO `ds_admin_log` VALUES ('403', '1', 'admin', '/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"190\",\"name\":\"finance\\/dish\",\"title\":\"\\u65e9\\u9910\\u6536\\u652f\\u660e\\u7ec6\",\"icon\":\"fa fa-exchange\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537944523');
INSERT INTO `ds_admin_log` VALUES ('404', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537944525');
INSERT INTO `ds_admin_log` VALUES ('405', '1', 'admin', '/index.php/admin/auth/rule/add?dialog=1', '权限管理 菜单管理 添加', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"190\",\"name\":\"finance\\/goods\",\"title\":\"\\u7cbe\\u9009\\u6536\\u652f\\u660e\\u7ec6\",\"icon\":\"fa fa-exchange\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537944603');
INSERT INTO `ds_admin_log` VALUES ('406', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537944604');
INSERT INTO `ds_admin_log` VALUES ('407', '1', 'admin', '/index.php/admin/auth/rule/edit/ids/191?dialog=1', '权限管理 菜单管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"190\",\"name\":\"finance\\/dish\",\"title\":\"\\u65e9\\u9910\\u6536\\u652f\\u660e\\u7ec6\",\"icon\":\"fa fa-exchange\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\\u53ef\\u6839\\u636e\\u65f6\\u95f4\\u67e5\\u8be2\\u67d0\\u4e2a\\u65f6\\u95f4\\u6bb5\\u7684\\u9500\\u552e\\u7edf\\u8ba1.\\r\\n\\u6bcf\\u65e5\\u9500\\u552e\\u91d1\\u989d\\u3001\\u9500\\u552e\\u5546\\u54c1\\u6570.\",\"status\":\"normal\"},\"ids\":\"191\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537944841');
INSERT INTO `ds_admin_log` VALUES ('408', '1', 'admin', '/index.php/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537944842');
INSERT INTO `ds_admin_log` VALUES ('409', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-vg@3.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946583');
INSERT INTO `ds_admin_log` VALUES ('410', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-vg@3.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946592');
INSERT INTO `ds_admin_log` VALUES ('411', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-vg@4.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946592');
INSERT INTO `ds_admin_log` VALUES ('412', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-vg@5.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946592');
INSERT INTO `ds_admin_log` VALUES ('413', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-rice@7.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946604');
INSERT INTO `ds_admin_log` VALUES ('414', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-tea@1.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946604');
INSERT INTO `ds_admin_log` VALUES ('415', '1', 'admin', '/admin/ajax/upload', '', '{\"name\":\"product-tea@2.png\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946605');
INSERT INTO `ds_admin_log` VALUES ('416', '1', 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"goods\"}}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946609');
INSERT INTO `ds_admin_log` VALUES ('417', '1', 'admin', '/admin/goods/goods/add?dialog=1', '精选管理 精选列表 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u6d4b\\u8bd5\\u7528\\u4f8b\",\"intro\":\"\\u6d4b\\u8bd5\\u7528\\u4f8b\",\"cover_image\":\"\\/uploads\\/20180926\\/43d42e4d0789ac307e043290147b7dc6.png\",\"goods_images\":\"\\/uploads\\/20180926\\/43d42e4d0789ac307e043290147b7dc6.png,\\/uploads\\/20180926\\/bb4fe93eafa815a0edcfbed2ff5f4ee2.png,\\/uploads\\/20180926\\/907645faaa9980086c4e765b03227753.png\",\"price\":\"0.01\",\"detail_images\":\"\\/uploads\\/20180926\\/1081547cd52217b0e109d01ba539f9ec.png,\\/uploads\\/20180926\\/fdb1dcbfdd72a2819003c537dcc5dbfc.png,\\/uploads\\/20180926\\/106657709052b14aed7f07f07f1dab21.png\",\"sales_sum\":\"0\",\"is_recommend\":\"1\",\"category_id\":\"7\",\"freight\":\"0.00\",\"keywords\":\"\\u6d4b\\u8bd5\",\"comment_count\":\"0\",\"is_on_sale\":\"1\",\"weigh\":\"0\",\"status\":\"1\"}}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946622');
INSERT INTO `ds_admin_log` VALUES ('418', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946629');
INSERT INTO `ds_admin_log` VALUES ('419', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946629');
INSERT INTO `ds_admin_log` VALUES ('420', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946630');
INSERT INTO `ds_admin_log` VALUES ('421', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946630');
INSERT INTO `ds_admin_log` VALUES ('422', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946631');
INSERT INTO `ds_admin_log` VALUES ('423', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\",\"22\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946631');
INSERT INTO `ds_admin_log` VALUES ('424', '1', 'admin', '/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\",\"22\",\"23\"]},\"goods_id\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946631');
INSERT INTO `ds_admin_log` VALUES ('425', '1', 'admin', '/admin/goods/goods/detail/ids/6?dialog=1', '精选管理 精选列表 商品详情', '{\"dialog\":\"1\",\"goods_id\":\"6\",\"row\":{\"item\":{\"17,20\":{\"price\":\"0.01\",\"image\":\"\"},\"17,21\":{\"price\":\"0.01\",\"image\":\"\"},\"17,22\":{\"price\":\"0.01\",\"image\":\"\"},\"17,23\":{\"price\":\"0.01\",\"image\":\"\"},\"18,20\":{\"price\":\"0.01\",\"image\":\"\"},\"18,21\":{\"price\":\"0.01\",\"image\":\"\"},\"18,22\":{\"price\":\"0.01\",\"image\":\"\"},\"18,23\":{\"price\":\"0.01\",\"image\":\"\"},\"19,20\":{\"price\":\"0.01\",\"image\":\"\"},\"19,21\":{\"price\":\"0.01\",\"image\":\"\"},\"19,22\":{\"price\":\"0.01\",\"image\":\"\"},\"19,23\":{\"price\":\"0.01\",\"image\":\"\"}}},\"ids\":\"6\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537946664');
INSERT INTO `ds_admin_log` VALUES ('426', '1', 'admin', '/index.php/admin/order/goods/detail/ids/25?dialog=1', '订单管理 精选订单 精选订单详情', '{\"dialog\":\"1\",\"row\":{\"status\":\"3\"},\"ids\":\"25\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537949425');
INSERT INTO `ds_admin_log` VALUES ('427', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952239');
INSERT INTO `ds_admin_log` VALUES ('428', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952475');
INSERT INTO `ds_admin_log` VALUES ('429', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952538');
INSERT INTO `ds_admin_log` VALUES ('430', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952544');
INSERT INTO `ds_admin_log` VALUES ('431', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952866');
INSERT INTO `ds_admin_log` VALUES ('432', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952869');
INSERT INTO `ds_admin_log` VALUES ('433', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-25 00:00:00 - 2018-09-25 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952877');
INSERT INTO `ds_admin_log` VALUES ('434', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-20 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537952891');
INSERT INTO `ds_admin_log` VALUES ('435', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537953190');
INSERT INTO `ds_admin_log` VALUES ('436', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1537953193');
INSERT INTO `ds_admin_log` VALUES ('437', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538014779');
INSERT INTO `ds_admin_log` VALUES ('438', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538014785');
INSERT INTO `ds_admin_log` VALUES ('439', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538015831');
INSERT INTO `ds_admin_log` VALUES ('440', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538015835');
INSERT INTO `ds_admin_log` VALUES ('441', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016063');
INSERT INTO `ds_admin_log` VALUES ('442', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016092');
INSERT INTO `ds_admin_log` VALUES ('443', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016158');
INSERT INTO `ds_admin_log` VALUES ('444', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016239');
INSERT INTO `ds_admin_log` VALUES ('445', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016582');
INSERT INTO `ds_admin_log` VALUES ('446', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016635');
INSERT INTO `ds_admin_log` VALUES ('447', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016674');
INSERT INTO `ds_admin_log` VALUES ('448', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016722');
INSERT INTO `ds_admin_log` VALUES ('449', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538016825');
INSERT INTO `ds_admin_log` VALUES ('450', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017101');
INSERT INTO `ds_admin_log` VALUES ('451', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017196');
INSERT INTO `ds_admin_log` VALUES ('452', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017230');
INSERT INTO `ds_admin_log` VALUES ('453', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017661');
INSERT INTO `ds_admin_log` VALUES ('454', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017673');
INSERT INTO `ds_admin_log` VALUES ('455', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017719');
INSERT INTO `ds_admin_log` VALUES ('456', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017723');
INSERT INTO `ds_admin_log` VALUES ('457', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017728');
INSERT INTO `ds_admin_log` VALUES ('458', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538017802');
INSERT INTO `ds_admin_log` VALUES ('459', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018088');
INSERT INTO `ds_admin_log` VALUES ('460', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018136');
INSERT INTO `ds_admin_log` VALUES ('461', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018442');
INSERT INTO `ds_admin_log` VALUES ('462', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018622');
INSERT INTO `ds_admin_log` VALUES ('463', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018769');
INSERT INTO `ds_admin_log` VALUES ('464', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018804');
INSERT INTO `ds_admin_log` VALUES ('465', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018868');
INSERT INTO `ds_admin_log` VALUES ('466', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538018904');
INSERT INTO `ds_admin_log` VALUES ('467', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019276');
INSERT INTO `ds_admin_log` VALUES ('468', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019297');
INSERT INTO `ds_admin_log` VALUES ('469', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019378');
INSERT INTO `ds_admin_log` VALUES ('470', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019602');
INSERT INTO `ds_admin_log` VALUES ('471', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019649');
INSERT INTO `ds_admin_log` VALUES ('472', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019774');
INSERT INTO `ds_admin_log` VALUES ('473', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538019813');
INSERT INTO `ds_admin_log` VALUES ('474', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020236');
INSERT INTO `ds_admin_log` VALUES ('475', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020320');
INSERT INTO `ds_admin_log` VALUES ('476', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020348');
INSERT INTO `ds_admin_log` VALUES ('477', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020380');
INSERT INTO `ds_admin_log` VALUES ('478', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020418');
INSERT INTO `ds_admin_log` VALUES ('479', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020530');
INSERT INTO `ds_admin_log` VALUES ('480', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020535');
INSERT INTO `ds_admin_log` VALUES ('481', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020648');
INSERT INTO `ds_admin_log` VALUES ('482', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020670');
INSERT INTO `ds_admin_log` VALUES ('483', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020714');
INSERT INTO `ds_admin_log` VALUES ('484', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020720');
INSERT INTO `ds_admin_log` VALUES ('485', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020771');
INSERT INTO `ds_admin_log` VALUES ('486', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020776');
INSERT INTO `ds_admin_log` VALUES ('487', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020890');
INSERT INTO `ds_admin_log` VALUES ('488', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020895');
INSERT INTO `ds_admin_log` VALUES ('489', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020942');
INSERT INTO `ds_admin_log` VALUES ('490', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538020946');
INSERT INTO `ds_admin_log` VALUES ('491', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538024820');
INSERT INTO `ds_admin_log` VALUES ('492', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538024839');
INSERT INTO `ds_admin_log` VALUES ('493', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538024924');
INSERT INTO `ds_admin_log` VALUES ('494', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538025078');
INSERT INTO `ds_admin_log` VALUES ('495', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538025115');
INSERT INTO `ds_admin_log` VALUES ('496', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538025123');
INSERT INTO `ds_admin_log` VALUES ('497', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-27 00:00:00 - 2018-09-27 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538025133');
INSERT INTO `ds_admin_log` VALUES ('498', '1', 'admin', '/index.php/admin/index/login?url=%2Findex.php%2Fadmin', '登录', '{\"url\":\"\\/index.php\\/admin\",\"__token__\":\"f0a8ccce7cab7f26fe555ac40f8103f3\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030089');
INSERT INTO `ds_admin_log` VALUES ('499', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030093');
INSERT INTO `ds_admin_log` VALUES ('500', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030106');
INSERT INTO `ds_admin_log` VALUES ('501', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-27 00:00:00 - 2018-09-27 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030110');
INSERT INTO `ds_admin_log` VALUES ('502', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-21 00:00:00 - 2018-09-27 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030121');
INSERT INTO `ds_admin_log` VALUES ('503', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-27 00:00:00 - 2018-09-27 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030162');
INSERT INTO `ds_admin_log` VALUES ('504', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030168');
INSERT INTO `ds_admin_log` VALUES ('505', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030302');
INSERT INTO `ds_admin_log` VALUES ('506', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-27 00:00:00 - 2018-09-27 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030314');
INSERT INTO `ds_admin_log` VALUES ('507', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030320');
INSERT INTO `ds_admin_log` VALUES ('508', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-21 00:00:00 - 2018-09-27 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030343');
INSERT INTO `ds_admin_log` VALUES ('509', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030434');
INSERT INTO `ds_admin_log` VALUES ('510', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030449');
INSERT INTO `ds_admin_log` VALUES ('511', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030579');
INSERT INTO `ds_admin_log` VALUES ('512', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030605');
INSERT INTO `ds_admin_log` VALUES ('513', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030618');
INSERT INTO `ds_admin_log` VALUES ('514', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030652');
INSERT INTO `ds_admin_log` VALUES ('515', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-09-26 00:00:00 - 2018-09-26 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538030661');
INSERT INTO `ds_admin_log` VALUES ('516', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538031157');
INSERT INTO `ds_admin_log` VALUES ('517', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538031189');
INSERT INTO `ds_admin_log` VALUES ('518', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538031224');
INSERT INTO `ds_admin_log` VALUES ('519', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538031931');
INSERT INTO `ds_admin_log` VALUES ('520', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538032056');
INSERT INTO `ds_admin_log` VALUES ('521', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538032204');
INSERT INTO `ds_admin_log` VALUES ('522', '1', 'admin', '/index.php/admin/finance/goods?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538032205');
INSERT INTO `ds_admin_log` VALUES ('523', '1', 'admin', '/index.php/admin/goods/goods/ajaxGetSpecInput', '', '{\"spec_arr\":{\"8\":[\"17\",\"18\",\"19\"],\"9\":[\"20\",\"21\",\"22\",\"23\"]},\"goods_id\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538032222');
INSERT INTO `ds_admin_log` VALUES ('524', '1', 'admin', '/index.php/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"* * * * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538032985');
INSERT INTO `ds_admin_log` VALUES ('525', '1', 'admin', '/index.php/admin/general/crontab/check_schedule', '', '{\"row\":{\"schedule\":\"* 0 *\\/1 * *\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033044');
INSERT INTO `ds_admin_log` VALUES ('526', '1', 'admin', '/index.php/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"* 0 *\\/1 * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033044');
INSERT INTO `ds_admin_log` VALUES ('527', '1', 'admin', '/index.php/admin/general/crontab/check_schedule', '', '{\"row\":{\"schedule\":\"* 0 1\\/* * *\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033085');
INSERT INTO `ds_admin_log` VALUES ('528', '1', 'admin', '/index.php/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"* 0 1\\/* * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033085');
INSERT INTO `ds_admin_log` VALUES ('529', '1', 'admin', '/index.php/admin/general/crontab/check_schedule', '', '{\"row\":{\"schedule\":\"* 0 * * *\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033095');
INSERT INTO `ds_admin_log` VALUES ('530', '1', 'admin', '/index.php/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"* 0 * * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033095');
INSERT INTO `ds_admin_log` VALUES ('531', '1', 'admin', '/index.php/admin/general/crontab/check_schedule', '', '{\"row\":{\"schedule\":\"0 0 *\\/1 * *\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033115');
INSERT INTO `ds_admin_log` VALUES ('532', '1', 'admin', '/index.php/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"0 0 *\\/1 * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033115');
INSERT INTO `ds_admin_log` VALUES ('533', '1', 'admin', '/index.php/admin/general/crontab/get_schedule_future', '', '{\"schedule\":\"* * * * *\",\"days\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538033241');
INSERT INTO `ds_admin_log` VALUES ('534', '1', 'admin', '/admin/index/login?url=%2Fadmin', '登录', '{\"url\":\"\\/admin\",\"__token__\":\"11a769843c3826e40bde7843ab0caebe\",\"username\":\"admin\"}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538035818');
INSERT INTO `ds_admin_log` VALUES ('535', '1', 'admin', '/index.php/admin/finance/dish?addtabs=1', '', '{\"addtabs\":\"1\",\"createtime\":\"2018-01-01 00:00:00 - 2018-12-31 23:59:59\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538036969');
INSERT INTO `ds_admin_log` VALUES ('536', '1', 'admin', '/admin/category/selectpage', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"7\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"7\",\"searchField\":[\"name\"]}', '36.24.221.42', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '1538038903');

-- ----------------------------
-- Table structure for ds_apply_goods
-- ----------------------------
DROP TABLE IF EXISTS `ds_apply_goods`;
CREATE TABLE `ds_apply_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_intro` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_images` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` enum('2','1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=申请失败,1=申请中,2=申请成功',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_apply_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ds_apply_horseman
-- ----------------------------
DROP TABLE IF EXISTS `ds_apply_horseman`;
CREATE TABLE `ds_apply_horseman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `status` enum('2','1','0') NOT NULL DEFAULT '1' COMMENT '申请状态:0=申请失败,1=申请中,2=申请成功',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_apply_horseman
-- ----------------------------

-- ----------------------------
-- Table structure for ds_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ds_attachment`;
CREATE TABLE `ds_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of ds_attachment
-- ----------------------------
INSERT INTO `ds_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `ds_attachment` VALUES ('2', '1', '0', '/uploads/20180920/a3fe84d16d5427ac188ce2d742aafa69.png', '430', '430', 'png', '0', '29430', 'image/png', '', '1537446273', '1537446273', '1537446273', 'local', 'c4d54df5213b1d7eb06a09c1cd6efe6f80ef641b');
INSERT INTO `ds_attachment` VALUES ('3', '1', '0', '/uploads/20180920/03473f8cef4f2d471ff90d184a0e2e4f.png', '430', '430', 'png', '0', '31455', 'image/png', '', '1537446293', '1537446293', '1537446293', 'local', 'd297e3380cf7b388b3470c3170d5b44774cad6a5');
INSERT INTO `ds_attachment` VALUES ('4', '1', '0', '/uploads/20180920/907645faaa9980086c4e765b03227753.png', '430', '430', 'png', '0', '36304', 'image/png', '', '1537446312', '1537446312', '1537446312', 'local', '4984334e5ea00f6652a6a6a7c462fb033710eefd');
INSERT INTO `ds_attachment` VALUES ('5', '1', '0', '/uploads/20180920/e40f3db079e3f4af8004375e032fb1d3.png', '430', '430', 'png', '0', '20934', 'image/png', '', '1537446330', '1537446330', '1537446330', 'local', '6605d5a18e1292108a710261f6577a502369bb9d');
INSERT INTO `ds_attachment` VALUES ('6', '0', '0', '/uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '430', '430', 'png', '0', '20934', 'image/png', '', '1537497868', '1537497868', '1537497868', 'local', '6605d5a18e1292108a710261f6577a502369bb9d');
INSERT INTO `ds_attachment` VALUES ('7', '0', '0', '/uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '430', '430', 'png', '0', '32288', 'image/png', '', '1537497924', '1537497924', '1537497924', 'local', '5debc0ae968febca7f52935f77e07ac709889dba');
INSERT INTO `ds_attachment` VALUES ('8', '0', '0', '/uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '430', '430', 'png', '0', '20934', 'image/png', '', '1537497983', '1537497983', '1537497983', 'local', '6605d5a18e1292108a710261f6577a502369bb9d');
INSERT INTO `ds_attachment` VALUES ('9', '0', '0', '/uploads/20180921/0a68cb0c545102331e467cea998cfc39.png', '430', '430', 'png', '0', '36238', 'image/png', '', '1537497991', '1537497991', '1537497991', 'local', 'b124c4a6033db4bfff6875d1ba716b580b0ccb40');
INSERT INTO `ds_attachment` VALUES ('10', '0', '0', '/uploads/20180921/9d7996b0aebe8f9b520af839779e9eff.png', '430', '430', 'png', '0', '45287', 'image/png', '', '1537497999', '1537497999', '1537497999', 'local', 'b8ce907980c52eaa3bb451100eddc4ae968774d7');
INSERT INTO `ds_attachment` VALUES ('11', '0', '0', '/uploads/20180921/17bdff847693a6df687a0c2dc10a4cf0.png', '750', '400', 'png', '0', '16891', 'image/png', '', '1537498023', '1537498023', '1537498023', 'local', 'b3dbbf476a1dcf72c3d8ae4fe40f2cd05f616f4a');
INSERT INTO `ds_attachment` VALUES ('12', '0', '0', '/uploads/20180921/7307a7cacfe318981814beacd874fccc.png', '750', '400', 'png', '0', '48100', 'image/png', '', '1537498023', '1537498023', '1537498023', 'local', 'c4498e4b210b051c97763c256e814330f62dfc61');
INSERT INTO `ds_attachment` VALUES ('13', '0', '0', '/uploads/20180921/583f0f69c438a6cb4add8c77f2fa3b2c.png', '750', '400', 'png', '0', '48063', 'image/png', '', '1537498023', '1537498023', '1537498023', 'local', 'b364a5e2e931aeb91396dba5783ca1d6c45a8573');
INSERT INTO `ds_attachment` VALUES ('14', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537498024', '1537498024', '1537498024', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('15', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537498024', '1537498024', '1537498024', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('16', '0', '0', '/uploads/20180921/0c0bad67d546cc2fbadce09c08922611.png', '750', '400', 'png', '0', '70484', 'image/png', '', '1537498024', '1537498024', '1537498024', 'local', 'b83dee2b53c6eee1629eea3bfdf4f7b9348b64af');
INSERT INTO `ds_attachment` VALUES ('17', '0', '0', '/uploads/20180921/ee18f9ede4e77a5439e5da6d5e64da56.png', '750', '400', 'png', '0', '13892', 'image/png', '', '1537498024', '1537498024', '1537498024', 'local', 'ede7df8fa68d4affe150c7f46a9188bdb4bcafd0');
INSERT INTO `ds_attachment` VALUES ('18', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537516679', '1537516679', '1537516679', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('19', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537516705', '1537516705', '1537516705', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('20', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537516763', '1537516763', '1537516763', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('21', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537516817', '1537516817', '1537516817', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('22', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537516916', '1537516916', '1537516916', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('23', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537517082', '1537517082', '1537517082', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('24', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537517102', '1537517102', '1537517102', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('25', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537517492', '1537517492', '1537517492', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('26', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537517509', '1537517509', '1537517509', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('27', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537517678', '1537517678', '1537517678', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('28', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537517766', '1537517766', '1537517766', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('29', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518207', '1537518207', '1537518207', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('30', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518244', '1537518244', '1537518244', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('31', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518271', '1537518271', '1537518271', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('32', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537518290', '1537518290', '1537518290', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('33', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537518300', '1537518300', '1537518299', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('34', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537518349', '1537518349', '1537518349', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('35', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518414', '1537518414', '1537518414', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('36', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518450', '1537518450', '1537518450', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('37', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537518484', '1537518484', '1537518484', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('38', '0', '0', '/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537518500', '1537518500', '1537518500', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('39', '0', '0', '/uploads/20180921/0c0bad67d546cc2fbadce09c08922611.png', '750', '400', 'png', '0', '70484', 'image/png', '', '1537518514', '1537518514', '1537518514', 'local', 'b83dee2b53c6eee1629eea3bfdf4f7b9348b64af');
INSERT INTO `ds_attachment` VALUES ('40', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518520', '1537518520', '1537518520', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('41', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537518776', '1537518776', '1537518776', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('42', '0', '0', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537525153', '1537525153', '1537525153', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('43', '0', '0', '/uploads/20180925/847f69f35141423b0cdbe4354b48530a.png', '750', '400', 'png', '0', '33034', 'image/png', '', '1537844176', '1537844176', '1537844176', 'local', 'aaa15acd057467fcffdfac1e70afca22863deb53');
INSERT INTO `ds_attachment` VALUES ('44', '0', '0', '/uploads/20180925/847f69f35141423b0cdbe4354b48530a.png', '750', '400', 'png', '0', '33034', 'image/png', '', '1537844299', '1537844299', '1537844299', 'local', 'aaa15acd057467fcffdfac1e70afca22863deb53');
INSERT INTO `ds_attachment` VALUES ('45', '0', '0', '/uploads/20180925/8c092c092c451effe078b3780c3b0460.png', '750', '400', 'png', '0', '107730', 'image/png', '', '1537844315', '1537844315', '1537844315', 'local', 'd179444f72faf0dc01daf07c6311e129a70f3f7b');
INSERT INTO `ds_attachment` VALUES ('46', '0', '0', '/uploads/20180925/affd6e7bc794bbde7a8b3867c83c3b97.png', '750', '400', 'png', '0', '99495', 'image/png', '', '1537844331', '1537844331', '1537844330', 'local', '30243a12b3b5f8fa283b2b448aca9887fa84df75');
INSERT INTO `ds_attachment` VALUES ('47', '0', '0', '/uploads/20180925/c05f69d47b67753fc98ea7bc63077574.png', '750', '400', 'png', '0', '55193', 'image/png', '', '1537844343', '1537844343', '1537844343', 'local', '95b6fa71c7390223a2ea5172abe1123fad63eaa5');
INSERT INTO `ds_attachment` VALUES ('48', '0', '0', '/uploads/20180925/d30d00938080b4b65d34a2e11071ca00.png', '520', '200', 'png', '0', '30985', 'image/png', '', '1537847109', '1537847109', '1537847109', 'local', '09e9453243d04a68f77fcfada0234ab3d7fcbafb');
INSERT INTO `ds_attachment` VALUES ('49', '0', '0', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '520', '200', 'png', '0', '21335', 'image/png', '', '1537859112', '1537859112', '1537859112', 'local', '9c4c4adea06191ab3a36b3fc306945515a086a56');
INSERT INTO `ds_attachment` VALUES ('50', '0', '0', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '520', '200', 'png', '0', '21335', 'image/png', '', '1537859240', '1537859240', '1537859240', 'local', '9c4c4adea06191ab3a36b3fc306945515a086a56');
INSERT INTO `ds_attachment` VALUES ('51', '0', '0', '/uploads/20180925/96d76df473ce47a51e352270a00ce748.png', '520', '200', 'png', '0', '24662', 'image/png', '', '1537859869', '1537859869', '1537859869', 'local', '1b6095a0fe3525d1d4b63ead7909d1c7aa6a8b45');
INSERT INTO `ds_attachment` VALUES ('52', '0', '0', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '520', '200', 'png', '0', '21335', 'image/png', '', '1537859883', '1537859883', '1537859883', 'local', '9c4c4adea06191ab3a36b3fc306945515a086a56');
INSERT INTO `ds_attachment` VALUES ('53', '0', '0', '/uploads/20180925/652cb7a7217aa9b19ea7c600f1a323c9.png', '750', '400', 'png', '0', '62357', 'image/png', '', '1537862965', '1537862965', '1537862965', 'local', 'dfd91bb8598dc4ddf84137bf98bdbbf3ff094e64');
INSERT INTO `ds_attachment` VALUES ('54', '0', '0', '/uploads/20180925/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537863200', '1537863200', '1537863199', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('55', '0', '0', '/uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', '375', '375', 'png', '0', '29262', 'image/png', '', '1537863653', '1537863653', '1537863653', 'local', 'd2c75561ca86d7d4a6656eabd3c4d77636f46a9a');
INSERT INTO `ds_attachment` VALUES ('56', '0', '0', '/uploads/20180925/59679590fbbe1e928ebc5feea2b9857a.png', '750', '400', 'png', '0', '78025', 'image/png', '', '1537863780', '1537863780', '1537863780', 'local', '4623db76991ec7e68cd351361a0c4fb7c22e32e4');
INSERT INTO `ds_attachment` VALUES ('57', '0', '0', '/uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', '375', '375', 'png', '0', '29262', 'image/png', '', '1537863798', '1537863798', '1537863798', 'local', 'd2c75561ca86d7d4a6656eabd3c4d77636f46a9a');
INSERT INTO `ds_attachment` VALUES ('58', '0', '0', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '520', '200', 'png', '0', '21335', 'image/png', '', '1537863909', '1537863909', '1537863909', 'local', '9c4c4adea06191ab3a36b3fc306945515a086a56');
INSERT INTO `ds_attachment` VALUES ('59', '0', '0', '/uploads/20180925/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537868162', '1537868162', '1537868162', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('60', '0', '0', '/uploads/20180925/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537868253', '1537868253', '1537868253', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('61', '0', '0', '/uploads/20180925/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537868306', '1537868306', '1537868306', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('62', '0', '0', '/uploads/20180925/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537868353', '1537868353', '1537868353', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('63', '0', '0', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '520', '200', 'png', '0', '21335', 'image/png', '', '1537868424', '1537868424', '1537868424', 'local', '9c4c4adea06191ab3a36b3fc306945515a086a56');
INSERT INTO `ds_attachment` VALUES ('64', '0', '0', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '520', '200', 'png', '0', '21335', 'image/png', '', '1537868437', '1537868437', '1537868437', 'local', '9c4c4adea06191ab3a36b3fc306945515a086a56');
INSERT INTO `ds_attachment` VALUES ('65', '0', '0', '/uploads/20180925/0c0bad67d546cc2fbadce09c08922611.png', '750', '400', 'png', '0', '70484', 'image/png', '', '1537868453', '1537868453', '1537868453', 'local', 'b83dee2b53c6eee1629eea3bfdf4f7b9348b64af');
INSERT INTO `ds_attachment` VALUES ('66', '0', '0', '/uploads/20180925/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537868494', '1537868494', '1537868493', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('67', '0', '0', '/uploads/20180925/0c0bad67d546cc2fbadce09c08922611.png', '750', '400', 'png', '0', '70484', 'image/png', '', '1537868508', '1537868508', '1537868508', 'local', 'b83dee2b53c6eee1629eea3bfdf4f7b9348b64af');
INSERT INTO `ds_attachment` VALUES ('68', '0', '0', '/uploads/20180925/988f09da7915ca6c94eba1aae1bf8f3e.png', '750', '400', 'png', '0', '67676', 'image/png', '', '1537868618', '1537868618', '1537868618', 'local', 'dda97a3c90374fa475a52518dd534624ebfb5bb8');
INSERT INTO `ds_attachment` VALUES ('69', '0', '0', '/uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', '375', '375', 'png', '0', '29262', 'image/png', '', '1537869572', '1537869572', '1537869572', 'local', 'd2c75561ca86d7d4a6656eabd3c4d77636f46a9a');
INSERT INTO `ds_attachment` VALUES ('70', '0', '0', '/uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '430', '430', 'png', '0', '25735', 'image/png', '', '1537946583', '1537946583', '1537946583', 'local', 'b8cff0f4f097eb3e1eeb2aa7d01fbb1cfc9a565c');
INSERT INTO `ds_attachment` VALUES ('71', '0', '0', '/uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '430', '430', 'png', '0', '25735', 'image/png', '', '1537946592', '1537946592', '1537946592', 'local', 'b8cff0f4f097eb3e1eeb2aa7d01fbb1cfc9a565c');
INSERT INTO `ds_attachment` VALUES ('72', '0', '0', '/uploads/20180926/bb4fe93eafa815a0edcfbed2ff5f4ee2.png', '430', '430', 'png', '0', '26131', 'image/png', '', '1537946592', '1537946592', '1537946592', 'local', 'fcf09674b843f87d9e713bf45d62cc87a9f6a460');
INSERT INTO `ds_attachment` VALUES ('73', '0', '0', '/uploads/20180926/907645faaa9980086c4e765b03227753.png', '430', '430', 'png', '0', '36304', 'image/png', '', '1537946592', '1537946592', '1537946592', 'local', '4984334e5ea00f6652a6a6a7c462fb033710eefd');
INSERT INTO `ds_attachment` VALUES ('74', '0', '0', '/uploads/20180926/1081547cd52217b0e109d01ba539f9ec.png', '430', '430', 'png', '0', '37384', 'image/png', '', '1537946604', '1537946604', '1537946604', 'local', 'b1dc0c6c0e4298919e5afb9dfd6e247699a6208e');
INSERT INTO `ds_attachment` VALUES ('75', '0', '0', '/uploads/20180926/fdb1dcbfdd72a2819003c537dcc5dbfc.png', '430', '430', 'png', '0', '23573', 'image/png', '', '1537946604', '1537946604', '1537946604', 'local', 'a5b1d0872dc9a84094e2cf28b66a06685b2a78ba');
INSERT INTO `ds_attachment` VALUES ('76', '0', '0', '/uploads/20180926/106657709052b14aed7f07f07f1dab21.png', '430', '430', 'png', '0', '32104', 'image/png', '', '1537946605', '1537946605', '1537946605', 'local', '90e0eab21ae01bc09ff41eda8adf009fbb7d5005');

-- ----------------------------
-- Table structure for ds_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ds_auth_group`;
CREATE TABLE `ds_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of ds_auth_group
-- ----------------------------
INSERT INTO `ds_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `ds_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `ds_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `ds_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `ds_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');

-- ----------------------------
-- Table structure for ds_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ds_auth_group_access`;
CREATE TABLE `ds_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of ds_auth_group_access
-- ----------------------------
INSERT INTO `ds_auth_group_access` VALUES ('1', '1');
INSERT INTO `ds_auth_group_access` VALUES ('2', '2');
INSERT INTO `ds_auth_group_access` VALUES ('3', '3');
INSERT INTO `ds_auth_group_access` VALUES ('4', '5');
INSERT INTO `ds_auth_group_access` VALUES ('5', '5');

-- ----------------------------
-- Table structure for ds_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ds_auth_rule`;
CREATE TABLE `ds_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of ds_auth_rule
-- ----------------------------
INSERT INTO `ds_auth_rule` VALUES ('1', 'file', '0', 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', '1', '1497429920', '1497429920', '143', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('3', 'file', '0', 'category', 'Category', 'fa fa-list', '', 'Category tips', '1', '1497429920', '1497429920', '119', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('4', 'file', '0', 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', '1', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '1', '1497429920', '1497430092', '99', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'fa fa-user', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', '菜单管理', 'fa fa-bars', '', 'Rule tips', '1', '1497429920', '1537450307', '104', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('59', 'file', '4', 'addon/local', 'Local install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('61', 'file', '4', 'addon/install', 'Install', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('62', 'file', '4', 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('66', 'file', '0', 'user', 'User', 'fa fa-list', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('67', 'file', '66', 'user/user', 'User', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('68', 'file', '67', 'user/user/index', '查看', 'fa fa-circle-o', '', '', '0', '1516374729', '1537442409', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1516374729', '1537442409', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('70', 'file', '67', 'user/user/add', '添加', 'fa fa-circle-o', '', '', '0', '1516374729', '1537442409', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('71', 'file', '67', 'user/user/del', '删除', 'fa fa-circle-o', '', '', '0', '1516374729', '1537442409', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1516374729', '1537442409', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('85', 'file', '66', 'user/address', '用户地址', 'fa fa-circle-o', '', '', '1', '1537442427', '1537442477', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('86', 'file', '85', 'user/address/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442428', '1537447237', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('87', 'file', '85', 'user/address/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442428', '1537447237', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('88', 'file', '85', 'user/address/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442428', '1537447237', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('89', 'file', '85', 'user/address/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442428', '1537447237', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('90', 'file', '85', 'user/address/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442428', '1537447237', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('91', 'file', '66', 'user/coupon', '会员优惠券', 'fa fa-circle-o', '', '', '1', '1537442441', '1537442495', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('92', 'file', '91', 'user/coupon/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442441', '1537442441', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('93', 'file', '91', 'user/coupon/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442441', '1537442441', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('94', 'file', '91', 'user/coupon/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442441', '1537442441', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('95', 'file', '91', 'user/coupon/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442441', '1537442441', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('96', 'file', '91', 'user/coupon/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442441', '1537442441', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('97', 'file', '0', 'dish', '早餐管理', 'fa fa-list', '', '', '1', '1537442533', '1537442802', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('98', 'file', '97', 'dish/dish', '早餐列表', 'fa fa-circle-o', '', '', '1', '1537442533', '1537442818', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('99', 'file', '98', 'dish/dish/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442533', '1537442533', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('100', 'file', '98', 'dish/dish/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442533', '1537442533', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('101', 'file', '98', 'dish/dish/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442533', '1537442533', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('102', 'file', '98', 'dish/dish/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442533', '1537442533', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('103', 'file', '98', 'dish/dish/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442533', '1537442533', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('104', 'file', '97', 'dish/spec', '套餐模型', 'fa fa-circle-o', '', '', '1', '1537442578', '1537442830', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('105', 'file', '104', 'dish/spec/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442578', '1537449790', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('106', 'file', '104', 'dish/spec/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442578', '1537449790', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('107', 'file', '104', 'dish/spec/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442578', '1537449790', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('108', 'file', '104', 'dish/spec/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442578', '1537449790', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('109', 'file', '104', 'dish/spec/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442578', '1537449790', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('110', 'file', '0', 'goods', '精选管理', 'fa fa-list', '', '', '1', '1537442619', '1537442841', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('111', 'file', '110', 'goods/goods', '精选列表', 'fa fa-circle-o', '', '', '1', '1537442619', '1537442853', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('112', 'file', '111', 'goods/goods/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442619', '1537442619', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('113', 'file', '111', 'goods/goods/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442619', '1537442619', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('114', 'file', '111', 'goods/goods/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442619', '1537442619', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('115', 'file', '111', 'goods/goods/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442619', '1537442619', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('116', 'file', '111', 'goods/goods/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442619', '1537442619', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('117', 'file', '110', 'goods/spec', '规格管理', 'fa fa-circle-o', '', '', '1', '1537442658', '1537442869', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('118', 'file', '117', 'goods/spec/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442658', '1537442658', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('119', 'file', '117', 'goods/spec/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442658', '1537442658', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('120', 'file', '117', 'goods/spec/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442658', '1537442658', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('121', 'file', '117', 'goods/spec/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442658', '1537442658', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('122', 'file', '117', 'goods/spec/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442658', '1537442658', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('123', 'file', '110', 'goods/comment', '评论管理', 'fa fa-comment', '', '', '1', '1537442686', '1537442878', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('124', 'file', '123', 'goods/comment/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442686', '1537442686', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('125', 'file', '123', 'goods/comment/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442686', '1537442686', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('126', 'file', '123', 'goods/comment/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442686', '1537442686', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('127', 'file', '123', 'goods/comment/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442686', '1537442686', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('128', 'file', '123', 'goods/comment/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442686', '1537442686', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('129', 'file', '0', 'order', '订单管理', 'fa fa-list', '', '', '1', '1537442734', '1537442890', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('130', 'file', '129', 'order/dish', '早餐订单', 'fa fa-circle-o', '', '', '1', '1537442734', '1537442899', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('131', 'file', '130', 'order/dish/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442734', '1537447016', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('132', 'file', '130', 'order/dish/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442734', '1537447016', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('133', 'file', '130', 'order/dish/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442734', '1537447016', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('134', 'file', '130', 'order/dish/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442734', '1537447016', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('135', 'file', '130', 'order/dish/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442734', '1537447016', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('136', 'file', '129', 'order/goods', '精选订单', 'fa fa-circle-o', '', '', '1', '1537442744', '1537442909', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('137', 'file', '136', 'order/goods/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442744', '1537442744', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('138', 'file', '136', 'order/goods/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442744', '1537442744', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('139', 'file', '136', 'order/goods/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442744', '1537442744', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('140', 'file', '136', 'order/goods/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442744', '1537442744', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('141', 'file', '136', 'order/goods/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442744', '1537442744', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('142', 'file', '0', 'banner', '广告管理', 'fa fa-list', '', '', '1', '1537442972', '1537444039', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('143', 'file', '142', 'banner/banner', '广告位', 'fa fa-circle-o', '', '', '1', '1537442973', '1537444053', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('144', 'file', '143', 'banner/banner/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442973', '1537442973', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('145', 'file', '143', 'banner/banner/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442973', '1537442973', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('146', 'file', '143', 'banner/banner/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442973', '1537442973', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('147', 'file', '143', 'banner/banner/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442973', '1537442973', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('148', 'file', '143', 'banner/banner/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442973', '1537442973', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('149', 'file', '142', 'banner/item', '广告列表', 'fa fa-circle-o', '', '', '1', '1537442982', '1537444064', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('150', 'file', '149', 'banner/item/index', '查看', 'fa fa-circle-o', '', '', '0', '1537442982', '1537442982', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('151', 'file', '149', 'banner/item/add', '添加', 'fa fa-circle-o', '', '', '0', '1537442983', '1537442983', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('152', 'file', '149', 'banner/item/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537442983', '1537442983', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('153', 'file', '149', 'banner/item/del', '删除', 'fa fa-circle-o', '', '', '0', '1537442983', '1537442983', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('154', 'file', '149', 'banner/item/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537442983', '1537442983', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('155', 'file', '0', 'coupon', '优惠券管理', 'fa fa-list', '', '', '1', '1537443970', '1537444074', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('156', 'file', '155', 'coupon/coupon', '优惠券管理', 'fa fa-circle-o', '', '', '1', '1537443970', '1537444085', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('157', 'file', '156', 'coupon/coupon/index', '查看', 'fa fa-circle-o', '', '', '0', '1537443970', '1537443970', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('158', 'file', '156', 'coupon/coupon/add', '添加', 'fa fa-circle-o', '', '', '0', '1537443970', '1537443970', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('159', 'file', '156', 'coupon/coupon/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537443970', '1537443970', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('160', 'file', '156', 'coupon/coupon/del', '删除', 'fa fa-circle-o', '', '', '0', '1537443970', '1537443970', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('161', 'file', '156', 'coupon/coupon/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537443970', '1537443970', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('162', 'file', '155', 'coupon/giveout', '发放优惠券', 'fa fa-circle-o', '', '', '1', '1537444015', '1537444097', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('163', 'file', '162', 'coupon/giveout/index', '查看', 'fa fa-circle-o', '', '', '0', '1537444015', '1537444015', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('164', 'file', '162', 'coupon/giveout/add', '添加', 'fa fa-circle-o', '', '', '0', '1537444015', '1537444015', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('165', 'file', '162', 'coupon/giveout/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537444015', '1537444015', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('166', 'file', '162', 'coupon/giveout/del', '删除', 'fa fa-circle-o', '', '', '0', '1537444015', '1537444015', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('167', 'file', '162', 'coupon/giveout/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537444015', '1537444015', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('168', 'file', '2', 'general/crontab', '定时任务', 'fa fa-tasks', '', '类似于Linux的Crontab定时任务,可以按照设定的时间进行任务的执行,目前仅支持三种任务:请求URL、执行SQL、执行Shell', '1', '1537447879', '1537447879', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('169', 'file', '168', 'general/crontab/index', '查看', 'fa fa-circle-o', '', '', '0', '1537447879', '1537447879', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('170', 'file', '168', 'general/crontab/add', '添加', 'fa fa-circle-o', '', '', '0', '1537447879', '1537447879', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('171', 'file', '168', 'general/crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', '0', '1537447879', '1537447879', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('172', 'file', '168', 'general/crontab/del', '删除', 'fa fa-circle-o', '', '', '0', '1537447879', '1537447879', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('173', 'file', '168', 'general/crontab/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537447880', '1537447880', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('174', 'file', '111', 'goods/goods/detail', '商品详情', 'fa fa-circle-o', '', '', '0', '1537934116', '1537934116', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('175', 'file', '130', 'order/dish/detail', '早餐订单详情', 'fa fa-circle-o', '', '', '0', '1537934153', '1537934153', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('176', 'file', '136', 'order/goods/detail', '精选订单详情', 'fa fa-circle-o', '', '', '0', '1537934176', '1537934176', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('177', 'file', '0', 'apply', '审核管理', 'fa fa-list', '', '', '1', '1537942800', '1537942859', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('178', 'file', '177', 'apply/goods', '精选入驻', 'fa fa-circle-o', '', '', '1', '1537942800', '1537942890', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('179', 'file', '178', 'apply/goods/index', '查看', 'fa fa-circle-o', '', '', '0', '1537942800', '1537942800', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('180', 'file', '178', 'apply/goods/add', '添加', 'fa fa-circle-o', '', '', '0', '1537942800', '1537942800', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('181', 'file', '178', 'apply/goods/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537942800', '1537942800', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('182', 'file', '178', 'apply/goods/del', '删除', 'fa fa-circle-o', '', '', '0', '1537942800', '1537942800', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('183', 'file', '178', 'apply/goods/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537942800', '1537942800', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('184', 'file', '177', 'apply/horseman', '骑手申请', 'fa fa-circle-o', '', '', '1', '1537942844', '1537942902', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('185', 'file', '184', 'apply/horseman/index', '查看', 'fa fa-circle-o', '', '', '0', '1537942844', '1537942844', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('186', 'file', '184', 'apply/horseman/add', '添加', 'fa fa-circle-o', '', '', '0', '1537942844', '1537942844', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('187', 'file', '184', 'apply/horseman/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1537942844', '1537942844', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('188', 'file', '184', 'apply/horseman/del', '删除', 'fa fa-circle-o', '', '', '0', '1537942844', '1537942844', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('189', 'file', '184', 'apply/horseman/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1537942844', '1537942844', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('190', 'file', '0', 'finance', '财务管理', 'fa fa-bar-chart-o', '', '', '1', '1537943112', '1537943112', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('191', 'file', '190', 'finance/dish', '早餐收支明细', 'fa fa-exchange', '', '可根据时间查询某个时间段的销售统计.\r\n每日销售金额、销售商品数.', '1', '1537944523', '1537944841', '0', 'normal');
INSERT INTO `ds_auth_rule` VALUES ('192', 'file', '190', 'finance/goods', '精选收支明细', 'fa fa-exchange', '', '', '1', '1537944603', '1537944603', '0', 'normal');

-- ----------------------------
-- Table structure for ds_banner
-- ----------------------------
DROP TABLE IF EXISTS `ds_banner`;
CREATE TABLE `ds_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Banner位ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Banner名称',
  `description` text NOT NULL COMMENT 'Banner描述',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('1','0') DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_banner
-- ----------------------------
INSERT INTO `ds_banner` VALUES ('1', '早餐轮播图', '首页早餐轮播图', '1537447694', '1537447694', '1');
INSERT INTO `ds_banner` VALUES ('2', '精选轮播图', '商城精选轮播图', '1537447722', '1537447722', '1');

-- ----------------------------
-- Table structure for ds_banner_item
-- ----------------------------
DROP TABLE IF EXISTS `ds_banner_item`;
CREATE TABLE `ds_banner_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `dish_id` int(11) NOT NULL DEFAULT '0' COMMENT '跳转菜品',
  `banner_id` int(11) NOT NULL COMMENT '所属Banner位',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_banner_item
-- ----------------------------
INSERT INTO `ds_banner_item` VALUES ('5', '/uploads/20180925/847f69f35141423b0cdbe4354b48530a.png', '10', '1', '1537844309', '1537844309', '1');
INSERT INTO `ds_banner_item` VALUES ('6', '/uploads/20180925/8c092c092c451effe078b3780c3b0460.png', '11', '1', '1537844323', '1537844323', '1');
INSERT INTO `ds_banner_item` VALUES ('7', '/uploads/20180925/affd6e7bc794bbde7a8b3867c83c3b97.png', '12', '1', '1537844337', '1537844337', '1');
INSERT INTO `ds_banner_item` VALUES ('8', '/uploads/20180925/c05f69d47b67753fc98ea7bc63077574.png', '10', '1', '1537844359', '1537844359', '1');
INSERT INTO `ds_banner_item` VALUES ('9', '/uploads/20180925/96d76df473ce47a51e352270a00ce748.png', '5', '2', '1537859875', '1537859875', '1');
INSERT INTO `ds_banner_item` VALUES ('10', '/uploads/20180925/711211d11edc198bd89a2083b1f2e4dd.png', '0', '2', '1537859887', '1537859887', '1');

-- ----------------------------
-- Table structure for ds_category
-- ----------------------------
DROP TABLE IF EXISTS `ds_category`;
CREATE TABLE `ds_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of ds_category
-- ----------------------------
INSERT INTO `ds_category` VALUES ('1', '0', 'dish', '鲜包', '鲜包', '', '', '', '', '', '1537444729', '1537444729', '1', 'normal');
INSERT INTO `ds_category` VALUES ('2', '0', 'dish', '粗粮', '粗粮', '', '', '', '', '', '1537444745', '1537444745', '2', 'normal');
INSERT INTO `ds_category` VALUES ('3', '0', 'dish', '豆浆', '豆浆', '', '', '', '', '', '1537444755', '1537444755', '3', 'normal');
INSERT INTO `ds_category` VALUES ('4', '0', 'dish', '好粥', '好粥', '', '', '', '', '', '1537444765', '1537444765', '4', 'normal');
INSERT INTO `ds_category` VALUES ('5', '0', 'dish', '点心', '点心', '', '', '', '', '', '1537444773', '1537444773', '5', 'normal');
INSERT INTO `ds_category` VALUES ('6', '0', 'dish', '套餐', '套餐', '', '', '', '', '', '1537444804', '1537444804', '6', 'normal');
INSERT INTO `ds_category` VALUES ('7', '0', 'goods', '分类一', '分类一', '', '/uploads/20180920/a3fe84d16d5427ac188ce2d742aafa69.png', '', '', '', '1537446277', '1537446277', '7', 'normal');
INSERT INTO `ds_category` VALUES ('8', '0', 'goods', '分类二', '分类二', '', '/uploads/20180920/03473f8cef4f2d471ff90d184a0e2e4f.png', '', '', '', '1537446295', '1537446295', '8', 'normal');
INSERT INTO `ds_category` VALUES ('9', '0', 'goods', '分类三', '分类三', '', '/uploads/20180920/907645faaa9980086c4e765b03227753.png', '', '', '', '1537446313', '1537446313', '9', 'normal');
INSERT INTO `ds_category` VALUES ('10', '0', 'goods', '分类四', '分类四', '', '/uploads/20180920/e40f3db079e3f4af8004375e032fb1d3.png', '', '', '', '1537446332', '1537446332', '10', 'normal');

-- ----------------------------
-- Table structure for ds_comment
-- ----------------------------
DROP TABLE IF EXISTS `ds_comment`;
CREATE TABLE `ds_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `details` varchar(255) NOT NULL DEFAULT '' COMMENT '评论内容',
  `images` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `score` enum('5','4','3','2','1') NOT NULL DEFAULT '5' COMMENT '评分:1=1分,2=2分,3=3分,4=4分,5=5分',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_comment
-- ----------------------------
INSERT INTO `ds_comment` VALUES ('2', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '25', 'aweq', 'uploads/', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('3', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '25', 'wqewq', 'uploads/', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('4', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '25', 'qw', 'uploads/', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('5', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '25', 'asdqwa', 'uploads/', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('6', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '25', 'qwe', 'uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.QW3nY5I4j0aK8d033512f89eefa512ca4d7825a00b08.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('7', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qweqw', 'uploads/,uploads/,uploads/', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('8', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'ewrq', 'uploads/', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('9', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'asda', 'uploads/20180927/fefa7b4c6f9553b9417a1969812c41f0.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('10', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'asdas', 'uploads/20180927/5d931de27c793b445af1b41a71168951.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('11', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qweq', 'uploads/20180927/8141fc019718be35d43fbb7acc542487.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('12', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qwe', 'uploads/20180927/1b43f53fc0f8ac82caed22bf8271eeec.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('13', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'wqewq', 'uploads/20180927/cde989eaf30af3caf91fcd0d64cfa447.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('14', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', '', 'uploads/20180927/ab80ca23cc1bedbe957f0651f745bcb4.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('15', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qwe', 'uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.wWKyzw2xF8cP8d033512f89eefa512ca4d7825a00b08.png,uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.oENEhCYalvGna1656ccfd3c409fba5581784a8c012c8.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('16', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', '123', 'uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.cCCHPkHxXSHH8d033512f89eefa512ca4d7825a00b08.png,uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.YyIcXknWtLXc9b84b2e7bd62a3388ad6d000466e49a3.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('17', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '5', 'qew', 'uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.WJXmSlPt2rCPa1656ccfd3c409fba5581784a8c012c8.png,uploads/http://tmp/wx11967a119ee0e677.o6zAJs7XiFy4Xy4z8MNjltXIqZpI.TrsPyTsEf1f66ba280f637c667ed4eac4f2204bbf774.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('18', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qe', 'uploads/20180927/4290fefeee6fca14ef561d13cad6241a.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('19', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '5', '123', 'uploads/20180927/d6860c2de0db0e6cae92538fdd6585c1.png,uploads/20180927/18ba84ab9cdf27490b25b7dbb17457c0.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('20', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qwe12', 'uploads/20180927/2cf86aa236210b99dc0458df3905ce1e.png,uploads/20180927/55a8dc6a328d5b2a2bd70e205763347d.png,uploads/20180927/067f25e41d32f9b3c5351c4fccdca04a.png', '5', '1', '0', '0');
INSERT INTO `ds_comment` VALUES ('21', '1', '再见～时光', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '6', 'qwe', 'uploads/20180927/6fea1f64518aeee252c7efd43fee13d9.png,uploads/20180927/654d929ff4a0fe6cf85bb938295f14a1.png,uploads/20180927/e22d5095b8953bcb3613f0bf119fab8d.png', '5', '1', '0', '0');

-- ----------------------------
-- Table structure for ds_config
-- ----------------------------
DROP TABLE IF EXISTS `ds_config`;
CREATE TABLE `ds_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of ds_config
-- ----------------------------
INSERT INTO `ds_config` VALUES ('1', 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `ds_config` VALUES ('2', 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', '');
INSERT INTO `ds_config` VALUES ('3', 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `ds_config` VALUES ('4', 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `ds_config` VALUES ('5', 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `ds_config` VALUES ('6', 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `ds_config` VALUES ('7', 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `ds_config` VALUES ('8', 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `ds_config` VALUES ('9', 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"dish\":\"早餐分类\",\"goods\":\"商品分类\"}', '', '', '');
INSERT INTO `ds_config` VALUES ('10', 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\"}', '', '', '');
INSERT INTO `ds_config` VALUES ('11', 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `ds_config` VALUES ('12', 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `ds_config` VALUES ('13', 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `ds_config` VALUES ('14', 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `ds_config` VALUES ('15', 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `ds_config` VALUES ('16', 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `ds_config` VALUES ('17', 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');
INSERT INTO `ds_config` VALUES ('18', 'customer_service ', 'basic', '客服电话', '', 'string', '010-33445566', '', '', '');

-- ----------------------------
-- Table structure for ds_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ds_coupon`;
CREATE TABLE `ds_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('3','2','1') NOT NULL DEFAULT '1' COMMENT '优惠券类型:1=购买早餐赠送,2=绑定手机号赠送',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `coupon_type` enum('2','1') NOT NULL COMMENT '优惠券种类:1=早餐专用,2=精选专用',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `expiry_date` tinyint(3) NOT NULL DEFAULT '0' COMMENT '有效期(天)',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_coupon
-- ----------------------------
INSERT INTO `ds_coupon` VALUES ('7', '1', '5.00', '1', '早餐专用', '当天原价,第二天半价', '0', '1', '1537859995', '1537859995');
INSERT INTO `ds_coupon` VALUES ('8', '2', '3.00', '1', '早餐专用', '当天原价,第二天半价', '0', '1', '1537860029', '1537860029');

-- ----------------------------
-- Table structure for ds_crontab
-- ----------------------------
DROP TABLE IF EXISTS `ds_crontab`;
CREATE TABLE `ds_crontab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `executetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务表';

-- ----------------------------
-- Records of ds_crontab
-- ----------------------------
INSERT INTO `ds_crontab` VALUES ('1', 'url', '请求FastAdmin', 'http://www.fastadmin.net', '* * * * *', '0', '0', '13548', '1497070825', '1501253101', '1483200000', '1546272000', '1501253101', '1', 'normal');
INSERT INTO `ds_crontab` VALUES ('2', 'sql', '查询一条SQL', 'SELECT 1;', '* * * * *', '0', '0', '13548', '1497071095', '1501253101', '1483200000', '1546272000', '1501253101', '2', 'normal');

-- ----------------------------
-- Table structure for ds_dish
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish`;
CREATE TABLE `ds_dish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类',
  `type` enum('1','0') NOT NULL DEFAULT '0' COMMENT '餐品类型:0=普通餐品,1=套餐',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '餐品名称',
  `desc` text NOT NULL COMMENT '描述',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `dish_image` varchar(255) NOT NULL DEFAULT '' COMMENT '餐品图片',
  `dish_spec_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '餐品规格',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish
-- ----------------------------
INSERT INTO `ds_dish` VALUES ('10', '1', '0', '鸡肉包', '上等鸡肉', '1.00', '/uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '', '1', '1537497877', '1537497877');
INSERT INTO `ds_dish` VALUES ('11', '6', '1', '套餐A', '早餐无忧', '5.00', '/uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '19,18', '1', '1537497933', '1537843065');
INSERT INTO `ds_dish` VALUES ('12', '6', '1', '套餐B', '专业套餐B', '11.00', '/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', '19,18', '1', '1537525159', '1537843059');
INSERT INTO `ds_dish` VALUES ('13', '5', '0', '甜点', '甜点', '0.01', '/uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', '', '1', '1537863657', '1537863657');

-- ----------------------------
-- Table structure for ds_dish_order
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish_order`;
CREATE TABLE `ds_dish_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` enum('3','2','1','0') NOT NULL DEFAULT '1' COMMENT '订单状态:0=隐藏,1=待支付,2=待提取,3=已完成',
  `user_id` int(11) NOT NULL COMMENT '所属用户',
  `product_count` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `prepay_id` varchar(100) DEFAULT '' COMMENT 'prepayID',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_order
-- ----------------------------
INSERT INTO `ds_dish_order` VALUES ('2', '2018921005323400708', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537500532', '1537500532', null);
INSERT INTO `ds_dish_order` VALUES ('3', '2018921009374071779', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537500937', '1537500937', null);
INSERT INTO `ds_dish_order` VALUES ('4', '2018921010219247371', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501021', '1537501021', null);
INSERT INTO `ds_dish_order` VALUES ('5', '2018921011266754194', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501126', '1537501126', null);
INSERT INTO `ds_dish_order` VALUES ('6', '2018921011700992420', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501170', '1537501170', null);
INSERT INTO `ds_dish_order` VALUES ('7', '2018921018706747898', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501870', '1537501870', null);
INSERT INTO `ds_dish_order` VALUES ('8', '2018921019127257711', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501912', '1537501912', null);
INSERT INTO `ds_dish_order` VALUES ('9', '2018921019351649928', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501935', '1537501935', null);
INSERT INTO `ds_dish_order` VALUES ('10', '2018921019596537018', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501959', '1537501959', null);
INSERT INTO `ds_dish_order` VALUES ('11', '2018921019730927555', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501973', '1537501973', null);
INSERT INTO `ds_dish_order` VALUES ('12', '2018921019770562175', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501977', '1537501977', null);
INSERT INTO `ds_dish_order` VALUES ('13', '2018921019938031339', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501993', '1537501993', null);
INSERT INTO `ds_dish_order` VALUES ('14', '2018921019972569442', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537501997', '1537501997', null);
INSERT INTO `ds_dish_order` VALUES ('15', '2018921020535659138', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537502053', '1537502053', null);
INSERT INTO `ds_dish_order` VALUES ('16', '2018921098999326652', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537509899', '1537509899', null);
INSERT INTO `ds_dish_order` VALUES ('17', '2018921099461383501', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537509946', '1537509946', null);
INSERT INTO `ds_dish_order` VALUES ('18', '2018921099908945266', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537509990', '1537509990', null);
INSERT INTO `ds_dish_order` VALUES ('19', '2018921100647441710', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537510064', '1537510064', null);
INSERT INTO `ds_dish_order` VALUES ('20', '2018921101162602629', '1', '1', '2', '6.00', '6.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537510116', '1537510116', null);
INSERT INTO `ds_dish_order` VALUES ('21', '2018921101197460642', '1', '1', '2', '6.00', '6.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537510119', '1537510119', null);
INSERT INTO `ds_dish_order` VALUES ('22', '2018921104772763357', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537510477', '1537510477', null);
INSERT INTO `ds_dish_order` VALUES ('23', '2018921104877732058', '1', '1', '3', '3.00', '3.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537510487', '1537510487', null);
INSERT INTO `ds_dish_order` VALUES ('24', '2018921105013730193', '1', '1', '4', '8.00', '8.00', '0', '0.00', 'gc', '北京市北京市东城区qweq', '15138328395', null, '', '1537510501', '1537510501', null);
INSERT INTO `ds_dish_order` VALUES ('25', '2018921105147097269', '1', '1', '4', '8.00', '8.00', '0', '0.00', 'asd', '北京市北京市东城区asd', '15138328395', null, '', '1537510514', '1537510514', null);
INSERT INTO `ds_dish_order` VALUES ('26', '2018921105372624414', '1', '1', '4', '8.00', '8.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537510537', '1537510537', null);
INSERT INTO `ds_dish_order` VALUES ('27', '2018921105419323457', '1', '1', '4', '8.00', '8.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537510541', '1537510541', null);
INSERT INTO `ds_dish_order` VALUES ('28', '2018921124763692982', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512476', '1537512476', null);
INSERT INTO `ds_dish_order` VALUES ('29', '2018921124902981656', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512490', '1537512490', null);
INSERT INTO `ds_dish_order` VALUES ('30', '2018921127117660343', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512711', '1537512711', null);
INSERT INTO `ds_dish_order` VALUES ('31', '2018921128605665484', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512860', '1537512860', null);
INSERT INTO `ds_dish_order` VALUES ('32', '2018921129102063290', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512910', '1537512910', null);
INSERT INTO `ds_dish_order` VALUES ('33', '2018921129185327605', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512918', '1537512918', null);
INSERT INTO `ds_dish_order` VALUES ('34', '2018921129518541115', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537512951', '1537512951', null);
INSERT INTO `ds_dish_order` VALUES ('35', '2018921131375482070', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513137', '1537513137', null);
INSERT INTO `ds_dish_order` VALUES ('36', '2018921131468944298', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513146', '1537513146', null);
INSERT INTO `ds_dish_order` VALUES ('37', '2018921131554808121', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513155', '1537513155', null);
INSERT INTO `ds_dish_order` VALUES ('38', '2018921131610019176', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513161', '1537513161', null);
INSERT INTO `ds_dish_order` VALUES ('39', '2018921131851103640', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513185', '1537513185', null);
INSERT INTO `ds_dish_order` VALUES ('40', '2018921131867453138', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513186', '1537513186', null);
INSERT INTO `ds_dish_order` VALUES ('41', '2018921131885491218', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513188', '1537513188', null);
INSERT INTO `ds_dish_order` VALUES ('42', '2018921133020684489', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, '', '1537513302', '1537513302', null);
INSERT INTO `ds_dish_order` VALUES ('43', '2018921139741710474', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, 'wx211512544514364257bb9f182015852028', '1537513974', '1537513974', null);
INSERT INTO `ds_dish_order` VALUES ('44', '2018921141229620347', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, '', '1537514122', '1537514122', null);
INSERT INTO `ds_dish_order` VALUES ('45', '2018921142743951359', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx2115175460394142dd57157f1136388993', '1537514274', '1537514274', null);
INSERT INTO `ds_dish_order` VALUES ('46', '2018921142907322675', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx21151810973253422707c6fc2756743709', '1537514290', '1537514291', null);
INSERT INTO `ds_dish_order` VALUES ('47', '2018921143200885368', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, 'wx21151840327170ad39a5cb850780852685', '1537514320', '1537514320', null);
INSERT INTO `ds_dish_order` VALUES ('48', '2018921143845256983', '1', '2', '3', '11.00', '11.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, 'wx21151944721431f552c17bc32875230701', '1537514384', '1537514384', null);
INSERT INTO `ds_dish_order` VALUES ('49', '2018921145909544544', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx21152311145334f9f4f7cdf80698203551', '1537514590', '1537514591', null);
INSERT INTO `ds_dish_order` VALUES ('50', '2018921149024395836', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx2115282264420127c41ea2e41409600041', '1537514902', '1537514902', null);
INSERT INTO `ds_dish_order` VALUES ('51', '2018921149112489837', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx211528314252654cbddb0e561781728466', '1537514911', '1537514911', null);
INSERT INTO `ds_dish_order` VALUES ('52', '2018921152291626443', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx21153349468646ef5cd40b122107282496', '1537515229', '1537515229', null);
INSERT INTO `ds_dish_order` VALUES ('53', '2018921159159552858', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx211545161479411372a24f662473055464', '1537515915', '1537515916', null);
INSERT INTO `ds_dish_order` VALUES ('54', '2018925373653776551', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25090245712291ce82befd6a1103480503', '1537837365', '1537837365', null);
INSERT INTO `ds_dish_order` VALUES ('55', '2018925373802081482', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250903004275290b412267742365175245', '1537837380', '1537837380', null);
INSERT INTO `ds_dish_order` VALUES ('56', '2018925380935848821', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx2509145383950919be8353601026389588', '1537838093', '1537838093', null);
INSERT INTO `ds_dish_order` VALUES ('57', '2018925381360962171', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25091536351586feba7f28f02702505236', '1537838136', '1537838136', null);
INSERT INTO `ds_dish_order` VALUES ('58', '2018925382030145629', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250916432419425772be12fd1270446048', '1537838203', '1537838203', null);
INSERT INTO `ds_dish_order` VALUES ('59', '2018925382401723424', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25091720392025424041e0443359031748', '1537838240', '1537838240', null);
INSERT INTO `ds_dish_order` VALUES ('60', '2018925382555890087', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250917358398078d7fe8aa991558306364', '1537838255', '1537838255', null);
INSERT INTO `ds_dish_order` VALUES ('61', '2018925384696152660', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx2509210982808821384c4db51196740156', '1537838469', '1537838469', null);
INSERT INTO `ds_dish_order` VALUES ('62', '2018925385135228206', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250921537666705d5799fb673572985856', '1537838513', '1537838513', null);
INSERT INTO `ds_dish_order` VALUES ('63', '2018925385380224265', '1', '1', '3', '17.00', '17.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25092218390110b9c0a5cd192974386651', '1537838538', '1537838538', null);
INSERT INTO `ds_dish_order` VALUES ('64', '2018925387408620994', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25092541078373b635be217a3681924485', '1537838740', '1537838741', null);
INSERT INTO `ds_dish_order` VALUES ('65', '2018925387818228740', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250926220750817ed27eeb2b0949290626', '1537838781', '1537838782', null);
INSERT INTO `ds_dish_order` VALUES ('66', '2018925388610205397', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25092741270301a9115f235a3870888224', '1537838861', '1537838861', null);
INSERT INTO `ds_dish_order` VALUES ('67', '2018925389476251562', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250929078828471338dc9ded0003452438', '1537838947', '1537838947', null);
INSERT INTO `ds_dish_order` VALUES ('68', '2018925390098691870', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250930100888004ea00e76b03756231957', '1537839009', '1537839010', null);
INSERT INTO `ds_dish_order` VALUES ('69', '2018925390933792040', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25093133608640563b36e7392744293439', '1537839093', '1537839093', null);
INSERT INTO `ds_dish_order` VALUES ('70', '2018925391582430305', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25093238444862a68170aa2c3969122960', '1537839158', '1537839158', null);
INSERT INTO `ds_dish_order` VALUES ('71', '2018925391864961508', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25093306710216a4809ff1232891829155', '1537839186', '1537839186', null);
INSERT INTO `ds_dish_order` VALUES ('72', '2018925392715204892', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25093431695394946eef43650223093429', '1537839271', '1537839271', null);
INSERT INTO `ds_dish_order` VALUES ('73', '2018925392919272154', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25093452137325781ae4a25e1561439187', '1537839291', '1537839292', null);
INSERT INTO `ds_dish_order` VALUES ('74', '2018925393510328310', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx250935513552872f2a441c063488590430', '1537839351', '1537839351', null);
INSERT INTO `ds_dish_order` VALUES ('75', '2018925410784408852', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25100438705688f3f037e2163113040220', '1537841078', '1537841078', null);
INSERT INTO `ds_dish_order` VALUES ('76', '2018925411716019015', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251006118360024d123e89ef2426094785', '1537841171', '1537841171', null);
INSERT INTO `ds_dish_order` VALUES ('77', '2018925411933702391', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251006335693366c94cbdefb2194190132', '1537841193', '1537841193', null);
INSERT INTO `ds_dish_order` VALUES ('78', '2018925412522332110', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251007324197897c04d669c21450383691', '1537841252', '1537841252', null);
INSERT INTO `ds_dish_order` VALUES ('79', '2018925412708640979', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25100751036234094d85b6572781736932', '1537841270', '1537841271', null);
INSERT INTO `ds_dish_order` VALUES ('80', '2018925413410350096', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251009012301209d1c34ea541075187869', '1537841341', '1537841341', null);
INSERT INTO `ds_dish_order` VALUES ('81', '2018925415824370287', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25101302671730f649d0ae803765388094', '1537841582', '1537841582', null);
INSERT INTO `ds_dish_order` VALUES ('82', '2018925417215572717', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25101521824933bd86763cb32755777477', '1537841721', '1537841721', null);
INSERT INTO `ds_dish_order` VALUES ('83', '2018925417682355521', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25101608502849d9432258eb0422453859', '1537841768', '1537841768', null);
INSERT INTO `ds_dish_order` VALUES ('84', '2018925418268444510', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx2510170708954170c4acc4f21469286117', '1537841826', '1537841827', null);
INSERT INTO `ds_dish_order` VALUES ('85', '2018925418709565891', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251017512276334d7e1055cf2947647466', '1537841870', '1537841871', null);
INSERT INTO `ds_dish_order` VALUES ('86', '2018925421278055540', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251022080403524d0b6ecc211198570598', '1537842127', '1537842128', null);
INSERT INTO `ds_dish_order` VALUES ('87', '2018925421603014367', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25102240523633a3a9f083420161703425', '1537842160', '1537842160', null);
INSERT INTO `ds_dish_order` VALUES ('88', '2018925425333220300', '1', '1', '1', '5.00', '5.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251028535765111b0f010de64078570336', '1537842533', '1537842533', null);
INSERT INTO `ds_dish_order` VALUES ('89', '2018925425419744579', '1', '1', '1', '5.00', '5.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251029022467198e085904492422241011', '1537842541', '1537842542', null);
INSERT INTO `ds_dish_order` VALUES ('90', '2018925425920737650', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25102952325826d37eaea7f50115928991', '1537842592', '1537842592', null);
INSERT INTO `ds_dish_order` VALUES ('91', '2018925426361563186', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251030363996189f2fcfea462480761844', '1537842636', '1537842636', null);
INSERT INTO `ds_dish_order` VALUES ('92', '2018925426879971966', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx251031282311772de13240780235948187', '1537842687', '1537842688', null);
INSERT INTO `ds_dish_order` VALUES ('93', '2018925428353100071', '1', '1', '1', '1.00', '1.00', '0', '0.00', 'hu', '北京市北京市东城区erw', '15138328395', null, 'wx25103355542755c717397d8e0241460705', '1537842835', '1537842835', null);
INSERT INTO `ds_dish_order` VALUES ('94', '2018925557065779048', '1', '1', '8', '8.00', '8.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537855706', '1537855706', null);
INSERT INTO `ds_dish_order` VALUES ('95', '2018925557210598124', '1', '1', '8', '8.00', '8.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537855721', '1537855721', null);
INSERT INTO `ds_dish_order` VALUES ('96', '2018925557374005065', '1', '1', '9', '9.00', '9.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537855737', '1537855737', null);
INSERT INTO `ds_dish_order` VALUES ('97', '2018925573699149162', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537857369', '1537857369', null);
INSERT INTO `ds_dish_order` VALUES ('98', '2018925588440229365', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537858844', '1537858844', null);
INSERT INTO `ds_dish_order` VALUES ('99', '2018925591583200226', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537859158', '1537859158', null);
INSERT INTO `ds_dish_order` VALUES ('100', '2018925592041551515', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537859204', '1537859204', null);
INSERT INTO `ds_dish_order` VALUES ('101', '2018925592894386626', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537859289', '1537859289', null);
INSERT INTO `ds_dish_order` VALUES ('102', '2018925593229847876', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537859322', '1537859322', null);
INSERT INTO `ds_dish_order` VALUES ('103', '2018925595266253608', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537859526', '1537859526', null);
INSERT INTO `ds_dish_order` VALUES ('104', '2018925601268604506', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860126', '1537860126', null);
INSERT INTO `ds_dish_order` VALUES ('105', '2018925603250025889', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860325', '1537860325', null);
INSERT INTO `ds_dish_order` VALUES ('106', '2018925604169082941', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860416', '1537860416', null);
INSERT INTO `ds_dish_order` VALUES ('107', '2018925604339191338', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860433', '1537860433', null);
INSERT INTO `ds_dish_order` VALUES ('108', '2018925604618149492', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860461', '1537860461', null);
INSERT INTO `ds_dish_order` VALUES ('109', '2018925604825592761', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860482', '1537860482', null);
INSERT INTO `ds_dish_order` VALUES ('110', '2018925605177683971', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, '', '1537860517', '1537860517', null);
INSERT INTO `ds_dish_order` VALUES ('111', '2018925606317042563', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx2515303189769668f3929ac72336158551', '1537860631', '1537860631', null);
INSERT INTO `ds_dish_order` VALUES ('112', '2018925606738959974', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25153114114570918c45b4740145303122', '1537860673', '1537860674', null);
INSERT INTO `ds_dish_order` VALUES ('113', '2018925606914541663', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25153131656088f45f624a8c1875102211', '1537860691', '1537860691', null);
INSERT INTO `ds_dish_order` VALUES ('114', '2018925608057331429', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25153325930201a0e57408c34063564849', '1537860805', '1537860805', null);
INSERT INTO `ds_dish_order` VALUES ('115', '2018925608134748094', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx251533337582897344011a952910266750', '1537860813', '1537860813', null);
INSERT INTO `ds_dish_order` VALUES ('116', '2018925608207250266', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25153340914166ba6ecfcfa51324823377', '1537860820', '1537860820', null);
INSERT INTO `ds_dish_order` VALUES ('117', '2018925608321651471', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx2515335234748745421f05ff1583891258', '1537860832', '1537860832', null);
INSERT INTO `ds_dish_order` VALUES ('118', '2018925609632781130', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25153603491357258d05554c1138410412', '1537860963', '1537860963', null);
INSERT INTO `ds_dish_order` VALUES ('119', '2018925609759570365', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25153616119958bfc9aecfb01265160684', '1537860975', '1537860976', null);
INSERT INTO `ds_dish_order` VALUES ('120', '2018925610055704334', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx2515364576923652257445c00990213848', '1537861005', '1537861005', null);
INSERT INTO `ds_dish_order` VALUES ('121', '2018925611963164271', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx251539565784925e3d58c3702114595319', '1537861196', '1537861196', null);
INSERT INTO `ds_dish_order` VALUES ('122', '2018925619567833649', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx2516014960494830bf3a147f2819610788', '1537861956', '1537862509', null);
INSERT INTO `ds_dish_order` VALUES ('123', '2018925626639580034', '1', '1', '1', '1.00', '1.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx25164719639055390b5204111324688330', '1537862663', '1537865239', null);
INSERT INTO `ds_dish_order` VALUES ('124', '2018925635050073724', '1', '2', '2', '6.00', '6.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, 'wx251618252609899655ca69bb1036962340', '1537863505', '1537863505', null);
INSERT INTO `ds_dish_order` VALUES ('125', '2018925635288972439', '1', '2', '2', '6.00', '6.00', '0', '0.00', '张强', '浙江省杭州市滨江区卧龙科技园', '18667933305', null, 'wx251618490991084e82776d5d0554463187', '1537863528', '1537863529', null);
INSERT INTO `ds_dish_order` VALUES ('126', '2018925639618019486', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537869635', 'wx2516260200842137c034a0f80989871184', '1537863961', '1537872455', '1537872455');
INSERT INTO `ds_dish_order` VALUES ('127', '2018925643594092613', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1538017082', 'wx271057447032442bc27eb67e0598683608', '1537864359', '1538017342', '1538017342');
INSERT INTO `ds_dish_order` VALUES ('128', '2018925646453243287', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537868507', 'wx251637255633199c0e49cd774170837367', '1537864645', '1537872452', '1537872452');
INSERT INTO `ds_dish_order` VALUES ('129', '2018925657376605006', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537869600', 'wx2516553789099318c547fba42923773717', '1537865737', '1537872445', '1537872445');
INSERT INTO `ds_dish_order` VALUES ('130', '2018925663859871697', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537872522', 'wx25184828588679a4f72cafb93116252304', '1537866385', '1538015603', '1538015603');
INSERT INTO `ds_dish_order` VALUES ('131', '2018925663862931298', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537868448', 'wx25170626533710920ae9edc51154016443', '1537866386', '1537872022', '1537872022');
INSERT INTO `ds_dish_order` VALUES ('132', '2018925667272346945', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537868785', 'wx25171207465079cb49a4759c2574905235', '1537866727', '1537871952', '1537871952');
INSERT INTO `ds_dish_order` VALUES ('133', '2018925670488214597', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537872487', 'wx2518475133598171db25bf451310799075', '1537867048', '1537872988', '1537872988');
INSERT INTO `ds_dish_order` VALUES ('134', '2018925671381319825', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537869196', 'wx251718583437898da18f333b2801257786', '1537867138', '1537871941', '1537871941');
INSERT INTO `ds_dish_order` VALUES ('135', '2018925674509938604', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537869508', 'wx2517241120190147c8fcc1f92368834752', '1537867450', '1537871926', '1537871926');
INSERT INTO `ds_dish_order` VALUES ('136', '2018925675473134831', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537872082', 'wx25184109396687cc1502c7450235752522', '1537867547', '1537872411', '1537872411');
INSERT INTO `ds_dish_order` VALUES ('137', '2018925676920573681', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537867948', 'wx251728122577693a1f8306200002221000', '1537867692', '1537869345', '1537869345');
INSERT INTO `ds_dish_order` VALUES ('138', '2018925678753668251', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537867889', 'wx251731156125891ef4f3bfdc0679904993', '1537867875', '1537869292', '1537869292');
INSERT INTO `ds_dish_order` VALUES ('139', '2018925696074342385', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537869626', 'wx25180007644039c53ec813c72539662947', '1537869607', '1537869646', '1537869646');
INSERT INTO `ds_dish_order` VALUES ('140', '2018925696780398724', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537869691', 'wx251801182395101c7567ca910345127372', '1537869678', '1537869702', '1537869702');
INSERT INTO `ds_dish_order` VALUES ('141', '2018925718454429849', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537871857', 'wx2518372564043081b8035b661257314099', '1537871845', '1537871917', '1537871917');
INSERT INTO `ds_dish_order` VALUES ('142', '2018926469669719526', '1', '1', '1', '5.00', '5.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx26185617363442674b329dc63026674105', '1537946966', '1537959377', null);
INSERT INTO `ds_dish_order` VALUES ('143', '2018926593495921629', '1', '1', '3', '21.00', '21.00', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, 'wx271052526880293b89625d273162765169', '1537959349', '1538016772', null);
INSERT INTO `ds_dish_order` VALUES ('144', '2018926613681354245', '2', '1', '1', '0.01', '0.01', '0', '0.00', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1538016745', 'wx2710520161933523d8978b840099742818', '1537961368', '1538017032', '1538017032');

-- ----------------------------
-- Table structure for ds_dish_order_item
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish_order_item`;
CREATE TABLE `ds_dish_order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL COMMENT '所属订单',
  `dish_id` int(11) NOT NULL COMMENT '菜品id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '菜品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `dish_image` varchar(255) NOT NULL DEFAULT '' COMMENT '菜品图片',
  `spec_name` varchar(255) DEFAULT NULL COMMENT '规格名称',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '菜品数量',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_order_item
-- ----------------------------
INSERT INTO `ds_dish_order_item` VALUES ('2', '14', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537501997', '1537501997');
INSERT INTO `ds_dish_order_item` VALUES ('3', '14', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537501997', '1537501997');
INSERT INTO `ds_dish_order_item` VALUES ('4', '15', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537502053', '1537502053');
INSERT INTO `ds_dish_order_item` VALUES ('5', '15', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537502053', '1537502053');
INSERT INTO `ds_dish_order_item` VALUES ('6', '16', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537509899', '1537509899');
INSERT INTO `ds_dish_order_item` VALUES ('7', '17', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537509946', '1537509946');
INSERT INTO `ds_dish_order_item` VALUES ('8', '18', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537509990', '1537509990');
INSERT INTO `ds_dish_order_item` VALUES ('9', '19', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537510064', '1537510064');
INSERT INTO `ds_dish_order_item` VALUES ('10', '20', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537510116', '1537510116');
INSERT INTO `ds_dish_order_item` VALUES ('11', '20', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537510116', '1537510116');
INSERT INTO `ds_dish_order_item` VALUES ('12', '21', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537510119', '1537510119');
INSERT INTO `ds_dish_order_item` VALUES ('13', '21', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537510119', '1537510119');
INSERT INTO `ds_dish_order_item` VALUES ('14', '22', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537510477', '1537510477');
INSERT INTO `ds_dish_order_item` VALUES ('15', '23', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '3', '1537510487', '1537510487');
INSERT INTO `ds_dish_order_item` VALUES ('16', '24', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '3', '1537510501', '1537510501');
INSERT INTO `ds_dish_order_item` VALUES ('17', '24', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537510501', '1537510501');
INSERT INTO `ds_dish_order_item` VALUES ('18', '25', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '3', '1537510514', '1537510514');
INSERT INTO `ds_dish_order_item` VALUES ('19', '25', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537510514', '1537510514');
INSERT INTO `ds_dish_order_item` VALUES ('20', '26', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '3', '1537510537', '1537510537');
INSERT INTO `ds_dish_order_item` VALUES ('21', '26', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537510537', '1537510537');
INSERT INTO `ds_dish_order_item` VALUES ('22', '27', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '3', '1537510541', '1537510541');
INSERT INTO `ds_dish_order_item` VALUES ('23', '27', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537510541', '1537510541');
INSERT INTO `ds_dish_order_item` VALUES ('24', '28', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512476', '1537512476');
INSERT INTO `ds_dish_order_item` VALUES ('25', '28', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512476', '1537512476');
INSERT INTO `ds_dish_order_item` VALUES ('26', '29', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512490', '1537512490');
INSERT INTO `ds_dish_order_item` VALUES ('27', '29', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512490', '1537512490');
INSERT INTO `ds_dish_order_item` VALUES ('28', '30', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512711', '1537512711');
INSERT INTO `ds_dish_order_item` VALUES ('29', '30', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512711', '1537512711');
INSERT INTO `ds_dish_order_item` VALUES ('30', '31', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512860', '1537512860');
INSERT INTO `ds_dish_order_item` VALUES ('31', '31', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512860', '1537512860');
INSERT INTO `ds_dish_order_item` VALUES ('32', '32', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512910', '1537512910');
INSERT INTO `ds_dish_order_item` VALUES ('33', '32', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512910', '1537512910');
INSERT INTO `ds_dish_order_item` VALUES ('34', '33', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512918', '1537512918');
INSERT INTO `ds_dish_order_item` VALUES ('35', '33', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512918', '1537512918');
INSERT INTO `ds_dish_order_item` VALUES ('36', '34', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537512951', '1537512951');
INSERT INTO `ds_dish_order_item` VALUES ('37', '34', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537512951', '1537512951');
INSERT INTO `ds_dish_order_item` VALUES ('38', '35', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513137', '1537513137');
INSERT INTO `ds_dish_order_item` VALUES ('39', '35', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513137', '1537513137');
INSERT INTO `ds_dish_order_item` VALUES ('40', '36', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513146', '1537513146');
INSERT INTO `ds_dish_order_item` VALUES ('41', '36', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513146', '1537513146');
INSERT INTO `ds_dish_order_item` VALUES ('42', '37', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513155', '1537513155');
INSERT INTO `ds_dish_order_item` VALUES ('43', '37', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513155', '1537513155');
INSERT INTO `ds_dish_order_item` VALUES ('44', '38', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513161', '1537513161');
INSERT INTO `ds_dish_order_item` VALUES ('45', '38', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513161', '1537513161');
INSERT INTO `ds_dish_order_item` VALUES ('46', '39', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513185', '1537513185');
INSERT INTO `ds_dish_order_item` VALUES ('47', '39', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513185', '1537513185');
INSERT INTO `ds_dish_order_item` VALUES ('48', '40', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513186', '1537513186');
INSERT INTO `ds_dish_order_item` VALUES ('49', '40', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513186', '1537513186');
INSERT INTO `ds_dish_order_item` VALUES ('50', '41', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513188', '1537513188');
INSERT INTO `ds_dish_order_item` VALUES ('51', '41', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513188', '1537513188');
INSERT INTO `ds_dish_order_item` VALUES ('52', '42', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513302', '1537513302');
INSERT INTO `ds_dish_order_item` VALUES ('53', '42', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513302', '1537513302');
INSERT INTO `ds_dish_order_item` VALUES ('54', '43', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537513974', '1537513974');
INSERT INTO `ds_dish_order_item` VALUES ('55', '43', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537513974', '1537513974');
INSERT INTO `ds_dish_order_item` VALUES ('56', '44', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537514122', '1537514122');
INSERT INTO `ds_dish_order_item` VALUES ('57', '45', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537514274', '1537514274');
INSERT INTO `ds_dish_order_item` VALUES ('58', '46', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537514290', '1537514290');
INSERT INTO `ds_dish_order_item` VALUES ('59', '47', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537514320', '1537514320');
INSERT INTO `ds_dish_order_item` VALUES ('60', '47', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537514320', '1537514320');
INSERT INTO `ds_dish_order_item` VALUES ('61', '48', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '6', '1', '1537514384', '1537514384');
INSERT INTO `ds_dish_order_item` VALUES ('62', '48', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '6', '2', '1537514384', '1537514384');
INSERT INTO `ds_dish_order_item` VALUES ('63', '49', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537514590', '1537514590');
INSERT INTO `ds_dish_order_item` VALUES ('64', '50', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537514902', '1537514902');
INSERT INTO `ds_dish_order_item` VALUES ('65', '51', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537514911', '1537514911');
INSERT INTO `ds_dish_order_item` VALUES ('66', '52', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537515229', '1537515229');
INSERT INTO `ds_dish_order_item` VALUES ('67', '53', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537515915', '1537515915');
INSERT INTO `ds_dish_order_item` VALUES ('68', '54', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537837365', '1537837365');
INSERT INTO `ds_dish_order_item` VALUES ('69', '55', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537837380', '1537837380');
INSERT INTO `ds_dish_order_item` VALUES ('70', '56', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838093', '1537838093');
INSERT INTO `ds_dish_order_item` VALUES ('71', '56', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838093', '1537838093');
INSERT INTO `ds_dish_order_item` VALUES ('72', '56', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838093', '1537838093');
INSERT INTO `ds_dish_order_item` VALUES ('73', '57', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838136', '1537838136');
INSERT INTO `ds_dish_order_item` VALUES ('74', '57', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838136', '1537838136');
INSERT INTO `ds_dish_order_item` VALUES ('75', '57', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838136', '1537838136');
INSERT INTO `ds_dish_order_item` VALUES ('76', '58', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838203', '1537838203');
INSERT INTO `ds_dish_order_item` VALUES ('77', '58', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838203', '1537838203');
INSERT INTO `ds_dish_order_item` VALUES ('78', '58', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838203', '1537838203');
INSERT INTO `ds_dish_order_item` VALUES ('79', '59', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838240', '1537838240');
INSERT INTO `ds_dish_order_item` VALUES ('80', '59', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838240', '1537838240');
INSERT INTO `ds_dish_order_item` VALUES ('81', '59', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838240', '1537838240');
INSERT INTO `ds_dish_order_item` VALUES ('82', '60', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838255', '1537838255');
INSERT INTO `ds_dish_order_item` VALUES ('83', '60', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838255', '1537838255');
INSERT INTO `ds_dish_order_item` VALUES ('84', '60', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838255', '1537838255');
INSERT INTO `ds_dish_order_item` VALUES ('85', '61', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838469', '1537838469');
INSERT INTO `ds_dish_order_item` VALUES ('86', '61', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838469', '1537838469');
INSERT INTO `ds_dish_order_item` VALUES ('87', '61', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838469', '1537838469');
INSERT INTO `ds_dish_order_item` VALUES ('88', '62', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838513', '1537838513');
INSERT INTO `ds_dish_order_item` VALUES ('89', '62', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838513', '1537838513');
INSERT INTO `ds_dish_order_item` VALUES ('90', '62', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838513', '1537838513');
INSERT INTO `ds_dish_order_item` VALUES ('91', '63', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838538', '1537838538');
INSERT INTO `ds_dish_order_item` VALUES ('92', '63', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537838538', '1537838538');
INSERT INTO `ds_dish_order_item` VALUES ('93', '63', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537838538', '1537838538');
INSERT INTO `ds_dish_order_item` VALUES ('94', '64', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838740', '1537838740');
INSERT INTO `ds_dish_order_item` VALUES ('95', '65', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838781', '1537838781');
INSERT INTO `ds_dish_order_item` VALUES ('96', '66', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838861', '1537838861');
INSERT INTO `ds_dish_order_item` VALUES ('97', '67', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537838947', '1537838947');
INSERT INTO `ds_dish_order_item` VALUES ('98', '68', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839009', '1537839009');
INSERT INTO `ds_dish_order_item` VALUES ('99', '69', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839093', '1537839093');
INSERT INTO `ds_dish_order_item` VALUES ('100', '70', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839158', '1537839158');
INSERT INTO `ds_dish_order_item` VALUES ('101', '71', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839186', '1537839186');
INSERT INTO `ds_dish_order_item` VALUES ('102', '72', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839271', '1537839271');
INSERT INTO `ds_dish_order_item` VALUES ('103', '73', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839291', '1537839291');
INSERT INTO `ds_dish_order_item` VALUES ('104', '74', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537839351', '1537839351');
INSERT INTO `ds_dish_order_item` VALUES ('105', '75', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841078', '1537841078');
INSERT INTO `ds_dish_order_item` VALUES ('106', '76', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841171', '1537841171');
INSERT INTO `ds_dish_order_item` VALUES ('107', '77', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841193', '1537841193');
INSERT INTO `ds_dish_order_item` VALUES ('108', '78', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841252', '1537841252');
INSERT INTO `ds_dish_order_item` VALUES ('109', '79', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841270', '1537841270');
INSERT INTO `ds_dish_order_item` VALUES ('110', '80', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841341', '1537841341');
INSERT INTO `ds_dish_order_item` VALUES ('111', '81', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841582', '1537841582');
INSERT INTO `ds_dish_order_item` VALUES ('112', '82', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841721', '1537841721');
INSERT INTO `ds_dish_order_item` VALUES ('113', '83', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841768', '1537841768');
INSERT INTO `ds_dish_order_item` VALUES ('114', '84', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841826', '1537841826');
INSERT INTO `ds_dish_order_item` VALUES ('115', '85', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537841870', '1537841870');
INSERT INTO `ds_dish_order_item` VALUES ('116', '86', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537842127', '1537842127');
INSERT INTO `ds_dish_order_item` VALUES ('117', '87', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537842160', '1537842160');
INSERT INTO `ds_dish_order_item` VALUES ('118', '88', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537842533', '1537842533');
INSERT INTO `ds_dish_order_item` VALUES ('119', '89', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537842541', '1537842541');
INSERT INTO `ds_dish_order_item` VALUES ('120', '90', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537842592', '1537842592');
INSERT INTO `ds_dish_order_item` VALUES ('121', '91', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537842636', '1537842636');
INSERT INTO `ds_dish_order_item` VALUES ('122', '92', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537842688', '1537842688');
INSERT INTO `ds_dish_order_item` VALUES ('123', '93', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537842835', '1537842835');
INSERT INTO `ds_dish_order_item` VALUES ('124', '111', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860631', '1537860631');
INSERT INTO `ds_dish_order_item` VALUES ('125', '112', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860673', '1537860673');
INSERT INTO `ds_dish_order_item` VALUES ('126', '113', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860691', '1537860691');
INSERT INTO `ds_dish_order_item` VALUES ('127', '114', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860805', '1537860805');
INSERT INTO `ds_dish_order_item` VALUES ('128', '115', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860813', '1537860813');
INSERT INTO `ds_dish_order_item` VALUES ('129', '116', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860820', '1537860820');
INSERT INTO `ds_dish_order_item` VALUES ('130', '117', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860832', '1537860832');
INSERT INTO `ds_dish_order_item` VALUES ('131', '118', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860963', '1537860963');
INSERT INTO `ds_dish_order_item` VALUES ('132', '119', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537860975', '1537860975');
INSERT INTO `ds_dish_order_item` VALUES ('133', '120', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537861005', '1537861005');
INSERT INTO `ds_dish_order_item` VALUES ('134', '121', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537861196', '1537861196');
INSERT INTO `ds_dish_order_item` VALUES ('135', '122', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537861956', '1537861956');
INSERT INTO `ds_dish_order_item` VALUES ('136', '123', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', ' ', '1', '1537862663', '1537862663');
INSERT INTO `ds_dish_order_item` VALUES ('137', '124', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '17,20', '1', '1537863505', '1537863505');
INSERT INTO `ds_dish_order_item` VALUES ('138', '124', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '17,20', '1', '1537863505', '1537863505');
INSERT INTO `ds_dish_order_item` VALUES ('139', '125', '10', '鸡肉包', '1.00', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '17,20', '1', '1537863528', '1537863528');
INSERT INTO `ds_dish_order_item` VALUES ('140', '125', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', '17,20', '1', '1537863528', '1537863528');
INSERT INTO `ds_dish_order_item` VALUES ('141', '126', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537863961', '1537863961');
INSERT INTO `ds_dish_order_item` VALUES ('142', '127', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537864359', '1537864359');
INSERT INTO `ds_dish_order_item` VALUES ('143', '128', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537864645', '1537864645');
INSERT INTO `ds_dish_order_item` VALUES ('144', '129', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537865737', '1537865737');
INSERT INTO `ds_dish_order_item` VALUES ('145', '130', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537866386', '1537866386');
INSERT INTO `ds_dish_order_item` VALUES ('146', '131', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537866386', '1537866386');
INSERT INTO `ds_dish_order_item` VALUES ('147', '132', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537866727', '1537866727');
INSERT INTO `ds_dish_order_item` VALUES ('148', '133', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537867048', '1537867048');
INSERT INTO `ds_dish_order_item` VALUES ('149', '134', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537867138', '1537867138');
INSERT INTO `ds_dish_order_item` VALUES ('150', '135', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537867451', '1537867451');
INSERT INTO `ds_dish_order_item` VALUES ('151', '136', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537867547', '1537867547');
INSERT INTO `ds_dish_order_item` VALUES ('152', '137', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537867692', '1537867692');
INSERT INTO `ds_dish_order_item` VALUES ('153', '138', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537867875', '1537867875');
INSERT INTO `ds_dish_order_item` VALUES ('154', '139', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537869607', '1537869607');
INSERT INTO `ds_dish_order_item` VALUES ('155', '140', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537869678', '1537869678');
INSERT INTO `ds_dish_order_item` VALUES ('156', '141', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537871845', '1537871845');
INSERT INTO `ds_dish_order_item` VALUES ('157', '142', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '1', '1537946966', '1537946966');
INSERT INTO `ds_dish_order_item` VALUES ('158', '143', '11', '套餐A', '5.00', 'http://ds.sharexwd.top//uploads/20180921/5a50a3536f19366e4a23608530016cc7.png', ' ', '2', '1537959349', '1537959349');
INSERT INTO `ds_dish_order_item` VALUES ('159', '143', '12', '套餐B', '11.00', 'http://ds.sharexwd.top//uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png', ' ', '1', '1537959349', '1537959349');
INSERT INTO `ds_dish_order_item` VALUES ('160', '144', '13', '甜点', '0.01', 'http://ds.sharexwd.top//uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', ' ', '1', '1537961368', '1537961368');

-- ----------------------------
-- Table structure for ds_dish_spec
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish_spec`;
CREATE TABLE `ds_dish_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `choose_num` int(11) NOT NULL DEFAULT '1' COMMENT '可选择数量',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_spec
-- ----------------------------
INSERT INTO `ds_dish_spec` VALUES ('19', '好粥', '1', '1', '1537497794', '1537497794');
INSERT INTO `ds_dish_spec` VALUES ('18', '鲜包', '2', '1', '1537497756', '1537926753');

-- ----------------------------
-- Table structure for ds_dish_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish_spec_item`;
CREATE TABLE `ds_dish_spec_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `dish_spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联规格',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_spec_item
-- ----------------------------
INSERT INTO `ds_dish_spec_item` VALUES ('1', '菜包\r', '18', '1', '1537497756', '1537497756');
INSERT INTO `ds_dish_spec_item` VALUES ('3', '皮蛋瘦肉粥\r', '19', '1', '1537497794', '1537497794');
INSERT INTO `ds_dish_spec_item` VALUES ('4', '南瓜粥', '19', '1', '1537497794', '1537497794');
INSERT INTO `ds_dish_spec_item` VALUES ('5', '肉包\r', '18', '1', '1537926753', '1537926753');
INSERT INTO `ds_dish_spec_item` VALUES ('6', '甜包', '18', '1', '1537926753', '1537926753');

-- ----------------------------
-- Table structure for ds_ems
-- ----------------------------
DROP TABLE IF EXISTS `ds_ems`;
CREATE TABLE `ds_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of ds_ems
-- ----------------------------

-- ----------------------------
-- Table structure for ds_give_out_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ds_give_out_coupon`;
CREATE TABLE `ds_give_out_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `stime` date DEFAULT NULL COMMENT '领取起始时间',
  `etime` date DEFAULT NULL COMMENT '领取截止时间',
  `type` enum('2','1') NOT NULL COMMENT '优惠券类型:1=早餐专用,2=精选专用',
  `expiry_date` tinyint(3) NOT NULL DEFAULT '0' COMMENT '有效期(天)',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_give_out_coupon
-- ----------------------------
INSERT INTO `ds_give_out_coupon` VALUES ('1', '2018-09-25', '2018-09-30', '2', '7', '10.00', '精选专用', '精选专用', '1', '1537860063', '1537860063');

-- ----------------------------
-- Table structure for ds_give_out_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `ds_give_out_coupon_user`;
CREATE TABLE `ds_give_out_coupon_user` (
  `give_out_coupon_id` int(11) NOT NULL COMMENT '发放优惠券ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`give_out_coupon_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_give_out_coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for ds_goods
-- ----------------------------
DROP TABLE IF EXISTS `ds_goods`;
CREATE TABLE `ds_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '商品名称',
  `intro` varchar(50) NOT NULL DEFAULT '' COMMENT '简介',
  `cover_image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `goods_images` varchar(255) NOT NULL DEFAULT '' COMMENT '产品图片',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '默认价格',
  `detail_images` varchar(500) NOT NULL DEFAULT '' COMMENT '商品详情图',
  `sales_sum` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `is_recommend` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否人气推荐:0=否,1=是',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论条数',
  `is_on_sale` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否上架:0=未上架,1=已上架',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_goods
-- ----------------------------
INSERT INTO `ds_goods` VALUES ('5', '笨鸡蛋', '农家笨鸡蛋', '/uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '/uploads/20180921/0a68cb0c545102331e467cea998cfc39.png,/uploads/20180921/9d7996b0aebe8f9b520af839779e9eff.png', '10.00', '/uploads/20180921/17bdff847693a6df687a0c2dc10a4cf0.png,/uploads/20180921/7307a7cacfe318981814beacd874fccc.png,/uploads/20180921/583f0f69c438a6cb4add8c77f2fa3b2c.png,/uploads/20180921/59679590fbbe1e928ebc5feea2b9857a.png,/uploads/20180921/988f09da7915ca6c94eba1aae1bf8f3e.png,/uploads/20180921/0c0bad67d546cc2fbadce09c08922611.png,/uploads/20180921/ee18f9ede4e77a5439e5da6d5e64da56.png', '0', '1', '7', '0.00', '鸡蛋', '2', '1', '5', '1', '1537498267', '1537498267');
INSERT INTO `ds_goods` VALUES ('6', '测试用例', '测试用例', '/uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '/uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png,/uploads/20180926/bb4fe93eafa815a0edcfbed2ff5f4ee2.png,/uploads/20180926/907645faaa9980086c4e765b03227753.png', '0.01', '/uploads/20180926/1081547cd52217b0e109d01ba539f9ec.png,/uploads/20180926/fdb1dcbfdd72a2819003c537dcc5dbfc.png,/uploads/20180926/106657709052b14aed7f07f07f1dab21.png', '0', '1', '7', '0.00', '测试', '13', '1', '6', '1', '1537946622', '1537946622');

-- ----------------------------
-- Table structure for ds_order
-- ----------------------------
DROP TABLE IF EXISTS `ds_order`;
CREATE TABLE `ds_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` enum('5','4','3','2','1','0') NOT NULL DEFAULT '1' COMMENT '订单状态:0=隐藏,1=待支付,2=待发货,3=待收货,4=待评价,5=已完成',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `product_total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `order_total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `delivery_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT 'prepay_id',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_order
-- ----------------------------
INSERT INTO `ds_order` VALUES ('2', '2018925428554085643', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'hu', '北京市北京市东城区erw', '15138328395', null, null, '0', '0.00', 'wx25103415606305714d41c51e4069161851', '1537842855', '1537842855', null);
INSERT INTO `ds_order` VALUES ('3', '2018925430634531150', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'hu', '北京市北京市东城区erw', '15138328395', null, null, '0', '0.00', 'wx251037436624383936c6fe772750936658', '1537843063', '1537843063', null);
INSERT INTO `ds_order` VALUES ('4', '2018925433148447335', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'hu', '北京市北京市东城区erw', '15138328395', null, null, '0', '0.00', 'wx2510415509975610d25ccc4e4264840686', '1537843314', '1537843315', null);
INSERT INTO `ds_order` VALUES ('5', '2018925440413707883', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'hu', '北京市北京市东城区erw', '15138328395', null, null, '0', '0.00', 'wx251054017565385b7d6583a54068944145', '1537844041', '1537844041', null);
INSERT INTO `ds_order` VALUES ('6', '2018925443875441038', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx25105947827535bb1db7eef22380621968', '1537844387', '1537844387', null);
INSERT INTO `ds_order` VALUES ('7', '2018925444307883709', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx2511003100695394e85511a71352281528', '1537844430', '1537844431', null);
INSERT INTO `ds_order` VALUES ('8', '2018925445592747204', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx25110239480406f11a9521bd1722289048', '1537844559', '1537844559', null);
INSERT INTO `ds_order` VALUES ('9', '2018925446409997434', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx25110401247826a5a34178a42013290876', '1537844641', '1537844641', null);
INSERT INTO `ds_order` VALUES ('10', '2018925447288249989', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251105290728626f3914a5f40283418252', '1537844728', '1537844729', null);
INSERT INTO `ds_order` VALUES ('11', '2018925447980260836', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx2511063826775656b58e41511970092426', '1537844798', '1537844798', null);
INSERT INTO `ds_order` VALUES ('12', '2018925479039265069', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx25115824152176db0320d6c82754152697', '1537847903', '1537847904', null);
INSERT INTO `ds_order` VALUES ('13', '2018925479108441274', '1', '1', '4', '39.20', '39.20', '0.00', '39.20', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251158310775206acdb1b1fd1489321029', '1537847910', '1537847911', null);
INSERT INTO `ds_order` VALUES ('14', '2018925556096613208', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251406498632767bef9d30c61756279338', '1537855609', '1537855609', null);
INSERT INTO `ds_order` VALUES ('15', '2018925556882966184', '1', '1', '4', '39.20', '39.20', '0.00', '39.20', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251408085827406cd2f9b7af2200134683', '1537855688', '1537855688', null);
INSERT INTO `ds_order` VALUES ('16', '2018925571318082992', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx2514321201390734d53188cf4105592633', '1537857131', '1537857132', null);
INSERT INTO `ds_order` VALUES ('17', '2018925600669931291', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251521072494802ecca31aca1537279669', '1537860066', '1537860067', null);
INSERT INTO `ds_order` VALUES ('18', '2018925601038085530', '1', '1', '6', '58.80', '58.80', '0.00', '58.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251521440676341d346672f33787992804', '1537860103', '1537860104', null);
INSERT INTO `ds_order` VALUES ('19', '2018925626783176664', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx25160438538288d8d62ce0381492255130', '1537862678', '1537862678', null);
INSERT INTO `ds_order` VALUES ('20', '2018925627681184001', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'asd', '北京市北京市东城区asd', '15138328395', null, null, '0', '0.00', 'wx2516060834711228f603c87d1517069295', '1537862768', '1537862768', null);
INSERT INTO `ds_order` VALUES ('21', '2018925629075066410', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'asd', '北京市北京市东城区asd', '15138328395', null, null, '0', '0.00', 'wx251608277492620d42cf1f6d2057255482', '1537862907', '1537862907', null);
INSERT INTO `ds_order` VALUES ('22', '2018925629358615889', '1', '1', '1', '9.80', '9.80', '0.00', '9.80', 'asd', '北京市北京市东城区asd', '15138328395', null, null, '0', '0.00', 'wx251608561494391932e66f341467316670', '1537862935', '1537862936', null);
INSERT INTO `ds_order` VALUES ('23', '2018925629763187372', '4', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx251718008859162e71804db41842981939', '1537862976', '1537867080', null);
INSERT INTO `ds_order` VALUES ('24', '2018925770142342163', '4', '1', '1', '9.80', '9.80', '0.00', '9.80', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx26153128456107c6ef6246c11769741550', '1537877014', '1537947088', null);
INSERT INTO `ds_order` VALUES ('25', '2018926470042160300', '4', '1', '1', '0.01', '0.01', '0.00', '0.01', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1537947032', null, '0', '0.00', 'wx26153004416590c3160df3011421913940', '1537947004', '1538015996', null);
INSERT INTO `ds_order` VALUES ('26', '2018926517094544376', '5', '1', '1', '0.01', '0.01', '0.00', '0.01', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx261856340734803afda9c6af2671526499', '1537951709', '1538038842', null);
INSERT INTO `ds_order` VALUES ('27', '2018926517563532897', '4', '1', '2', '9.81', '9.81', '0.00', '9.81', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx26164916541140e6af1da1ac1522416808', '1537951756', '1537951756', null);
INSERT INTO `ds_order` VALUES ('28', '2018926517613904290', '4', '1', '2', '9.81', '9.81', '0.00', '9.81', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx261649216585843dfc86cf9a4088779721', '1537951761', '1538028151', null);
INSERT INTO `ds_order` VALUES ('29', '2018926593600447569', '5', '1', '1', '0.01', '0.01', '0.00', '0.01', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', '1538017281', null, '0', '0.00', 'wx27110106719108b7d0185ca32303036126', '1537959360', '1538037601', null);
INSERT INTO `ds_order` VALUES ('30', '2018927282800665358', '5', '1', '2', '9.81', '9.81', '0.00', '9.81', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx27140440297642070f2c51cf2576297441', '1538028280', '1538036756', null);
INSERT INTO `ds_order` VALUES ('31', '2018927303602073507', '4', '1', '1', '0.01', '0.01', '0.00', '0.01', '最权威', '北京市北京市东城区亲吻青蛙', '15138328395', null, null, '0', '0.00', 'wx27143920441623093b5290310681993713', '1538030360', '1538030360', null);

-- ----------------------------
-- Table structure for ds_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ds_order_goods`;
CREATE TABLE `ds_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `spec_key` varchar(50) NOT NULL DEFAULT '' COMMENT '商品规格',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `spec_key_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品规格名',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_order_goods
-- ----------------------------
INSERT INTO `ds_order_goods` VALUES ('1', '2', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537842855', '1537842855');
INSERT INTO `ds_order_goods` VALUES ('2', '3', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537843063', '1537843063');
INSERT INTO `ds_order_goods` VALUES ('3', '4', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537843314', '1537843314');
INSERT INTO `ds_order_goods` VALUES ('4', '5', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844041', '1537844041');
INSERT INTO `ds_order_goods` VALUES ('5', '6', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844387', '1537844387');
INSERT INTO `ds_order_goods` VALUES ('6', '7', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844430', '1537844430');
INSERT INTO `ds_order_goods` VALUES ('7', '8', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844559', '1537844559');
INSERT INTO `ds_order_goods` VALUES ('8', '9', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844641', '1537844641');
INSERT INTO `ds_order_goods` VALUES ('9', '10', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844728', '1537844728');
INSERT INTO `ds_order_goods` VALUES ('10', '11', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537844798', '1537844798');
INSERT INTO `ds_order_goods` VALUES ('11', '12', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537847903', '1537847903');
INSERT INTO `ds_order_goods` VALUES ('12', '13', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '4', '尺寸:大;颜色:白色', '1537847910', '1537847910');
INSERT INTO `ds_order_goods` VALUES ('13', '14', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537855609', '1537855609');
INSERT INTO `ds_order_goods` VALUES ('14', '15', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '4', '尺寸:大;颜色:白色', '1537855688', '1537855688');
INSERT INTO `ds_order_goods` VALUES ('15', '16', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537857131', '1537857131');
INSERT INTO `ds_order_goods` VALUES ('16', '17', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537860067', '1537860067');
INSERT INTO `ds_order_goods` VALUES ('17', '18', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '6', '尺寸:大;颜色:白色', '1537860103', '1537860103');
INSERT INTO `ds_order_goods` VALUES ('18', '19', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537862678', '1537862678');
INSERT INTO `ds_order_goods` VALUES ('19', '20', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537862768', '1537862768');
INSERT INTO `ds_order_goods` VALUES ('20', '21', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537862907', '1537862907');
INSERT INTO `ds_order_goods` VALUES ('21', '22', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537862935', '1537862935');
INSERT INTO `ds_order_goods` VALUES ('22', '23', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大;颜色:白色', '1537862976', '1537862976');
INSERT INTO `ds_order_goods` VALUES ('23', '24', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大\r 颜色:白色\r ', '1537877014', '1537877014');
INSERT INTO `ds_order_goods` VALUES ('24', '25', '6', '17,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:大\r 颜色:白色\r ', '1537947004', '1537947004');
INSERT INTO `ds_order_goods` VALUES ('25', '26', '6', '19,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:小 颜色:白色\r ', '1537951709', '1537951709');
INSERT INTO `ds_order_goods` VALUES ('26', '27', '6', '17,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:大\r 颜色:白色\r ', '1537951756', '1537951756');
INSERT INTO `ds_order_goods` VALUES ('27', '27', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大\r 颜色:白色\r ', '1537951756', '1537951756');
INSERT INTO `ds_order_goods` VALUES ('28', '28', '6', '17,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:大\r 颜色:白色\r ', '1537951761', '1537951761');
INSERT INTO `ds_order_goods` VALUES ('29', '28', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大\r 颜色:白色\r ', '1537951761', '1537951761');
INSERT INTO `ds_order_goods` VALUES ('30', '29', '6', '17,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:大\r 颜色:白色\r ', '1537959360', '1537959360');
INSERT INTO `ds_order_goods` VALUES ('31', '30', '6', '17,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:大\r 颜色:白色\r ', '1538028280', '1538028280');
INSERT INTO `ds_order_goods` VALUES ('32', '30', '5', '17,20', '笨鸡蛋', 'http://ds.sharexwd.top//uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '9.80', '1', '尺寸:大\r 颜色:白色\r ', '1538028280', '1538028280');
INSERT INTO `ds_order_goods` VALUES ('33', '31', '6', '17,20', '测试用例', 'http://ds.sharexwd.top//uploads/20180926/43d42e4d0789ac307e043290147b7dc6.png', '0.01', '1', '尺寸:大\r 颜色:白色\r ', '1538030360', '1538030360');

-- ----------------------------
-- Table structure for ds_search
-- ----------------------------
DROP TABLE IF EXISTS `ds_search`;
CREATE TABLE `ds_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '搜索内容',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_search
-- ----------------------------
INSERT INTO `ds_search` VALUES ('4', 'undefined', '4', '1', '0', '0');

-- ----------------------------
-- Table structure for ds_sms
-- ----------------------------
DROP TABLE IF EXISTS `ds_sms`;
CREATE TABLE `ds_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Records of ds_sms
-- ----------------------------

-- ----------------------------
-- Table structure for ds_spec
-- ----------------------------
DROP TABLE IF EXISTS `ds_spec`;
CREATE TABLE `ds_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规格名称',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_spec
-- ----------------------------
INSERT INTO `ds_spec` VALUES ('8', '尺寸', '1', '1537450423', '1537450423');
INSERT INTO `ds_spec` VALUES ('9', '颜色', '1', '1537450443', '1537450443');

-- ----------------------------
-- Table structure for ds_spec_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `ds_spec_goods_price`;
CREATE TABLE `ds_spec_goods_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `key` varchar(255) DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) DEFAULT NULL COMMENT '规格键名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_spec_goods_price
-- ----------------------------
INSERT INTO `ds_spec_goods_price` VALUES ('6', '5', '17,20', '尺寸:大\r 颜色:白色\r ', '9.80', '/uploads/20180921/e40f3db079e3f4af8004375e032fb1d3.png', '1', '1537871960', '1537871960');
INSERT INTO `ds_spec_goods_price` VALUES ('7', '5', '17,21', '尺寸:大\r 颜色:黑色\r ', '8.80', '/uploads/20180925/d1156772f6dec6a17d9d7ce7119c2b12.png', '1', '1537871960', '1537871960');
INSERT INTO `ds_spec_goods_price` VALUES ('8', '6', '17,20', '尺寸:大\r 颜色:白色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('9', '6', '17,21', '尺寸:大\r 颜色:黑色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('10', '6', '17,22', '尺寸:大\r 颜色:蓝色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('11', '6', '17,23', '尺寸:大\r 颜色:紫色 ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('12', '6', '18,20', '尺寸:中\r 颜色:白色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('13', '6', '18,21', '尺寸:中\r 颜色:黑色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('14', '6', '18,22', '尺寸:中\r 颜色:蓝色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('15', '6', '18,23', '尺寸:中\r 颜色:紫色 ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('16', '6', '19,20', '尺寸:小 颜色:白色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('17', '6', '19,21', '尺寸:小 颜色:黑色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('18', '6', '19,22', '尺寸:小 颜色:蓝色\r ', '0.01', '', '1', '1537946664', '1537946664');
INSERT INTO `ds_spec_goods_price` VALUES ('19', '6', '19,23', '尺寸:小 颜色:紫色 ', '0.01', '', '1', '1537946664', '1537946664');

-- ----------------------------
-- Table structure for ds_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ds_spec_item`;
CREATE TABLE `ds_spec_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spec_id` int(11) NOT NULL COMMENT '规格ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '规格项',
  `isselect` tinyint(1) NOT NULL DEFAULT '0' COMMENT '选择',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_spec_item
-- ----------------------------
INSERT INTO `ds_spec_item` VALUES ('17', '8', '大\r', '0', '1', '1537450423', '1537450423');
INSERT INTO `ds_spec_item` VALUES ('18', '8', '中\r', '0', '1', '1537450423', '1537450423');
INSERT INTO `ds_spec_item` VALUES ('19', '8', '小', '0', '1', '1537450423', '1537450423');
INSERT INTO `ds_spec_item` VALUES ('20', '9', '白色\r', '0', '1', '1537450443', '1537450443');
INSERT INTO `ds_spec_item` VALUES ('21', '9', '黑色\r', '0', '1', '1537450443', '1537450443');
INSERT INTO `ds_spec_item` VALUES ('22', '9', '蓝色\r', '0', '1', '1537450443', '1537450443');
INSERT INTO `ds_spec_item` VALUES ('23', '9', '紫色', '0', '1', '1537450443', '1537450443');

-- ----------------------------
-- Table structure for ds_test
-- ----------------------------
DROP TABLE IF EXISTS `ds_test`;
CREATE TABLE `ds_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ds_test
-- ----------------------------
INSERT INTO `ds_test` VALUES ('1', '1');
INSERT INTO `ds_test` VALUES ('2', '1');
INSERT INTO `ds_test` VALUES ('3', '1');
INSERT INTO `ds_test` VALUES ('4', '1');
INSERT INTO `ds_test` VALUES ('5', '1');
INSERT INTO `ds_test` VALUES ('6', 'dish');
INSERT INTO `ds_test` VALUES ('7', 'dish');
INSERT INTO `ds_test` VALUES ('8', 'dish');
INSERT INTO `ds_test` VALUES ('9', 'dish');
INSERT INTO `ds_test` VALUES ('10', 'dish');

-- ----------------------------
-- Table structure for ds_user
-- ----------------------------
DROP TABLE IF EXISTS `ds_user`;
CREATE TABLE `ds_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT 'openID',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `gender` enum('2','1','0') NOT NULL DEFAULT '0' COMMENT '性别:0=未知,1=男,2=女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of ds_user
-- ----------------------------
INSERT INTO `ds_user` VALUES ('1', 'o5evq4pWqO7quA3xfjmPozTtymXM', '再见～时光', '15138328395', 'https://wx.qlogo.cn/mmopen/vi_32/5cZdfXExiaicviaoKgFhy2ukEL0MTE54HjbnZbfgWcUIibVSsPB9U2MlSMNbJwiaY1j20ibhoZb4fq6mxVIO5P7OBbpQ/132', '1', '2018-09-23', '1537498395', '1538041554', '1');
INSERT INTO `ds_user` VALUES ('2', 'o5evq4ic1KCV58Tp87R-mhz31IZ4', '', '', '', '0', null, '1537499869', '1537499869', '1');

-- ----------------------------
-- Table structure for ds_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ds_user_address`;
CREATE TABLE `ds_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '省/市/区',
  `detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_default` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否默认:0=否,1=是',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_user_address
-- ----------------------------
INSERT INTO `ds_user_address` VALUES ('5', '1', 'hu', '15138328395', '北京市/北京市/东城区', 'erw', '0', '1', '1537500946', '1537956249');
INSERT INTO `ds_user_address` VALUES ('3', '1', '最权威', '15138328395', '北京市/北京市/东城区', '亲吻青蛙', '1', '1', '1537500477', '1538030554');
INSERT INTO `ds_user_address` VALUES ('4', '2', '张强', '18667933305', '浙江省/杭州市/滨江区', '卧龙科技园', '0', '1', '0', '0');
INSERT INTO `ds_user_address` VALUES ('6', '1', 'asd', '15138328395', '北京市/北京市/东城区', 'asd', '0', '1', '1537502070', '1537956245');
INSERT INTO `ds_user_address` VALUES ('7', '1', 'gc', '15138328395', '北京市/北京市/东城区', 'qweq', '0', '1', '1537502204', '1537956246');

-- ----------------------------
-- Table structure for ds_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ds_user_coupon`;
CREATE TABLE `ds_user_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  `type` enum('2','1') NOT NULL DEFAULT '1' COMMENT '优惠券类型:1=早餐专用,2=商城专用',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `stime` date DEFAULT NULL COMMENT '起始时间',
  `etime` date DEFAULT NULL COMMENT '结束时间',
  `status` enum('2','1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=已过期,1=未使用,2=已使用',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for ds_version
-- ----------------------------
DROP TABLE IF EXISTS `ds_version`;
CREATE TABLE `ds_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of ds_version
-- ----------------------------
INSERT INTO `ds_version` VALUES ('1', '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', '1', '1520425318', '0', '0', 'normal');
