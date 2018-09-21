/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : dszc

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-20 21:50:03
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
INSERT INTO `ds_admin` VALUES ('1', 'admin', 'Admin', 'a4a187a878c3972ffadb1d6de3a185d8', 'bc9cab', '/assets/img/avatar.png', 'admin@admin.com', '0', '1537448078', '1492186163', '1537448078', '99238d81-33eb-4e41-b40a-9dd0a55da000', 'normal');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

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

-- ----------------------------
-- Table structure for ds_apply_goods
-- ----------------------------
DROP TABLE IF EXISTS `ds_apply_goods`;
CREATE TABLE `ds_apply_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of ds_attachment
-- ----------------------------
INSERT INTO `ds_attachment` VALUES ('1', '1', '0', '/assets/img/qrcode.png', '150', '150', 'png', '0', '21859', 'image/png', '', '1499681848', '1499681848', '1499681848', 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `ds_attachment` VALUES ('2', '1', '0', '/uploads/20180920/a3fe84d16d5427ac188ce2d742aafa69.png', '430', '430', 'png', '0', '29430', 'image/png', '', '1537446273', '1537446273', '1537446273', 'local', 'c4d54df5213b1d7eb06a09c1cd6efe6f80ef641b');
INSERT INTO `ds_attachment` VALUES ('3', '1', '0', '/uploads/20180920/03473f8cef4f2d471ff90d184a0e2e4f.png', '430', '430', 'png', '0', '31455', 'image/png', '', '1537446293', '1537446293', '1537446293', 'local', 'd297e3380cf7b388b3470c3170d5b44774cad6a5');
INSERT INTO `ds_attachment` VALUES ('4', '1', '0', '/uploads/20180920/907645faaa9980086c4e765b03227753.png', '430', '430', 'png', '0', '36304', 'image/png', '', '1537446312', '1537446312', '1537446312', 'local', '4984334e5ea00f6652a6a6a7c462fb033710eefd');
INSERT INTO `ds_attachment` VALUES ('5', '1', '0', '/uploads/20180920/e40f3db079e3f4af8004375e032fb1d3.png', '430', '430', 'png', '0', '20934', 'image/png', '', '1537446330', '1537446330', '1537446330', 'local', '6605d5a18e1292108a710261f6577a502369bb9d');

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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

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
INSERT INTO `ds_banner` VALUES ('4', '早餐轮播图', '首页早餐轮播图', '1537447694', '1537447694', '1');
INSERT INTO `ds_banner` VALUES ('5', '精选轮播图', '商城精选轮播图', '1537447722', '1537447722', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_banner_item
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_comment
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_coupon
-- ----------------------------

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
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '默认选择数量',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_order
-- ----------------------------

-- ----------------------------
-- Table structure for ds_dish_order_item
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish_order_item`;
CREATE TABLE `ds_dish_order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL COMMENT '所属订单',
  `dish_id` int(11) NOT NULL COMMENT '菜品id',
  `spec_name` varchar(255) DEFAULT NULL COMMENT '规格名称',
  `dish_count` int(11) NOT NULL DEFAULT '1' COMMENT '菜品数量',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_order_item
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_spec
-- ----------------------------

-- ----------------------------
-- Table structure for ds_dish_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `ds_dish_spec_item`;
CREATE TABLE `ds_dish_spec_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `dish_spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联规格',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_dish_spec_item
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_give_out_coupon
-- ----------------------------

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
  `detail_content` text NOT NULL COMMENT '商品详情',
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_goods
-- ----------------------------

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
  `coupon_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '优惠券金额',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_order
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_order_goods
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_search
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_spec_goods_price
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of ds_user
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ds_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for ds_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ds_user_coupon`;
CREATE TABLE `ds_user_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  `type` enum('2','0','1') NOT NULL DEFAULT '1' COMMENT '优惠券类型:0=全场通用,1=早餐专用,2=商城专用',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券描述',
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
