/*
Navicat MySQL Data Transfer

Source Server         : 大山早餐
Source Server Version : 50636
Source Host           : 47.99.89.219:3306
Source Database       : dszc

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-09-07 16:31:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dszc_admin
-- ----------------------------
DROP TABLE IF EXISTS `dszc_admin`;
CREATE TABLE `dszc_admin` (
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
-- Table structure for dszc_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dszc_admin_log`;
CREATE TABLE `dszc_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

-- ----------------------------
-- Table structure for dszc_apply_goods
-- ----------------------------
DROP TABLE IF EXISTS `dszc_apply_goods`;
CREATE TABLE `dszc_apply_goods` (
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
-- Table structure for dszc_apply_horseman
-- ----------------------------
DROP TABLE IF EXISTS `dszc_apply_horseman`;
CREATE TABLE `dszc_apply_horseman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `status` enum('2','1','0') NOT NULL DEFAULT '1' COMMENT '申请状态:0=申请失败,1=申请中,2=申请成功',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dszc_attachment`;
CREATE TABLE `dszc_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
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
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Table structure for dszc_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `dszc_auth_group`;
CREATE TABLE `dszc_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Table structure for dszc_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `dszc_auth_group_access`;
CREATE TABLE `dszc_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

-- ----------------------------
-- Table structure for dszc_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `dszc_auth_rule`;
CREATE TABLE `dszc_auth_rule` (
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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Table structure for dszc_banner
-- ----------------------------
DROP TABLE IF EXISTS `dszc_banner`;
CREATE TABLE `dszc_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Banner位ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Banner名称',
  `description` text NOT NULL COMMENT 'Banner描述',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('1','0') DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_banner_item
-- ----------------------------
DROP TABLE IF EXISTS `dszc_banner_item`;
CREATE TABLE `dszc_banner_item` (
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
-- Table structure for dszc_category
-- ----------------------------
DROP TABLE IF EXISTS `dszc_category`;
CREATE TABLE `dszc_category` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Table structure for dszc_comment
-- ----------------------------
DROP TABLE IF EXISTS `dszc_comment`;
CREATE TABLE `dszc_comment` (
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
-- Table structure for dszc_config
-- ----------------------------
DROP TABLE IF EXISTS `dszc_config`;
CREATE TABLE `dszc_config` (
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Table structure for dszc_coupon
-- ----------------------------
DROP TABLE IF EXISTS `dszc_coupon`;
CREATE TABLE `dszc_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('3','2','1') NOT NULL DEFAULT '1' COMMENT '优惠券类型:1=购买商品赠送,2=登录赠送,3=绑定手机号赠送',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券描述',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_crontab
-- ----------------------------
DROP TABLE IF EXISTS `dszc_crontab`;
CREATE TABLE `dszc_crontab` (
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
-- Table structure for dszc_dish
-- ----------------------------
DROP TABLE IF EXISTS `dszc_dish`;
CREATE TABLE `dszc_dish` (
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
-- Table structure for dszc_dish_order
-- ----------------------------
DROP TABLE IF EXISTS `dszc_dish_order`;
CREATE TABLE `dszc_dish_order` (
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
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `prepay_id` varchar(100) DEFAULT '' COMMENT 'prepayID',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_dish_order_item
-- ----------------------------
DROP TABLE IF EXISTS `dszc_dish_order_item`;
CREATE TABLE `dszc_dish_order_item` (
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
-- Table structure for dszc_dish_spec
-- ----------------------------
DROP TABLE IF EXISTS `dszc_dish_spec`;
CREATE TABLE `dszc_dish_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dish_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属餐品',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `choose_num` int(11) NOT NULL DEFAULT '1' COMMENT '可选择数量',
  `item` varchar(255) NOT NULL DEFAULT '' COMMENT '选项',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_ems
-- ----------------------------
DROP TABLE IF EXISTS `dszc_ems`;
CREATE TABLE `dszc_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Table structure for dszc_goods
-- ----------------------------
DROP TABLE IF EXISTS `dszc_goods`;
CREATE TABLE `dszc_goods` (
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
-- Table structure for dszc_order
-- ----------------------------
DROP TABLE IF EXISTS `dszc_order`;
CREATE TABLE `dszc_order` (
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
-- Table structure for dszc_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `dszc_order_goods`;
CREATE TABLE `dszc_order_goods` (
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
-- Table structure for dszc_search
-- ----------------------------
DROP TABLE IF EXISTS `dszc_search`;
CREATE TABLE `dszc_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '搜索内容',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '搜索次数',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_sms
-- ----------------------------
DROP TABLE IF EXISTS `dszc_sms`;
CREATE TABLE `dszc_sms` (
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
-- Table structure for dszc_spec
-- ----------------------------
DROP TABLE IF EXISTS `dszc_spec`;
CREATE TABLE `dszc_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规格名称',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_spec_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `dszc_spec_goods_price`;
CREATE TABLE `dszc_spec_goods_price` (
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
-- Table structure for dszc_spec_item
-- ----------------------------
DROP TABLE IF EXISTS `dszc_spec_item`;
CREATE TABLE `dszc_spec_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spec_id` int(11) NOT NULL COMMENT '规格ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '规格项',
  `isselect` tinyint(1) NOT NULL DEFAULT '0' COMMENT '选择',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_user
-- ----------------------------
DROP TABLE IF EXISTS `dszc_user`;
CREATE TABLE `dszc_user` (
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
-- Table structure for dszc_user_address
-- ----------------------------
DROP TABLE IF EXISTS `dszc_user_address`;
CREATE TABLE `dszc_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户',
  `consignee` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区',
  `detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_default` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否默认:0=否,1=是',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '状态:0=隐藏,1=正常',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dszc_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `dszc_user_coupon`;
CREATE TABLE `dszc_user_coupon` (
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
-- Table structure for dszc_version
-- ----------------------------
DROP TABLE IF EXISTS `dszc_version`;
CREATE TABLE `dszc_version` (
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
