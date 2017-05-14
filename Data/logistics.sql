/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50086
Source Host           : localhost:3306
Source Database       : logistics

Target Server Type    : MYSQL
Target Server Version : 50086
File Encoding         : 65001

Date: 2017-05-15 00:30:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for logistics_action
-- ----------------------------
DROP TABLE IF EXISTS `logistics_action`;
CREATE TABLE `logistics_action` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` char(30) NOT NULL default '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL default '' COMMENT '行为说明',
  `remark` char(140) NOT NULL default '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL default '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL default '0' COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of logistics_action
-- ----------------------------
INSERT INTO `logistics_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `logistics_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '1', '1380173180');
INSERT INTO `logistics_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `logistics_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '1', '1386139726');
INSERT INTO `logistics_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `logistics_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `logistics_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `logistics_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `logistics_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `logistics_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `logistics_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1490942434');

-- ----------------------------
-- Table structure for logistics_action_log
-- ----------------------------
DROP TABLE IF EXISTS `logistics_action_log`;
CREATE TABLE `logistics_action_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL default '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL default '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL default '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL default '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL default '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '执行行为的时间',
  PRIMARY KEY  (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of logistics_action_log
-- ----------------------------
INSERT INTO `logistics_action_log` VALUES ('1', '1', '86', '2130706433', 'member', '86', 'adminyuanteng在2017-05-14 22:03登录了后台', '1', '1494770615');
INSERT INTO `logistics_action_log` VALUES ('2', '1', '86', '2130706433', 'member', '86', 'adminyuanteng在2017-05-14 22:05登录了后台', '1', '1494770757');
INSERT INTO `logistics_action_log` VALUES ('3', '1', '67', '2130706433', 'member', '67', '0316-5328497在2017-05-14 22:10登录了后台', '1', '1494771003');
INSERT INTO `logistics_action_log` VALUES ('4', '1', '97', '2130706433', 'member', '97', 'shexie960在2017-05-14 22:45登录了后台', '1', '1494773154');
INSERT INTO `logistics_action_log` VALUES ('5', '1', '97', '2130706433', 'member', '97', 'shexie960在2017-05-14 22:47登录了后台', '1', '1494773255');
INSERT INTO `logistics_action_log` VALUES ('6', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-14 23:31登录了后台', '1', '1494775879');
INSERT INTO `logistics_action_log` VALUES ('7', '1', '98', '2130706433', 'member', '98', 'shexie961在2017-05-15 00:01登录了后台', '1', '1494777663');
INSERT INTO `logistics_action_log` VALUES ('8', '1', '98', '2130706433', 'member', '98', 'shexie961在2017-05-15 00:03登录了后台', '1', '1494777787');
INSERT INTO `logistics_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-15 00:14登录了后台', '1', '1494778460');
INSERT INTO `logistics_action_log` VALUES ('10', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-15 00:17登录了后台', '1', '1494778657');
INSERT INTO `logistics_action_log` VALUES ('11', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-15 00:21登录了后台', '1', '1494778866');
INSERT INTO `logistics_action_log` VALUES ('12', '6', '1', '2130706433', 'config', '20', '操作url：/index.php?s=/config/edit.html', '1', '1494779230');
INSERT INTO `logistics_action_log` VALUES ('13', '1', '85', '2130706433', 'member', '85', 'yuantengadmin在2017-05-15 00:29登录了后台', '1', '1494779344');

-- ----------------------------
-- Table structure for logistics_ad
-- ----------------------------
DROP TABLE IF EXISTS `logistics_ad`;
CREATE TABLE `logistics_ad` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '频道ID',
  `ad_title` varchar(200) NOT NULL default '' COMMENT '广告标题',
  `position` tinyint(3) unsigned NOT NULL default '0' COMMENT '广告位位置id',
  `ad_img` varchar(200) NOT NULL COMMENT '频道连接',
  `ad_url` varchar(200) NOT NULL default '' COMMENT '广告链接',
  `sort` int(10) unsigned NOT NULL default '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL default '0' COMMENT '状态 1-正常 0-隐藏',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_ad
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_addons
-- ----------------------------
DROP TABLE IF EXISTS `logistics_addons`;
CREATE TABLE `logistics_addons` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL default '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL default '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) default '' COMMENT '作者',
  `version` varchar(20) default '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否有后台列表',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of logistics_addons
-- ----------------------------
INSERT INTO `logistics_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"400px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `logistics_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');

-- ----------------------------
-- Table structure for logistics_attachment
-- ----------------------------
DROP TABLE IF EXISTS `logistics_attachment`;
CREATE TABLE `logistics_attachment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
  `title` char(30) NOT NULL default '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL default '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL default '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL default '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL default '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL default '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL default '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL default '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL default '0' COMMENT '状态',
  PRIMARY KEY  (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of logistics_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_attribute
-- ----------------------------
DROP TABLE IF EXISTS `logistics_attribute`;
CREATE TABLE `logistics_attribute` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '' COMMENT '字段名',
  `title` varchar(100) NOT NULL default '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL default '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL default '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL default '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL default '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL default '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL default '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL default '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL default '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of logistics_attribute
-- ----------------------------
INSERT INTO `logistics_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '点击上传按钮，如果已经上传则会覆盖', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `logistics_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `logistics_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `logistics_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:待审核\r\n1:正常\r\n2:未审核\r\n3:草稿', '1', '0', '1', '1493635954', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `logistics_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `logistics_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for logistics_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `logistics_auth_extend`;
CREATE TABLE `logistics_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of logistics_auth_extend
-- ----------------------------
INSERT INTO `logistics_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '5', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '6', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '7', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '2', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '3', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '4', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '5', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '7', '1');
INSERT INTO `logistics_auth_extend` VALUES ('3', '6', '1');
INSERT INTO `logistics_auth_extend` VALUES ('3', '7', '1');

-- ----------------------------
-- Table structure for logistics_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `logistics_auth_group`;
CREATE TABLE `logistics_auth_group` (
  `id` mediumint(8) unsigned NOT NULL auto_increment COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL default '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL default '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL default '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL default '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_auth_group
-- ----------------------------
INSERT INTO `logistics_auth_group` VALUES ('1', 'admin', '1', '管理员', '', '1', '2,3,7,8,9,10,17,23,24,26,65,67,68,69,70,71,72,74,88,108,178,211,214,221,222,223,224,225,226,227,228,229,230');
INSERT INTO `logistics_auth_group` VALUES ('2', 'admin', '1', '物流用户', '', '1', '2,3,7,10,17,108,218,221');
INSERT INTO `logistics_auth_group` VALUES ('3', 'admin', '1', '生成厂家', '', '1', '2,3,7,10,17,108,218,221');

-- ----------------------------
-- Table structure for logistics_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `logistics_auth_group_access`;
CREATE TABLE `logistics_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_auth_group_access
-- ----------------------------
INSERT INTO `logistics_auth_group_access` VALUES ('2', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('3', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('4', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('4', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('5', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('5', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('6', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('7', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('8', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('8', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('9', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('10', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('11', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('11', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('12', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('13', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('13', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('14', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('15', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('15', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('16', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('16', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('17', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('18', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('19', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('20', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('21', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('22', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('22', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('23', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('24', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('25', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('26', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('27', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('28', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('29', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('30', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('31', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('32', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('33', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('34', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('35', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('36', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('37', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('38', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('39', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('40', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('41', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('42', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('43', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('44', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('45', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('46', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('47', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('48', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('49', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('50', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('51', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('52', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('53', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('54', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('55', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('56', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('57', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('58', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('59', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('60', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('61', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('62', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('63', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('64', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('65', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('66', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('67', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('68', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('69', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('70', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('71', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('72', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('73', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('74', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('75', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('76', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('77', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('78', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('79', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('80', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('81', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('82', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('83', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('84', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('85', '1');
INSERT INTO `logistics_auth_group_access` VALUES ('85', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('86', '1');
INSERT INTO `logistics_auth_group_access` VALUES ('86', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('87', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('88', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('89', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('90', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('91', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('92', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('93', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('94', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('95', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('96', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('97', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('98', '2');

-- ----------------------------
-- Table structure for logistics_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `logistics_auth_rule`;
CREATE TABLE `logistics_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL auto_increment COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL default '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL default '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL default '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL default '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL default '' COMMENT '规则附加条件',
  PRIMARY KEY  (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_auth_rule
-- ----------------------------
INSERT INTO `logistics_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '友链管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '系统', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('219', 'admin', '1', 'Admin/user/sss', '个人中心', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('217', 'admin', '1', 'Admin/user', '个人中心', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('218', 'admin', '1', 'Admin/User/recharge', '会员充值', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('220', 'admin', '2', 'Admin/Article/index?cate_id=2', '内容', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('221', 'admin', '1', 'Admin/User/info', '完善资料', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('222', 'admin', '1', 'Admin/User/manual_recharge', '手动充值', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Ad/add', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Ad/edit', '编辑', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Ad/index', '广告管理', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Ad/del', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('227', 'admin', '1', 'Admin/City/hotAdd', '新增', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('228', 'admin', '1', 'Admin/City/hotDel', '删除', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('229', 'admin', '1', 'Admin/City/hot', '热门城市', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Category/setStatus', '更改状态', '1', '');

-- ----------------------------
-- Table structure for logistics_category
-- ----------------------------
DROP TABLE IF EXISTS `logistics_category`;
CREATE TABLE `logistics_category` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL default '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL default '30' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL default '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL default '' COMMENT '关键字',
  `description` varchar(255) NOT NULL default '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL default '2' COMMENT '关联模型',
  `type` varchar(100) NOT NULL default '2,1' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL default '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL default '2' COMMENT '是否允许发布内容 0-不允许 1-仅运行后台 2-允许前后台',
  `display` tinyint(3) unsigned NOT NULL default '1' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL default '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL default '1' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL default '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL default '0' COMMENT '分类图标',
  `province_id` mediumint(8) unsigned NOT NULL default '0' COMMENT '省份id 为jpzx的二级分类准备',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of logistics_category
-- ----------------------------
INSERT INTO `logistics_category` VALUES ('5', 'tjhc', '推荐货车', '0', '4', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492065358', '1492065527', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('2', 'jpzx', '精品专线', '0', '1', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '0', '1', '', '', '1490326849', '1492755931', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('3', 'ldp', '落地配', '0', '2', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1490595686', '1492065524', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('4', 'zhwl', '综合物流', '0', '3', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1491035129', '1492065525', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('6', 'sccj', '生产厂家', '0', '5', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492065425', '1492065529', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('7', 'fbhy', '货源', '0', '6', '30', '', '', '', '', 'Index/hy', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492133721', '1493102654', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('8', 'sn', '市内', '2', '1', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '100000');
INSERT INTO `logistics_category` VALUES ('9', 'bj', '北京', '2', '2', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492764992', '1', '0', '110000');
INSERT INTO `logistics_category` VALUES ('10', 'tj', '天津', '2', '3', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '120000');
INSERT INTO `logistics_category` VALUES ('11', 'sh', '上海', '2', '4', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '310000');
INSERT INTO `logistics_category` VALUES ('12', 'cq', '重庆', '2', '5', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '500000');
INSERT INTO `logistics_category` VALUES ('13', 'zj', '浙江', '2', '6', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '330000');
INSERT INTO `logistics_category` VALUES ('14', 'js', '江苏', '2', '7', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '320000');
INSERT INTO `logistics_category` VALUES ('15', 'sd', '山东', '2', '8', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '370000');
INSERT INTO `logistics_category` VALUES ('16', 'ah', '安徽', '2', '9', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '340000');
INSERT INTO `logistics_category` VALUES ('17', 'gd', '广东', '2', '10', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '440000');
INSERT INTO `logistics_category` VALUES ('18', 'fj', '福建', '2', '11', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '350000');
INSERT INTO `logistics_category` VALUES ('19', 'jx', '江西', '2', '12', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '360000');
INSERT INTO `logistics_category` VALUES ('20', 'hn', '湖南', '2', '13', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '430000');
INSERT INTO `logistics_category` VALUES ('21', 'hb', '湖北', '2', '14', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '420000');
INSERT INTO `logistics_category` VALUES ('22', 'hen', '河南', '2', '15', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '410000');
INSERT INTO `logistics_category` VALUES ('23', 'heb', '河北', '2', '16', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '130000');
INSERT INTO `logistics_category` VALUES ('24', 'sx', '山西', '2', '17', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '140000');
INSERT INTO `logistics_category` VALUES ('25', 'shx', '陕西', '2', '18', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '610000');
INSERT INTO `logistics_category` VALUES ('26', 'gx', '广西', '2', '19', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '450000');
INSERT INTO `logistics_category` VALUES ('27', 'yn', '云南', '2', '20', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '530000');
INSERT INTO `logistics_category` VALUES ('28', 'gz', '贵州', '2', '21', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '520000');
INSERT INTO `logistics_category` VALUES ('29', 'sc', '四川', '2', '22', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '510000');
INSERT INTO `logistics_category` VALUES ('30', 'jl', '吉林', '2', '23', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '220000');
INSERT INTO `logistics_category` VALUES ('31', 'hlj', '黑龙江', '2', '24', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '230000');
INSERT INTO `logistics_category` VALUES ('32', 'ln', '辽宁', '2', '25', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '210000');
INSERT INTO `logistics_category` VALUES ('33', 'xj', '新疆', '2', '26', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '650000');
INSERT INTO `logistics_category` VALUES ('34', 'nx', '宁夏', '2', '27', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '630000');
INSERT INTO `logistics_category` VALUES ('35', 'nm', '内蒙', '2', '28', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '150000');
INSERT INTO `logistics_category` VALUES ('36', 'gs', '甘肃', '2', '29', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '620000');
INSERT INTO `logistics_category` VALUES ('37', 'qh', '青海', '2', '30', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '630000');
INSERT INTO `logistics_category` VALUES ('38', 'xz', '西藏', '2', '31', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '540000');
INSERT INTO `logistics_category` VALUES ('39', 'hain', '海南', '2', '32', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '460000');
INSERT INTO `logistics_category` VALUES ('40', 'gat', '港澳台', '2', '33', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '850000');
INSERT INTO `logistics_category` VALUES ('41', 'shengn', '省内', '2', '34', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '900000');
INSERT INTO `logistics_category` VALUES ('42', 'wjzp', '五金制品', '6', '1', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284818', '1493284920', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('43', 'gcgj', '管材管件', '6', '2', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284851', '1493284921', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('44', 'dlqj', '电缆桥架', '6', '3', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284877', '1493284922', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('45', 'zxjc', '装修建材', '6', '4', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284907', '1493284924', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('46', 'yyyj', '液压元件', '42', '0', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493641934', '1493641934', '0', '0', '0');
INSERT INTO `logistics_category` VALUES ('47', 'clyq', '测量仪器', '42', '0', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493645349', '1493645349', '0', '0', '0');
INSERT INTO `logistics_category` VALUES ('48', 'lsdtz', '螺丝刀套装', '42', '0', '30', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1494685550', '1494685550', '0', '0', '0');

-- ----------------------------
-- Table structure for logistics_channel
-- ----------------------------
DROP TABLE IF EXISTS `logistics_channel`;
CREATE TABLE `logistics_channel` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL default '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL default '0' COMMENT '新窗口打开',
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_channel
-- ----------------------------
INSERT INTO `logistics_channel` VALUES ('4', '0', '百度', 'http://www.baidu.com', '1', '1494776584', '1494776584', '1', '1');
INSERT INTO `logistics_channel` VALUES ('5', '0', '搜狗', 'http://www.sogou.com', '2', '1494776816', '1494776816', '1', '1');

-- ----------------------------
-- Table structure for logistics_config
-- ----------------------------
DROP TABLE IF EXISTS `logistics_config`;
CREATE TABLE `logistics_config` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '配置ID',
  `name` varchar(30) NOT NULL default '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL default '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL default '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL default '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL default '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL default '0' COMMENT '排序',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_config
-- ----------------------------
INSERT INTO `logistics_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '源腾物流信息平台', '0');
INSERT INTO `logistics_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '源腾物流信息平台', '1');
INSERT INTO `logistics_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '精品专线、落地配、综合物流、推荐货车、生成厂家、发布货源', '8');
INSERT INTO `logistics_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `logistics_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `logistics_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `logistics_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `logistics_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `logistics_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰\r\nqing_color:青', '后台颜色风格', '1379122533', '1493475779', '1', 'qing_color', '10');
INSERT INTO `logistics_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1494779230', '1', '1:基本', '4');
INSERT INTO `logistics_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `logistics_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `logistics_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '0', '1');
INSERT INTO `logistics_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `logistics_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '20', '10');
INSERT INTO `logistics_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `logistics_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `logistics_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `logistics_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `logistics_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `logistics_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `logistics_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `logistics_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1492573998', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture\r\n11:Article/getNextCategory\r\n12:Article/getNextArea\r\n13:Addons/execute', '0');
INSERT INTO `logistics_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `logistics_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `logistics_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `logistics_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for logistics_document
-- ----------------------------
DROP TABLE IF EXISTS `logistics_document`;
CREATE TABLE `logistics_document` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
  `name` char(40) NOT NULL default '' COMMENT '标识',
  `title` char(80) NOT NULL default '' COMMENT '标题',
  `contact` varchar(15) NOT NULL default '' COMMENT '联系方式',
  `search_k` varchar(300) NOT NULL default '' COMMENT '地区搜索关键字',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `cate_id` int(10) unsigned NOT NULL default '0' COMMENT '二级分类',
  `c_id` int(10) unsigned NOT NULL default '0' COMMENT '三级分类',
  `location_p` mediumint(8) unsigned NOT NULL default '0' COMMENT '归属地省份id',
  `location_c` mediumint(8) unsigned NOT NULL default '0' COMMENT '归属地城市id',
  `location_a` mediumint(8) unsigned NOT NULL default '0' COMMENT '归属地县区id',
  `destination_p` mediumint(8) unsigned NOT NULL default '0' COMMENT '目的地省份id',
  `destination_c` mediumint(8) unsigned NOT NULL default '0' COMMENT '目的地城市id',
  `destination_a` mediumint(8) unsigned NOT NULL default '0' COMMENT '目的地县区id',
  `address` varchar(200) NOT NULL default '' COMMENT '具体地址',
  `root` int(10) unsigned NOT NULL default '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL default '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL default '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL default '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL default '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL default '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL default '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL default '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL default '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL default '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL default '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL default '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL default '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '数据状态',
  PRIMARY KEY  (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of logistics_document
-- ----------------------------
INSERT INTO `logistics_document` VALUES ('1', '95', '', '沈阳 长春 哈尔滨', '0316-5328878', '', '4', '102', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县围河道口 岛川物流B区13号23号库房', '0', '0', '2', '2', '0', '0', '1', '1', '0', '0', '149', '0', '0', '600', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('2', '2', '', '吉轩格栅厂', '13932662063', '', '6', '114', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇工业区', '0', '0', '2', '2', '0', '0', '2', '1', '0', '0', '145', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('3', '3', '', '文安出租4.25米奥铃货车，主发京津冀鲁', '18931649415', '', '5', '88', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安', '0', '0', '2', '2', '0', '0', '3', '1', '0', '0', '149', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('4', '4', '', '轻钢龙骨，卡式龙骨,全丝吊杆，龙骨配件，金属格栅，三角龙骨', '0316-5310982', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县新镇工业区', '0', '0', '2', '2', '0', '0', '4', '1', '0', '0', '138', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('5', '5', '', '北京华旗 灯具 投光灯', '13315605505', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安', '0', '0', '2', '2', '0', '0', '5', '1', '0', '0', '126', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('6', '6', '', '大连，营口专线', '0316-2626044', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处岛川物流A区20（库房7号）', '0', '0', '2', '2', '0', '0', '6', '1', '0', '0', '127', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('7', '7', '', '河北文安-大连专线', '0316-5314522', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安新镇小桥101-102公里处', '0', '0', '2', '2', '0', '0', '7', '1', '0', '0', '121', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('8', '8', '', '顺发 主要生产：预埋件，大理石干挂件，角码，垫片，塑料垫块及各种异型冲加工', '15930643072', '', '6', '113', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇工业区', '0', '0', '2', '2', '0', '0', '8', '1', '0', '0', '236', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('9', '9', '', '顺通物流 上海专线', '0316-7966966', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道文安收费站南800米（东海实业院内）', '0', '0', '2', '2', '0', '0', '9', '1', '0', '0', '193', '0', '0', '997', '1494681944', '1494681944', '1');
INSERT INTO `logistics_document` VALUES ('10', '10', '', '万通物流 河南 湖北专线 南阳 襄阳 十堰', '0316-7986476', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县王村交警中队对过106国道110公里处', '0', '0', '2', '2', '0', '0', '10', '1', '0', '0', '150', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('11', '11', '', '轻钢龙骨 主要生产：主吊;付挂；支卡，快吊；付接；.反烤漆挂件；50支托等各种冲压备套件', '15076605987', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县大围河乡高头村', '0', '0', '2', '2', '0', '0', '11', '1', '0', '0', '126', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('12', '12', '', '1+1物流（江苏专线）文安-南京 常州 苏州', '0316-5670010', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县106国道109.6公里处（宏义物流院内01号库）', '0', '0', '2', '2', '0', '0', '12', '1', '0', '0', '155', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('13', '13', '', '仁合兴装饰材料厂', '0316-5316710', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇工业区', '0', '0', '2', '2', '0', '0', '13', '1', '0', '0', '150', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('14', '14', '', '顺发 鸦鸿桥 丰润 玉田 遵化 迁安 滦县 丰南 滦南', '0316-5322104', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县史各庄大桥北50米路东', '0', '0', '2', '2', '0', '0', '14', '1', '0', '0', '128', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('15', '15', '', '宝塑 高碑店友谊建筑电料制品厂', '0312-2858312', '', '6', '42', '0', '130000', '130600', '130684', '0', '0', '0', '河北省高碑店市辛立庄工业区', '0', '0', '2', '2', '0', '0', '15', '1', '0', '0', '63', '0', '0', '0', '1494681226', '1494681226', '1');
INSERT INTO `logistics_document` VALUES ('16', '16', '', '宏义福州 厦门 福建全境，常州 无锡 苏州 江苏全境，西安 陕西全境,兰州 武威 金昌 张掖 酒泉 嘉峪关甘肃全境', '0316-5322666', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县106国道109.6公里处（宏义物流院内）16-18库房', '0', '0', '2', '2', '0', '0', '16', '1', '0', '0', '61', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('17', '17', '', '伟民物流 南昌 洛阳 直达江西全境 河南洛阳', '0316-5322268', '', '2', '88', '0', '130000', '131000', '131026', '0', '0', '0', '106国道109.7公里处宏义物流院内9号.10号库', '0', '0', '2', '2', '0', '0', '17', '1', '0', '0', '159', '0', '0', '299', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('18', '18', '', '双星上海专线  江苏 浙江', '0316-5321020', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安106国道108.4公里处', '0', '0', '2', '2', '0', '0', '18', '1', '0', '0', '128', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('19', '19', '', '锡林浩特专线', '0316-5328572', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处岛川物流B区11号', '0', '0', '2', '2', '0', '0', '19', '1', '0', '0', '127', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('20', '20', '', '鑫源物流 张家口专线 榆林 神木专线 延安专线', '0316-5327711', '', '3', '107', '0', '130000', '131000', '131026', '0', '0', '0', '文安世纪大道口106国道东200米108公里处', '0', '0', '2', '2', '0', '0', '20', '1', '0', '0', '143', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('21', '21', '', '建宇江苏 南京 苏州 常州 无锡 昆山 张家港 扬州 无锡', '15832657222', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道107公里处岛川物流B区15号', '0', '0', '2', '2', '0', '0', '21', '1', '0', '0', '171', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('22', '22', '', '专业生产优质三角龙骨 轻钢龙骨及各式烤漆龙骨', '0316-5314286', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇四村工业区', '0', '0', '2', '2', '0', '0', '22', '1', '0', '0', '134', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('23', '23', '', '济南 淄博 滨州 庆云 潍坊 青州 德州 禹城 济阳 商河 章丘 宁津', '0316-5322345', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道王村道口农行斜对过', '0', '0', '2', '2', '0', '0', '23', '1', '0', '0', '134', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('24', '24', '', '文平物流', '0316-5328470', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县王村办事处（106国道110.5公里处）', '0', '0', '2', '2', '0', '0', '24', '1', '0', '0', '135', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('25', '25', '', '联通山东专线 烟台 威海 青岛', '0316-5328305', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安106国道110.5公里处王村道口南行20米', '0', '0', '2', '2', '0', '0', '25', '1', '0', '0', '130', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('26', '26', '', '石家庄 西安专线 成都 重庆 九江 沈阳 运城 长治 哈尔滨', '0316-7860274', '', '2', '112', '0', '130000', '131000', '131081', '0', '0', '0', '霸州市汽车站红绿灯南400米路西', '0', '0', '2', '2', '0', '0', '26', '1', '0', '0', '152', '0', '0', '300', '1494681115', '1494681115', '1');
INSERT INTO `logistics_document` VALUES ('27', '27', '', '北京贝斯特科技有限公司', '0316-5320516', '', '6', '42', '0', '110000', '110100', '110106', '0', '0', '0', '北京市丰台区马家堡东路49-2号6层6010室', '0', '0', '2', '2', '0', '0', '27', '1', '0', '0', '136', '0', '0', '0', '1494681334', '1494681334', '1');
INSERT INTO `logistics_document` VALUES ('28', '28', '', '联通快运 文安-廊坊 北京 保定 白沟 天津', '0316-5320993', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道110.5公里处', '0', '0', '2', '2', '0', '0', '28', '1', '0', '0', '135', '0', '0', '30', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('29', '29', '', '济南专线 主发 济南 章丘 济阳 临邑 泰安 肥城 长清 山东全境', '13785661313', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县106国道世纪大道口', '0', '0', '2', '2', '0', '0', '29', '1', '0', '0', '124', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('30', '30', '', '永安物流中心 庆云 菏泽专线', '0316-5321008', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道史各庄新桥北头路东', '0', '0', '2', '2', '0', '0', '30', '1', '0', '0', '120', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('31', '31', '', '平安物流 临沂专线 青岛专线 太原专线', '0316-5313316', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安新镇106国道101.2公里处路西', '0', '0', '2', '2', '0', '0', '31', '1', '0', '0', '189', '0', '0', '998', '1494681918', '1494681918', '1');
INSERT INTO `logistics_document` VALUES ('32', '32', '', '廊坊凯美星装饰材料 烤漆龙骨 三角龙骨', '0316-5018225', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇西庄头工业区', '0', '0', '2', '2', '0', '0', '32', '1', '0', '0', '131', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('33', '33', '', '宏发 苏北专线 (江苏) 主发: 宿迁 淮安 连云港 盐城 新沂 扬州 泰州 南通', '0316-5326388', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安106国道109.8公里处', '0', '0', '2', '2', '0', '0', '33', '1', '0', '0', '148', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('34', '34', '', '文安县芦阜庄益发钢铁经销部', '15030666770', '', '6', '113', '0', '130000', '131000', '131026', '0', '0', '0', '文安县芦阜庄钢材市场C6西区2056号', '0', '0', '2', '2', '0', '0', '34', '1', '0', '0', '166', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('35', '35', '', '宇通快运 合肥 蚌埠 淮南 芜湖 安庆 六安专线', '0316-5310418', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安 106国道史各庄新桥北头路东', '0', '0', '2', '2', '0', '0', '35', '1', '0', '0', '359', '0', '0', '900', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('36', '36', '', '平乐配货中心', '0316-5323693', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道106公里处（围河道口）', '0', '0', '2', '2', '0', '0', '36', '1', '0', '0', '137', '0', '0', '600', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('37', '37', '', '廊坊新正达龙骨厂', '0316-5312639', '', '6', '114', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县新镇三村', '0', '0', '2', '2', '0', '0', '37', '1', '0', '0', '136', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('38', '38', '', '麒麟物流 郑州专线 新乡 焦作 安阳 濮阳 许昌 开封', '15630610666', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道王村交警中队东50米', '0', '0', '2', '2', '0', '0', '38', '1', '0', '0', '141', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('39', '39', '', '喜成货运 天津 塘沽 大港 蓟县', '0316-5310761', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '史各庄新桥北200米路西', '0', '0', '2', '2', '0', '0', '39', '1', '0', '0', '145', '0', '0', '600', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('40', '40', '', '金淼色母粒制造有限公司', '0312-5711997', '', '6', '42', '0', '130000', '130600', '130638', '0', '0', '0', '河北省雄县昝岗镇孤庄头工业区', '0', '0', '2', '2', '0', '0', '40', '1', '0', '0', '122', '0', '0', '0', '1494681374', '1494681374', '1');
INSERT INTO `logistics_document` VALUES ('41', '41', '', '大海山东专线 潍坊 青州 临朐 寿光 安丘 诸城', '13833622077', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '岛川院里A区6号', '0', '0', '2', '2', '0', '0', '41', '1', '0', '0', '396', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('42', '42', '', '胜达货运 哈尔滨 大庆 齐齐哈尔 白城 海拉尔 扎兰屯 长春 沈阳 佳木斯 牡丹江', '0316-2626091', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道107公里处岛川物流B区18号', '0', '0', '2', '2', '0', '0', '42', '1', '0', '0', '182', '0', '0', '600', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('43', '43', '', '徐州专线 主发：徐州 淮北 宿迁 宿州 丰县 新沂 沛县', '0316-5328658', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安王村交警队东50米宏义物流院内', '0', '0', '2', '2', '0', '0', '43', '1', '0', '0', '151', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('44', '44', '', '冀中物流 济南 淄博 滨州 德州', '0316-2626060', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处岛川物流B区7号', '0', '0', '2', '2', '0', '0', '44', '1', '0', '0', '158', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('45', '45', '', '天达物流 文安-银川', '0316-5322026', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县王村道口交警队东侧宏义物流院内106国道109.8公里处', '0', '0', '2', '2', '0', '0', '45', '1', '0', '0', '127', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('46', '46', '', '宏鑫 文安 霸州 雄县--成都 新都 特快班车 广东广西 贵州 昆明', '18832666333', '', '2', '0', '0', '130000', '131000', '131026', '0', '0', '0', '岛川物流23号库房', '0', '0', '2', '2', '0', '0', '46', '1', '0', '0', '166', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('47', '47', '', '鑫利.轻钢龙骨，卡式龙骨，三角龙骨，烤漆龙骨和边角及各种龙骨配件', '0316-5313615', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇二村工业区农贸市场南行300米路西', '0', '0', '2', '2', '0', '0', '47', '1', '0', '0', '127', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('48', '48', '', '文安县金昊达龙骨厂', '18731670898', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '新镇二村工业区', '0', '0', '2', '2', '0', '0', '48', '1', '0', '0', '131', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('49', '49', '', '文安鑫利 轻钢龙骨，三角龙骨，边角及各种龙骨配件', '15081661826', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县新镇二村工业区农贸市场南行300米路西', '0', '0', '2', '2', '0', '0', '49', '1', '0', '0', '141', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('50', '50', '', '沈阳  长春  哈尔滨', '13931636035', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '世纪大道东500米', '0', '0', '2', '2', '0', '0', '50', '1', '0', '0', '141', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('51', '51', '', '兄弟物流  乌鲁木齐  库尔勒  阿克苏 喀什  和田  伊犁  吐鲁番 哈密  酒泉  嘉峪关', '0316-8100888', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处（岛川物流B区5号）', '0', '0', '2', '2', '0', '0', '51', '1', '0', '0', '131', '0', '0', '300', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('52', '52', '', '胜发物流山西全境', '0316-5328760', '', '2', '0', '0', '130000', '131000', '131026', '0', '0', '0', '王村道口西行100米路北', '0', '0', '2', '2', '0', '0', '52', '1', '0', '0', '128', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('53', '53', '', '文安县（彩明塑业）京花线盒管件厂', '0316-5321670', '', '6', '114', '0', '130000', '131000', '131026', '0', '0', '0', '106国道111公里处文安县王村道口西行200米路南', '0', '0', '2', '2', '0', '0', '53', '1', '0', '0', '134', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('54', '54', '', '建材市场测试', '15531613668', '', '90', '0', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市浙商广场', '0', '0', '2', '2', '0', '0', '54', '1', '0', '0', '117', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('55', '55', '', '雨洁物流唐山专线', '0316-5016618', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道105.5公里处路西史各庄大桥北头', '0', '0', '2', '2', '0', '0', '55', '1', '0', '0', '138', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('56', '56', '', '兴达主发：青岛 平度 即墨 胶州 泰安 肥城 莱芜 新泰', '0316-5018718', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道108.9公里处（世纪大道东200米）', '0', '0', '2', '2', '0', '0', '56', '1', '0', '0', '130', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('57', '57', '', '高迅网络广告', '18631682688', '', '2', '111', '0', '130000', '131000', '131026', '0', '0', '0', '106国道110公里处农业银行旁', '0', '0', '2', '2', '0', '0', '57', '1', '0', '0', '132', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('58', '58', '', '华通主发：东胜 包头 呼市 集宁 锡林浩特', '0316-5328141', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县王村道口农业银行对过', '0', '0', '2', '2', '0', '0', '58', '1', '0', '0', '143', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('59', '59', '', '江苏专线  常州  无锡  苏州 昆山', '0316-8656303', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道110公里处路南', '0', '0', '2', '2', '0', '0', '59', '1', '0', '0', '135', '0', '0', '10', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('60', '60', '', '西藏专线 拉萨 那曲  山南 昌都 阿里  林芝  日喀则', '13731630046', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北106国道107公里岛川物流园B区11号', '0', '0', '2', '2', '0', '0', '60', '1', '0', '0', '158', '0', '0', '620', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('61', '61', '', '安徽专线  安庆 桐城 六安 舒城 合肥 铜陵池州', '0316-5327738', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北廊坊文安王村道口110.5公里', '0', '0', '2', '2', '0', '0', '61', '1', '0', '0', '120', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('62', '62', '', '海山承德 赤峰专线 主发：承德 围场 平泉 赤峰 乌丹 大板 敖汉 林东 林西 克旗', '0316-5321497', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安106国道110公里处王村道口', '0', '0', '2', '2', '0', '0', '62', '1', '0', '0', '132', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('63', '63', '', '山东专线  潍坊  临朐  寿光     青州   昌乐', '0316-2626030', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道107公里处（岛川物流A区30号）', '0', '0', '2', '2', '0', '0', '63', '1', '0', '0', '121', '0', '0', '13', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('64', '64', '', '名洋主发：章丘   济阳  临邑  德州 泰安  淄博   东营  潍坊  日照 莱芜', '0316-7983373', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县王村道口110公里处', '0', '0', '2', '2', '0', '0', '64', '1', '0', '0', '126', '0', '0', '14', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('65', '65', '', '鹏程 石家庄 专线', '0316-5019775', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安史各庄新桥北头路西', '0', '0', '2', '2', '0', '0', '65', '1', '0', '0', '139', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('66', '66', '', '乾源物流 西北专线  银川  乌海   临河', '0316-5321991', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县王村道口110公里处', '0', '0', '2', '2', '0', '0', '66', '1', '0', '0', '129', '0', '0', '14', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('67', '67', '', '濮阳专线 主发：文安 濮阳 新乡漯河', '0316-5328497', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安106国道109公里处', '0', '0', '2', '2', '0', '0', '67', '1', '0', '0', '123', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('68', '68', '', '旺通物流   新疆专线  酒泉  嘉峪关  张掖  武威', '0316-5317360', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道105公里处文安县史各庄新桥北', '0', '0', '2', '2', '0', '0', '68', '1', '0', '0', '130', '0', '0', '490', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('69', '69', '', '兴邦物流  商丘 周口 宿州 淮北 滁州 芜湖 宣城 黄山', '0316-2785288', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安106国道106.6公里处（岛川物流院内A区28号）', '0', '0', '2', '2', '0', '0', '69', '1', '0', '0', '168', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('70', '70', '', '文安-廊坊 香河 三河 燕郊 大厂 北京 通州 顺义 平谷 怀柔 昌平 东坝 小汤山 密云', '15133600323', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县围河路口北20米', '0', '0', '2', '2', '0', '0', '70', '1', '0', '0', '137', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('71', '71', '', '邯郸-邢台 安阳 及周边县市', '0316-7986666', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处（川岛院内）A区8号库房（12.13号）', '0', '0', '2', '2', '0', '0', '71', '1', '0', '0', '166', '0', '0', '996', '1494682165', '1494682165', '1');
INSERT INTO `logistics_document` VALUES ('72', '72', '', '宏盛物流-湖南专线  长沙 岳阳 怀化 铜仁 郴州', '0316-5328554', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道109.7公里处交警队东侧50米宏义物流院内19,20号库房', '0', '0', '2', '2', '0', '0', '72', '1', '0', '0', '160', '0', '0', '298', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('73', '73', '', '青海全境 文安-西宁', '0316-5322625', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处岛川物流B区11号', '0', '0', '2', '2', '0', '0', '73', '1', '0', '0', '393', '0', '0', '300', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('74', '74', '', '益发物流（专线直达）', '0312-5722733', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '十间房红绿灯往南1000米路西', '0', '0', '2', '2', '0', '0', '74', '1', '0', '0', '127', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('75', '75', '', '江苏 浙江 西安专线 主发：西安 嘉兴 南京 无锡 常州 杭州 宁波 义务', '0316-5322734', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县王村道口106国道110公里处', '0', '0', '2', '2', '0', '0', '75', '1', '0', '0', '138', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('76', '76', '', '合肥专线 主发：合肥 蚌阜 宿州 阜阳 淮南 安庆 铜陵', '0316-5018788', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安106国道109公里处', '0', '0', '2', '2', '0', '0', '76', '1', '0', '0', '136', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('77', '77', '', '文安-湖南长沙 株洲 湘潭 衡阳 邵阳岳阳 常德 张家界 益阳 怀化 娄底 贵阳 遵义 安顺', '0316-2626036', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '106国道107公里处岛川物流B区3号', '0', '0', '2', '2', '0', '0', '77', '1', '0', '0', '151', '0', '0', '600', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('78', '78', '', '亿隆主发：福州 福清 长乐 莆田 惠安 泉州 晋江 厦门 漳州 三明 龙岩 南平 宁德 福安 沙县', '18531635305', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县岛川物流园B区12号', '0', '0', '2', '2', '0', '0', '78', '1', '0', '0', '130', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('79', '79', '', '衡水专线', '0316-2785299', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '岛川物流大院B区2号', '0', '0', '2', '2', '0', '0', '79', '1', '0', '0', '127', '0', '0', '500', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('80', '80', '', '元亨西安兰州专线', '0316-5327892', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道110.5公里处王村道口', '0', '0', '2', '2', '0', '0', '80', '1', '0', '0', '154', '0', '0', '800', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('81', '81', '', '日照专线 诸城 五莲 莒县 沂水 沂南 临沂', '0316-5327885', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安', '0', '0', '2', '2', '0', '0', '81', '1', '0', '0', '131', '0', '0', '100', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('82', '82', '', '中利烤漆龙骨', '0316-7343760', '', '6', '42', '0', '130000', '131000', '131081', '0', '0', '0', '河北省霸州市霸州镇工业区', '0', '0', '2', '2', '0', '0', '82', '1', '0', '0', '124', '0', '0', '0', '1494681404', '1494681404', '1');
INSERT INTO `logistics_document` VALUES ('83', '83', '', '北京通汇坤宇电线有限公司', '0316-5322491', '', '6', '113', '0', '130000', '131000', '131026', '0', '0', '0', '106国道108公里处文安县新村工业区', '0', '0', '2', '2', '0', '0', '83', '1', '0', '0', '138', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('84', '84', '', '鑫源武汉专线 主发：武汉 湖北全境中转', '0316-2785281', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安县106国道106公里处岛川物流B区4号', '0', '0', '2', '2', '0', '0', '84', '1', '0', '0', '168', '0', '0', '999', '1494681896', '1494681896', '1');
INSERT INTO `logistics_document` VALUES ('85', '85', '', '鑫源物流 榆林 神木 府谷 乌审旗 店塔 靖边 定边 大柳塔 米脂 绥德 吴堡 清涧 镇川', '0316-5327711', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '文安世纪大道口106国道东200米108公里处', '0', '0', '2', '2', '0', '0', '85', '1', '0', '0', '247', '0', '0', '1000', '1494681869', '1494681869', '1');
INSERT INTO `logistics_document` VALUES ('86', '86', '', '鑫源物流 张家口专线 榆林 神木专线 延安专线', '0316-5327711', '', '4', '102', '0', '130000', '131000', '131026', '0', '0', '0', '文安世纪大道口106国道东200米108公里处', '0', '0', '2', '2', '0', '0', '86', '1', '0', '0', '126', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('87', '87', '', '宜昌三峡 轻钢龙骨 卡式龙骨 三角龙骨 龙骨配件 吊杆 石膏板等装饰材料', '18871718899', '', '6', '42', '0', '420000', '420500', '420502', '0', '0', '0', '宜昌市沙河村88号钟宜实业公司院内', '0', '0', '2', '2', '0', '0', '87', '1', '0', '0', '38', '0', '0', '100', '1494680647', '1494680647', '1');
INSERT INTO `logistics_document` VALUES ('88', '88', '', '阻燃、耐火、低烟无卤、辐照电线电缆、高低压交联电力电缆、KVV控制电缆、架空绝缘导线、民用电线系列', '0316-7987009', '', '6', '115', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县西桥工业区', '0', '0', '2', '2', '0', '0', '88', '1', '0', '0', '26', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('89', '89', '', '金属电缆桥架、防火电缆桥架、梯式电缆桥架、大跨距电缆桥架、一次成型电缆桥架及金属穿线管配件', '0316-7981116', '', '6', '115', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县新镇鹿町工业区', '0', '0', '2', '2', '0', '0', '89', '1', '0', '0', '20', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('90', '90', '', '华安 河北文安-西宁 兰州 格尔木 天水 拉萨', '0316-2308088', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县宏义物流院23号库房', '0', '0', '2', '2', '0', '0', '90', '1', '0', '0', '63', '0', '0', '996', '1494682059', '1494682059', '1');
INSERT INTO `logistics_document` VALUES ('91', '91', '', '金仕达电缆桥架 烤漆龙骨', '0316-5312928', '', '6', '115', '0', '130000', '131000', '131026', '0', '0', '0', '文安县新镇工业开发区', '0', '0', '2', '2', '0', '0', '91', '1', '0', '0', '25', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('92', '92', '', '河北中利线缆有限公司', '0316-5333458', '', '6', '115', '0', '130000', '131000', '131026', '0', '0', '0', '河北省廊坊市文安县西桥工业区', '0', '0', '2', '2', '0', '0', '92', '1', '0', '0', '90', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('93', '93', '', '洪季缘 制作各种档次牛皮纸箱，各种彩箱', '15030450752', '', '6', '116', '0', '130000', '131000', '131026', '0', '0', '0', '河北文安', '0', '0', '2', '2', '0', '0', '93', '1', '0', '0', '17', '0', '0', '0', '0', '1494672983', '1');
INSERT INTO `logistics_document` VALUES ('94', '94', '', '河北文安网通货站 江苏，浙江专线每天有多部9.6米-13米车发往泰州，镇江，靖江，江阴，常州，无锡，苏州，张家港，常熟，宜兴，昆山，等周边地区，杭州，嘉兴，宁波', '13933930320', '', '2', '112', '0', '130000', '131000', '131026', '0', '0', '0', '河北省文安县王村道口农行对面', '0', '0', '2', '2', '0', '0', '94', '1', '0', '0', '25', '0', '0', '0', '0', '1494672983', '1');

-- ----------------------------
-- Table structure for logistics_document_article
-- ----------------------------
DROP TABLE IF EXISTS `logistics_document_article`;
CREATE TABLE `logistics_document_article` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL default '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL default '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL default '0' COMMENT '收藏数',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of logistics_document_article
-- ----------------------------
INSERT INTO `logistics_document_article` VALUES ('1', '0', '<div>沈阳 长春 哈尔滨 代办海口拉萨业务</div>\r\n<div><br />\r\n</div>\r\n<div>中转周边各县市 代收货款 天天发车</div>\r\n<div><br />\r\n</div>\r\n<div>联系人:王德瑞&lt;/div>\r\n<div>电话: <a href=\"tel:0316-5328878\" target=\"_blank\">0316-5328878</a> <a href=\"tel:0316-5323858\" target=\"_blank\">0316-5323858</a></div>\r\n<div>手机: <a href=\"tel:13931636035\" target=\"_blank\">13931636035</a></div>\r\n<div><br />\r\n</div>\r\n<div>地址:河北省文安县围河道口 岛川物流B区13号23号库房&lt;/div>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('2', '0', '<div>吉轩格栅厂子 &nbsp;主要生产塑料格栅 铁格栅&lt;/div>\r\n<p>新镇工业区 &nbsp;电话 <a href=\"tel:13932662063\" target=\"_blank\">13932662063</a> &nbsp;<a href=\"tel:15226688860\" target=\"_blank\">15226688860</a></p>\r\n<p><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061613113319862.jpg\" alt=\"\" border=\"0\" /><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061613114962877.jpg\" alt=\"\" border=\"0\" /><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061613115919396.jpg\" alt=\"\" border=\"0\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('3', '0', '<p><span style=\"font-family:Arial Black;\"><strong><span style=\"font-size:18px;\">文安出租4.25米奥铃货车，主发京津冀鲁。&lt;/span></strong></span></p>\r\n<p><strong><span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">价格绝对便宜。手机&lt;a href=\"tel:18931649415\" target=\"_blank\">18931649415</a>微信同步</span></span></strong></p>\r\n<p><strong><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610110172773.jpg\" /></strong></p>\r\n<p><strong><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610111896022.jpg\" /><br />\r\n</p>\r\n</strong>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('4', '0', '<p><strong><span style=\"font-size:18px;font-family:Arial Black;\">新航轻钢龙骨厂&lt;/span></strong><br />\r\n<strong><span style=\"font-size:16px;\">本厂主要生产：轻钢龙骨，卡式龙骨，&lt;/span><br />\r\n<span style=\"font-size:16px;\">全丝吊杆，龙骨配件，金属格栅，三角龙骨&lt;/span><br />\r\n经理：&lt;/strong>张建卫&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5310982\" target=\"_blank\">0316-5310982</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13930625367 \" target=\"_blank\">13930625367&nbsp; &nbsp;</a>&nbsp; <a href=\"tel:18103368608\" target=\"_blank\">18103368608<br />\r\n</a><strong>传真：&lt;/strong>0316-5310982<br />\r\n<strong>电邮：&lt;/strong><a href=\"mailto:34567912@qq.com\">34567912@qq.com</a><br />\r\n<strong>地址：&lt;/strong>河北省廊坊市文安县新镇工业区</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610360723886.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610362465664.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610364827558.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610370635521.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610372846804.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610375198676.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061610381761814.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('5', '0', '<p><strong><span style=\"font-size:18px;\">北京华旗科技有限公司</span></strong><br />\r\n<strong>联系人：</strong> 苏立军&amp;nbsp;&nbsp;&nbsp; </p>\r\n<p><strong>联系电话：&lt;/strong><a href=\"tel:13315605505\" target=\"_blank\">13315605505</a></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611204996965.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611210569688.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611212364352.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611214040750.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611220621255.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611222526361.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061611224531516.jpg\" /><br />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('6', '0', '<p><strong><span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">文安鑫金龙物流&lt;/span></span><br />\r\n<span style=\"font-size:16px;\">大连，营口专线&lt;/span></strong><br />\r\n<strong>经理：&lt;/strong>郝艳彬&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-2626044\" target=\"_blank\">0316-2626044</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13932604121\" target=\"_blank\">13932604121</a><br />\r\n<strong>地址：&lt;/strong>106国道107公里处岛川物流A区20（库房7号）</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701150518036.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701244695220.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('7', '0', '<p><strong><span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">河北文安-大连专线</span></span><br />\r\n<span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">天天发车 代收货款</span></span><br />\r\n总经理：</strong>信威<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5314522\" target=\"_blank\">0316-5314522</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13889856778\" target=\"_blank\">13889856778</a>&nbsp; <a href=\"tel:15076674242\" target=\"_blank\">15076674242<br />\r\n</a><strong>地址：&lt;/strong>文安新镇小桥101-102公里处&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701210817517.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701213359309.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701215728473.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701221440646.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701224046581.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061701225790922.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('8', '0', '<p><strong><span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">文安县顺发五金制品厂</span></span><br />\r\n<span style=\"font-size:16px;\">主要生产：预埋件，大理石干挂件，角码，垫片，塑料垫块及各种异型冲加工</span><br />\r\n联系人：</strong>吴圈住&lt;br />\r\n<strong>手机：&lt;/strong><a href=\"tel:15930643072\" target=\"_blank\">15930643072</a> &nbsp; <a href=\"tel:15931469716\" target=\"_blank\">15931469716</a><br />\r\n<strong>地址：&lt;/strong>河北省文安县新镇工业区&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719264612397.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719265996421.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719271497132.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719273857444.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719275646340.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719281552786.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719283690172.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719290549495.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719292591614.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719294511966.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('9', '0', '<p>\r\n	<strong><span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">顺通物流 上海专线</span></span><br />\r\n<span style=\"font-size:16px;\">天天发车 代收货款 承揽全国各地整车及零担业务</span><br />\r\n联系人：</strong>冯小二<br />\r\n<strong>电话：</strong><a href=\"tel:0316-7966966 \" target=\"_blank\">0316-7966966&nbsp; </a>&nbsp; <a href=\"tel:0316-5312955\" target=\"_blank\">0316-5312955</a><br />\r\n<strong>手机：</strong><a href=\"tel:18631611040\" target=\"_blank\">18631611040</a>&nbsp; <a href=\"tel:13831685538\" target=\"_blank\">13831685538</a><br />\r\n<strong>地址：</strong>106国道文安收费站南800米（东海实业院内）<br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719471581938.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719472933856.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719474737482.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719481074481.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719483299802.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719485212625.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719491713435.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061719493312411.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('10', '0', '<p><strong><span style=\"font-size:18px;\">万通物流 河南 湖北专线</span><br />\r\n<span style=\"font-size:18px;\">南阳 襄阳 十堰</span><br />\r\n联系人：</strong>刘力强&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-7986476\" target=\"_blank\">0316-7986476</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13323269122\" target=\"_blank\">13323269122<br />\r\n</a><strong>地址：&lt;/strong>河北省廊坊市文安县王村交警中队对过106国道110公里处&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720190748029.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720191954316.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720193285649.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('11', '0', '<p><strong><span style=\"font-size:18px;\">轻钢龙骨配件厂&lt;/span></strong><br />\r\n<strong>主要生产：&lt;/strong>38.50.60主吊；38.50.60-50.60付挂；75.100支卡，38.50快吊；&lt;br />\r\n38.50.60（主）付接；38.50.反烤漆挂件；50支托等各种冲压备套件<br />\r\n<strong>联系人：</strong>张盼盼&lt;br />\r\n<strong>手机、微信：</strong><a href=\"tel:15076605987\" target=\"_blank\">15076605987</a><br />\r\n<strong>地址：&lt;/strong>河北省文安县大围河乡高头村&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720335559438.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720340893707.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061922143040481.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061922144981015.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061922151334884.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061922153261317.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061922155638885.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061922162090713.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720342371001.jpg\" /><br />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('12', '0', '<p><strong><span style=\"font-size:18px;\">1+1物流（江苏专线）</span><br />\r\n<span style=\"font-size:18px;\">文安-南京 常州 苏州</span><br />\r\n联系人：</strong>周盼龙&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5670010\" target=\"_blank\">0316-5670010</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:15932161161 \" target=\"_blank\">15932161161&nbsp; </a>&nbsp; <a href=\"tel:15531662251\" target=\"_blank\">15531662251</a><br />\r\n<strong>地址：&lt;/strong>河北省文安县106国道109.6公里处（宏义物流院内01号库）&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061819531843544.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061819532926213.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061819534536921.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('13', '0', '<p><strong><span style=\"font-size:18px;font-family:Arial Black;\">仁合兴装饰材料厂</span></strong><br />\r\n<strong>联系人：</strong>李军辉&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5316710\" target=\"_blank\">0316-5316710</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13633165552\" target=\"_blank\">13633165552</a><br />\r\n<strong>QQ：&lt;/strong>1129644870<br />\r\n<strong>地址：&lt;/strong>河北省文安县新镇工业区&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921434987511.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921441675335.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921443642851.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921445490853.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921451538622.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921453640437.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921455917292.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('14', '0', '<p><br />\r\n<strong><span style=\"font-size:18px;\"><span style=\"font-family:SimHei;\">顺发物流</span></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"font-family:SimHei;\">文安-唐山</span></span><br />\r\n<span style=\"font-size:16px;\">主发：鸦鸿桥 丰润 玉田 遵化 迁安 滦县 丰南 滦南</span><br />\r\n中转：&lt;/strong>承德全境，秦皇岛全境，赤峰全境及东北方向各市县&lt;br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 朝阳 凌源 赤峰 喀左 乌兰浩特 蓟县及周边市县&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5322104\" target=\"_blank\">0316-5322104</a>&nbsp; <a href=\"tel:0316-5314890\" target=\"_blank\">0316-5314890</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13933922886\" target=\"_blank\">13933922886</a>&nbsp;&nbsp; <a href=\"tel:13722632164\" target=\"_blank\">13722632164</a><br />\r\n<strong>地址：&lt;/strong>文安县史各庄大桥北50米路东&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921530097352.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921531248106.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921533075931.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921535199656.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921540734680.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921543061751.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0619/2016061921550140044.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('15', '0', '<p>\r\n	<strong><span style=\"font-size:18px;font-family:SimHei;\">宝塑 高碑店友谊建筑电料制品厂</span></strong><br />\r\n<strong>经理：</strong>赵云<br />\r\n<strong>电话：</strong><a href=\"tel:0312-2858312\" target=\"_blank\">0312-2858312</a><br />\r\n<strong>手机：</strong><a href=\"tel:13111650656\" target=\"_blank\">13111650656</a><br />\r\n<strong>微信：</strong>13111650656<br />\r\n<strong>QQ：</strong>13111650656<br />\r\n<strong>地址：</strong>河北省高碑店市辛立庄工业区\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112011293166.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112012318904.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112013977925.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112015197805.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112020684547.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112021947317.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112023723579.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112025338671.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0621/2016062112031418591.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('16', '0', '<p><strong><span style=\"font-family:NSimSun;font-size:18px;\">宏义物流</span></strong><br />\r\n<strong>文安 霸州 大城 雄县 任丘 永清 静海-福州 厦门 福建全境，&lt;br />\r\n常州 无锡 苏州 江苏全境，西安 陕西全境，&lt;br />\r\n兰州 武威 金昌 张掖 酒泉 嘉峪关 甘肃全境<br />\r\n中转 甘肃全省<br />\r\n</strong>白银市 天水市 平凉市 庆阳市 定西市 陇南市 榆中县 皋兰县 永登县 永昌县&lt;br />\r\n会宁县 靖远县 景泰县 清水县 秦安县 甘谷县 武山县 古浪县 民勤县&lt;br />\r\n山丹县 民乐县 临泽县 临潭县等<br />\r\n<strong>中转 陕西全省<br />\r\n</strong>铜川市 宝鸡市 咸阳市 渭南市 汉中市 安康市 商洛市 蓝田县 周至县 高陵县&lt;br />\r\n宜君县 凤翔县 岐山县 扶风县 千阳县 麟游县 太白县 三原县 泾阳县 宜川县等 <br />\r\n<strong>中转 江苏全省<br />\r\n</strong>南京市 江阴市 徐州市 金坛市 常熟市 南通市 如皋市 淮安市 溧水县 高淳县&lt;br />\r\n铜山县 如东县 海安县 东海县 灌云县 赣榆县 灌南县 涟水县 沛县 丰县 阜宁县&lt;br />\r\n射阳县等<br />\r\n<strong>中转 福建全省<br />\r\n</strong>福清市 三明市 永安市 石狮市 龙海市 龙岩市 建瓯市 漳平市 宁德市 福安市&lt;br />\r\n闽侯县 闽清县 永泰县 连江县 平潭县 仙游县 明溪县 永定县 光泽县 顺昌县&lt;br />\r\n松溪县 诏安县 漳浦县等<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5322666 \" target=\"_blank\">0316-5322666&nbsp; </a>&nbsp; <a href=\"tel:0316-5320333\" target=\"_blank\">0316-5320333</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13930652821\" target=\"_blank\">13930652821</a><br />\r\n<strong>地址：&lt;/strong>河北省文安县106国道109.6公里处（宏义物流院内）16-18库房</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221181376445.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221182770639.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221190186445.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221192763874.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221194956351.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221201172572.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221203394635.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221210439325.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221213127078.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221221079378.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0622/2016062221224429305.jpg\" /></p>\r\n<p>&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('17', '0', '<p><strong><span style=\"font-size:18px;\">伟民物流</span><br />\r\n<span style=\"font-size:18px;\">南昌 洛阳</span></strong></p>\r\n<p><br />\r\n<span style=\"font-size:14px;\">直达江西全境 河南洛阳</span></p>\r\n<p><strong><span style=\"font-size:16px;\">联系人：</span></strong><span style=\"font-size:14px;\">史伟民 </span></p>\r\n<p><strong><span style=\"font-size:18px;\">电话：&lt;/span></strong><span style=\"font-size:14px;\"><a href=\"tel:0316-5322268\" target=\"_blank\">0316-5322268</a></span><br />\r\n<strong><span style=\"font-size:16px;\">手机：&lt;/span></strong><span style=\"font-size:14px;\"><a href=\"tel:15383762678\" target=\"_blank\">15383762678</a> 查款电话：&lt;a href=\"tel:13832646017\" target=\"_blank\">13832646017</a></span><br />\r\n<span style=\"font-size:14px;\"><strong><span style=\"font-size:16px;\">地址：&lt;/span></strong>106国道109.7公里处宏义物流院内9号.10号库<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320061111249.jpg\" width=\"681\" height=\"382\" /></span></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811041480540.jpg\" /></p>\r\n<p></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811044044848.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320142748902.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320114825927.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315303593248.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('18', '0', '<p>双星货运中心<br />\r\n上海专线&nbsp; 江苏 浙江<br />\r\n联系人：张平安&lt;br />\r\n电话：&lt;a href=\"tel:0316-5321020\" target=\"_blank\">0316-5321020</a><br />\r\n手机：&lt;a href=\"tel:13623160853\" target=\"_blank\">13623160853<br />\r\n</a>地址：河北文安106国道108.4公里处&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210435942107.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210441965412.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215550593984.jpg\" width=\"400\" height=\"300\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('19', '0', '<p>锡林浩特专线<br />\r\n联系人：张景辉&lt;br />\r\n电话：&lt;a href=\"tel:0316-5321158\" target=\"_blank\">0316-5328572 </a>&nbsp; <a href=\"tel:0316-5321158\" target=\"_blank\">0316-5321158<br />\r\n</a>手机：&lt;a href=\"tel:13785612592 \" target=\"_blank\">13785612592 </a>&nbsp;<a href=\"tel:13403169307\" target=\"_blank\">13403169307<br />\r\n</a>地址：106国道107公里处岛川物流B区11号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210525268760.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210531269688.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061313220791062.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('20', '0', '<span id=\"syscomment\" sizcache=\"3\" sizset=\"6\">&nbsp;<div class=\"blk_ev56 review\" sizcache=\"3\" sizset=\"6\" jquery1464766716061=\"44\"><br />\r\n<b><span style=\"font-size:24px;\">文安--张家口专线&lt;/span></b><br />\r\n<span style=\"font-size:16px;\">宣化 张北 尚义 怀来 涿鹿 沽源 康保 万全 怀安 赤城 崇礼 多伦 保昌</span><br />\r\n<span style=\"font-size:24px;\"><b>文安-榆林 神木专线</b></span><br />\r\n<span style=\"font-size:24px;\"><span style=\"font-size:16px;\">府谷 乌审旗 店塔 靖边 </span></span><span style=\"font-size:16px;\">定边 大柳塔 横山 米脂 绥德 吴堡 清涧 镇川</span><br />\r\n<span style=\"font-size:24px;\"><b>文安-延安专线</b></span><br />\r\n<span style=\"font-size:18px;\">宝塔 延长 延川 子长 志丹 绥德 吴旗 甘泉 富县 洛川 宜川 孔涧</span><br />\r\n<span style=\"font-size:18px;\">联系人：郑伟</span><br />\r\n电话：&lt;a href=\"tel:0316-5327711 \" target=\"_blank\">0316-5327711 &nbsp;</a>&nbsp; <a href=\"tel:0316-5327722\" target=\"_blank\">0316-5327722</a><br />\r\n手机：&lt;a href=\"tel:13932674000\" target=\"_blank\">13932674000</a> &nbsp;<a href=\"tel:15075665777\" target=\"_blank\">15075665777</a><br />\r\n地址：文安世纪大道口106国道东200米108公里处&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123254823900.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123260323540.jpg\" /></div>\r\n<div class=\"blk_ev56 review\" sizcache=\"3\" sizset=\"6\" jquery1464766716061=\"44\"><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314204381018.jpg\" /></div>\r\n</span><!---<div class=\"deal-buy-bottom\" style=\"clear:both;text-align:center;padding:30px;\">\r\n						<a class=\"pngfix\" href=\"//Uploads/Picture/cover/buy.php?id=95\" rel=\"nofollow\">抢购</a> 					</div>\r\n--->', '', '0');
INSERT INTO `logistics_document_article` VALUES ('21', '0', '<p><strong><span style=\"font-size:16px;\"><span style=\"font-size:18px;\">建宇物流</span></span><br />\r\n<span style=\"font-size:16px;\"><span style=\"font-size:18px;\">江苏全境</span></span><br />\r\n南京 苏州 常州 无锡 江阴 宜兴 南通 泰州 扬州 盐城 </strong></p>\r\n<p><strong>常熟 昆山 吴江 太仓 张家港 上海 宿迁 连云港 淮安<br />\r\n手机：&lt;/strong><a href=\"tel:15832657222\" target=\"_blank\">15832657222</a> <a href=\"tel:18932624644\" target=\"_blank\">18932624644<br />\r\n</a><strong>地址：&lt;/strong>文安县106国道107公里处岛川物流B区15号&lt;br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060217482974204.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060217484648586.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060217490089653.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0611/2016061112341731014.jpg\" width=\"400\" height=\"300\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0611/2016061112350085910.jpg\" width=\"400\" height=\"300\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215310469672.jpg\" width=\"400\" height=\"300\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('22', '0', '<p>京新装饰材料有限公司<br />\r\n专业生产优质三角龙骨 轻钢龙骨及各式烤漆龙骨&lt;br />\r\n联系人：王策<br />\r\n电话：&lt;a href=\"tel:0316-5314286\" target=\"_blank\">0316-5314286</a><br />\r\n传真：0316-7965286<br />\r\n手机：&lt;a href=\"tel:15233661006\" target=\"_blank\">15233661006</a> <a href=\"tel:18231600888\" target=\"_blank\">18231600888</a></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060217533877579.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060217535472591.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061313192258628.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('23', '0', '冀中配货站<br />\r\n济南 淄博 滨州 庆云 潍坊 青州 德州 禹城 济阳 商河 章丘 宁津<br />\r\n联系人：郝海涛&lt;br />\r\n电话：&lt;a href=\"tel:0316-5322345 \" target=\"_blank\">0316-5322345&nbsp; </a>&nbsp;<a href=\"tel:0316-5328109\" target=\"_blank\">0316-5328109</a><br />\r\n手机：&lt;a href=\"tel:13833633063\" target=\"_blank\">13833633063</a> &nbsp;<a href=\"tel:15531662022\" target=\"_blank\">15531662022<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215464883742.jpg\" /><br />\r\n</a>地址：文安县106国道王村道口农行斜对过&lt;br />', '', '0');
INSERT INTO `logistics_document_article` VALUES ('24', '0', '文平物流<br />\r\n秦皇岛 邢台 邯郸专线<br />\r\n联系人：殷红彬&lt;br />\r\n电话：&lt;a href=\"tel:0316-5328704\" target=\"_blank\">0316-5328470 </a>&nbsp;<a href=\"tel:0316-5328704\" target=\"_blank\">0316-5328704</a><br />\r\n手机：&lt;a href=\"tel:18730607000\" target=\"_blank\">18730607000</a>&nbsp;<a href=\"tel: 18831681000\" target=\"_blank\"> 18831681000</a><br />\r\n地址：河北省廊坊市文安县王村办事处（106国道110.5公里处）<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309025540006.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309053586011.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309054847801.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215490912897.jpg\" width=\"400\" height=\"300\" />', '', '0');
INSERT INTO `logistics_document_article` VALUES ('25', '0', '<p>联通山东专线&lt;br />\r\n烟台 威海 青岛<br />\r\n联系人：李伟<br />\r\n电话：&lt;a href=\"tale;5328105\" target=\"_blank\">0316-5328305 5328105</a><br />\r\n手机：&lt;a href=\"tale;13603169672\" target=\"_blank\">18631689689 13603169672</a><br />\r\n地址：河北文安106国道110.5公里处王村道口南行20米&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309125255019.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061313175935754.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('26', '0', '<p>\r\n	新兴物流中心<br />\r\n&nbsp;石家庄 西安专线 成都 重庆 九江 沈阳 运城 长治 哈尔滨<br />\r\n联系人：李锁住<br />\r\n电话：<a href=\"tel:0316-7860274\" target=\"_blank\">0316-7860274<br />\r\n</a>手机：<a href=\"tel:13932676516\" target=\"_blank\">13932676516</a> <a href=\"tel:15350691132\" target=\"_blank\">15350691132<br />\r\n</a>地址：霸州市汽车站红绿灯南400米路西\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309423437976.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309425911246.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215543247232.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('27', '0', '<p>\r\n	北京贝斯特科技有限公司<br />\r\n联系人：葛海锋<br />\r\n电话：<a href=\"tel:0316-5320516\" target=\"_blank\">0316-5320516</a><br />\r\n手机：<a href=\"tel:18631658555\" target=\"_blank\">18631658555</a> <a href=\"tel:18131618885\" target=\"_blank\">18131618885</a> <a href=\"tel:13373467333\" target=\"_blank\">13373467333<br />\r\n</a>网址：<a href=\"http://www.best-bj.com\">www.best-bj.com</a><br />\r\n总部：北京市丰台区马家堡东路49-2号6层6010室<br />\r\n生产基地：河北 文安 王村<br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309535055357.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309540733768.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309544657513.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309550272531.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309551577489.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061313165839967.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('28', '0', '<p><strong><span style=\"font-size:18px;\">联通快运&lt;/span></strong></p>\r\n<p><strong><span style=\"font-size:18px;\">文安--廊坊 &nbsp;北京 &nbsp;保定 &nbsp;白沟 &nbsp;天津 专线</span></strong></p>\r\n<p>电话；&lt;a href=\"tel:0316-5320993\" target=\"_blank\">0316-5320993</a></p>\r\n<p>手机；&lt;a href=\"tel:13831616211\" target=\"_blank\">13831616211</a> &nbsp;<a href=\"tel:13831644144\" target=\"_blank\">13831644144</a></p>\r\n<p>地址；文安县106国道110.5公里处&lt;/p>\r\n<p>北京：京开 通州 顺义 平谷 密云 昌平 延庆 门头沟 房山 马驹桥&lt;br />\r\n廊坊：霸州 永清 廊坊 香河 大厂 三河 燕郊 固安<br />\r\n保定：安新 定州 涞水 高碑店 易县 蠡县 高阳 安国 博野 徐水 容城 唐县 涞源</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061820141575451.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061820142996432.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061820144627490.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0618/2016061820151652984.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215373196954.jpg\" width=\"400\" height=\"300\" />&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('29', '0', '<p>鲁泰山东专线 <br />\r\n济南卸货地址：济南天桥区零点物流园&lt;br />\r\n济南专线 主发 济南 章丘 济阳 临邑 泰安 肥城 长清 山东全境<br />\r\n联系人：赵志清&lt;br />\r\n手机：&lt;a href=\"tel:13785661313\" target=\"_blank\">13785661313</a> <a href=\"tel:13343160006\" target=\"_blank\">13343160006<br />\r\n</a>地址：河北省文安县106国道世纪大道口&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0605/2016060509274358378.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0605/2016060509280538009.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('30', '0', '<p>永安物流中心<br />\r\n庆云 菏泽专线<br />\r\n联系人：李国桥 王立辉&lt;br />\r\n联系电话：&lt;a href=\"tel:0316-5321008\" target=\"_blank\">0316-5321008</a><br />\r\n查询电话：&lt;a href=\"tel:13930606112\" target=\"_blank\">13930606112</a>&nbsp; <a href=\"tel:13833619189\" target=\"_blank\">13833619189</a><br />\r\n地址：106国道史各庄新桥北头路东&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060811175888854.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060811182594594.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060811193750591.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0609/2016060908080959108.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0609/2016060908082653025.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0609/2016060908084340997.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0609/2016060908090139242.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('31', '0', '<p>\r\n	平安物流<br />\r\n临沂专线<br />\r\n临沂：0316-5313316 7752088<br />\r\n手机：17703163886 <br />\r\n青岛专线<br />\r\n青岛：0316-7058311<br />\r\n手机：18731615757<br />\r\n太原专线<br />\r\n太原：0316-5313203<br />\r\n手机：13722667266 18632601316 <br />\r\n地址：文安新镇106国道101.2公里处路西<br />\r\n电话：<a href=\"tel:0316-5313316\" target=\"_blank\">0316-5313316</a><br />\r\n手机：<a href=\"tel:17703163886\" target=\"_blank\">17703163886</a>&nbsp; <a href=\"tel:15933260055\" target=\"_blank\">15933260055<br />\r\n</a>货款业务<a href=\"tel:15832609099\" target=\"_blank\">15832609099</a> \r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060611525956549.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060611531349630.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060611532983528.jpg\" /><br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060611534610571.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215452482364.jpg\" width=\"400\" height=\"300\" /> \r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('32', '0', '<p>廊坊凯美星装饰材料&lt;br />\r\n烤漆龙骨 三角龙骨<br />\r\n联系人：刘伟<br />\r\n电话：&lt;a href=\"tel:0316-5018225 \" target=\"_blank\">0316-5018225 </a>传真：7988201<br />\r\n手机：&lt;a href=\"tel:13833676046\" target=\"_blank\">13833676046</a>&nbsp; <a href=\"tel:13613261055\" target=\"_blank\">13613261055</a><br />\r\n网址：&lt;a href=\"http://www.kaimeixing.com\">www.kaimeixing.com</a><br />\r\n地址：河北省文安县新镇西庄头工业区&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060612165198135.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060612170440311.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060612172341723.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060612174717028.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060612180623460.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0606/2016060612183030374.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215473739231.jpg\" width=\"400\" height=\"300\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('33', '0', '<div>电话: <a href=\"tel:0316-5326388\" target=\"_blank\">0316-5326388</a></div>\r\n<div>联系人: 吕建松&lt;/div>\r\n<div>手机; <a href=\"tel:13403167301\" target=\"_blank\">13403167301</a> <a href=\"tel:15075677301\" target=\"_blank\">15075677301</a></div>\r\n<div><br />\r\n</div>\r\n<div>地址: 河北文安106国道109.8公里处&lt;/div>\r\n<div><br />\r\n</div>\r\n<div>沿途卸货点:</div>\r\n<div><br />\r\n</div>\r\n<div>宿迁: 沐阳 泗阳 泗洪 新沂 邳州 睢宁&nbsp;</div>\r\n<div>连云港: 东海 赣榆 灌云 灌南</div>\r\n<div>淮安: 淮阴 &nbsp;涟水 洪泽 盱眙&nbsp;</div>\r\n<div>盐城: 建湖 响水 阜宁 射阳 大丰 东台</div>\r\n<div>扬州: 宝应 高邮 江都 仪征</div>\r\n<div>泰州: 兴化 姜堰 泰兴 靖江</div>\r\n<div>南通: 海安 如皋 海门 启东</div>\r\n<div><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215540529885.jpg\" /></div>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('34', '0', '<p>文安县芦阜庄益发钢铁经销部&lt;br />\r\n主要经营：各种厚度酸洗板 冷硬板 厚度0.15-4.0<br />\r\n联系人：厉超<br />\r\n电话：&lt;a href=\"tel:15030666770\" target=\"_blank\">15030666770</a>&nbsp; <a href=\"tel:15030656996\" target=\"_blank\">15030656996<br />\r\n</a>地址：文安县芦阜庄钢材市场C6西区2056号&lt;br />\r\n信用社：6210210070701151506（厉超）<br />\r\n农行：6228481006219657869（厉超）<br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0607/2016060719503684113.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0607/2016060719505817989.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061313152797703.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('35', '0', '<p>宇通快运&lt;br />\r\n合肥 蚌埠 淮南 芜湖 安庆 六安专线<br />\r\n地址：河北文安 106国道史各庄新桥北头路东 <br />\r\n电话 ：&lt;a href=\"tel:0316-5310418 \" target=\"_blank\">0316-5310418&nbsp; </a>&nbsp; <a href=\"tel:0316-5328811 \" target=\"_blank\">0316-5328811 </a><br />\r\n手机：&lt;a href=\"tel:15932638827\" target=\"_blank\">15932638827</a>&nbsp; <a href=\"tel:13831651127 \" target=\"_blank\">13831651127 <br />\r\n</a>联系人：安涛 </p>\r\n<p>合肥卸货地址：南二环国际商贸五金城6号库<br />\r\n联系人：张鹏<br />\r\n电话：&lt;a href=\"tel:18326101102\" target=\"_blank\">18326101102</a> </p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810004673967.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810010257598.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810011712241.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810013529044.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810015136210.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061313135946683.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('36', '0', '平乐配货中心<br />\r\n集宁 呼市 包头 东胜 二连 临河<br />\r\n联系人：蔡平乐&lt;br />\r\n电话：&lt;a href=\"tel:0316-5323693\" target=\"_blank\">0316-5323693</a><br />\r\n手机：&lt;a href=\"tel:13831668188\" target=\"_blank\">13831668188</a><br />\r\n地址：文安县106国道106公里处（围河道口）&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810215686352.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810221842884.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060810224132571.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215444623820.jpg\" />', '', '0');
INSERT INTO `logistics_document_article` VALUES ('37', '0', '<div>廊坊新正达龙骨厂</div>\r\n<div><br />\r\n</div>\r\n<div>轻钢龙骨 卡式龙骨 三角龙骨 边角龙骨</div>\r\n<div><br />\r\n</div>\r\n<div>联系人： 柴松</div>\r\n<div>电话：&lt;a href=\"tel:0316-5312639\" target=\"_blank\">0316-5312639</a>&nbsp;</div>\r\n<div>手机：&lt;a href=\"tel:18632645588\" target=\"_blank\">18632645588</a> <a href=\"tel:13831641604\" target=\"_blank\">13831641604</a></div>\r\n<div>传真： 0316-5312639</div>\r\n<div>地址：河北省廊坊市文安县新镇三村</div>\r\n<div>网址：&lt;a href=\"http://www.hbxinzhengda.com/\" target=\"_blank\">http://www.hbxinzhengda.com/</a></div>\r\n<div><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215412954129.jpg\" width=\"400\" height=\"300\" /></div>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('38', '0', '<p><strong><span style=\"font-size:18px;\"><span style=\"font-family:Arial Black;\">麒麟物流 郑州专线</span></span><br />\r\n主发：&lt;/strong>郑州 新乡 焦作 安阳 濮阳 许昌 开封&lt;br />\r\n<strong>联系人：</strong>王磊<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:15630610666 \" target=\"_blank\">15630610666 </a>&nbsp;<a href=\"tel:15383769333\" target=\"_blank\">15383769333<br />\r\n</a><strong>地址：&lt;/strong>文安县106国道王村交警中队东50米&lt;/p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061310533588305.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061310540161847.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311270628003.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('39', '0', '<p><strong><span style=\"font-size:18px;\">喜成货运</span></strong><br />\r\n<strong><span style=\"font-size:16px;\">天津 塘沽 大港 蓟县</span></strong><br />\r\n<strong>联系人：</strong>孙喜成&lt;br />\r\n<strong>查货：&lt;/strong><a href=\"tel:0316-5310761\" target=\"_blank\">0316-5310761</a><br />\r\n<strong>报货：&lt;/strong><a href=\"tel:13731621920\" target=\"_blank\">13731621920</a><br />\r\n<strong>投诉：&lt;/strong><a href=\"tel:13832637822\" target=\"_blank\">13832637822</a><br />\r\n<strong>地址：&lt;/strong>史各庄新桥北200米路西&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311033268309.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311035276181.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311044028753.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311050312502.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311052791180.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311054859295.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311262911290.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('40', '0', '<p>\r\n	<strong><span style=\"font-size:18px;\">金淼色母粒制造有限公司</span></strong><br />\r\n<strong>联系人：</strong>高静<br />\r\n<strong>电话：</strong><a href=\"tel:0312-5711997 \" target=\"_blank\">0312-5711997&nbsp; &nbsp;</a>&nbsp; <a href=\"tel:0312-5718298\" target=\"_blank\">0312-5718298</a><br />\r\n<strong>手机：</strong><a href=\"tel:15130080888 \" target=\"_blank\">15130080888&nbsp; &nbsp;</a>&nbsp; <a href=\"tel:13930831103\" target=\"_blank\">13930831103</a><br />\r\n<strong>地址：</strong>河北省雄县昝岗镇孤庄头工业区\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311351368595.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311353257205.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311360288837.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('41', '0', '<p><strong><span style=\"font-size:18px;\"><span style=\"color:#e53333;\">大海山东专线</span></span><br />\r\n<span style=\"font-size:18px;\"><span style=\"color:#e53333;\">潍坊 青州 临朐 寿光 安丘 诸城</span></span><br />\r\n联系人：</strong>张海桥&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:13833622077\" target=\"_blank\">13833622077</a>&nbsp; <a href=\"tel:13832606838\" target=\"_blank\">13832606838<br />\r\n</a><strong>地址：&lt;/strong>岛川院里A区6号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311231838146.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311233581139.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311235696050.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311241240676.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311244338089.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311250367496.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311252552670.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311254670136.jpg\" /></p>\r\n<p>&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('42', '0', '<p><strong><span style=\"font-size:18px;\">胜达货运 东北全境</span><br />\r\n联系人：</strong>高军胜&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-2626091\" target=\"_blank\">0316-2626091</a>&nbsp;&nbsp;&nbsp; <a href=\"tel:0316-2715456\" target=\"_blank\">0316-2715456</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13503165426\" target=\"_blank\">13503165426</a><br />\r\n<strong>财务：&lt;/strong><a href=\"tel:15003368785\" target=\"_blank\">15003368785</a><br />\r\n<strong>地址：&lt;/strong>文安县106国道107公里处岛川物流B区18号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311442995177.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311563732077.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311452077387.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311462052574.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311470971116.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311500761418.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311505446145.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311512217803.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311522080889.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311524856192.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311572187525.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061311574553821.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061312022428025.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('43', '0', '<p><strong><span style=\"font-size:18px;\">徐州专线</span></strong> <br />\r\n<strong>主发：徐州 淮北 宿迁 宿州 丰县 新沂 沛县</strong><br />\r\n<strong>联系人：</strong>高伟<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5328658\" target=\"_blank\">0316-5328658</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:18831678799\" target=\"_blank\">18831678799</a>&nbsp;&nbsp; <a href=\"tel:13463605763\" target=\"_blank\">13463605763<br />\r\n</a><strong>地址：&lt;/strong>文安王村交警队东50米宏义物流院内&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320312346296.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320315041451.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061708251169024.jpg\" width=\"400\" height=\"300\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061708255052849.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061708242046460.jpg\" width=\"400\" height=\"800\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320320730335.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('44', '0', '<p><strong><span style=\"font-size:18px;\">冀中物流 济南 淄博 滨州 德州</span></strong><br />\r\n<strong>山东专线 济南 章丘 济阳 商河 平原 德州 禹城 宁津 齐河 <br />\r\n庆云 淄博 临淄 淄川 张店 周村 滨州 邹平 博兴 惠民<br />\r\n联系人：</strong>郝双燕&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-2626060 \" target=\"_blank\">0316-2626060&nbsp; </a>&nbsp; <a href=\"tel:0316-2626523\" target=\"_blank\">0316-2626523<br />\r\n</a><strong>手机：&lt;/strong><a href=\"tel:18631628962 \" target=\"_blank\">18631628962&nbsp; </a>&nbsp; <a href=\"tel:15932638626\" target=\"_blank\">15932638626<br />\r\n</a><strong>地址：&lt;/strong>106国道107公里处岛川物流B区7号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320393458411.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320395625943.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320401319761.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320403386670.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061320405431810.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('45', '0', '<p><strong><span style=\"font-size:18px;\">天达物流</span><br />\r\n<span style=\"font-size:18px;\">文安-银川</span><br />\r\n联系人：</strong>张强&nbsp; <strong>手机：&lt;/strong>15075662029<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 李彬&nbsp; <strong>手机：&lt;/strong>13785651914<br />\r\n<strong>电话：&lt;/strong>0316-5322026<br />\r\n<strong>地址：&lt;/strong>文安县王村道口交警队东侧宏义物流院内106国道109.8公里处&lt;br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061321175179430.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061321180758537.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('46', '0', '<p><strong><span style=\"font-size:18px;\">文安宏鑫物流</span></strong><br />\r\n<strong>文安 霸州 雄县--成都 新都 特快班车<br />\r\n每日一班 36小时到达<br />\r\n每晚十点准时发车<br />\r\n联系人：</strong>高铁栓&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:18832666333\" target=\"_blank\">18832666333</a><br />\r\n<strong>文安地址：&lt;/strong>岛川物流23号库房&lt;br />\r\n<strong>霸州地址：&lt;/strong>钜城B区23号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420043041464.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420104762445.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420113649344.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420121339207.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420130791925.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420135185923.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420141913111.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420144135378.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420150576404.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420154061069.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061420160869298.jpg\" /></p>\r\n<p>&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('47', '0', '<p><strong><span style=\"font-family:Arial Black;font-size:18px;\">鑫利龙骨厂&lt;/span></strong><br />\r\n<strong><span style=\"font-size:16px;\">本厂专业生产各种型号38，50,60,75,100,150,200系列</span><br />\r\n<span style=\"font-size:16px;\">轻钢龙骨，卡式龙骨，三角龙骨，烤漆龙骨和边角及各种龙骨配件。&lt;/span><br />\r\n<span style=\"font-size:16px;\">本厂有生产机组40台，库存量最大，量大从优</span><br />\r\n联系人：</strong>宗恩峰&lt;br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13931678128\" target=\"_blank\">13931678128<br />\r\n</a><strong>电话：&lt;/strong><a href=\"tel:0316-5313615\" target=\"_blank\">0316-5313615</a><br />\r\n<strong>传真：&lt;/strong>0316-5313858<br />\r\n<strong>总厂地址：&lt;/strong>河北省文安县新镇二村工业区农贸市场南行300米路西&lt;br />\r\n<strong>分厂地址：&lt;/strong>河北省文安县新镇四村工业区路南&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061509020062967.jpg\" width=\"400\" height=\"500\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421202936185.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421173262086.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421162252470.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421164171347.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421212388483.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421170770801.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421175976505.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421183342882.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421190056387.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421193467428.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421200586890.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421210039594.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421214587154.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0614/2016061421222277417.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('48', '0', '<p><strong><span style=\"font-size:18px;\">文安县金昊达龙骨厂&lt;/span><br />\r\n手机：&lt;/strong><a href=\"tel:18731670898\" target=\"_blank\">18731670898<br />\r\n</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<a href=\"tel:15383761166\" target=\"_blank\">15383761166</a><br />\r\n<strong>地址：&lt;/strong>新镇二村工业区&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510270335488.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510273732129.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510275769436.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510282292084.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510284331184.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510290761413.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510293222848.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510300135002.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510303578074.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510311081795.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510314726320.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510322014369.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510330763456.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061510343444595.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('49', '0', '<p><strong><span style=\"font-family:Arial Black;\"><span style=\"font-size:18px;\">文安县鑫利龙骨厂</span></span><br />\r\n<span style=\"font-size:16px;\">本厂专业生产各种型号38，50,60,75,100,150,200</span><br />\r\n<span style=\"font-size:16px;\">轻钢龙骨，三角龙骨，边角及各种龙骨配件。&lt;/span><br />\r\n<span style=\"font-size:16px;\">销胜芳龙骨料0.8-1.2厚。&lt;/span><br />\r\n<span style=\"font-size:16px;\">本厂有生产机组40台，库存量最大，量大从&lt;/span><span style=\"font-size:16px;\">优&lt;/span><br />\r\n联系人：</strong>焦勤军&lt;br />\r\n<strong>手机：&lt;/strong><a href=\"tel:15081661826\" target=\"_blank\">15081661826<br />\r\n</a><strong>QQ：&lt;/strong>3071844056<br />\r\n<strong>微信号：</strong>15081661826<br />\r\n<strong>总厂地址：&lt;/strong>河北省文安县新镇二村工业区农贸市场南行300米路西&lt;br />\r\n<strong>分厂地址：&lt;/strong>河北省文安县新镇四村工业区路南&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061620201864621.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061620185489843.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511052017028.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511004958109.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511015443511.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511021041723.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061620180564516.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0616/2016061620164354255.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511023295204.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511012426303.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511055364006.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511063935169.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511061693221.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511070225526.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511072686841.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511075254327.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0615/2016061511082930668.jpg\" /></p>\r\n<p>&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('50', '0', '<p>沈阳&nbsp; 长春&nbsp; 哈尔滨&lt;br />\r\n中转周边各县市&lt;br />\r\n联系人：王德瑞&lt;br />\r\n地址：世纪大道东500米&lt;br />\r\n电话：&lt;a href=\"tel:0316-5328878 \" target=\"_blank\">0316-5328878&nbsp; </a>&nbsp;<a href=\"tel:0316-5323858\" target=\"_blank\">0316-5323858</a><br />\r\n手机：&lt;a href=\"tel:13931636035\" target=\"_blank\">13931636035</a></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061321213938407.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315295068628.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('51', '0', '<p>兄弟物流&nbsp; 新疆专线<br />\r\n乌鲁木齐&nbsp; 库尔勒&amp;nbsp; 阿克苏&amp;nbsp; <br />\r\n喀什&nbsp; 和田&nbsp; 伊犁&nbsp; 吐鲁番&lt;br />\r\n哈密&nbsp; 酒泉&nbsp; 嘉峪关&lt;/p>\r\n<p>地址：106国道107公里处（岛川物流B区5号）<br />\r\n电话：&lt;a href=\"tel:0316-8100888 \" target=\"_blank\">0316-8100888&nbsp; </a>&nbsp;<a href=\"tel:0316-2785268\" target=\"_blank\">0316-2785268</a><br />\r\n手机：&lt;a href=\"tel:15030671888\" target=\"_blank\">15030671888</a>&nbsp; <a href=\"tel:18832616666\" target=\"_blank\">18832616666</a></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315291021134.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('52', '0', '<p><strong><span style=\"font-size:18px;\">胜发物流山西全境</span><br />\r\n<span style=\"color:#ffffff;background-color:#e56600;\">太原专线 </span></strong></p>\r\n<p><strong>手机：&lt;/strong><a href=\"tel:13932600889 \" target=\"_blank\">13932600889&nbsp;</a>&nbsp; <a href=\"tel:18630567222\" target=\"_blank\">18630567222</a>（刘伟）<br />\r\n<strong><span style=\"color:#ffffff;background-color:#ff9900;\">大同 朔州专线 </span></strong></p>\r\n<p><strong>手机：&lt;/strong><a href=\"tel:15175694888\" target=\"_blank\">15175694888</a>&nbsp; <a href=\"tel:13931629641\" target=\"_blank\">13931629641</a>（刘兴）<br />\r\n<span style=\"color:#ffffff;background-color:#ff9900;\"><strong>长治 高平&nbsp; 晋城专线</strong></span><span style=\"background-color:#ff9900;\">&nbsp; </span></p>\r\n<p><strong>手机:</strong><a href=\"tel:15127666966\" target=\"_blank\">15127666966</a>（韩磊）<br />\r\n<span style=\"color:#ffffff;background-color:#ff9900;\"><strong>临沧 运城&nbsp; 侯马专线&nbsp; </strong></span></p>\r\n<p><strong>手机:</strong><a href=\"tel:15078666187\" target=\"_blank\">15076666187</a>&nbsp; <a href=\"tel:150766681571\" target=\"_blank\">150766681571</a>(刘欢)<br />\r\n<strong>总部电话：&lt;/strong><a href=\"tel:0316-5328760 \" target=\"_blank\">0316-5328760&nbsp; </a>&nbsp;<a href=\"tel:0316-5323372 \" target=\"_blank\">0316-5323372&nbsp; </a>&nbsp;<a href=\"tel:0316-5321090\" target=\"_blank\">0316-5321090</a><br />\r\n<strong>地址：&lt;/strong>王村道口西行100米路北&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315273741668.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('53', '0', '<p><strong><span style=\"font-size:18px;\">文安县（彩明塑业）京花线盒管件厂</span><br />\r\n</strong>秦彩明 手机：&lt;a href=\"tel:13785612288\" target=\"_blank\">13785612288</a><br />\r\n秦彩涛 手机：&lt;a href=\"tel:13930673737\" target=\"_blank\">13930673737</a><br />\r\n地址：106国道111公里处文安县王村道口西行200米路南&lt;br />\r\n电话：&lt;a href=\"tel:0316-5321670 \" target=\"_blank\">0316-5321670 </a>&nbsp;<a href=\"tel:0316-5323402 \" target=\"_blank\">0316-5323402 </a>&nbsp;<a href=\"tel:13373363575\" target=\"_blank\">13373363575</a></p>\r\n<p>开户行<br />\r\n河北省文安县邮政储蓄银行帐号<br />\r\n60146 60032 0009 2568<br />\r\n河北省文安县农业银行帐号<br />\r\n62284 51000 0070 00313<br />\r\n河北省文安县农村信用社帐号&lt;br />\r\n6210 2100 7070 0727 975</p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811240570985.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811242381908.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811244056126.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811245717588.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0528/2016052811251334367.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315262499390.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('54', '0', '<p>建材市场测试</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315250931791.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('55', '0', '雨洁物流唐山专线<br />\r\n主发：唐山 丰润 玉田 鸦鸿桥 唐海 乐亭 滦南 滦县 京唐港 曹妃店 蓟县 宝坻方向及唐山全境&lt;br />\r\n联系人：宁雨洁&lt;br />\r\n电话：&lt;a href=\"tel:0316-5016618\" target=\"_blank\">0316-5016618</a><br />\r\n手机：&lt;a href=\"tel:18630603337\" target=\"_blank\">18630603337</a>&nbsp; <a href=\"tel:13930602881\" target=\"_blank\">13930602881</a><br />\r\n地址：106国道105.5公里处路西史各庄大桥北头<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060811295613095.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060811301059298.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0608/2016060811302390211.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215402964203.jpg\" width=\"400\" height=\"300\" />', '', '0');
INSERT INTO `logistics_document_article` VALUES ('56', '0', '<p>兴达山东专线<br />\r\n主发：青岛 平度 即墨 胶州 泰安 肥城 莱芜 新泰 及全国各地零担 整车业务<br />\r\n联系人：郑运岭&lt;br />\r\n电话：&lt;a href=\"tel:0316-5018718\" target=\"_blank\">0316-5018718</a><br />\r\n手机：&lt;a href=\"tel:13930631730 \" target=\"_blank\">13930631730&nbsp;</a>&nbsp; <a href=\"tel:15030635318\" target=\"_blank\">15030635318<br />\r\n</a>地址：106国道108.9公里处（世纪大道东200米）<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060209494753566.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314195826383.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('57', '0', '<p>高迅网络广告<br />\r\n广告印刷 网站制作 百度优化 阿里巴巴 专业办理400电话<br />\r\n设计师：李微<br />\r\n手机：&lt;a href=\"tel:18631682688\" target=\"_blank\">18631682688<br />\r\n</a>传真：0316-5322654<br />\r\n邮箱：&lt;a href=\"mailto:350323873@qq.com\">350323873@qq.com</a> <br />\r\n咨询热线：&lt;a href=\"tel:4006630316\" target=\"_blank\">4006630316</a></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210130973901.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210133162775.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210135949100.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210141653909.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314174132977.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('58', '0', '<p>河北文安华通配货中心&lt;br />\r\n主发：东胜 包头 呼市 集宁 锡林浩特<br />\r\n电话：&lt;a href=\"tel:0316-5328141\" target=\"_blank\">0316-5328141</a><br />\r\n手机：&lt;a href=\"tel:13831681355\" target=\"_blank\">13831681355</a>&nbsp; <a href=\"tel:13473638866\" target=\"_blank\">13473638866<br />\r\n</a>联系人：张华<br />\r\n地址：河北省文安县王村道口农业银行对过&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0602/2016060210385830544.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314164149138.jpg\" /></p>\r\n<p>&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('59', '0', '<p><strong><span style=\"font-size:18px;\">浩凯物流</span></strong></p>\r\n<p><strong><span style=\"font-size:18px;\">江苏专线</span></strong></p>\r\n<p><strong>常州&nbsp; 无锡&nbsp; 苏州 昆山</strong><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:0316-8656303 \" target=\"_blank\">0316-8656303&nbsp; </a>&nbsp;<a href=\"tel:15933061933\" target=\"_blank\">15933061933</a>&nbsp; <a href=\"tel:13700348119\" target=\"_blank\">13700348119</a><br />\r\n<strong>地址：&lt;/strong>文安县106国道110公里处路南&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052709575555464.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052709580448095.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052711163966241.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052711165169727.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315243937836.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('60', '0', '<p><strong><span style=\"font-size:18px;\">恒源物流</span><br />\r\n<span style=\"font-size:18px;\">西藏专线&nbsp;&nbsp;</span></strong></p>\r\n<p><br />\r\n拉萨 那曲&nbsp; 山南 昌都</p>\r\n<p>&nbsp;&nbsp;&nbsp; <br />\r\n阿里&nbsp; 林芝&nbsp; 日喀则&lt;br />\r\n&nbsp;&nbsp;&nbsp; <br />\r\n拉萨卸货点：拉萨市城关区纳金中路兰天物流园33号&lt;br />\r\n&nbsp;<br />\r\n电话：&lt;a href=\"tel:13731630046\" target=\"_blank\">13731630046</a> <a href=\"tel:13082078108\" target=\"_blank\">13082078108<br />\r\n</a>地址：河北106国道107公里岛川物流园B区11号&lt;/p>\r\n<p>&nbsp;</p>\r\n<p>银川 兰州专线</p>\r\n<p><br />\r\n银川 兰州 金昌 武威<br />\r\n</p>\r\n<p>张掖 酒泉 嘉峪关&lt;/p>\r\n<p>天天发车 代收货款</p>\r\n<p></p>\r\n<p>电话：&lt;a href=\"tel:13731630046\" target=\"_blank\">13731630046</a>&nbsp; <a href=\"tel:13082078108\" target=\"_blank\">13082078108</a><br />\r\n地址：河北106国道107公里岛川物流园B区11号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061321272784572.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061321274294309.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052711171565014.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315233028794.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('61', '0', '<p><strong><span style=\"font-size:18px;\">鑫宇通货运 安徽专线</span><br />\r\n河北文安-安庆桐城<br />\r\n联系人：</strong>高朝阳&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5327738\" target=\"_blank\">0316-5327738</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13785671069\" target=\"_blank\">13785671069</a><br />\r\n<strong>地址：&lt;/strong>河北廊坊文安王村道口110.5公里</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053011314168422.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315014563366.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('62', '0', '<p><strong><span style=\"font-size:18px;\">海山承德 赤峰专线</span><br />\r\n主发：&lt;/strong>承德 围场 平泉 赤峰 乌丹 大板 敖汉 林东 林西 克旗<br />\r\n<strong>联系人：</strong>张海山&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5321497 \" target=\"_blank\">0316-5321497 </a>&nbsp; <a href=\"tel:0316-5320695\" target=\"_blank\">0316-5320695</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13832636336\" target=\"_blank\">13832636336</a><br />\r\n<strong>地址：&lt;/strong>河北文安106国道110公里处王村道口&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053011402816819.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053016064146323.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314593939432.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('63', '0', '<p>鲁鑫物流有限公司<br />\r\n天天发车&nbsp; 代收货款<br />\r\n山东专线<br />\r\n潍坊&nbsp; 临朐&nbsp; 寿光&nbsp;&nbsp;&nbsp;&nbsp; 青州&nbsp;&nbsp; 昌乐<br />\r\n东营&nbsp; 利津&nbsp; 广饶&nbsp;&nbsp; 大王&nbsp; 淄博 滨州<br />\r\n电话：0316-2626030<br />\r\n手机：15932635202&nbsp; &nbsp;15632691222<br />\r\n农行卡号：622848 1006381997465<br />\r\n信用社卡号：623501 0270700162509</p>\r\n<p>联系人：韩猛经理<br />\r\n地址：文安县106国道107公里处（岛川物流A区30号）</p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052710220779472.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('64', '0', '<p><strong><span style=\"font-size:16px;\">名洋物流&nbsp;&nbsp;&nbsp; 济南专线</span><br />\r\n<span style=\"font-size:16px;\">&nbsp;</span><br />\r\n</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> 电话：&lt;/strong><a href=\"tel:0316-7983373\" target=\"_blank\">0316-7983373</a><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />\r\n张合圈&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>手机：&lt;/strong><a href=\"tel:18330616826\" target=\"_blank\">18330616826</a><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> 地址：&lt;/strong>文安县王村道口110公里处&lt;/p>\r\n<p>直&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 章丘&nbsp;&nbsp; 济阳&nbsp; 临邑&nbsp; 德州 泰安<br />\r\n达&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 淄博&nbsp;&nbsp; 东营&nbsp; 潍坊&nbsp; 日照 莱芜</p>\r\n<p>&nbsp;</p>\r\n<p><br />\r\n名洋物流&nbsp; 为您风雨兼程</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp; 汽运<br />\r\n文安————西宁&lt;br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 直达&nbsp; </p>\r\n<p>&nbsp;中转全省整车零担</p>\r\n<p>自备货场 发货及时 代收货款<br />\r\n&nbsp;电话：&lt;a href=\"tel:0316-5327766\" target=\"_blank\">0316-5327766</a><br />\r\n&nbsp;手机：&lt;a href=\"tel:13930671358\" target=\"_blank\">13930671358</a>（联系人:张合圈）<br />\r\n&nbsp;地址：文安县106国道王村道口</p>\r\n<p><br />\r\n名洋物流&nbsp;&nbsp; 东营专线</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 电话：&lt;a href=\"tel:0316-7983373\" target=\"_blank\">0316-7983373</a><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />\r\n张合圈&amp;nbsp;&nbsp;&nbsp;&nbsp; 手机：&lt;a href=\"tel:18330616826\" target=\"_blank\">18330616826</a><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址：文安县王村道口110公里处&lt;br />\r\n直&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 利津&nbsp;&nbsp; 垦利 沾化&nbsp; 广饶<br />\r\n&nbsp;&nbsp; —— <br />\r\n达&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 寿光&nbsp;&nbsp; 青州&nbsp; 临朐&nbsp; 潍坊</p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052710303772764.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315224223540.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('65', '0', '<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 石家庄&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 井陉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 整&lt;br />\r\n代&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 文安&nbsp;&nbsp;&nbsp; 正定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 鹿泉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 车&lt;br />\r\n收&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 新乐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 栾城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 零&lt;br />\r\n货&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 定州&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 元氏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 担&lt;br />\r\n款&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 藁城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 赵县<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 晋州<br />\r\n电话：&lt;a href=\"tel:0316-5019775\" target=\"_blank\">0316-5019775</a><br />\r\n&nbsp;<br />\r\n手机：&lt;a href=\"tel:15230600969\" target=\"_blank\">15230600969</a>&nbsp; <a href=\"tel:15231659938\" target=\"_blank\">15231659938</a></p>\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 鹏程石家庄专线&lt;/p>\r\n<p>自备车辆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 天天发车<br />\r\n安全托运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 全程呵护<br />\r\n&nbsp;<br />\r\n内设大型停车场&amp;nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 昼夜服务</p>\r\n<p>农行卡号：6228481001539758315（史东生）&lt;br />\r\n地址：文安史各庄新桥北头路西</p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052710563984759.jpg\" /><br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315202527756.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('66', '0', '<p><strong><span style=\"font-size:16px;\">乾源物流&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 天天发车</span><br />\r\n<span style=\"font-size:16px;\">西北专线&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 代收货款</span></strong></p>\r\n<p><strong>银川&nbsp; 乌海&nbsp;&nbsp; 临河</strong><br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5321991\" target=\"_blank\">0316-5321991</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13831623337\" target=\"_blank\">13831623337</a>&nbsp;&nbsp; <a href=\"tel:13653168555\" target=\"_blank\">13653168555<br />\r\n</a><strong>地址：&lt;/strong>文安县王村道口110公里处&lt;/p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052711050823859.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315193596193.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('67', '0', '<p><strong><span style=\"font-size:18px;\">文安四海 濮阳专线</span></strong><br />\r\n<strong>主发：&lt;/strong>文安 濮阳 新乡漯河<br />\r\n<strong>联系人：</strong>张海良&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5328497\" target=\"_blank\">0316-5328497</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13932683744\" target=\"_blank\">13932683744</a><br />\r\n<strong>地址：&lt;/strong>河北文安106国道109公里处&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053016045525682.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314575418984.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('68', '0', '<p>旺通物流&lt;br />\r\n新疆专线<br />\r\n电话：&lt;a href=\"tel:0316-5317360 \" target=\"_blank\">0316-5317360&nbsp; </a>&nbsp;<a href=\"tel:13722654777\" target=\"_blank\">13722654777</a></p>\r\n<p>酒泉&nbsp; 嘉峪关&lt;br />\r\n张掖&nbsp; 武威<br />\r\n金昌&nbsp; 敦煌<br />\r\n额济纳旗<br />\r\n&nbsp;&nbsp; 拉萨<br />\r\n<a href=\"tel:13722654777\" target=\"_blank\">13722654777</a><br />\r\n<a href=\"tel:15831662567\" target=\"_blank\">15831662567</a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>旺通物流&lt;/p>\r\n<p>本公司货物全程由中国人民财产保险公司承保</p>\r\n<p><br />\r\n拉萨专线 西宁专线</p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"width:499px;height:576px;\" border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0527/2016052711135054854.jpg\" width=\"680\" height=\"906\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315175222453.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('69', '0', '<p><strong><span style=\"color:#e53333;font-size:18px;\">兴邦物流&nbsp; 安徽专线</span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><span style=\"color:#64451d;\">文安-芜湖</span> </span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><span style=\"color:#9933e5;\">联系人：</span> 陈龙</span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><span style=\"color:#9933e5;\">联系电话：&lt;/span> <a href=\"tel:0316-2685288 \" target=\"_blank\">0316-2785288&nbsp; </a>&nbsp; <a href=\"tel:15003165168\" target=\"_blank\">15003165168</a></span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><span style=\"color:#9933e5;\">地址：&lt;/span>文安106国道106.6公里处（岛川物流院内A区28号）<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0529/2016052911103138767.jpg\" /></span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720410530429.jpg\" /></span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0617/2016061720412137111.jpg\" /></span></strong></p>\r\n<p><strong><span style=\"color:#003399;font-size:16px;\"><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315133129129.jpg\" /></span></strong></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('70', '0', '<strong><span style=\"font-family:SimHei;\"><span style=\"font-size:18px;\"><span style=\"color:#e53333;\">东辉货运站&lt;/span></span></span><br />\r\n<span style=\"font-size:16px;\"><span style=\"color:#006600;\">文安-廊坊 香河 三河 燕郊 大厂</span></span><br />\r\n<span style=\"font-size:16px;\"><span style=\"color:#006600;\">文安-北京 通州 顺义 平谷 怀柔 昌平 东坝 小汤山 密云</span></span><br />\r\n<span style=\"background-color:#ffffff;font-family:NSimSun;color:#64451d;font-size:16px;\">联系人：</span><span style=\"color:#003399;font-size:16px;\">张东辉&lt;/span><br />\r\n<span><span style=\"color:#64451d;font-size:18px;\">电话：&lt;/span><a href=\"tel:15133600323 \" target=\"_blank\">15133600323 </a>&nbsp;<a href=\"tel:13623261780\" target=\"_blank\">13623261780</a></span><br />\r\n<span style=\"font-family:NSimSun;font-size:18px;\"><span style=\"color:#64451d;\">地址：&lt;/span></span><span style=\"color:#000000;\">文安县围河路口北20米&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0529/2016052911310822312.jpg\" /></span></strong><br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315130028544.jpg\" />', '', '0');
INSERT INTO `logistics_document_article` VALUES ('71', '0', '<p>\r\n	<strong><span style=\"color:#006600;\"><span style=\"font-family:SimHei;\"><span style=\"font-size:18px;\">文安安顺配货</span></span></span></strong><br />\r\n<strong><span style=\"color:#006600;\"><span style=\"font-family:SimHei;\"><span style=\"font-size:18px;\">邯郸-邢台及周边县市</span></span></span><br />\r\n<span style=\"color:#006600;\"><span style=\"font-family:SimHei;\"><span style=\"font-size:18px;\">上门提货 代结货款</span></span></span><br />\r\n<span style=\"font-size:18px;\">联系人：</span><span style=\"font-size:18px;color:#003399;\">张贺来</span><br />\r\n<span style=\"font-size:18px;\">电话：</span><a href=\"tel:0316-7986666 \" target=\"_blank\">0316-7986666 </a>&nbsp; <a href=\"tel:0316-5328887 \" target=\"_blank\">0316-5328887 </a>&nbsp; <a href=\"tel:0316-5320277\" target=\"_blank\">0316-5320277</a><br />\r\n<span style=\"font-size:18px;\">手机：</span><a href=\"tel:18631603060\" target=\"_blank\">18631603060</a><br />\r\n<span style=\"font-size:18px;\">地址：</span>106国道107公里处（川岛院内）A区8号库房（12.13号）</strong><br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0529/2016052911500626138.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315120489082.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('72', '0', '<p><strong><span style=\"font-size:18px;\"><span style=\"color:#003399;\">宏盛物流-湖南专线</span></span><br />\r\n<span style=\"font-size:16px;\"><span style=\"color:#333333;\">长沙 岳阳 怀化 铜仁 郴州</span></span><br />\r\n<span style=\"color:#333333;\">联系人：史松华&lt;/span><br />\r\n<span style=\"color:#333333;\">电话：&lt;a href=\"tel:0316-5328554\" target=\"_blank\">0316-5328554</a></span><br />\r\n<span style=\"color:#333333;\">手机：&lt;a href=\"tel:13503166212\" target=\"_blank\">13503166212</a>&nbsp; <a href=\"tel:13313061789\" target=\"_blank\">13313061789</a></span><br />\r\n<span style=\"color:#333333;\">地址：106国道109.7公里处交警队东侧50米宏义物流院内19,20号库房&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053011224589428.jpg\" /></span></strong></p>\r\n<p><strong><span style=\"color:#333333;\"><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315112163651.jpg\" /></span></strong></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('73', '0', '<p><strong><span style=\"font-size:18px;\">文安恒源物流（青海全境）</span><br />\r\n文安-西宁<br />\r\n联系人：张永乐&lt;br />\r\n电话：&lt;a href=\"tel:0316-5322625\" target=\"_blank\">0316-5322625</a><br />\r\n手机：&lt;a href=\"tel:18630409896\" target=\"_blank\">18630409896</a>&nbsp; <a href=\"tel:18630409898\" target=\"_blank\">18630409898<br />\r\n</a>地址：106国道107公里处岛川物流B区11号&lt;/strong></p>\r\n<p><strong><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053000104839374.jpg\" /></strong></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315082417651.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('74', '0', '<p><strong><span style=\"font-size:18px;\">益发物流（专线直达）</span></strong><br />\r\n<strong>联系人：</strong>郑妍<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0312-5722733 \" target=\"_blank\">0312-5722733 </a><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"tel:0312-5722700\" target=\"_blank\">0312-5722700</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:15233126781\" target=\"_blank\">15233126781</a>&nbsp; <a href=\"tel:15233125410\" target=\"_blank\">15233125410</a><br />\r\n<strong>地址：&lt;/strong>十间房红绿灯往南1000米路西&lt;br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053000172349984.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315055042615.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('75', '0', '<p><strong><span style=\"font-size:18px;\">宏发物流</span><br />\r\n江苏 浙江 西安专线</strong><br />\r\n<strong>主发：&lt;/strong>西安 嘉兴 南京 无锡 常州 杭州 宁波 义务<br />\r\n<strong>联系人：</strong>张奎<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5322734 \" target=\"_blank\">0316-5322734 </a>&nbsp;<a href=\"tel:0316-5320734\" target=\"_blank\">0316-5320734</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:18831637676\" target=\"_blank\">18831637676</a>&nbsp; <a href=\"tel:13731631199\" target=\"_blank\">13731631199</a><br />\r\n<strong>地址：&lt;/strong>河北省文安县王村道口106国道110公里处&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053000234613455.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315041917660.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('76', '0', '<p><strong><span style=\"font-size:18px;\">中顺物流（合肥专线）</span></strong><br />\r\n<strong>主发：&lt;/strong>合肥 蚌阜 宿州 阜阳 淮南 安庆 铜陵 六安 滁州 芜湖<br />\r\n<strong>联系人：</strong>王卫青 张奎<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5018788 \" target=\"_blank\">0316-5018788&nbsp; </a>&nbsp; <a href=\"tel:0316-5018799 \" target=\"_blank\">0316-5018799 </a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:18731683322\" target=\"_blank\">18731683322</a><br />\r\n<strong>地址：&lt;/strong>河北文安106国道109公里处&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053014374140476.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061315030243395.jpg\" /><br />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('77', '0', '<p><strong><span style=\"font-size:18px;\">老宋物流</span><br />\r\n<span style=\"font-size:18px;\">长沙专线 文安直达湖南全境</span></strong><br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-2626036\" target=\"_blank\">0316-2626036</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13832678826\" target=\"_blank\">13832678826</a>&nbsp; <a href=\"tel:13731600318\" target=\"_blank\">13731600318<br />\r\n</a><strong>地址：&lt;/strong>106国道107公里处岛川物流B区3号&lt;br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053018055391677.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400081634724.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400082938053.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400084492339.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400085955810.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314485211933.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('78', '0', '<p><strong><span style=\"font-size:18px;\">亿隆物流</span><br />\r\n<span style=\"font-size:18px;\">福建专线</span><br />\r\n福州 福清 长乐 莆田 惠安 泉州 晋江 厦门 漳州 三明 龙岩 南平 宁德 福安 沙县</strong><br />\r\n<strong>电话：&lt;/strong><a href=\"tel:18531635305\" target=\"_blank\">18531635305</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:18832616555\" target=\"_blank\">18832616555</a><br />\r\n<strong>地址：&lt;/strong>河北省文安县岛川物流园B区12号&lt;br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053018140718997.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053018142738800.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314473480046.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('79', '0', '<p><strong><span style=\"font-size:18px;\">神马物流</span><br />\r\n<span style=\"font-size:18px;\">衡水专线</span><br />\r\n联系人：</strong>张旭<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-2785299\" target=\"_blank\">0316-2785299</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:15031603123\" target=\"_blank\">15031603123</a><br />\r\n<strong>地址：&lt;/strong>岛川物流大院B区2号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053019355372188.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215561053074.jpg\" width=\"400\" height=\"300\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('80', '0', '<p><strong><span style=\"font-size:18px;\">元亨物流</span><br />\r\n西安兰州专线</strong><br />\r\n<strong>联系人：</strong>胡红恩&lt;br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5327892\" target=\"_blank\">0316-5327892</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:15075637000\" target=\"_blank\">15075637000</a>&nbsp; <a href=\"tel:13313061277\" target=\"_blank\">13313061277</a>&nbsp; <a href=\"tel:15690168555\" target=\"_blank\">15690168555</a><br />\r\n<strong>地址：&lt;/strong>文安县106国道110.5公里处王村道口&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053019420876450.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053019423351791.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314400722661.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('81', '0', '<p><strong><span style=\"font-size:18px;\">日照专线</span></strong></p>\r\n<p>诸城 五莲 莒县 沂水 沂南 临沂<br />\r\n<strong>电话：&lt;/strong><a href=\"tel:0316-5327885\" target=\"_blank\">0316-5327885</a><br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13931683883\" target=\"_blank\">13931683883</a></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053021475810519.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0530/2016053021481064121.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309180596643.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0603/2016060309182038679.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314391990895.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('82', '0', '<p>\r\n	<strong><span style=\"font-size:18px;\">中利烤漆龙骨</span></strong>\r\n</p>\r\n<p>\r\n	<strong>专业品质&nbsp; 缔造完美</strong>\r\n</p>\r\n<p>\r\n	<strong>厂址：</strong>河北省霸州市霸州镇工业区\r\n</p>\r\n<p>\r\n	<strong>电话：</strong><a href=\"tel:0316-7343760\" target=\"_blank\">0316-7343760</a>\r\n</p>\r\n<p>\r\n	<strong>手机：</strong><a href=\"tel:13932666557\" target=\"_blank\">13932666557</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053115191382935.jpg\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053115192530898.jpg\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314334088582.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('83', '0', '<p><strong><span style=\"font-size:18px;\">北京通汇坤宇电线有限公司</span></strong></p>\r\n<p><strong>总经理：</strong>李伟</p>\r\n<p><strong>电话：&lt;/strong><a href=\"tel:0316-5322491 \" target=\"_blank\">0316-5322491&nbsp;&nbsp; </a>传真：0316-5320569</p>\r\n<p><strong>手机：&lt;/strong><a href=\"tel:13803228611 \" target=\"_blank\">13803228611&nbsp;</a>&nbsp; <a href=\"tel:13784114455\" target=\"_blank\">13784114455</a></p>\r\n<p><strong>地址：&lt;/strong>106国道108公里处文安县新村工业区&lt;/p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053115242546589.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053115243780650.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314320243576.jpg\" /></p>\r\n<p>&nbsp;</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('84', '0', '<p>\r\n	鑫源物流<br />\r\n武汉专线<br />\r\n主发：武汉 湖北全境中转<br />\r\n电话：<a href=\"tel:0316-2785281\" target=\"_blank\">0316-2785281</a><br />\r\n手机：<a href=\"tel:18833611776 \" target=\"_blank\">18833611776 <br />\r\n</a>地址：文安县106国道106公里处岛川物流B区4号<br />\r\n卸货地点：武汉市东西湖区八方路（八支沟南头9玖通达物流）<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123033557936.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061216015677604.jpg\" width=\"400\" height=\"300\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('85', '0', '<p>\r\n	<span style=\"background-color:#ff9900;color:#ffffff;\"><b>&nbsp;鑫源物流&nbsp;</b></span>\r\n</p>\r\n<p>\r\n	<span style=\"background-color:#ff9900;color:#ffffff;\"><b><br />\r\n</b></span>\r\n</p>\r\n<p>\r\n	<b><span style=\"font-size:24px;\">文安-张家口专线</span></b>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;font-size:16px;\">宣化 张北 尚义 怀来 涿鹿 沽源 康保 万全 怀安 赤城 崇礼 多伦 保昌</span>\r\n</p>\r\n<p>\r\n	&nbsp;<span style=\"line-height:1.5;\"><b><span style=\"font-size:24px;\">文安-榆林 神木专线</span></b></span>\r\n</p>\r\n<span style=\"font-size:18px;\">府谷 乌审旗 店塔 靖边 定边 大柳塔 横山 米脂 绥德 吴堡 清涧 镇川</span><br />\r\n<p>\r\n	&nbsp;<b><span style=\"font-size:24px;\">文安-延安专线</span></b>\r\n</p>\r\n<span style=\"font-size:18px;\">宝塔 延长 延川 子长 志丹 绥德 吴旗 甘泉 富县 洛川 宜川 孔涧</span><br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<b>联系人：</b>郑伟\r\n</p>\r\n<b>电话：</b><a href=\"tel:0316-5327711\" target=\"_blank\">0316-5327711</a>&nbsp;&nbsp;&nbsp;<a href=\"tel:0316-5327722 \" target=\"_blank\">0316-5327722 </a><br />\r\n<b>手机：<a href=\"tel:13932674000\" target=\"_blank\">13932674000</a>&nbsp;</b>&nbsp; <a href=\"tel:15075665777\" target=\"_blank\">15075665777<br />\r\n</a> \r\n<p>\r\n	<b>地址：</b>文安世纪大道口106国道东200米108公里处\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123254823900.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123260323540.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0601/2016060117143886234.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0601/2016060117141022038.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0601/2016060117033789505.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0612/2016061215432223287.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('86', '0', '<span id=\"syscomment\" sizcache=\"3\" sizset=\"6\">&nbsp;<div class=\"blk_ev56 review\" sizcache=\"3\" sizset=\"6\" jquery1464766716061=\"44\">鑫源物流<br />\r\n文安-张家口专线&lt;br />\r\n宣化 张北 尚义 怀来 涿鹿 沽源 康保 万全 怀安 赤城 崇礼 多伦 保昌<br />\r\n文安-榆林 神木专线<br />\r\n府谷 乌审旗 店塔 靖边 定边 大柳塔 横山 米脂 绥德 吴堡 清涧 镇川<br />\r\n文安-延安专线<br />\r\n宝塔 延长 延川 子长 志丹 绥德 吴旗 甘泉 富县 洛川 宜川 孔涧<br />\r\n联系人：郑伟<br />\r\n电话：&lt;a href=\"tel:0316-5327711 \" target=\"_blank\">0316-5327711&nbsp; </a>&nbsp;<a href=\"tel:0316-5327722\" target=\"_blank\">0316-5327722</a><br />\r\n手机：&lt;a href=\"tel:13932674000\" target=\"_blank\">13932674000</a> &nbsp;&nbsp;<a href=\"tel:15075665777\" target=\"_blank\">15075665777</a><br />\r\n地址：文安世纪大道口106国道东200米108公里处&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123254823900.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123260323540.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0531/2016053123262299524.jpg\" /></div>\r\n<div class=\"blk_ev56 review\" sizcache=\"3\" sizset=\"6\" jquery1464766716061=\"44\"><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0613/2016061314212666417.jpg\" /></div>\r\n</span><!---<div class=\"deal-buy-bottom\" style=\"clear:both;text-align:center;padding:30px;\">\r\n						<a class=\"pngfix\" href=\"//Uploads/Picture/cover/buy.php?id=95\" rel=\"nofollow\">抢购</a> 					</div>\r\n--->', '', '0');
INSERT INTO `logistics_document_article` VALUES ('87', '0', '<p>\r\n	<strong><span style=\"font-size:18px;\"><span style=\"font-family:SimHei;\">宜昌三峡龙骨厂</span></span><br />\r\n<span style=\"font-size:16px;\"><span style=\"font-family:Microsoft YaHei;\">主要生产批发：轻钢龙骨 卡式龙骨 三角龙骨 </span></span></strong>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:16px;\"><span style=\"font-family:Microsoft YaHei;\">龙骨配件 吊杆 石膏板等装饰材料</span></span><br />\r\n总经理：</strong>于方明<br />\r\n<strong>手机：</strong><a href=\"tel:18871718899\" target=\"_blank\">18871718899</a><br />\r\n<strong>厂址：</strong>宜昌市沙河村88号钟宜实业公司院内<br />\r\n<strong>湖北农商银行卡号：</strong>6224121125067539 于方明<br />\r\n<strong>湖北农业银行卡号：</strong>6228480779619876674 于方明\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321050775802.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321053521640.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321060079477.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321063952953.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321070168548.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321074234458.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321080967994.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321083166749.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321090410480.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321093063953.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062321095714397.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('88', '0', '<p><strong><span style=\"font-size:18px;font-family:SimHei;\">北京昆仑中天电线电缆有限公司</span></strong><br />\r\n<strong><span style=\"font-size:16px;\">公司主要生产：阻燃、耐火、低烟无卤、辐照电线电缆、&lt;/span><br />\r\n<span style=\"font-size:16px;\">高低压交联电力电缆、KVV控制电缆、架空绝缘导线、民</span><br />\r\n<span style=\"font-size:16px;\">用电线系列&lt;/span><br />\r\n定做加工各种型号电线电缆</strong><br />\r\n<strong>销售经理：</strong>张建<br />\r\n<strong>电话/传真：&lt;/strong><a href=\"tel:0316-7987009\" target=\"_blank\">0316-7987009</a><br />\r\n<strong>手机/微信：&lt;/strong><a href=\"tel:15932622333\" target=\"_blank\">15932622333</a>&nbsp; <a href=\"tel:13931602780\" target=\"_blank\">13931602780</a><br />\r\n<strong>廊坊地址：&lt;/strong>河北省廊坊市文安县西桥工业区<br />\r\n<strong>北京地址：&lt;/strong>房山区长阳万兴路86号F-343号&lt;/p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323520653456.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323521856587.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323523311634.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323524658468.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323530394067.jpg\" /><br />\r\n<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323532274676.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323534034271.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0623/2016062323540041651.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('89', '0', '<p><strong><span style=\"font-size:18px;\"><span style=\"font-family:NSimSun;\">优联特&lt;/span></span><br />\r\n<span style=\"font-size:16px;\">主要生产：金属电缆桥架、防火电缆桥架、&lt;/span><br />\r\n<span style=\"font-size:16px;\">梯式电缆桥架、大跨距电缆桥架、一次成</span><br />\r\n<span style=\"font-size:16px;\">型电缆桥架及金属穿线管配件&lt;/span><br />\r\n联系人：</strong>于子旺 <a href=\"tel:15128683888\" target=\"_blank\">15128683888<br />\r\n</a><strong>电话：&lt;/strong><a href=\"tel:0316-7981116\" target=\"_blank\">0316-7981116</a><br />\r\n<strong>传真：&lt;/strong>0316-7966680<br />\r\n<strong>手机：&lt;/strong><a href=\"tel:13613261016\" target=\"_blank\">13613261016</a><br />\r\n<strong>地&lt;img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062515074445914.jpg\" width=\"400\" height=\"300\" />址：&lt;/strong>河北省廊坊市文安县新镇鹿町工业区</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062515071356222.jpg\" width=\"400\" height=\"300\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400270023859.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400271283723.jpg\" /><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062515091611631.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400272355733.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0624/2016062400273616127.jpg\" /></p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('90', '0', '<p>\r\n	<strong><span style=\"font-family:Arial Black;font-size:18px;\">华安物流</span></strong><br />\r\n<strong><span style=\"font-size:16px;\">河北文安-西宁 兰州</span><br />\r\n<span style=\"font-size:16px;\">格尔木 天水 拉萨</span><br />\r\n联系人：</strong>高旭<br />\r\n<strong>电话：</strong><a href=\"tel:0316-2308088\" target=\"_blank\">0316-2308088</a><br />\r\n<strong>手机：</strong><a href=\"tel:15075611690\" target=\"_blank\">15075611690</a><br />\r\n<strong>地址：</strong>河北省文安县宏义物流院4号5号库房\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062500040267041.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062500041396377.jpg\" />\r\n</p>\r\n<p>\r\n	<img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062500042383278.jpg\" />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('91', '0', '<div><b><span style=\"font-size:18px;font-family:SimHei;\">超达建筑装饰制品厂&lt;/span></b></div>\r\n<div><b><span style=\"font-size:18px;font-family:SimHei;\">金仕达电缆桥架 烤漆龙骨</span></b></div>\r\n<div><b>总经理：</b>王洪祥&lt;/div>\r\n<div><b>业务主管：&lt;/b>吴建交&lt;/div>\r\n<div><b>厂电/传真：&lt;/b><a href=\"tel:0316-5312928\" target=\"_blank\">0316-5312928</a></div>\r\n<div><b>手机：&lt;/b><a href=\"tel:13703162383\" target=\"_blank\">13703162383</a> &nbsp;<a href=\"tel:18631676266\" target=\"_blank\">18631676266</a></div>\r\n<div><b>网址：&lt;/b>chaodaqiaojia.1688.com</div>\r\n<div>农行卡号：6228461006003115169（吴建交）&lt;/div>\r\n<div>工行卡号：6222080410000966133（吴建交）&lt;/div>\r\n<div>建行卡号：6217000210008477803（吴建交）&lt;/div>\r\n<div><b>厂址：&lt;/b>文安县新镇工业开发区</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522254770358.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522260319275.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522262752247.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522264495492.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522270094034.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522271563033.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522273112554.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522275327015.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522281715581.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522283144741.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522284749325.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522290213205.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062523013676387.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><br />\r\n</div>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('92', '0', '<div><b><span style=\"font-size:18px;font-family:NSimSun;\">河北中利线缆有限公司</span></b></div>\r\n<div><b><span style=\"font-size:16px;\">生产销售：高低压电力电缆、矿物绝缘电缆&lt;/span></b></div>\r\n<div><b><span style=\"font-size:16px;\">柔性防火电缆、铝合金电缆、低烟无卤电缆、&lt;/span></b></div>\r\n<div><b><span style=\"font-size:16px;\">光伏电缆、阻燃耐火电缆、屏蔽电缆、架空&lt;/span></b></div>\r\n<div><b><span style=\"font-size:16px;\">绝缘导线、民用电缆系列&lt;/span></b></div>\r\n<div><b>经理：&lt;/b>霍鹏旭&lt;/div>\r\n<div><b>电话：&lt;/b><a href=\"tel:0316-5333458\" target=\"_blank\">0316-5333458</a> &nbsp;<a href=\"tel:0316-5338883\" target=\"_blank\">0316-5338883</a></div>\r\n<div><b>传真：&lt;/b>0316-5338519</div>\r\n<div><b>手机：&lt;/b><a href=\"tel:13663266627\" target=\"_blank\">13663266627</a> &nbsp;<a href=\"tel:15333163444\" target=\"_blank\">15333163444</a></div>\r\n<div><b>邮箱：&lt;/b>zhongli0316@163.com</div>\r\n<div><b>网址：&lt;/b>www.zl0316.com</div>\r\n<div><b>地址：&lt;/b>河北省廊坊市文安县西桥工业区</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522591164379.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522593032686.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062522595236139.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062523000951050.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062523002783089.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062523004297670.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062523005782534.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0625/2016062523010828759.jpg\" alt=\"\" border=\"0\" /><br />\r\n</div>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('93', '0', '<p><strong><span style=\"font-size:18px;font-family:NSimSun;\">洪季缘纸箱&lt;/span><br />\r\n电话：&lt;/strong><a href=\"tel:15030450752\" target=\"_blank\">15030450752<br />\r\n</a><strong><span style=\"font-size:16px;\">制作各种档次牛皮纸箱，各种彩箱&lt;/span></strong></p>\r\n <p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710333175684.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710335854522.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710341321799.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710343434002.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710345196443.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710351281455.jpg\" /></p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2016/0627/2016062710352947510.jpg\" /><br />\r\n</p>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('94', '0', '<div>河北文安网通货站&lt;/div>\r\n<div>江苏，浙江专线每天有多部9.6米-13米车发往泰州，镇江，靖江，江阴，常州，无锡，苏州，张家港，常熟，宜兴，昆山，等周边地区，杭州，嘉兴，宁波，义乌，等周边地区，发货安全及时代收货款</div>\r\n<div>手机：&lt;a href=\"tel:13933930320\" target=\"_blank\">13933930320</a></div>\r\n<div>电话：&lt;a href=\"tel:0316-5323230\" target=\"_blank\">0316-5323230</a></div>\r\n<div>地址：河北省文安县王村道口农行对面&lt;/div>\r\n<div><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2017/0428/2017042811150990408.jpg\" width=\"400\" height=\"300\" alt=\"\" border=\"0\" /><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2017/0428/2017042811152384105.jpg\" width=\"400\" height=\"300\" alt=\"\" border=\"0\" /><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2017/0428/2017042811153270628.jpg\" width=\"400\" height=\"300\" alt=\"\" border=\"0\" /><img src=\"http://www.yuanteng56.com/Uploads/Picture/cover/2017/0428/2017042811160023301.jpg\" width=\"400\" height=\"300\" alt=\"\" border=\"0\" /><br />\r\n</div>', '', '0');
INSERT INTO `logistics_document_article` VALUES ('95', '0', '凄凄切切群群', '', '0');

-- ----------------------------
-- Table structure for logistics_document_download
-- ----------------------------
DROP TABLE IF EXISTS `logistics_document_download`;
CREATE TABLE `logistics_document_download` (
  `id` int(10) unsigned NOT NULL default '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL default '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL default '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL default '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL default '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL default '0' COMMENT '文件大小',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of logistics_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_file
-- ----------------------------
DROP TABLE IF EXISTS `logistics_file`;
CREATE TABLE `logistics_file` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '文件ID',
  `name` char(30) NOT NULL default '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL default '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL default '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL default '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL default '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL default '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL default '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL default '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of logistics_file
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_hooks
-- ----------------------------
DROP TABLE IF EXISTS `logistics_hooks`;
CREATE TABLE `logistics_hooks` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(40) NOT NULL default '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL default '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL default '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_hooks
-- ----------------------------
INSERT INTO `logistics_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `logistics_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `logistics_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `logistics_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment');
INSERT INTO `logistics_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `logistics_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `logistics_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', '');
INSERT INTO `logistics_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `logistics_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', '');
INSERT INTO `logistics_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', '');
INSERT INTO `logistics_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for logistics_jpzx
-- ----------------------------
DROP TABLE IF EXISTS `logistics_jpzx`;
CREATE TABLE `logistics_jpzx` (
  `wuliu_id` int(10) unsigned NOT NULL default '0' COMMENT '精品专线的id',
  `zdzx_id` int(10) unsigned NOT NULL default '0' COMMENT '直达专线（精品专线的二级分类）',
  `city_id` int(10) unsigned NOT NULL default '0' COMMENT '城市id',
  KEY `zdzx_id-city_id` USING BTREE (`zdzx_id`,`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_jpzx
-- ----------------------------
INSERT INTO `logistics_jpzx` VALUES ('85', '25', '131000');
INSERT INTO `logistics_jpzx` VALUES ('85', '41', '131000');
INSERT INTO `logistics_jpzx` VALUES ('84', '21', '131000');
INSERT INTO `logistics_jpzx` VALUES ('31', '15', '131000');
INSERT INTO `logistics_jpzx` VALUES ('31', '24', '131000');
INSERT INTO `logistics_jpzx` VALUES ('9', '11', '131000');
INSERT INTO `logistics_jpzx` VALUES ('90', '37', '131000');
INSERT INTO `logistics_jpzx` VALUES ('90', '36', '131000');
INSERT INTO `logistics_jpzx` VALUES ('90', '38', '131000');
INSERT INTO `logistics_jpzx` VALUES ('71', '22', '131000');
INSERT INTO `logistics_jpzx` VALUES ('71', '41', '131000');

-- ----------------------------
-- Table structure for logistics_member
-- ----------------------------
DROP TABLE IF EXISTS `logistics_member`;
CREATE TABLE `logistics_member` (
  `uid` int(10) unsigned NOT NULL auto_increment COMMENT '用户ID',
  `nickname` char(16) NOT NULL default '' COMMENT '昵称',
  `company` varchar(100) NOT NULL default '' COMMENT '用户公司名',
  `id_card` varchar(100) NOT NULL default '' COMMENT '身份证',
  `contact` char(10) NOT NULL default '' COMMENT '联系人',
  `wechat` varchar(50) NOT NULL default '' COMMENT '微信号',
  `telephone` varchar(12) NOT NULL default '' COMMENT '手机号',
  `truck` varchar(100) NOT NULL default '' COMMENT '车牌号',
  `driver_license` varchar(100) NOT NULL default '' COMMENT '驾驶证图片',
  `license` varchar(100) NOT NULL default '' COMMENT '营业执照图片id',
  `vip` tinyint(3) unsigned NOT NULL default '0' COMMENT '0-游客 1-试用期会员 2-推荐会员 3-vip会员',
  `vip_start` int(10) unsigned NOT NULL default '0' COMMENT '会员开始时间',
  `vip_end` int(10) unsigned NOT NULL default '0' COMMENT '会员结束时间',
  `score` mediumint(8) NOT NULL default '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL default '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL default '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL default '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL default '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL default '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '会员状态',
  PRIMARY KEY  (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of logistics_member
-- ----------------------------
INSERT INTO `logistics_member` VALUES ('1', 'shexie303', '0', '', '', '', '', '', '', '', '3', '1491494400', '1499356800', '140', '131', '0', '1490319959', '2130706433', '1494778866', '1');
INSERT INTO `logistics_member` VALUES ('2', '13932662063', '吉轩格栅厂', '', '', '', '13932662063', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('3', '18931649415', '文安出租4.25米奥铃货车，主发京津冀鲁', '', '', '', '18931649415', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('4', '0316-5310982', '轻钢龙骨，卡式龙骨,全丝吊杆，龙骨配件，金属格栅，三角龙骨', '', '', '', '0316-5310982', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('5', '13315605505', '北京华旗 灯具 投光灯', '', '', '', '13315605505', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('6', '0316-2626044', '大连，营口专线', '', '', '', '0316-2626044', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('7', '0316-5314522', '河北文安-大连专线', '', '', '', '0316-5314522', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('8', '15930643072', '顺发 主要生产：预埋件，大理石干挂件，角码，垫片，塑料垫块及各种异型冲加工', '', '', '', '15930643072', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('9', '0316-7966966', '顺通物流 上海专线', '', '', '', '0316-7966966', '', '', '', '3', '1466092800', '1497801600', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('10', '0316-7986476', '万通物流 河南 湖北专线 南阳 襄阳 十堰', '', '', '', '0316-7986476', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('11', '15076605987', '轻钢龙骨 主要生产：主吊;付挂；支卡，快吊；付接；.反烤漆挂件；50支托等各种冲压备套件', '', '', '', '15076605987', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('12', '0316-5670010', '1+1物流（江苏专线）文安-南京 常州 苏州', '', '', '', '0316-5670010', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('13', '0316-5316710', '仁合兴装饰材料厂', '', '', '', '0316-5316710', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('14', '0316-5322104', '顺发 鸦鸿桥 丰润 玉田 遵化 迁安 滦县 丰南 滦南', '', '', '', '0316-5322104', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('15', '0312-2858312', '宝塑 高碑店友谊建筑电料制品厂', '', '', '', '0312-2858312', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('16', '0316-5322666', '宏义福州 厦门 福建全境，常州 无锡 苏州 江苏全境，西安 陕西全境,兰州 武威 金昌 张掖 酒泉 嘉峪关甘肃全境', '', '', '', '0316-5322666', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('17', '0316-5322268', '伟民物流 南昌 洛阳 直达江西全境 河南洛阳', '', '', '', '0316-5322268', '', '', '', '2', '1382112000', '1693324800', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('18', '0316-5321020', '双星上海专线  江苏 浙江', '', '', '', '0316-5321020', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('19', '0316-5328572', '锡林浩特专线', '', '', '', '0316-5328572', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('20', '0316-5327711', '鑫源物流 张家口专线 榆林 神木专线 延安专线', '', '', '', '0316-5327711', '', '', '', '3', '1464710400', '1496419200', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('21', '15832657222', '建宇江苏 南京 苏州 常州 无锡 昆山 张家港 扬州 无锡', '', '', '', '15832657222', '', '', '', '2', '1464796800', '1496505600', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('22', '0316-5314286', '专业生产优质三角龙骨 轻钢龙骨及各式烤漆龙骨', '', '', '', '0316-5314286', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('23', '0316-5322345', '济南 淄博 滨州 庆云 潍坊 青州 德州 禹城 济阳 商河 章丘 宁津', '', '', '', '0316-5322345', '', '', '', '2', '1464796800', '1496505600', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('24', '0316-5328470', '文平物流', '', '', '', '0316-5328470', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('25', '0316-5328305', '联通山东专线 烟台 威海 青岛', '', '', '', '0316-5328305', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('26', '0316-7860274', '石家庄 西安专线 成都 重庆 九江 沈阳 运城 长治 哈尔滨', '', '', '', '0316-7860274', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('27', '0316-5320516', '北京贝斯特科技有限公司', '', '', '', '0316-5320516', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('28', '0316-5320993', '联通快运 文安-廊坊 北京 保定 白沟 天津', '', '', '', '0316-5320993', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('29', '13785661313', '济南专线 主发 济南 章丘 济阳 临邑 泰安 肥城 长清 山东全境', '', '', '', '13785661313', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('30', '0316-5321008', '永安物流中心 庆云 菏泽专线', '', '', '', '0316-5321008', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('31', '0316-5313316', '平安物流 临沂专线 青岛专线 太原专线', '', '', '', '0316-5313316', '', '', '', '3', '1465142400', '1496851200', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('32', '0316-5018225', '廊坊凯美星装饰材料 烤漆龙骨 三角龙骨', '', '', '', '0316-5018225', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('33', '0316-5326388', '宏发 苏北专线 (江苏) 主发: 宿迁 淮安 连云港 盐城 新沂 扬州 泰州 南通', '', '', '', '0316-5326388', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('34', '15030666770', '文安县芦阜庄益发钢铁经销部', '', '', '', '15030666770', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('35', '0316-5310418', '宇通快运 合肥 蚌埠 淮南 芜湖 安庆 六安专线', '', '', '', '0316-5310418', '', '', '', '2', '1465315200', '1497024000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('36', '0316-5323693', '平乐配货中心', '', '', '', '0316-5323693', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('37', '0316-5312639', '廊坊新正达龙骨厂', '', '', '', '0316-5312639', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('38', '15630610666', '麒麟物流 郑州专线 新乡 焦作 安阳 濮阳 许昌 开封', '', '', '', '15630610666', '', '', '', '2', '1465747200', '1497456000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('39', '0316-5310761', '喜成货运 天津 塘沽 大港 蓟县', '', '', '', '0316-5310761', '', '', '', '2', '1465747200', '1497456000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('40', '0312-5711997', '金淼色母粒制造有限公司', '', '', '', '0312-5711997', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('41', '13833622077', '大海山东专线 潍坊 青州 临朐 寿光 安丘 诸城', '', '', '', '13833622077', '', '', '', '2', '1465747200', '1497456000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('42', '0316-2626091', '胜达货运 哈尔滨 大庆 齐齐哈尔 白城 海拉尔 扎兰屯 长春 沈阳 佳木斯 牡丹江', '', '', '', '0316-2626091', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('43', '0316-5328658', '徐州专线 主发：徐州 淮北 宿迁 宿州 丰县 新沂 沛县', '', '', '', '0316-5328658', '', '', '', '2', '1465747200', '1497456000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('44', '0316-2626060', '冀中物流 济南 淄博 滨州 德州', '', '', '', '0316-2626060', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('45', '0316-5322026', '天达物流 文安-银川', '', '', '', '0316-5322026', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('46', '18832666333', '宏鑫 文安 霸州 雄县--成都 新都 特快班车 广东广西 贵州 昆明', '', '', '', '18832666333', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('47', '0316-5313615', '鑫利.轻钢龙骨，卡式龙骨，三角龙骨，烤漆龙骨和边角及各种龙骨配件', '', '', '', '0316-5313615', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('48', '18731670898', '文安县金昊达龙骨厂', '', '', '', '18731670898', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('49', '15081661826', '文安鑫利 轻钢龙骨，三角龙骨，边角及各种龙骨配件', '', '', '', '15081661826', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('50', '13931636035', '沈阳  长春  哈尔滨', '', '', '', '13931636035', '', '', '', '2', '1463241600', '1684339200', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('51', '0316-8100888', '兄弟物流  乌鲁木齐  库尔勒  阿克苏 喀什  和田  伊犁  吐鲁番 哈密  酒泉  嘉峪关', '', '', '', '0316-8100888', '', '', '', '2', '1463241600', '1684080000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('52', '0316-5328760', '胜发物流山西全境', '', '', '', '0316-5328760', '', '', '', '2', '1463414400', '1495209600', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('53', '0316-5321670', '文安县（彩明塑业）京花线盒管件厂', '', '', '', '0316-5321670', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('54', '15531613668', '建材市场测试', '', '', '', '15531613668', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('55', '0316-5016618', '雨洁物流唐山专线', '', '', '', '0316-5016618', '', '', '', '2', '1465315200', '1497024000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('56', '0316-5018718', '兴达主发：青岛 平度 即墨 胶州 泰安 肥城 莱芜 新泰', '', '', '', '0316-5018718', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('57', '18631682688', '高迅网络广告', '', '', '', '18631682688', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('58', '0316-5328141', '华通主发：东胜 包头 呼市 集宁 锡林浩特', '', '', '', '0316-5328141', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('59', '0316-8656303', '江苏专线  常州  无锡  苏州 昆山', '', '', '', '0316-8656303', '', '', '', '3', '1464192000', '1495987200', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('60', '13731630046', '西藏专线 拉萨 那曲  山南 昌都 阿里  林芝  日喀则', '', '', '', '13731630046', '', '', '', '2', '1464192000', '1495987200', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('61', '0316-5327738', '安徽专线  安庆 桐城 六安 舒城 合肥 铜陵池州', '', '', '', '0316-5327738', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('62', '0316-5321497', '海山承德 赤峰专线 主发：承德 围场 平泉 赤峰 乌丹 大板 敖汉 林东 林西 克旗', '', '', '', '0316-5321497', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('63', '0316-2626030', '山东专线  潍坊  临朐  寿光     青州   昌乐', '', '', '', '0316-2626030', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('64', '0316-7983373', '名洋主发：章丘   济阳  临邑  德州 泰安  淄博   东营  潍坊  日照 莱芜', '', '', '', '0316-7983373', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('65', '0316-5019775', '鹏程 石家庄 专线', '', '', '', '0316-5019775', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('66', '0316-5321991', '乾源物流 西北专线  银川  乌海   临河', '', '', '', '0316-5321991', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('67', '0316-5328497', '濮阳专线 主发：文安 濮阳 新乡漯河', '', '', '', '0316-5328497', '', '', '', '0', '0', '0', '10', '1', '0', '0', '2130706433', '1494771003', '1');
INSERT INTO `logistics_member` VALUES ('68', '0316-5317360', '旺通物流   新疆专线  酒泉  嘉峪关  张掖  武威', '', '', '', '0316-5317360', '', '', '', '2', '1464192000', '1495987200', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('69', '0316-2785288', '兴邦物流  商丘 周口 宿州 淮北 滁州 芜湖 宣城 黄山', '', '', '', '0316-2785288', '', '', '', '2', '1464537600', '1496160000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('70', '15133600323', '文安-廊坊 香河 三河 燕郊 大厂 北京 通州 顺义 平谷 怀柔 昌平 东坝 小汤山 密云', '', '', '', '15133600323', '', '', '', '2', '1464537600', '1496160000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('71', '0316-7986666', '邯郸-邢台 安阳 及周边县市', '', '', '', '0316-7986666', '', '', '', '3', '1464537600', '1496160000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('72', '0316-5328554', '宏盛物流-湖南专线  长沙 岳阳 怀化 铜仁 郴州', '', '', '', '0316-5328554', '', '', '', '2', '1464537600', '1496160000', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('73', '0316-5322625', '青海全境 文安-西宁', '', '', '', '0316-5322625', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('74', '0312-5722733', '益发物流（专线直达）', '', '', '', '0312-5722733', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('75', '0316-5322734', '江苏 浙江 西安专线 主发：西安 嘉兴 南京 无锡 常州 杭州 宁波 义务', '', '', '', '0316-5322734', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('76', '0316-5018788', '合肥专线 主发：合肥 蚌阜 宿州 阜阳 淮南 安庆 铜陵', '', '', '', '0316-5018788', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('77', '0316-2626036', '文安-湖南长沙 株洲 湘潭 衡阳 邵阳岳阳 常德 张家界 益阳 怀化 娄底 贵阳 遵义 安顺', '', '', '', '0316-2626036', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('78', '18531635305', '亿隆主发：福州 福清 长乐 莆田 惠安 泉州 晋江 厦门 漳州 三明 龙岩 南平 宁德 福安 沙县', '', '', '', '18531635305', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('79', '0316-2785299', '衡水专线', '', '', '', '0316-2785299', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('80', '0316-5327892', '元亨西安兰州专线', '', '', '', '0316-5327892', '', '', '', '2', '1464537600', '1496246400', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('81', '0316-5327885', '日照专线 诸城 五莲 莒县 沂水 沂南 临沂', '', '', '', '0316-5327885', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('82', '0316-7343760', '中利烤漆龙骨', '', '', '', '0316-7343760', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('83', '0316-5322491', '北京通汇坤宇电线有限公司', '', '', '', '0316-5322491', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('84', '0316-2785281', '鑫源武汉专线 主发：武汉 湖北全境中转', '', '', '', '0316-2785281', '', '', '', '3', '1464624000', '1496332800', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('85', 'yuantengadmin', '鑫源物流 榆林 神木 府谷 乌审旗 店塔 靖边 定边 大柳塔 米脂 绥德 吴堡 清涧 镇川', '', '', '', '0316-5327711', '', '', '', '3', '1464624000', '1496332800', '30', '4', '0', '0', '2130706433', '1494779344', '1');
INSERT INTO `logistics_member` VALUES ('86', 'adminyuanteng', '鑫源物流 张家口专线 榆林 神木专线 延安专线', '', '', '', '0316-5327711', '', '', '', '3', '1464710400', '1496419200', '10', '2', '0', '0', '2130706433', '1494770757', '1');
INSERT INTO `logistics_member` VALUES ('87', '18871718899', '宜昌三峡 轻钢龙骨 卡式龙骨 三角龙骨 龙骨配件 吊杆 石膏板等装饰材料', '', '', '', '18871718899', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('88', '0316-7987009', '阻燃、耐火、低烟无卤、辐照电线电缆、高低压交联电力电缆、KVV控制电缆、架空绝缘导线、民用电线系列', '', '', '', '0316-7987009', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('89', '0316-7981116', '金属电缆桥架、防火电缆桥架、梯式电缆桥架、大跨距电缆桥架、一次成型电缆桥架及金属穿线管配件', '', '', '', '0316-7981116', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('90', '0316-2308088', '华安 河北文安-西宁 兰州 格尔木 天水 拉萨', '', '', '', '0316-2308088', '', '', '', '3', '1466784000', '1498492800', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('91', '0316-5312928', '金仕达电缆桥架 烤漆龙骨', '', '', '', '0316-5312928', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('92', '0316-5333458', '河北中利线缆有限公司', '', '', '', '0316-5333458', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('93', '15030450752', '洪季缘 制作各种档次牛皮纸箱，各种彩箱', '', '', '', '15030450752', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('94', '13933930320', '河北文安网通货站 江苏，浙江专线每天有多部9.6米-13米车发往泰州，镇江，靖江，江阴，常州，无锡，苏州，张家港，常熟，宜兴，昆山，等周边地区，杭州，嘉兴，宁波，义乌，等周边地区', '', '', '', '13933930320', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('95', '0316-5328878', '沈阳 长春 哈尔滨', '', '', '', '0316-5328878', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for logistics_menu
-- ----------------------------
DROP TABLE IF EXISTS `logistics_menu`;
CREATE TABLE `logistics_menu` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '文档ID',
  `title` varchar(50) NOT NULL default '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL default '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL default '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL default '' COMMENT '提示',
  `group` varchar(50) default '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY  (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_menu
-- ----------------------------
INSERT INTO `logistics_menu` VALUES ('2', '内容', '0', '2', 'Article/mydocument', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `logistics_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `logistics_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `logistics_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `logistics_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `logistics_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `logistics_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `logistics_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `logistics_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `logistics_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `logistics_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `logistics_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `logistics_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `logistics_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `logistics_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `logistics_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `logistics_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `logistics_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `logistics_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `logistics_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `logistics_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `logistics_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `logistics_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `logistics_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `logistics_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `logistics_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `logistics_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `logistics_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `logistics_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `logistics_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `logistics_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `logistics_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `logistics_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('68', '系统', '0', '4', 'Channel/index', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('76', '友链管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `logistics_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `logistics_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `logistics_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `logistics_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `logistics_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `logistics_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `logistics_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `logistics_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `logistics_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `logistics_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `logistics_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `logistics_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `logistics_menu` VALUES ('108', '修改密码', '16', '2', 'User/updatePassword', '0', '', '个人中心', '0');
INSERT INTO `logistics_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('122', '会员充值', '16', '1', 'User/recharge', '0', '', '个人中心', '0');
INSERT INTO `logistics_menu` VALUES ('124', '完善资料', '16', '0', 'User/info', '0', '', '个人中心', '0');
INSERT INTO `logistics_menu` VALUES ('125', '手动充值', '16', '0', 'User/manual_recharge', '1', '', '个人中心', '0');
INSERT INTO `logistics_menu` VALUES ('126', '广告管理', '68', '7', 'Ad/index', '0', '广告位管理', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('127', '新增', '126', '0', 'Ad/add', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('128', '编辑', '126', '0', 'Ad/edit', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('129', '删除', '126', '0', 'Ad/del', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('130', '热门城市', '68', '8', 'City/hot', '0', '热门城市管理', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('131', '新增', '130', '0', 'City/hotAdd', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('132', '删除', '130', '0', 'City/hotDel', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('133', '更改状态', '80', '0', 'Category/setStatus', '0', '更改分类状态', '', '0');

-- ----------------------------
-- Table structure for logistics_model
-- ----------------------------
DROP TABLE IF EXISTS `logistics_model`;
CREATE TABLE `logistics_model` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '模型ID',
  `name` char(30) NOT NULL default '' COMMENT '模型标识',
  `title` char(30) NOT NULL default '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL default '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL default '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL default '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL default '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL default '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL default '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL default '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL default '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL default '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL default '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL default '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL default 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of logistics_model
-- ----------------------------
INSERT INTO `logistics_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览', '0', '', '', '1383891233', '1490840117', '1', 'MyISAM');
INSERT INTO `logistics_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"19\",\"12\",\"24\"],\"2\":[\"9\",\"13\",\"10\",\"16\",\"2\",\"17\",\"5\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1490859874', '1', 'MyISAM');

-- ----------------------------
-- Table structure for logistics_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `logistics_pay_log`;
CREATE TABLE `logistics_pay_log` (
  `id` mediumint(8) unsigned NOT NULL auto_increment COMMENT '规则id,自增主键',
  `order_number` varchar(100) NOT NULL default '' COMMENT '流水号',
  `type` tinyint(2) NOT NULL default '2' COMMENT '0-免费试用期会员 1-人工后台充值 2-微信',
  `money` int(10) unsigned NOT NULL default '0' COMMENT '充值金额',
  `uid` int(10) unsigned NOT NULL default '0' COMMENT 'uid',
  `month` tinyint(3) unsigned default '0' COMMENT '会员期限',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '生成时间',
  PRIMARY KEY  (`id`),
  KEY `module` (`order_number`,`create_time`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_pay_log
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_pca
-- ----------------------------
DROP TABLE IF EXISTS `logistics_pca`;
CREATE TABLE `logistics_pca` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `name` varchar(128) NOT NULL,
  `full_name` varchar(128) NOT NULL,
  `pinyin` varchar(50) NOT NULL default '' COMMENT '拼音',
  `hot` tinyint(1) unsigned NOT NULL default '0' COMMENT '1-热门城市 0-正常',
  PRIMARY KEY  (`id`),
  KEY `i_region_name` USING BTREE (`name`),
  KEY `i_region_parent` USING BTREE (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of logistics_pca
-- ----------------------------
INSERT INTO `logistics_pca` VALUES ('110000', '0', '1', '北京', '北京', '', '0');
INSERT INTO `logistics_pca` VALUES ('110100', '110000', '2', '北京', '北京市', 'beijing', '1');
INSERT INTO `logistics_pca` VALUES ('110101', '110100', '3', '东城', '东城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110102', '110100', '3', '西城', '西城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110105', '110100', '3', '朝阳', '朝阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110106', '110100', '3', '丰台', '丰台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110107', '110100', '3', '石景山', '石景山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110108', '110100', '3', '海淀', '海淀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110109', '110100', '3', '门头沟', '门头沟区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110111', '110100', '3', '房山', '房山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110112', '110100', '3', '通州', '通州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110113', '110100', '3', '顺义', '顺义区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110114', '110100', '3', '昌平', '昌平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110115', '110100', '3', '大兴', '大兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110116', '110100', '3', '怀柔', '怀柔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110117', '110100', '3', '平谷', '平谷区', '', '0');
INSERT INTO `logistics_pca` VALUES ('110228', '110100', '3', '密云', '密云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('110229', '110100', '3', '延庆', '延庆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('120000', '0', '1', '天津', '天津', '', '0');
INSERT INTO `logistics_pca` VALUES ('120100', '120000', '2', '天津', '天津市', 'tianjin', '1');
INSERT INTO `logistics_pca` VALUES ('120101', '120100', '3', '和平', '和平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120102', '120100', '3', '河东', '河东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120103', '120100', '3', '河西', '河西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120104', '120100', '3', '南开', '南开区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120105', '120100', '3', '河北', '河北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120106', '120100', '3', '红桥', '红桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120110', '120100', '3', '东丽', '东丽区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120111', '120100', '3', '西青', '西青区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120112', '120100', '3', '津南', '津南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120113', '120100', '3', '北辰', '北辰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120114', '120100', '3', '武清', '武清区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120115', '120100', '3', '宝坻', '宝坻区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120116', '120100', '3', '滨海新区', '滨海新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('120221', '120100', '3', '宁河', '宁河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('120223', '120100', '3', '静海', '静海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('120225', '120100', '3', '蓟县', '蓟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130000', '0', '1', '河北', '河北省', '', '0');
INSERT INTO `logistics_pca` VALUES ('130100', '130000', '2', '石家庄', '石家庄市', 'shijiazhuang', '0');
INSERT INTO `logistics_pca` VALUES ('130102', '130100', '3', '长安', '长安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130104', '130100', '3', '桥西', '桥西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130105', '130100', '3', '新华', '新华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130107', '130100', '3', '井陉矿区', '井陉矿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130108', '130100', '3', '裕华', '裕华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130109', '130100', '3', '藁城', '藁城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130110', '130100', '3', '鹿泉', '鹿泉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130111', '130100', '3', '栾城', '栾城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130121', '130100', '3', '井陉', '井陉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130123', '130100', '3', '正定', '正定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130125', '130100', '3', '行唐', '行唐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130126', '130100', '3', '灵寿', '灵寿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130127', '130100', '3', '高邑', '高邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130128', '130100', '3', '深泽', '深泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130129', '130100', '3', '赞皇', '赞皇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130130', '130100', '3', '无极', '无极县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130131', '130100', '3', '平山', '平山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130132', '130100', '3', '元氏', '元氏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130133', '130100', '3', '赵县', '赵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130181', '130100', '3', '辛集', '辛集市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130183', '130100', '3', '晋州', '晋州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130184', '130100', '3', '新乐', '新乐市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130200', '130000', '2', '唐山', '唐山市', 'tangshan', '0');
INSERT INTO `logistics_pca` VALUES ('130202', '130200', '3', '路南', '路南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130203', '130200', '3', '路北', '路北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130204', '130200', '3', '古冶', '古冶区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130205', '130200', '3', '开平', '开平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130207', '130200', '3', '丰南', '丰南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130208', '130200', '3', '丰润', '丰润区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130209', '130200', '3', '曹妃甸', '曹妃甸区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130223', '130200', '3', '滦县', '滦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130224', '130200', '3', '滦南', '滦南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130225', '130200', '3', '乐亭', '乐亭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130227', '130200', '3', '迁西', '迁西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130229', '130200', '3', '玉田', '玉田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130281', '130200', '3', '遵化', '遵化市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130283', '130200', '3', '迁安', '迁安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130300', '130000', '2', '秦皇岛', '秦皇岛市', 'qinhuangdao', '0');
INSERT INTO `logistics_pca` VALUES ('130302', '130300', '3', '海港', '海港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130303', '130300', '3', '山海关', '山海关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130304', '130300', '3', '北戴河', '北戴河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130321', '130300', '3', '青龙', '青龙满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130322', '130300', '3', '昌黎', '昌黎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130323', '130300', '3', '抚宁', '抚宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130324', '130300', '3', '卢龙', '卢龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130400', '130000', '2', '邯郸', '邯郸市', 'handan', '0');
INSERT INTO `logistics_pca` VALUES ('130402', '130400', '3', '邯山', '邯山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130403', '130400', '3', '丛台', '丛台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130404', '130400', '3', '复兴', '复兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130406', '130400', '3', '峰峰矿区', '峰峰矿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130421', '130400', '3', '邯郸', '邯郸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130423', '130400', '3', '临漳', '临漳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130424', '130400', '3', '成安', '成安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130425', '130400', '3', '大名', '大名县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130426', '130400', '3', '涉县', '涉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130427', '130400', '3', '磁县', '磁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130428', '130400', '3', '肥乡', '肥乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130429', '130400', '3', '永年', '永年县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130430', '130400', '3', '邱县', '邱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130431', '130400', '3', '鸡泽', '鸡泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130432', '130400', '3', '广平', '广平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130433', '130400', '3', '馆陶', '馆陶县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130434', '130400', '3', '魏县', '魏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130435', '130400', '3', '曲周', '曲周县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130481', '130400', '3', '武安', '武安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130500', '130000', '2', '邢台', '邢台市', 'xingtai', '0');
INSERT INTO `logistics_pca` VALUES ('130502', '130500', '3', '桥东', '桥东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130503', '130500', '3', '桥西', '桥西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130521', '130500', '3', '邢台', '邢台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130522', '130500', '3', '临城', '临城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130523', '130500', '3', '内丘', '内丘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130524', '130500', '3', '柏乡', '柏乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130525', '130500', '3', '隆尧', '隆尧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130526', '130500', '3', '任县', '任县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130527', '130500', '3', '南和', '南和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130528', '130500', '3', '宁晋', '宁晋县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130529', '130500', '3', '巨鹿', '巨鹿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130530', '130500', '3', '新河', '新河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130531', '130500', '3', '广宗', '广宗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130532', '130500', '3', '平乡', '平乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130533', '130500', '3', '威县', '威县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130534', '130500', '3', '清河', '清河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130535', '130500', '3', '临西', '临西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130581', '130500', '3', '南宫', '南宫市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130582', '130500', '3', '沙河', '沙河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130600', '130000', '2', '保定', '保定市', 'baoding', '0');
INSERT INTO `logistics_pca` VALUES ('130602', '130600', '3', '新市', '新市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130603', '130600', '3', '北市', '北市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130604', '130600', '3', '南市', '南市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130621', '130600', '3', '满城', '满城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130622', '130600', '3', '清苑', '清苑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130623', '130600', '3', '涞水', '涞水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130624', '130600', '3', '阜平', '阜平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130625', '130600', '3', '徐水', '徐水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130626', '130600', '3', '定兴', '定兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130627', '130600', '3', '唐县', '唐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130628', '130600', '3', '高阳', '高阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130629', '130600', '3', '容城', '容城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130630', '130600', '3', '涞源', '涞源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130631', '130600', '3', '望都', '望都县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130632', '130600', '3', '安新', '安新县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130633', '130600', '3', '易县', '易县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130634', '130600', '3', '曲阳', '曲阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130635', '130600', '3', '蠡县', '蠡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130636', '130600', '3', '顺平', '顺平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130637', '130600', '3', '博野', '博野县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130638', '130600', '3', '雄县', '雄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130681', '130600', '3', '涿州', '涿州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130682', '130600', '3', '定州', '定州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130683', '130600', '3', '安国', '安国市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130684', '130600', '3', '高碑店', '高碑店市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130700', '130000', '2', '张家口', '张家口市', 'zhangjiakou', '0');
INSERT INTO `logistics_pca` VALUES ('130702', '130700', '3', '桥东', '桥东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130703', '130700', '3', '桥西', '桥西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130705', '130700', '3', '宣化', '宣化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130706', '130700', '3', '下花园', '下花园区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130721', '130700', '3', '宣化', '宣化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130722', '130700', '3', '张北', '张北县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130723', '130700', '3', '康保', '康保县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130724', '130700', '3', '沽源', '沽源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130725', '130700', '3', '尚义', '尚义县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130726', '130700', '3', '蔚县', '蔚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130727', '130700', '3', '阳原', '阳原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130728', '130700', '3', '怀安', '怀安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130729', '130700', '3', '万全', '万全县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130730', '130700', '3', '怀来', '怀来县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130731', '130700', '3', '涿鹿', '涿鹿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130732', '130700', '3', '赤城', '赤城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130733', '130700', '3', '崇礼', '崇礼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130800', '130000', '2', '承德', '承德市', 'chengde', '0');
INSERT INTO `logistics_pca` VALUES ('130802', '130800', '3', '双桥', '双桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130803', '130800', '3', '双滦', '双滦区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130804', '130800', '3', '鹰手营子矿区', '鹰手营子矿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130821', '130800', '3', '承德', '承德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130822', '130800', '3', '兴隆', '兴隆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130823', '130800', '3', '平泉', '平泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130824', '130800', '3', '滦平', '滦平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130825', '130800', '3', '隆化', '隆化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130826', '130800', '3', '丰宁', '丰宁满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130827', '130800', '3', '宽城', '宽城满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130828', '130800', '3', '围场', '围场满族蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130900', '130000', '2', '沧州', '沧州市', 'cangzhou', '0');
INSERT INTO `logistics_pca` VALUES ('130902', '130900', '3', '新华', '新华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130903', '130900', '3', '运河', '运河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('130921', '130900', '3', '沧县', '沧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130922', '130900', '3', '青县', '青县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130923', '130900', '3', '东光', '东光县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130924', '130900', '3', '海兴', '海兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130925', '130900', '3', '盐山', '盐山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130926', '130900', '3', '肃宁', '肃宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130927', '130900', '3', '南皮', '南皮县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130928', '130900', '3', '吴桥', '吴桥县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130929', '130900', '3', '献县', '献县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130930', '130900', '3', '孟村', '孟村回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('130981', '130900', '3', '泊头', '泊头市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130982', '130900', '3', '任丘', '任丘市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130983', '130900', '3', '黄骅', '黄骅市', '', '0');
INSERT INTO `logistics_pca` VALUES ('130984', '130900', '3', '河间', '河间市', '', '0');
INSERT INTO `logistics_pca` VALUES ('131000', '130000', '2', '廊坊', '廊坊市', 'langfang', '1');
INSERT INTO `logistics_pca` VALUES ('131002', '131000', '3', '安次', '安次区', '', '0');
INSERT INTO `logistics_pca` VALUES ('131003', '131000', '3', '广阳', '广阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('131022', '131000', '3', '固安', '固安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131023', '131000', '3', '永清', '永清县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131024', '131000', '3', '香河', '香河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131025', '131000', '3', '大城', '大城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131026', '131000', '3', '文安', '文安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131028', '131000', '3', '大厂', '大厂回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131081', '131000', '3', '霸州', '霸州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('131082', '131000', '3', '三河', '三河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('131100', '130000', '2', '衡水', '衡水市', 'hengshui', '0');
INSERT INTO `logistics_pca` VALUES ('131102', '131100', '3', '桃城', '桃城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('131121', '131100', '3', '枣强', '枣强县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131122', '131100', '3', '武邑', '武邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131123', '131100', '3', '武强', '武强县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131124', '131100', '3', '饶阳', '饶阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131125', '131100', '3', '安平', '安平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131126', '131100', '3', '故城', '故城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131127', '131100', '3', '景县', '景县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131128', '131100', '3', '阜城', '阜城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('131181', '131100', '3', '冀州', '冀州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('131182', '131100', '3', '深州', '深州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140000', '0', '1', '山西', '山西省', '', '0');
INSERT INTO `logistics_pca` VALUES ('140100', '140000', '2', '太原', '太原市', 'taiyuan', '1');
INSERT INTO `logistics_pca` VALUES ('140105', '140100', '3', '小店', '小店区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140106', '140100', '3', '迎泽', '迎泽区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140107', '140100', '3', '杏花岭', '杏花岭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140108', '140100', '3', '尖草坪', '尖草坪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140109', '140100', '3', '万柏林', '万柏林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140110', '140100', '3', '晋源', '晋源区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140121', '140100', '3', '清徐', '清徐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140122', '140100', '3', '阳曲', '阳曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140123', '140100', '3', '娄烦', '娄烦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140181', '140100', '3', '古交', '古交市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140200', '140000', '2', '大同', '大同市', 'datong', '0');
INSERT INTO `logistics_pca` VALUES ('140202', '140200', '3', '城区', '城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140203', '140200', '3', '矿区', '矿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140211', '140200', '3', '南郊', '南郊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140212', '140200', '3', '新荣', '新荣区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140221', '140200', '3', '阳高', '阳高县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140222', '140200', '3', '天镇', '天镇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140223', '140200', '3', '广灵', '广灵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140224', '140200', '3', '灵丘', '灵丘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140225', '140200', '3', '浑源', '浑源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140226', '140200', '3', '左云', '左云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140227', '140200', '3', '大同', '大同县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140300', '140000', '2', '阳泉', '阳泉市', 'yangquan', '0');
INSERT INTO `logistics_pca` VALUES ('140302', '140300', '3', '城区', '城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140303', '140300', '3', '矿区', '矿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140311', '140300', '3', '郊区', '郊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140321', '140300', '3', '平定', '平定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140322', '140300', '3', '盂县', '盂县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140400', '140000', '2', '长治', '长治市', 'changzhi', '0');
INSERT INTO `logistics_pca` VALUES ('140402', '140400', '3', '城区', '城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140411', '140400', '3', '郊区', '郊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140421', '140400', '3', '长治', '长治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140423', '140400', '3', '襄垣', '襄垣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140424', '140400', '3', '屯留', '屯留县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140425', '140400', '3', '平顺', '平顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140426', '140400', '3', '黎城', '黎城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140427', '140400', '3', '壶关', '壶关县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140428', '140400', '3', '长子', '长子县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140429', '140400', '3', '武乡', '武乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140430', '140400', '3', '沁县', '沁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140431', '140400', '3', '沁源', '沁源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140481', '140400', '3', '潞城', '潞城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140500', '140000', '2', '晋城', '晋城市', 'jincheng', '0');
INSERT INTO `logistics_pca` VALUES ('140502', '140500', '3', '城区', '城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140521', '140500', '3', '沁水', '沁水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140522', '140500', '3', '阳城', '阳城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140524', '140500', '3', '陵川', '陵川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140525', '140500', '3', '泽州', '泽州县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140581', '140500', '3', '高平', '高平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140600', '140000', '2', '朔州', '朔州市', 'shuozhou', '0');
INSERT INTO `logistics_pca` VALUES ('140602', '140600', '3', '朔城', '朔城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140603', '140600', '3', '平鲁', '平鲁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140621', '140600', '3', '山阴', '山阴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140622', '140600', '3', '应县', '应县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140623', '140600', '3', '右玉', '右玉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140624', '140600', '3', '怀仁', '怀仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140700', '140000', '2', '晋中', '晋中市', 'jinzhong', '0');
INSERT INTO `logistics_pca` VALUES ('140702', '140700', '3', '榆次', '榆次区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140721', '140700', '3', '榆社', '榆社县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140722', '140700', '3', '左权', '左权县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140723', '140700', '3', '和顺', '和顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140724', '140700', '3', '昔阳', '昔阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140725', '140700', '3', '寿阳', '寿阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140726', '140700', '3', '太谷', '太谷县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140727', '140700', '3', '祁县', '祁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140728', '140700', '3', '平遥', '平遥县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140729', '140700', '3', '灵石', '灵石县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140781', '140700', '3', '介休', '介休市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140800', '140000', '2', '运城', '运城市', 'yuncheng', '0');
INSERT INTO `logistics_pca` VALUES ('140802', '140800', '3', '盐湖', '盐湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140821', '140800', '3', '临猗', '临猗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140822', '140800', '3', '万荣', '万荣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140823', '140800', '3', '闻喜', '闻喜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140824', '140800', '3', '稷山', '稷山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140825', '140800', '3', '新绛', '新绛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140826', '140800', '3', '绛县', '绛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140827', '140800', '3', '垣曲', '垣曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140828', '140800', '3', '夏县', '夏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140829', '140800', '3', '平陆', '平陆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140830', '140800', '3', '芮城', '芮城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140881', '140800', '3', '永济', '永济市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140882', '140800', '3', '河津', '河津市', '', '0');
INSERT INTO `logistics_pca` VALUES ('140900', '140000', '2', '忻州', '忻州市', 'xinzhou', '0');
INSERT INTO `logistics_pca` VALUES ('140902', '140900', '3', '忻府', '忻府区', '', '0');
INSERT INTO `logistics_pca` VALUES ('140921', '140900', '3', '定襄', '定襄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140922', '140900', '3', '五台', '五台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140923', '140900', '3', '代县', '代县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140924', '140900', '3', '繁峙', '繁峙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140925', '140900', '3', '宁武', '宁武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140926', '140900', '3', '静乐', '静乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140927', '140900', '3', '神池', '神池县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140928', '140900', '3', '五寨', '五寨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140929', '140900', '3', '岢岚', '岢岚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140930', '140900', '3', '河曲', '河曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140931', '140900', '3', '保德', '保德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140932', '140900', '3', '偏关', '偏关县', '', '0');
INSERT INTO `logistics_pca` VALUES ('140981', '140900', '3', '原平', '原平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('141000', '140000', '2', '临汾', '临汾市', 'linfen', '0');
INSERT INTO `logistics_pca` VALUES ('141002', '141000', '3', '尧都', '尧都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('141021', '141000', '3', '曲沃', '曲沃县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141022', '141000', '3', '翼城', '翼城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141023', '141000', '3', '襄汾', '襄汾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141024', '141000', '3', '洪洞', '洪洞县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141025', '141000', '3', '古县', '古县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141026', '141000', '3', '安泽', '安泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141027', '141000', '3', '浮山', '浮山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141028', '141000', '3', '吉县', '吉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141029', '141000', '3', '乡宁', '乡宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141030', '141000', '3', '大宁', '大宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141031', '141000', '3', '隰县', '隰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141032', '141000', '3', '永和', '永和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141033', '141000', '3', '蒲县', '蒲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141034', '141000', '3', '汾西', '汾西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141081', '141000', '3', '侯马', '侯马市', '', '0');
INSERT INTO `logistics_pca` VALUES ('141082', '141000', '3', '霍州', '霍州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('141100', '140000', '2', '吕梁', '吕梁市', 'lvliang', '0');
INSERT INTO `logistics_pca` VALUES ('141102', '141100', '3', '离石', '离石区', '', '0');
INSERT INTO `logistics_pca` VALUES ('141121', '141100', '3', '文水', '文水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141122', '141100', '3', '交城', '交城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141123', '141100', '3', '兴县', '兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141124', '141100', '3', '临县', '临县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141125', '141100', '3', '柳林', '柳林县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141126', '141100', '3', '石楼', '石楼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141127', '141100', '3', '岚县', '岚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141128', '141100', '3', '方山', '方山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141129', '141100', '3', '中阳', '中阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141130', '141100', '3', '交口', '交口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('141181', '141100', '3', '孝义', '孝义市', '', '0');
INSERT INTO `logistics_pca` VALUES ('141182', '141100', '3', '汾阳', '汾阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150000', '0', '1', '内蒙古', '内蒙古自治区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150100', '150000', '2', '呼和浩特', '呼和浩特市', 'huhehaote', '0');
INSERT INTO `logistics_pca` VALUES ('150102', '150100', '3', '新城', '新城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150103', '150100', '3', '回民', '回民区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150104', '150100', '3', '玉泉', '玉泉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150105', '150100', '3', '赛罕', '赛罕区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150121', '150100', '3', '土默特左旗', '土默特左旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150122', '150100', '3', '托克托', '托克托县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150123', '150100', '3', '和林格尔', '和林格尔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150124', '150100', '3', '清水河', '清水河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150125', '150100', '3', '武川', '武川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150200', '150000', '2', '包头', '包头市', 'baotou', '0');
INSERT INTO `logistics_pca` VALUES ('150202', '150200', '3', '东河', '东河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150203', '150200', '3', '昆都仑', '昆都仑区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150204', '150200', '3', '青山', '青山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150205', '150200', '3', '石拐', '石拐区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150206', '150200', '3', '白云鄂博矿区', '白云鄂博矿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150207', '150200', '3', '九原', '九原区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150221', '150200', '3', '土默特右旗', '土默特右旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150222', '150200', '3', '固阳', '固阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150223', '150200', '3', '达茂旗', '达尔罕茂明安联合旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150300', '150000', '2', '乌海', '乌海市', 'wuhai', '0');
INSERT INTO `logistics_pca` VALUES ('150302', '150300', '3', '海勃湾', '海勃湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150303', '150300', '3', '海南', '海南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150304', '150300', '3', '乌达', '乌达区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150400', '150000', '2', '赤峰', '赤峰市', 'chifeng', '0');
INSERT INTO `logistics_pca` VALUES ('150402', '150400', '3', '红山', '红山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150403', '150400', '3', '元宝山', '元宝山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150404', '150400', '3', '松山', '松山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150421', '150400', '3', '阿鲁科尔沁旗', '阿鲁科尔沁旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150422', '150400', '3', '巴林左旗', '巴林左旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150423', '150400', '3', '巴林右旗', '巴林右旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150424', '150400', '3', '林西', '林西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150425', '150400', '3', '克什克腾旗', '克什克腾旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150426', '150400', '3', '翁牛特旗', '翁牛特旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150428', '150400', '3', '喀喇沁旗', '喀喇沁旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150429', '150400', '3', '宁城', '宁城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150430', '150400', '3', '敖汉旗', '敖汉旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150500', '150000', '2', '通辽', '通辽市', 'tongliao', '0');
INSERT INTO `logistics_pca` VALUES ('150502', '150500', '3', '科尔沁', '科尔沁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150521', '150500', '3', '科尔沁左翼中旗', '科尔沁左翼中旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150522', '150500', '3', '科尔沁左翼后旗', '科尔沁左翼后旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150523', '150500', '3', '开鲁', '开鲁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150524', '150500', '3', '库伦旗', '库伦旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150525', '150500', '3', '奈曼旗', '奈曼旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150526', '150500', '3', '扎鲁特旗', '扎鲁特旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150581', '150500', '3', '霍林郭勒', '霍林郭勒市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150600', '150000', '2', '鄂尔多斯', '鄂尔多斯市', 'eerduosi', '0');
INSERT INTO `logistics_pca` VALUES ('150602', '150600', '3', '东胜', '东胜区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150621', '150600', '3', '达拉特旗', '达拉特旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150622', '150600', '3', '准格尔旗', '准格尔旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150623', '150600', '3', '鄂托克前旗', '鄂托克前旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150624', '150600', '3', '鄂托克旗', '鄂托克旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150625', '150600', '3', '杭锦旗', '杭锦旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150626', '150600', '3', '乌审旗', '乌审旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150627', '150600', '3', '伊金霍洛旗', '伊金霍洛旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150700', '150000', '2', '呼伦贝尔', '呼伦贝尔市', 'hulunbeier', '0');
INSERT INTO `logistics_pca` VALUES ('150702', '150700', '3', '海拉尔', '海拉尔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150703', '150700', '3', '扎赉诺尔', '扎赉诺尔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150721', '150700', '3', '阿荣旗', '阿荣旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150722', '150700', '3', '莫旗', '莫力达瓦达斡尔族自治旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150723', '150700', '3', '鄂伦春', '鄂伦春自治旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150724', '150700', '3', '鄂温', '鄂温克族自治旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150725', '150700', '3', '陈巴尔虎旗', '陈巴尔虎旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150726', '150700', '3', '新巴尔虎左旗', '新巴尔虎左旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150727', '150700', '3', '新巴尔虎右旗', '新巴尔虎右旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150781', '150700', '3', '满洲里', '满洲里市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150782', '150700', '3', '牙克石', '牙克石市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150783', '150700', '3', '扎兰屯', '扎兰屯市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150784', '150700', '3', '额尔古纳', '额尔古纳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150785', '150700', '3', '根河', '根河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('150800', '150000', '2', '巴彦淖尔', '巴彦淖尔市', 'bayannaoer', '0');
INSERT INTO `logistics_pca` VALUES ('150802', '150800', '3', '临河', '临河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150821', '150800', '3', '五原', '五原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150822', '150800', '3', '磴口', '磴口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150823', '150800', '3', '乌拉特前旗', '乌拉特前旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150824', '150800', '3', '乌拉特中旗', '乌拉特中旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150825', '150800', '3', '乌拉特后旗', '乌拉特后旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150826', '150800', '3', '杭锦后旗', '杭锦后旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150900', '150000', '2', '乌兰察布', '乌兰察布市', 'wulanchabu', '0');
INSERT INTO `logistics_pca` VALUES ('150902', '150900', '3', '集宁', '集宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('150921', '150900', '3', '卓资', '卓资县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150922', '150900', '3', '化德', '化德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150923', '150900', '3', '商都', '商都县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150924', '150900', '3', '兴和', '兴和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150925', '150900', '3', '凉城', '凉城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('150926', '150900', '3', '察右前旗', '察哈尔右翼前旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150927', '150900', '3', '察右中旗', '察哈尔右翼中旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150928', '150900', '3', '察右后旗', '察哈尔右翼后旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150929', '150900', '3', '四子王旗', '四子王旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('150981', '150900', '3', '丰镇', '丰镇市', '', '0');
INSERT INTO `logistics_pca` VALUES ('152200', '150000', '2', '兴安盟', '兴安盟', 'xinganmeng', '0');
INSERT INTO `logistics_pca` VALUES ('152201', '152200', '3', '乌兰浩特', '乌兰浩特市', '', '0');
INSERT INTO `logistics_pca` VALUES ('152202', '152200', '3', '阿尔山', '阿尔山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('152221', '152200', '3', '科右前旗', '科尔沁右翼前旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152222', '152200', '3', '科右中旗', '科尔沁右翼中旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152223', '152200', '3', '扎赉特旗', '扎赉特旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152224', '152200', '3', '突泉', '突泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('152500', '150000', '2', '锡林郭勒盟', '锡林郭勒盟', 'xilinguolemeng', '0');
INSERT INTO `logistics_pca` VALUES ('152501', '152500', '3', '二连浩特', '二连浩特市', '', '0');
INSERT INTO `logistics_pca` VALUES ('152502', '152500', '3', '锡林浩特', '锡林浩特市', '', '0');
INSERT INTO `logistics_pca` VALUES ('152522', '152500', '3', '阿巴嘎旗', '阿巴嘎旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152523', '152500', '3', '苏尼特左旗', '苏尼特左旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152524', '152500', '3', '苏尼特右旗', '苏尼特右旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152525', '152500', '3', '东乌旗', '东乌珠穆沁旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152526', '152500', '3', '西乌旗', '西乌珠穆沁旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152527', '152500', '3', '太仆寺旗', '太仆寺旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152528', '152500', '3', '镶黄旗', '镶黄旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152529', '152500', '3', '正镶白旗', '正镶白旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152530', '152500', '3', '正蓝旗', '正蓝旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152531', '152500', '3', '多伦', '多伦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('152900', '150000', '2', '阿拉善盟', '阿拉善盟', 'alashanmeng', '0');
INSERT INTO `logistics_pca` VALUES ('152921', '152900', '3', '阿拉善左旗', '阿拉善左旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152922', '152900', '3', '阿拉善右旗', '阿拉善右旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('152923', '152900', '3', '额济纳旗', '额济纳旗', '', '0');
INSERT INTO `logistics_pca` VALUES ('210000', '0', '1', '辽宁', '辽宁省', '', '0');
INSERT INTO `logistics_pca` VALUES ('210100', '210000', '2', '沈阳', '沈阳市', 'shenyang', '0');
INSERT INTO `logistics_pca` VALUES ('210102', '210100', '3', '和平', '和平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210103', '210100', '3', '沈河', '沈河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210104', '210100', '3', '大东', '大东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210105', '210100', '3', '皇姑', '皇姑区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210106', '210100', '3', '铁西', '铁西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210111', '210100', '3', '苏家屯', '苏家屯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210112', '210100', '3', '浑南', '浑南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210113', '210100', '3', '沈北新区', '沈北新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210114', '210100', '3', '于洪', '于洪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210122', '210100', '3', '辽中', '辽中县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210123', '210100', '3', '康平', '康平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210124', '210100', '3', '法库', '法库县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210181', '210100', '3', '新民', '新民市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210200', '210000', '2', '大连', '大连市', 'dalian', '0');
INSERT INTO `logistics_pca` VALUES ('210202', '210200', '3', '中山', '中山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210203', '210200', '3', '西岗', '西岗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210204', '210200', '3', '沙河口', '沙河口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210211', '210200', '3', '甘井子', '甘井子区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210212', '210200', '3', '旅顺口', '旅顺口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210213', '210200', '3', '金州', '金州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210224', '210200', '3', '长海', '长海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210281', '210200', '3', '瓦房店', '瓦房店市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210282', '210200', '3', '普兰店', '普兰店市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210283', '210200', '3', '庄河', '庄河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210300', '210000', '2', '鞍山', '鞍山市', 'anshan', '0');
INSERT INTO `logistics_pca` VALUES ('210302', '210300', '3', '铁东', '铁东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210303', '210300', '3', '铁西', '铁西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210304', '210300', '3', '立山', '立山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210311', '210300', '3', '千山', '千山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210321', '210300', '3', '台安', '台安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210323', '210300', '3', '岫岩', '岫岩满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210381', '210300', '3', '海城', '海城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210400', '210000', '2', '抚顺', '抚顺市', 'fushun', '0');
INSERT INTO `logistics_pca` VALUES ('210402', '210400', '3', '新抚', '新抚区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210403', '210400', '3', '东洲', '东洲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210404', '210400', '3', '望花', '望花区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210411', '210400', '3', '顺城', '顺城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210421', '210400', '3', '抚顺', '抚顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210422', '210400', '3', '新宾', '新宾满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210423', '210400', '3', '清原', '清原满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210500', '210000', '2', '本溪', '本溪市', 'benxi', '0');
INSERT INTO `logistics_pca` VALUES ('210502', '210500', '3', '平山', '平山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210503', '210500', '3', '溪湖', '溪湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210504', '210500', '3', '明山', '明山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210505', '210500', '3', '南芬', '南芬区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210521', '210500', '3', '本溪', '本溪满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210522', '210500', '3', '桓仁', '桓仁满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210600', '210000', '2', '丹东', '丹东市', 'dandong', '0');
INSERT INTO `logistics_pca` VALUES ('210602', '210600', '3', '元宝', '元宝区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210603', '210600', '3', '振兴', '振兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210604', '210600', '3', '振安', '振安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210624', '210600', '3', '宽甸', '宽甸满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210681', '210600', '3', '东港', '东港市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210682', '210600', '3', '凤城', '凤城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210700', '210000', '2', '锦州', '锦州市', 'jinzhou', '0');
INSERT INTO `logistics_pca` VALUES ('210702', '210700', '3', '古塔', '古塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210703', '210700', '3', '凌河', '凌河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210711', '210700', '3', '太和', '太和区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210726', '210700', '3', '黑山', '黑山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210727', '210700', '3', '义县', '义县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210781', '210700', '3', '凌海', '凌海市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210782', '210700', '3', '北镇', '北镇市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210800', '210000', '2', '营口', '营口市', 'yingkou', '0');
INSERT INTO `logistics_pca` VALUES ('210802', '210800', '3', '站前', '站前区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210803', '210800', '3', '西市', '西市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210804', '210800', '3', '鲅鱼圈', '鲅鱼圈区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210811', '210800', '3', '老边', '老边区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210881', '210800', '3', '盖州', '盖州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210882', '210800', '3', '大石桥', '大石桥市', '', '0');
INSERT INTO `logistics_pca` VALUES ('210900', '210000', '2', '阜新', '阜新市', 'fuxin', '0');
INSERT INTO `logistics_pca` VALUES ('210902', '210900', '3', '海州', '海州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210903', '210900', '3', '新邱', '新邱区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210904', '210900', '3', '太平', '太平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210905', '210900', '3', '清河门', '清河门区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210911', '210900', '3', '细河', '细河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('210921', '210900', '3', '阜新', '阜新蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('210922', '210900', '3', '彰武', '彰武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211000', '210000', '2', '辽阳', '辽阳市', 'liaoyang', '0');
INSERT INTO `logistics_pca` VALUES ('211002', '211000', '3', '白塔', '白塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211003', '211000', '3', '文圣', '文圣区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211004', '211000', '3', '宏伟', '宏伟区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211005', '211000', '3', '弓长岭', '弓长岭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211011', '211000', '3', '太子河', '太子河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211021', '211000', '3', '辽阳', '辽阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211081', '211000', '3', '灯塔', '灯塔市', '', '0');
INSERT INTO `logistics_pca` VALUES ('211100', '210000', '2', '盘锦', '盘锦市', 'panjin', '0');
INSERT INTO `logistics_pca` VALUES ('211102', '211100', '3', '双台子', '双台子区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211103', '211100', '3', '兴隆台', '兴隆台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211121', '211100', '3', '大洼', '大洼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211122', '211100', '3', '盘山', '盘山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211200', '210000', '2', '铁岭', '铁岭市', 'tieling', '0');
INSERT INTO `logistics_pca` VALUES ('211202', '211200', '3', '银州', '银州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211204', '211200', '3', '清河', '清河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211221', '211200', '3', '铁岭', '铁岭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211223', '211200', '3', '西丰', '西丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211224', '211200', '3', '昌图', '昌图县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211281', '211200', '3', '调兵山', '调兵山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('211282', '211200', '3', '开原', '开原市', '', '0');
INSERT INTO `logistics_pca` VALUES ('211300', '210000', '2', '朝阳', '朝阳市', 'chaoyang', '0');
INSERT INTO `logistics_pca` VALUES ('211302', '211300', '3', '双塔', '双塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211303', '211300', '3', '龙城', '龙城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211321', '211300', '3', '朝阳', '朝阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211322', '211300', '3', '建平', '建平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211324', '211300', '3', '喀喇沁左翼', '喀喇沁左翼蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211381', '211300', '3', '北票', '北票市', '', '0');
INSERT INTO `logistics_pca` VALUES ('211382', '211300', '3', '凌源', '凌源市', '', '0');
INSERT INTO `logistics_pca` VALUES ('211400', '210000', '2', '葫芦岛', '葫芦岛市', 'huludao', '1');
INSERT INTO `logistics_pca` VALUES ('211402', '211400', '3', '连山', '连山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211403', '211400', '3', '龙港', '龙港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211404', '211400', '3', '南票', '南票区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211421', '211400', '3', '绥中', '绥中县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211422', '211400', '3', '建昌', '建昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('211481', '211400', '3', '兴城', '兴城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('211500', '210000', '2', '金普新区', '金普新区', 'jinpuxinqu', '0');
INSERT INTO `logistics_pca` VALUES ('211501', '211500', '3', '金州新区', '金州新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211502', '211500', '3', '普湾新区', '普湾新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('211503', '211500', '3', '保税区', '保税区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220000', '0', '1', '吉林', '吉林省', '', '0');
INSERT INTO `logistics_pca` VALUES ('220100', '220000', '2', '长春', '长春市', 'changchun', '0');
INSERT INTO `logistics_pca` VALUES ('220102', '220100', '3', '南关', '南关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220103', '220100', '3', '宽城', '宽城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220104', '220100', '3', '朝阳', '朝阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220105', '220100', '3', '二道', '二道区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220106', '220100', '3', '绿园', '绿园区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220112', '220100', '3', '双阳', '双阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220113', '220100', '3', '九台', '九台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220122', '220100', '3', '农安', '农安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220182', '220100', '3', '榆树', '榆树市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220183', '220100', '3', '德惠', '德惠市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220200', '220000', '2', '吉林', '吉林市', 'jilin', '0');
INSERT INTO `logistics_pca` VALUES ('220202', '220200', '3', '昌邑', '昌邑区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220203', '220200', '3', '龙潭', '龙潭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220204', '220200', '3', '船营', '船营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220211', '220200', '3', '丰满', '丰满区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220221', '220200', '3', '永吉', '永吉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220281', '220200', '3', '蛟河', '蛟河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220282', '220200', '3', '桦甸', '桦甸市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220283', '220200', '3', '舒兰', '舒兰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220284', '220200', '3', '磐石', '磐石市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220300', '220000', '2', '四平', '四平市', 'siping', '0');
INSERT INTO `logistics_pca` VALUES ('220302', '220300', '3', '铁西', '铁西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220303', '220300', '3', '铁东', '铁东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220322', '220300', '3', '梨树', '梨树县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220323', '220300', '3', '伊通', '伊通满族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220381', '220300', '3', '公主岭', '公主岭市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220382', '220300', '3', '双辽', '双辽市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220400', '220000', '2', '辽源', '辽源市', 'liaoyuan', '0');
INSERT INTO `logistics_pca` VALUES ('220402', '220400', '3', '龙山', '龙山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220403', '220400', '3', '西安', '西安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220421', '220400', '3', '东丰', '东丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220422', '220400', '3', '东辽', '东辽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220500', '220000', '2', '通化', '通化市', 'tonghua', '0');
INSERT INTO `logistics_pca` VALUES ('220502', '220500', '3', '东昌', '东昌区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220503', '220500', '3', '二道江', '二道江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220521', '220500', '3', '通化', '通化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220523', '220500', '3', '辉南', '辉南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220524', '220500', '3', '柳河', '柳河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220581', '220500', '3', '梅河口', '梅河口市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220582', '220500', '3', '集安', '集安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220600', '220000', '2', '白山', '白山市', 'baishan', '0');
INSERT INTO `logistics_pca` VALUES ('220602', '220600', '3', '浑江', '浑江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220605', '220600', '3', '江源', '江源区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220621', '220600', '3', '抚松', '抚松县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220622', '220600', '3', '靖宇', '靖宇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220623', '220600', '3', '长白', '长白朝鲜族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220681', '220600', '3', '临江', '临江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220700', '220000', '2', '松原', '松原市', 'songyuan', '0');
INSERT INTO `logistics_pca` VALUES ('220702', '220700', '3', '宁江', '宁江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220721', '220700', '3', '前郭尔罗斯', '前郭尔罗斯蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220722', '220700', '3', '长岭', '长岭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220723', '220700', '3', '乾安', '乾安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220781', '220700', '3', '扶余', '扶余市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220800', '220000', '2', '白城', '白城市', 'baicheng', '0');
INSERT INTO `logistics_pca` VALUES ('220802', '220800', '3', '洮北', '洮北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('220821', '220800', '3', '镇赉', '镇赉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220822', '220800', '3', '通榆', '通榆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('220881', '220800', '3', '洮南', '洮南市', '', '0');
INSERT INTO `logistics_pca` VALUES ('220882', '220800', '3', '大安', '大安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222400', '220000', '2', '延边', '延边朝鲜族自治州', 'yanbian', '0');
INSERT INTO `logistics_pca` VALUES ('222401', '222400', '3', '延吉', '延吉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222402', '222400', '3', '图们', '图们市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222403', '222400', '3', '敦化', '敦化市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222404', '222400', '3', '珲春', '珲春市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222405', '222400', '3', '龙井', '龙井市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222406', '222400', '3', '和龙', '和龙市', '', '0');
INSERT INTO `logistics_pca` VALUES ('222424', '222400', '3', '汪清', '汪清县', '', '0');
INSERT INTO `logistics_pca` VALUES ('222426', '222400', '3', '安图', '安图县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230000', '0', '1', '黑龙江', '黑龙江省', '', '0');
INSERT INTO `logistics_pca` VALUES ('230100', '230000', '2', '哈尔滨', '哈尔滨市', 'haerbin', '0');
INSERT INTO `logistics_pca` VALUES ('230102', '230100', '3', '道里', '道里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230103', '230100', '3', '南岗', '南岗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230104', '230100', '3', '道外', '道外区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230108', '230100', '3', '平房', '平房区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230109', '230100', '3', '松北', '松北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230110', '230100', '3', '香坊', '香坊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230111', '230100', '3', '呼兰', '呼兰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230112', '230100', '3', '阿城', '阿城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230113', '230100', '3', '双城', '双城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230123', '230100', '3', '依兰', '依兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230124', '230100', '3', '方正', '方正县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230125', '230100', '3', '宾县', '宾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230126', '230100', '3', '巴彦', '巴彦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230127', '230100', '3', '木兰', '木兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230128', '230100', '3', '通河', '通河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230129', '230100', '3', '延寿', '延寿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230183', '230100', '3', '尚志', '尚志市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230184', '230100', '3', '五常', '五常市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230200', '230000', '2', '齐齐哈尔', '齐齐哈尔市', 'qiqihaer', '0');
INSERT INTO `logistics_pca` VALUES ('230202', '230200', '3', '龙沙', '龙沙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230203', '230200', '3', '建华', '建华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230204', '230200', '3', '铁锋', '铁锋区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230205', '230200', '3', '昂昂溪', '昂昂溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230206', '230200', '3', '富拉尔基', '富拉尔基区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230207', '230200', '3', '碾子山', '碾子山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230208', '230200', '3', '梅里斯', '梅里斯达斡尔族区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230221', '230200', '3', '龙江', '龙江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230223', '230200', '3', '依安', '依安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230224', '230200', '3', '泰来', '泰来县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230225', '230200', '3', '甘南', '甘南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230227', '230200', '3', '富裕', '富裕县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230229', '230200', '3', '克山', '克山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230230', '230200', '3', '克东', '克东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230231', '230200', '3', '拜泉', '拜泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230281', '230200', '3', '讷河', '讷河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230300', '230000', '2', '鸡西', '鸡西市', 'jixi', '0');
INSERT INTO `logistics_pca` VALUES ('230302', '230300', '3', '鸡冠', '鸡冠区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230303', '230300', '3', '恒山', '恒山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230304', '230300', '3', '滴道', '滴道区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230305', '230300', '3', '梨树', '梨树区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230306', '230300', '3', '城子河', '城子河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230307', '230300', '3', '麻山', '麻山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230321', '230300', '3', '鸡东', '鸡东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230381', '230300', '3', '虎林', '虎林市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230382', '230300', '3', '密山', '密山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230400', '230000', '2', '鹤岗', '鹤岗市', 'hegang', '0');
INSERT INTO `logistics_pca` VALUES ('230402', '230400', '3', '向阳', '向阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230403', '230400', '3', '工农', '工农区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230404', '230400', '3', '南山', '南山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230405', '230400', '3', '兴安', '兴安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230406', '230400', '3', '东山', '东山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230407', '230400', '3', '兴山', '兴山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230421', '230400', '3', '萝北', '萝北县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230422', '230400', '3', '绥滨', '绥滨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230500', '230000', '2', '双鸭山', '双鸭山市', 'shuangyashan', '0');
INSERT INTO `logistics_pca` VALUES ('230502', '230500', '3', '尖山', '尖山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230503', '230500', '3', '岭东', '岭东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230505', '230500', '3', '四方台', '四方台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230506', '230500', '3', '宝山', '宝山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230521', '230500', '3', '集贤', '集贤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230522', '230500', '3', '友谊', '友谊县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230523', '230500', '3', '宝清', '宝清县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230524', '230500', '3', '饶河', '饶河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230600', '230000', '2', '大庆', '大庆市', 'daqing', '0');
INSERT INTO `logistics_pca` VALUES ('230602', '230600', '3', '萨尔图', '萨尔图区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230603', '230600', '3', '龙凤', '龙凤区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230604', '230600', '3', '让胡路', '让胡路区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230605', '230600', '3', '红岗', '红岗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230606', '230600', '3', '大同', '大同区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230621', '230600', '3', '肇州', '肇州县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230622', '230600', '3', '肇源', '肇源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230623', '230600', '3', '林甸', '林甸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230624', '230600', '3', '杜尔伯特', '杜尔伯特蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230700', '230000', '2', '伊春', '伊春市', 'yichun', '0');
INSERT INTO `logistics_pca` VALUES ('230702', '230700', '3', '伊春', '伊春区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230703', '230700', '3', '南岔', '南岔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230704', '230700', '3', '友好', '友好区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230705', '230700', '3', '西林', '西林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230706', '230700', '3', '翠峦', '翠峦区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230707', '230700', '3', '新青', '新青区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230708', '230700', '3', '美溪', '美溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230709', '230700', '3', '金山屯', '金山屯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230710', '230700', '3', '五营', '五营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230711', '230700', '3', '乌马河', '乌马河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230712', '230700', '3', '汤旺河', '汤旺河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230713', '230700', '3', '带岭', '带岭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230714', '230700', '3', '乌伊岭', '乌伊岭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230715', '230700', '3', '红星', '红星区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230716', '230700', '3', '上甘岭', '上甘岭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230722', '230700', '3', '嘉荫', '嘉荫县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230781', '230700', '3', '铁力', '铁力市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230800', '230000', '2', '佳木斯', '佳木斯市', 'jiamusi', '0');
INSERT INTO `logistics_pca` VALUES ('230803', '230800', '3', '向阳', '向阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230804', '230800', '3', '前进', '前进区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230805', '230800', '3', '东风', '东风区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230811', '230800', '3', '郊区', '郊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230822', '230800', '3', '桦南', '桦南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230826', '230800', '3', '桦川', '桦川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230828', '230800', '3', '汤原', '汤原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230833', '230800', '3', '抚远', '抚远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('230881', '230800', '3', '同江', '同江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230882', '230800', '3', '富锦', '富锦市', '', '0');
INSERT INTO `logistics_pca` VALUES ('230900', '230000', '2', '七台河', '七台河市', 'qitaihe', '0');
INSERT INTO `logistics_pca` VALUES ('230902', '230900', '3', '新兴', '新兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230903', '230900', '3', '桃山', '桃山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230904', '230900', '3', '茄子河', '茄子河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('230921', '230900', '3', '勃利', '勃利县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231000', '230000', '2', '牡丹江', '牡丹江市', 'mudanjiang', '0');
INSERT INTO `logistics_pca` VALUES ('231002', '231000', '3', '东安', '东安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('231003', '231000', '3', '阳明', '阳明区', '', '0');
INSERT INTO `logistics_pca` VALUES ('231004', '231000', '3', '爱民', '爱民区', '', '0');
INSERT INTO `logistics_pca` VALUES ('231005', '231000', '3', '西安', '西安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('231024', '231000', '3', '东宁', '东宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231025', '231000', '3', '林口', '林口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231081', '231000', '3', '绥芬河', '绥芬河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231083', '231000', '3', '海林', '海林市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231084', '231000', '3', '宁安', '宁安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231085', '231000', '3', '穆棱', '穆棱市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231100', '230000', '2', '黑河', '黑河市', 'heihe', '0');
INSERT INTO `logistics_pca` VALUES ('231102', '231100', '3', '爱辉', '爱辉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('231121', '231100', '3', '嫩江', '嫩江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231123', '231100', '3', '逊克', '逊克县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231124', '231100', '3', '孙吴', '孙吴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231181', '231100', '3', '北安', '北安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231182', '231100', '3', '五大连池', '五大连池市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231200', '230000', '2', '绥化', '绥化市', 'suihua', '0');
INSERT INTO `logistics_pca` VALUES ('231202', '231200', '3', '北林', '北林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('231221', '231200', '3', '望奎', '望奎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231222', '231200', '3', '兰西', '兰西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231223', '231200', '3', '青冈', '青冈县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231224', '231200', '3', '庆安', '庆安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231225', '231200', '3', '明水', '明水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231226', '231200', '3', '绥棱', '绥棱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('231281', '231200', '3', '安达', '安达市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231282', '231200', '3', '肇东', '肇东市', '', '0');
INSERT INTO `logistics_pca` VALUES ('231283', '231200', '3', '海伦', '海伦市', '', '0');
INSERT INTO `logistics_pca` VALUES ('232700', '230000', '2', '大兴安岭', '大兴安岭地区', 'daxinganling', '0');
INSERT INTO `logistics_pca` VALUES ('232701', '232700', '3', '加格达奇', '加格达奇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('232702', '232700', '3', '新林', '新林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('232703', '232700', '3', '松岭', '松岭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('232704', '232700', '3', '呼中', '呼中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('232721', '232700', '3', '呼玛', '呼玛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('232722', '232700', '3', '塔河', '塔河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('232723', '232700', '3', '漠河', '漠河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('310000', '0', '1', '上海', '上海', '', '0');
INSERT INTO `logistics_pca` VALUES ('310100', '310000', '2', '上海', '上海市', 'shanghai', '0');
INSERT INTO `logistics_pca` VALUES ('310101', '310100', '3', '黄浦', '黄浦区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310104', '310100', '3', '徐汇', '徐汇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310105', '310100', '3', '长宁', '长宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310106', '310100', '3', '静安', '静安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310107', '310100', '3', '普陀', '普陀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310108', '310100', '3', '闸北', '闸北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310109', '310100', '3', '虹口', '虹口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310110', '310100', '3', '杨浦', '杨浦区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310112', '310100', '3', '闵行', '闵行区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310113', '310100', '3', '宝山', '宝山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310114', '310100', '3', '嘉定', '嘉定区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310115', '310100', '3', '浦东', '浦东新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310116', '310100', '3', '金山', '金山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310117', '310100', '3', '松江', '松江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310118', '310100', '3', '青浦', '青浦区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310120', '310100', '3', '奉贤', '奉贤区', '', '0');
INSERT INTO `logistics_pca` VALUES ('310230', '310100', '3', '崇明', '崇明县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320000', '0', '1', '江苏', '江苏省', '', '0');
INSERT INTO `logistics_pca` VALUES ('320100', '320000', '2', '南京', '南京市', 'nanjing', '0');
INSERT INTO `logistics_pca` VALUES ('320102', '320100', '3', '玄武', '玄武区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320104', '320100', '3', '秦淮', '秦淮区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320105', '320100', '3', '建邺', '建邺区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320106', '320100', '3', '鼓楼', '鼓楼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320111', '320100', '3', '浦口', '浦口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320113', '320100', '3', '栖霞', '栖霞区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320114', '320100', '3', '雨花台', '雨花台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320115', '320100', '3', '江宁', '江宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320116', '320100', '3', '六合', '六合区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320117', '320100', '3', '溧水', '溧水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320118', '320100', '3', '高淳', '高淳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320200', '320000', '2', '无锡', '无锡市', 'wuxi', '0');
INSERT INTO `logistics_pca` VALUES ('320202', '320200', '3', '崇安', '崇安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320203', '320200', '3', '南长', '南长区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320204', '320200', '3', '北塘', '北塘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320205', '320200', '3', '锡山', '锡山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320206', '320200', '3', '惠山', '惠山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320211', '320200', '3', '滨湖', '滨湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320281', '320200', '3', '江阴', '江阴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320282', '320200', '3', '宜兴', '宜兴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320300', '320000', '2', '徐州', '徐州市', 'xuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('320302', '320300', '3', '鼓楼', '鼓楼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320303', '320300', '3', '云龙', '云龙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320305', '320300', '3', '贾汪', '贾汪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320311', '320300', '3', '泉山', '泉山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320312', '320300', '3', '铜山', '铜山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320321', '320300', '3', '丰县', '丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320322', '320300', '3', '沛县', '沛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320324', '320300', '3', '睢宁', '睢宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320381', '320300', '3', '新沂', '新沂市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320382', '320300', '3', '邳州', '邳州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320400', '320000', '2', '常州', '常州市', 'changzhou', '0');
INSERT INTO `logistics_pca` VALUES ('320402', '320400', '3', '天宁', '天宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320404', '320400', '3', '钟楼', '钟楼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320405', '320400', '3', '戚墅堰', '戚墅堰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320411', '320400', '3', '新北', '新北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320412', '320400', '3', '武进', '武进区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320481', '320400', '3', '溧阳', '溧阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320482', '320400', '3', '金坛', '金坛市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320500', '320000', '2', '苏州', '苏州市', 'suzhou', '0');
INSERT INTO `logistics_pca` VALUES ('320505', '320500', '3', '虎丘', '虎丘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320506', '320500', '3', '吴中', '吴中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320507', '320500', '3', '相城', '相城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320508', '320500', '3', '姑苏', '姑苏区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320509', '320500', '3', '吴江', '吴江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320581', '320500', '3', '常熟', '常熟市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320582', '320500', '3', '张家港', '张家港市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320583', '320500', '3', '昆山', '昆山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320585', '320500', '3', '太仓', '太仓市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320600', '320000', '2', '南通', '南通市', 'nantong', '0');
INSERT INTO `logistics_pca` VALUES ('320602', '320600', '3', '崇川', '崇川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320611', '320600', '3', '港闸', '港闸区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320612', '320600', '3', '通州', '通州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320621', '320600', '3', '海安', '海安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320623', '320600', '3', '如东', '如东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320681', '320600', '3', '启东', '启东市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320682', '320600', '3', '如皋', '如皋市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320684', '320600', '3', '海门', '海门市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320700', '320000', '2', '连云港', '连云港市', 'lianyungang', '0');
INSERT INTO `logistics_pca` VALUES ('320703', '320700', '3', '连云', '连云区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320706', '320700', '3', '海州', '海州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320707', '320700', '3', '赣榆', '赣榆区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320722', '320700', '3', '东海', '东海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320723', '320700', '3', '灌云', '灌云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320724', '320700', '3', '灌南', '灌南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320800', '320000', '2', '淮安', '淮安市', 'huaian', '0');
INSERT INTO `logistics_pca` VALUES ('320802', '320800', '3', '清河', '清河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320803', '320800', '3', '淮安', '淮安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320804', '320800', '3', '淮阴', '淮阴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320811', '320800', '3', '清浦', '清浦区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320826', '320800', '3', '涟水', '涟水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320829', '320800', '3', '洪泽', '洪泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320830', '320800', '3', '盱眙', '盱眙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320831', '320800', '3', '金湖', '金湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320900', '320000', '2', '盐城', '盐城市', 'yancheng', '0');
INSERT INTO `logistics_pca` VALUES ('320902', '320900', '3', '亭湖', '亭湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320903', '320900', '3', '盐都', '盐都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('320921', '320900', '3', '响水', '响水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320922', '320900', '3', '滨海', '滨海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320923', '320900', '3', '阜宁', '阜宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320924', '320900', '3', '射阳', '射阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320925', '320900', '3', '建湖', '建湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('320981', '320900', '3', '东台', '东台市', '', '0');
INSERT INTO `logistics_pca` VALUES ('320982', '320900', '3', '大丰', '大丰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321000', '320000', '2', '扬州', '扬州市', 'yangzhou', '0');
INSERT INTO `logistics_pca` VALUES ('321002', '321000', '3', '广陵', '广陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321003', '321000', '3', '邗江', '邗江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321012', '321000', '3', '江都', '江都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321023', '321000', '3', '宝应', '宝应县', '', '0');
INSERT INTO `logistics_pca` VALUES ('321081', '321000', '3', '仪征', '仪征市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321084', '321000', '3', '高邮', '高邮市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321100', '320000', '2', '镇江', '镇江市', 'zhenjiang', '0');
INSERT INTO `logistics_pca` VALUES ('321102', '321100', '3', '京口', '京口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321111', '321100', '3', '润州', '润州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321112', '321100', '3', '丹徒', '丹徒区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321181', '321100', '3', '丹阳', '丹阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321182', '321100', '3', '扬中', '扬中市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321183', '321100', '3', '句容', '句容市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321200', '320000', '2', '泰州', '泰州市', 'taizhou', '0');
INSERT INTO `logistics_pca` VALUES ('321202', '321200', '3', '海陵', '海陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321203', '321200', '3', '高港', '高港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321204', '321200', '3', '姜堰', '姜堰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321281', '321200', '3', '兴化', '兴化市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321282', '321200', '3', '靖江', '靖江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321283', '321200', '3', '泰兴', '泰兴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('321300', '320000', '2', '宿迁', '宿迁市', 'xiuqian', '0');
INSERT INTO `logistics_pca` VALUES ('321302', '321300', '3', '宿城', '宿城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321311', '321300', '3', '宿豫', '宿豫区', '', '0');
INSERT INTO `logistics_pca` VALUES ('321322', '321300', '3', '沭阳', '沭阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('321323', '321300', '3', '泗阳', '泗阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('321324', '321300', '3', '泗洪', '泗洪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330000', '0', '1', '浙江', '浙江省', '', '0');
INSERT INTO `logistics_pca` VALUES ('330100', '330000', '2', '杭州', '杭州市', 'hangzhou', '0');
INSERT INTO `logistics_pca` VALUES ('330102', '330100', '3', '上城', '上城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330103', '330100', '3', '下城', '下城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330104', '330100', '3', '江干', '江干区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330105', '330100', '3', '拱墅', '拱墅区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330106', '330100', '3', '西湖', '西湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330108', '330100', '3', '滨江', '滨江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330109', '330100', '3', '萧山', '萧山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330110', '330100', '3', '余杭', '余杭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330122', '330100', '3', '桐庐', '桐庐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330127', '330100', '3', '淳安', '淳安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330182', '330100', '3', '建德', '建德市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330183', '330100', '3', '富阳', '富阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330185', '330100', '3', '临安', '临安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330200', '330000', '2', '宁波', '宁波市', 'ningbo', '0');
INSERT INTO `logistics_pca` VALUES ('330203', '330200', '3', '海曙', '海曙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330204', '330200', '3', '江东', '江东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330205', '330200', '3', '江北', '江北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330206', '330200', '3', '北仑', '北仑区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330211', '330200', '3', '镇海', '镇海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330212', '330200', '3', '鄞州', '鄞州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330225', '330200', '3', '象山', '象山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330226', '330200', '3', '宁海', '宁海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330281', '330200', '3', '余姚', '余姚市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330282', '330200', '3', '慈溪', '慈溪市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330283', '330200', '3', '奉化', '奉化市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330300', '330000', '2', '温州', '温州市', 'wenzhou', '0');
INSERT INTO `logistics_pca` VALUES ('330302', '330300', '3', '鹿城', '鹿城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330303', '330300', '3', '龙湾', '龙湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330304', '330300', '3', '瓯海', '瓯海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330322', '330300', '3', '洞头', '洞头县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330324', '330300', '3', '永嘉', '永嘉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330326', '330300', '3', '平阳', '平阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330327', '330300', '3', '苍南', '苍南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330328', '330300', '3', '文成', '文成县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330329', '330300', '3', '泰顺', '泰顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330381', '330300', '3', '瑞安', '瑞安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330382', '330300', '3', '乐清', '乐清市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330400', '330000', '2', '嘉兴', '嘉兴市', 'jiaxing', '0');
INSERT INTO `logistics_pca` VALUES ('330402', '330400', '3', '南湖', '南湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330411', '330400', '3', '秀洲', '秀洲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330421', '330400', '3', '嘉善', '嘉善县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330424', '330400', '3', '海盐', '海盐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330481', '330400', '3', '海宁', '海宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330482', '330400', '3', '平湖', '平湖市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330483', '330400', '3', '桐乡', '桐乡市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330500', '330000', '2', '湖州', '湖州市', 'huzhou', '0');
INSERT INTO `logistics_pca` VALUES ('330502', '330500', '3', '吴兴', '吴兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330503', '330500', '3', '南浔', '南浔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330521', '330500', '3', '德清', '德清县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330522', '330500', '3', '长兴', '长兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330523', '330500', '3', '安吉', '安吉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330600', '330000', '2', '绍兴', '绍兴市', 'shaoxing', '0');
INSERT INTO `logistics_pca` VALUES ('330602', '330600', '3', '越城', '越城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330603', '330600', '3', '柯桥', '柯桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330604', '330600', '3', '上虞', '上虞区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330624', '330600', '3', '新昌', '新昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330681', '330600', '3', '诸暨', '诸暨市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330683', '330600', '3', '嵊州', '嵊州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330700', '330000', '2', '金华', '金华市', 'jinhua', '0');
INSERT INTO `logistics_pca` VALUES ('330702', '330700', '3', '婺城', '婺城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330703', '330700', '3', '金东', '金东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330723', '330700', '3', '武义', '武义县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330726', '330700', '3', '浦江', '浦江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330727', '330700', '3', '磐安', '磐安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330781', '330700', '3', '兰溪', '兰溪市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330782', '330700', '3', '义乌', '义乌市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330783', '330700', '3', '东阳', '东阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330784', '330700', '3', '永康', '永康市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330800', '330000', '2', '衢州', '衢州市', 'quzhou', '0');
INSERT INTO `logistics_pca` VALUES ('330802', '330800', '3', '柯城', '柯城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330803', '330800', '3', '衢江', '衢江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330822', '330800', '3', '常山', '常山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330824', '330800', '3', '开化', '开化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330825', '330800', '3', '龙游', '龙游县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330881', '330800', '3', '江山', '江山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('330900', '330000', '2', '舟山', '舟山市', 'zhoushan', '0');
INSERT INTO `logistics_pca` VALUES ('330902', '330900', '3', '定海', '定海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330903', '330900', '3', '普陀', '普陀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('330921', '330900', '3', '岱山', '岱山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('330922', '330900', '3', '嵊泗', '嵊泗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331000', '330000', '2', '台州', '台州市', 'taizhou', '0');
INSERT INTO `logistics_pca` VALUES ('331002', '331000', '3', '椒江', '椒江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('331003', '331000', '3', '黄岩', '黄岩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('331004', '331000', '3', '路桥', '路桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('331021', '331000', '3', '玉环', '玉环县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331022', '331000', '3', '三门', '三门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331023', '331000', '3', '天台', '天台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331024', '331000', '3', '仙居', '仙居县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331081', '331000', '3', '温岭', '温岭市', '', '0');
INSERT INTO `logistics_pca` VALUES ('331082', '331000', '3', '临海', '临海市', '', '0');
INSERT INTO `logistics_pca` VALUES ('331100', '330000', '2', '丽水', '丽水市', 'lishui', '0');
INSERT INTO `logistics_pca` VALUES ('331102', '331100', '3', '莲都', '莲都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('331121', '331100', '3', '青田', '青田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331122', '331100', '3', '缙云', '缙云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331123', '331100', '3', '遂昌', '遂昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331124', '331100', '3', '松阳', '松阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331125', '331100', '3', '云和', '云和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331126', '331100', '3', '庆元', '庆元县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331127', '331100', '3', '景宁', '景宁畲族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('331181', '331100', '3', '龙泉', '龙泉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('331200', '330000', '2', '舟山新区', '舟山群岛新区', 'zhoushanxinqu', '0');
INSERT INTO `logistics_pca` VALUES ('331201', '331200', '3', '金塘', '金塘岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331202', '331200', '3', '六横', '六横岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331203', '331200', '3', '衢山', '衢山岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331204', '331200', '3', '舟山', '舟山本岛西北部', '', '0');
INSERT INTO `logistics_pca` VALUES ('331205', '331200', '3', '岱山', '岱山岛西南部', '', '0');
INSERT INTO `logistics_pca` VALUES ('331206', '331200', '3', '泗礁', '泗礁岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331207', '331200', '3', '朱家尖', '朱家尖岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331208', '331200', '3', '洋山', '洋山岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331209', '331200', '3', '长涂', '长涂岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('331210', '331200', '3', '虾峙', '虾峙岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('340000', '0', '1', '安徽', '安徽省', '', '0');
INSERT INTO `logistics_pca` VALUES ('340100', '340000', '2', '合肥', '合肥市', 'hefei', '0');
INSERT INTO `logistics_pca` VALUES ('340102', '340100', '3', '瑶海', '瑶海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340103', '340100', '3', '庐阳', '庐阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340104', '340100', '3', '蜀山', '蜀山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340111', '340100', '3', '包河', '包河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340121', '340100', '3', '长丰', '长丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340122', '340100', '3', '肥东', '肥东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340123', '340100', '3', '肥西', '肥西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340124', '340100', '3', '庐江', '庐江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340181', '340100', '3', '巢湖', '巢湖市', '', '0');
INSERT INTO `logistics_pca` VALUES ('340200', '340000', '2', '芜湖', '芜湖市', 'wuhu', '0');
INSERT INTO `logistics_pca` VALUES ('340202', '340200', '3', '镜湖', '镜湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340203', '340200', '3', '弋江', '弋江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340207', '340200', '3', '鸠江', '鸠江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340208', '340200', '3', '三山', '三山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340221', '340200', '3', '芜湖', '芜湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340222', '340200', '3', '繁昌', '繁昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340223', '340200', '3', '南陵', '南陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340225', '340200', '3', '无为', '无为县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340300', '340000', '2', '蚌埠', '蚌埠市', 'bangbu', '0');
INSERT INTO `logistics_pca` VALUES ('340302', '340300', '3', '龙子湖', '龙子湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340303', '340300', '3', '蚌山', '蚌山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340304', '340300', '3', '禹会', '禹会区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340311', '340300', '3', '淮上', '淮上区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340321', '340300', '3', '怀远', '怀远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340322', '340300', '3', '五河', '五河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340323', '340300', '3', '固镇', '固镇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340400', '340000', '2', '淮南', '淮南市', 'huainan', '0');
INSERT INTO `logistics_pca` VALUES ('340402', '340400', '3', '大通', '大通区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340403', '340400', '3', '田家庵', '田家庵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340404', '340400', '3', '谢家集', '谢家集区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340405', '340400', '3', '八公山', '八公山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340406', '340400', '3', '潘集', '潘集区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340421', '340400', '3', '凤台', '凤台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340500', '340000', '2', '马鞍山', '马鞍山市', 'maanshan', '0');
INSERT INTO `logistics_pca` VALUES ('340503', '340500', '3', '花山', '花山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340504', '340500', '3', '雨山', '雨山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340506', '340500', '3', '博望', '博望区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340521', '340500', '3', '当涂', '当涂县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340522', '340500', '3', '含山', '含山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340523', '340500', '3', '和县', '和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340600', '340000', '2', '淮北', '淮北市', 'huaibei', '0');
INSERT INTO `logistics_pca` VALUES ('340602', '340600', '3', '杜集', '杜集区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340603', '340600', '3', '相山', '相山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340604', '340600', '3', '烈山', '烈山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340621', '340600', '3', '濉溪', '濉溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340700', '340000', '2', '铜陵', '铜陵市', 'tongling', '0');
INSERT INTO `logistics_pca` VALUES ('340702', '340700', '3', '铜官山', '铜官山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340703', '340700', '3', '狮子山', '狮子山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340711', '340700', '3', '郊区', '郊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340721', '340700', '3', '铜陵', '铜陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340800', '340000', '2', '安庆', '安庆市', 'anqing', '0');
INSERT INTO `logistics_pca` VALUES ('340802', '340800', '3', '迎江', '迎江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340803', '340800', '3', '大观', '大观区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340811', '340800', '3', '宜秀', '宜秀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('340822', '340800', '3', '怀宁', '怀宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340823', '340800', '3', '枞阳', '枞阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340824', '340800', '3', '潜山', '潜山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340825', '340800', '3', '太湖', '太湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340826', '340800', '3', '宿松', '宿松县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340827', '340800', '3', '望江', '望江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340828', '340800', '3', '岳西', '岳西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('340881', '340800', '3', '桐城', '桐城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('341000', '340000', '2', '黄山', '黄山市', 'huangshan', '0');
INSERT INTO `logistics_pca` VALUES ('341002', '341000', '3', '屯溪', '屯溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341003', '341000', '3', '黄山', '黄山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341004', '341000', '3', '徽州', '徽州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341021', '341000', '3', '歙县', '歙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341022', '341000', '3', '休宁', '休宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341023', '341000', '3', '黟县', '黟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341024', '341000', '3', '祁门', '祁门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341100', '340000', '2', '滁州', '滁州市', 'chuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('341102', '341100', '3', '琅琊', '琅琊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341103', '341100', '3', '南谯', '南谯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341122', '341100', '3', '来安', '来安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341124', '341100', '3', '全椒', '全椒县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341125', '341100', '3', '定远', '定远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341126', '341100', '3', '凤阳', '凤阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341181', '341100', '3', '天长', '天长市', '', '0');
INSERT INTO `logistics_pca` VALUES ('341182', '341100', '3', '明光', '明光市', '', '0');
INSERT INTO `logistics_pca` VALUES ('341200', '340000', '2', '阜阳', '阜阳市', 'fuyang', '0');
INSERT INTO `logistics_pca` VALUES ('341202', '341200', '3', '颍州', '颍州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341203', '341200', '3', '颍东', '颍东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341204', '341200', '3', '颍泉', '颍泉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341221', '341200', '3', '临泉', '临泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341222', '341200', '3', '太和', '太和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341225', '341200', '3', '阜南', '阜南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341226', '341200', '3', '颍上', '颍上县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341282', '341200', '3', '界首', '界首市', '', '0');
INSERT INTO `logistics_pca` VALUES ('341300', '340000', '2', '宿州', '宿州市', 'xiuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('341302', '341300', '3', '埇桥', '埇桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341321', '341300', '3', '砀山', '砀山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341322', '341300', '3', '萧县', '萧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341323', '341300', '3', '灵璧', '灵璧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341324', '341300', '3', '泗县', '泗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341500', '340000', '2', '六安', '六安市', 'liuan', '0');
INSERT INTO `logistics_pca` VALUES ('341502', '341500', '3', '金安', '金安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341503', '341500', '3', '裕安', '裕安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341521', '341500', '3', '寿县', '寿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341522', '341500', '3', '霍邱', '霍邱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341523', '341500', '3', '舒城', '舒城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341524', '341500', '3', '金寨', '金寨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341525', '341500', '3', '霍山', '霍山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341600', '340000', '2', '亳州', '亳州市', 'bozhou', '0');
INSERT INTO `logistics_pca` VALUES ('341602', '341600', '3', '谯城', '谯城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341621', '341600', '3', '涡阳', '涡阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341622', '341600', '3', '蒙城', '蒙城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341623', '341600', '3', '利辛', '利辛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341700', '340000', '2', '池州', '池州市', 'chizhou', '0');
INSERT INTO `logistics_pca` VALUES ('341702', '341700', '3', '贵池', '贵池区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341721', '341700', '3', '东至', '东至县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341722', '341700', '3', '石台', '石台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341723', '341700', '3', '青阳', '青阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341800', '340000', '2', '宣城', '宣城市', 'xuancheng', '0');
INSERT INTO `logistics_pca` VALUES ('341802', '341800', '3', '宣州', '宣州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('341821', '341800', '3', '郎溪', '郎溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341822', '341800', '3', '广德', '广德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341823', '341800', '3', '泾县', '泾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341824', '341800', '3', '绩溪', '绩溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341825', '341800', '3', '旌德', '旌德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('341881', '341800', '3', '宁国', '宁国市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350000', '0', '1', '福建', '福建省', '', '0');
INSERT INTO `logistics_pca` VALUES ('350100', '350000', '2', '福州', '福州市', 'fuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('350102', '350100', '3', '鼓楼', '鼓楼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350103', '350100', '3', '台江', '台江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350104', '350100', '3', '仓山', '仓山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350105', '350100', '3', '马尾', '马尾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350111', '350100', '3', '晋安', '晋安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350121', '350100', '3', '闽侯', '闽侯县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350122', '350100', '3', '连江', '连江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350123', '350100', '3', '罗源', '罗源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350124', '350100', '3', '闽清', '闽清县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350125', '350100', '3', '永泰', '永泰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350128', '350100', '3', '平潭', '平潭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350181', '350100', '3', '福清', '福清市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350182', '350100', '3', '长乐', '长乐市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350200', '350000', '2', '厦门', '厦门市', 'shamen', '0');
INSERT INTO `logistics_pca` VALUES ('350203', '350200', '3', '思明', '思明区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350205', '350200', '3', '海沧', '海沧区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350206', '350200', '3', '湖里', '湖里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350211', '350200', '3', '集美', '集美区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350212', '350200', '3', '同安', '同安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350213', '350200', '3', '翔安', '翔安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350300', '350000', '2', '莆田', '莆田市', 'putian', '0');
INSERT INTO `logistics_pca` VALUES ('350302', '350300', '3', '城厢', '城厢区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350303', '350300', '3', '涵江', '涵江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350304', '350300', '3', '荔城', '荔城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350305', '350300', '3', '秀屿', '秀屿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350322', '350300', '3', '仙游', '仙游县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350400', '350000', '2', '三明', '三明市', 'sanming', '0');
INSERT INTO `logistics_pca` VALUES ('350402', '350400', '3', '梅列', '梅列区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350403', '350400', '3', '三元', '三元区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350421', '350400', '3', '明溪', '明溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350423', '350400', '3', '清流', '清流县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350424', '350400', '3', '宁化', '宁化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350425', '350400', '3', '大田', '大田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350426', '350400', '3', '尤溪', '尤溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350427', '350400', '3', '沙县', '沙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350428', '350400', '3', '将乐', '将乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350429', '350400', '3', '泰宁', '泰宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350430', '350400', '3', '建宁', '建宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350481', '350400', '3', '永安', '永安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350500', '350000', '2', '泉州', '泉州市', 'quanzhou', '0');
INSERT INTO `logistics_pca` VALUES ('350502', '350500', '3', '鲤城', '鲤城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350503', '350500', '3', '丰泽', '丰泽区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350504', '350500', '3', '洛江', '洛江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350505', '350500', '3', '泉港', '泉港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350521', '350500', '3', '惠安', '惠安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350524', '350500', '3', '安溪', '安溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350525', '350500', '3', '永春', '永春县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350526', '350500', '3', '德化', '德化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350527', '350500', '3', '金门', '金门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350581', '350500', '3', '石狮', '石狮市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350582', '350500', '3', '晋江', '晋江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350583', '350500', '3', '南安', '南安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350600', '350000', '2', '漳州', '漳州市', 'zhangzhou', '0');
INSERT INTO `logistics_pca` VALUES ('350602', '350600', '3', '芗城', '芗城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350603', '350600', '3', '龙文', '龙文区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350622', '350600', '3', '云霄', '云霄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350623', '350600', '3', '漳浦', '漳浦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350624', '350600', '3', '诏安', '诏安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350625', '350600', '3', '长泰', '长泰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350626', '350600', '3', '东山', '东山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350627', '350600', '3', '南靖', '南靖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350628', '350600', '3', '平和', '平和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350629', '350600', '3', '华安', '华安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350681', '350600', '3', '龙海', '龙海市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350700', '350000', '2', '南平', '南平市', 'nanping', '0');
INSERT INTO `logistics_pca` VALUES ('350702', '350700', '3', '延平', '延平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350703', '350700', '3', '建阳', '建阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350721', '350700', '3', '顺昌', '顺昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350722', '350700', '3', '浦城', '浦城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350723', '350700', '3', '光泽', '光泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350724', '350700', '3', '松溪', '松溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350725', '350700', '3', '政和', '政和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350781', '350700', '3', '邵武', '邵武市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350782', '350700', '3', '武夷山', '武夷山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350783', '350700', '3', '建瓯', '建瓯市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350800', '350000', '2', '龙岩', '龙岩市', 'longyan', '0');
INSERT INTO `logistics_pca` VALUES ('350802', '350800', '3', '新罗', '新罗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350821', '350800', '3', '长汀', '长汀县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350822', '350800', '3', '永定', '永定区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350823', '350800', '3', '上杭', '上杭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350824', '350800', '3', '武平', '武平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350825', '350800', '3', '连城', '连城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350881', '350800', '3', '漳平', '漳平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350900', '350000', '2', '宁德', '宁德市', 'ningde', '0');
INSERT INTO `logistics_pca` VALUES ('350902', '350900', '3', '蕉城', '蕉城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('350921', '350900', '3', '霞浦', '霞浦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350922', '350900', '3', '古田', '古田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350923', '350900', '3', '屏南', '屏南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350924', '350900', '3', '寿宁', '寿宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350925', '350900', '3', '周宁', '周宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350926', '350900', '3', '柘荣', '柘荣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('350981', '350900', '3', '福安', '福安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('350982', '350900', '3', '福鼎', '福鼎市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360000', '0', '1', '江西', '江西省', '', '0');
INSERT INTO `logistics_pca` VALUES ('360100', '360000', '2', '南昌', '南昌市', 'nanchang', '0');
INSERT INTO `logistics_pca` VALUES ('360102', '360100', '3', '东湖', '东湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360103', '360100', '3', '西湖', '西湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360104', '360100', '3', '青云谱', '青云谱区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360105', '360100', '3', '湾里', '湾里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360111', '360100', '3', '青山湖', '青山湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360121', '360100', '3', '南昌', '南昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360122', '360100', '3', '新建', '新建县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360123', '360100', '3', '安义', '安义县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360124', '360100', '3', '进贤', '进贤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360200', '360000', '2', '景德镇', '景德镇市', 'jingdezhen', '0');
INSERT INTO `logistics_pca` VALUES ('360202', '360200', '3', '昌江', '昌江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360203', '360200', '3', '珠山', '珠山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360222', '360200', '3', '浮梁', '浮梁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360281', '360200', '3', '乐平', '乐平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360300', '360000', '2', '萍乡', '萍乡市', 'pingxiang', '0');
INSERT INTO `logistics_pca` VALUES ('360302', '360300', '3', '安源', '安源区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360313', '360300', '3', '湘东', '湘东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360321', '360300', '3', '莲花', '莲花县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360322', '360300', '3', '上栗', '上栗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360323', '360300', '3', '芦溪', '芦溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360400', '360000', '2', '九江', '九江市', 'jiujiang', '0');
INSERT INTO `logistics_pca` VALUES ('360402', '360400', '3', '庐山', '庐山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360403', '360400', '3', '浔阳', '浔阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360421', '360400', '3', '九江', '九江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360423', '360400', '3', '武宁', '武宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360424', '360400', '3', '修水', '修水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360425', '360400', '3', '永修', '永修县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360426', '360400', '3', '德安', '德安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360427', '360400', '3', '星子', '星子县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360428', '360400', '3', '都昌', '都昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360429', '360400', '3', '湖口', '湖口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360430', '360400', '3', '彭泽', '彭泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360481', '360400', '3', '瑞昌', '瑞昌市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360482', '360400', '3', '共青城', '共青城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360500', '360000', '2', '新余', '新余市', 'xinyu', '0');
INSERT INTO `logistics_pca` VALUES ('360502', '360500', '3', '渝水', '渝水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360521', '360500', '3', '分宜', '分宜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360600', '360000', '2', '鹰潭', '鹰潭市', 'yingtan', '0');
INSERT INTO `logistics_pca` VALUES ('360602', '360600', '3', '月湖', '月湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360622', '360600', '3', '余江', '余江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360681', '360600', '3', '贵溪', '贵溪市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360700', '360000', '2', '赣州', '赣州市', 'ganzhou', '0');
INSERT INTO `logistics_pca` VALUES ('360702', '360700', '3', '章贡', '章贡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360703', '360700', '3', '南康', '南康区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360721', '360700', '3', '赣县', '赣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360722', '360700', '3', '信丰', '信丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360723', '360700', '3', '大余', '大余县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360724', '360700', '3', '上犹', '上犹县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360725', '360700', '3', '崇义', '崇义县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360726', '360700', '3', '安远', '安远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360727', '360700', '3', '龙南', '龙南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360728', '360700', '3', '定南', '定南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360729', '360700', '3', '全南', '全南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360730', '360700', '3', '宁都', '宁都县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360731', '360700', '3', '于都', '于都县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360732', '360700', '3', '兴国', '兴国县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360733', '360700', '3', '会昌', '会昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360734', '360700', '3', '寻乌', '寻乌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360735', '360700', '3', '石城', '石城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360781', '360700', '3', '瑞金', '瑞金市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360800', '360000', '2', '吉安', '吉安市', 'jian', '0');
INSERT INTO `logistics_pca` VALUES ('360802', '360800', '3', '吉州', '吉州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360803', '360800', '3', '青原', '青原区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360821', '360800', '3', '吉安', '吉安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360822', '360800', '3', '吉水', '吉水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360823', '360800', '3', '峡江', '峡江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360824', '360800', '3', '新干', '新干县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360825', '360800', '3', '永丰', '永丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360826', '360800', '3', '泰和', '泰和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360827', '360800', '3', '遂川', '遂川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360828', '360800', '3', '万安', '万安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360829', '360800', '3', '安福', '安福县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360830', '360800', '3', '永新', '永新县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360881', '360800', '3', '井冈山', '井冈山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360900', '360000', '2', '宜春', '宜春市', 'yichun', '0');
INSERT INTO `logistics_pca` VALUES ('360902', '360900', '3', '袁州', '袁州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('360921', '360900', '3', '奉新', '奉新县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360922', '360900', '3', '万载', '万载县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360923', '360900', '3', '上高', '上高县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360924', '360900', '3', '宜丰', '宜丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360925', '360900', '3', '靖安', '靖安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360926', '360900', '3', '铜鼓', '铜鼓县', '', '0');
INSERT INTO `logistics_pca` VALUES ('360981', '360900', '3', '丰城', '丰城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360982', '360900', '3', '樟树', '樟树市', '', '0');
INSERT INTO `logistics_pca` VALUES ('360983', '360900', '3', '高安', '高安市', '', '0');
INSERT INTO `logistics_pca` VALUES ('361000', '360000', '2', '抚州', '抚州市', 'fuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('361002', '361000', '3', '临川', '临川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('361021', '361000', '3', '南城', '南城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361022', '361000', '3', '黎川', '黎川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361023', '361000', '3', '南丰', '南丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361024', '361000', '3', '崇仁', '崇仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361025', '361000', '3', '乐安', '乐安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361026', '361000', '3', '宜黄', '宜黄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361027', '361000', '3', '金溪', '金溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361028', '361000', '3', '资溪', '资溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361029', '361000', '3', '东乡', '东乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361030', '361000', '3', '广昌', '广昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361100', '360000', '2', '上饶', '上饶市', 'shangrao', '0');
INSERT INTO `logistics_pca` VALUES ('361102', '361100', '3', '信州', '信州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('361121', '361100', '3', '上饶', '上饶县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361122', '361100', '3', '广丰', '广丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361123', '361100', '3', '玉山', '玉山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361124', '361100', '3', '铅山', '铅山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361125', '361100', '3', '横峰', '横峰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361126', '361100', '3', '弋阳', '弋阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361127', '361100', '3', '余干', '余干县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361128', '361100', '3', '鄱阳', '鄱阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361129', '361100', '3', '万年', '万年县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361130', '361100', '3', '婺源', '婺源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('361181', '361100', '3', '德兴', '德兴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370000', '0', '1', '山东', '山东省', '', '0');
INSERT INTO `logistics_pca` VALUES ('370100', '370000', '2', '济南', '济南市', 'jinan', '0');
INSERT INTO `logistics_pca` VALUES ('370102', '370100', '3', '历下', '历下区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370103', '370100', '3', '市中区', '市中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370104', '370100', '3', '槐荫', '槐荫区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370105', '370100', '3', '天桥', '天桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370112', '370100', '3', '历城', '历城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370113', '370100', '3', '长清', '长清区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370124', '370100', '3', '平阴', '平阴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370125', '370100', '3', '济阳', '济阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370126', '370100', '3', '商河', '商河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370181', '370100', '3', '章丘', '章丘市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370200', '370000', '2', '青岛', '青岛市', 'qingdao', '0');
INSERT INTO `logistics_pca` VALUES ('370202', '370200', '3', '市南', '市南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370203', '370200', '3', '市北', '市北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370211', '370200', '3', '黄岛', '黄岛区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370212', '370200', '3', '崂山', '崂山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370213', '370200', '3', '李沧', '李沧区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370214', '370200', '3', '城阳', '城阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370281', '370200', '3', '胶州', '胶州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370282', '370200', '3', '即墨', '即墨市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370283', '370200', '3', '平度', '平度市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370285', '370200', '3', '莱西', '莱西市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370286', '370200', '3', '西海岸', '西海岸新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370300', '370000', '2', '淄博', '淄博市', 'zibo', '0');
INSERT INTO `logistics_pca` VALUES ('370302', '370300', '3', '淄川', '淄川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370303', '370300', '3', '张店', '张店区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370304', '370300', '3', '博山', '博山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370305', '370300', '3', '临淄', '临淄区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370306', '370300', '3', '周村', '周村区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370321', '370300', '3', '桓台', '桓台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370322', '370300', '3', '高青', '高青县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370323', '370300', '3', '沂源', '沂源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370400', '370000', '2', '枣庄', '枣庄市', 'zaozhuang', '0');
INSERT INTO `logistics_pca` VALUES ('370402', '370400', '3', '市中区', '市中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370403', '370400', '3', '薛城', '薛城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370404', '370400', '3', '峄城', '峄城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370405', '370400', '3', '台儿庄', '台儿庄区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370406', '370400', '3', '山亭', '山亭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370481', '370400', '3', '滕州', '滕州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370500', '370000', '2', '东营', '东营市', 'dongying', '0');
INSERT INTO `logistics_pca` VALUES ('370502', '370500', '3', '东营', '东营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370503', '370500', '3', '河口', '河口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370521', '370500', '3', '垦利', '垦利县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370522', '370500', '3', '利津', '利津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370523', '370500', '3', '广饶', '广饶县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370600', '370000', '2', '烟台', '烟台市', 'yantai', '0');
INSERT INTO `logistics_pca` VALUES ('370602', '370600', '3', '芝罘', '芝罘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370611', '370600', '3', '福山', '福山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370612', '370600', '3', '牟平', '牟平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370613', '370600', '3', '莱山', '莱山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370634', '370600', '3', '长岛', '长岛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370681', '370600', '3', '龙口', '龙口市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370682', '370600', '3', '莱阳', '莱阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370683', '370600', '3', '莱州', '莱州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370684', '370600', '3', '蓬莱', '蓬莱市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370685', '370600', '3', '招远', '招远市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370686', '370600', '3', '栖霞', '栖霞市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370687', '370600', '3', '海阳', '海阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370700', '370000', '2', '潍坊', '潍坊市', 'weifang', '0');
INSERT INTO `logistics_pca` VALUES ('370702', '370700', '3', '潍城', '潍城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370703', '370700', '3', '寒亭', '寒亭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370704', '370700', '3', '坊子', '坊子区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370705', '370700', '3', '奎文', '奎文区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370724', '370700', '3', '临朐', '临朐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370725', '370700', '3', '昌乐', '昌乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370781', '370700', '3', '青州', '青州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370782', '370700', '3', '诸城', '诸城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370783', '370700', '3', '寿光', '寿光市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370784', '370700', '3', '安丘', '安丘市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370785', '370700', '3', '高密', '高密市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370786', '370700', '3', '昌邑', '昌邑市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370800', '370000', '2', '济宁', '济宁市', 'jining', '0');
INSERT INTO `logistics_pca` VALUES ('370811', '370800', '3', '任城', '任城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370812', '370800', '3', '兖州', '兖州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370826', '370800', '3', '微山', '微山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370827', '370800', '3', '鱼台', '鱼台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370828', '370800', '3', '金乡', '金乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370829', '370800', '3', '嘉祥', '嘉祥县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370830', '370800', '3', '汶上', '汶上县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370831', '370800', '3', '泗水', '泗水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370832', '370800', '3', '梁山', '梁山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370881', '370800', '3', '曲阜', '曲阜市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370883', '370800', '3', '邹城', '邹城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370900', '370000', '2', '泰安', '泰安市', 'taian', '0');
INSERT INTO `logistics_pca` VALUES ('370902', '370900', '3', '泰山', '泰山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370911', '370900', '3', '岱岳', '岱岳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('370921', '370900', '3', '宁阳', '宁阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370923', '370900', '3', '东平', '东平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('370982', '370900', '3', '新泰', '新泰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('370983', '370900', '3', '肥城', '肥城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('371000', '370000', '2', '威海', '威海市', 'weihai', '0');
INSERT INTO `logistics_pca` VALUES ('371002', '371000', '3', '环翠', '环翠区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371003', '371000', '3', '文登', '文登区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371082', '371000', '3', '荣成', '荣成市', '', '0');
INSERT INTO `logistics_pca` VALUES ('371083', '371000', '3', '乳山', '乳山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('371100', '370000', '2', '日照', '日照市', 'rizhao', '0');
INSERT INTO `logistics_pca` VALUES ('371102', '371100', '3', '东港', '东港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371103', '371100', '3', '岚山', '岚山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371121', '371100', '3', '五莲', '五莲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371122', '371100', '3', '莒县', '莒县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371200', '370000', '2', '莱芜', '莱芜市', 'laiwu', '0');
INSERT INTO `logistics_pca` VALUES ('371202', '371200', '3', '莱城', '莱城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371203', '371200', '3', '钢城', '钢城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371300', '370000', '2', '临沂', '临沂市', 'linyi', '0');
INSERT INTO `logistics_pca` VALUES ('371302', '371300', '3', '兰山', '兰山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371311', '371300', '3', '罗庄', '罗庄区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371312', '371300', '3', '河东', '河东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371321', '371300', '3', '沂南', '沂南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371322', '371300', '3', '郯城', '郯城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371323', '371300', '3', '沂水', '沂水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371324', '371300', '3', '兰陵', '兰陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371325', '371300', '3', '费县', '费县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371326', '371300', '3', '平邑', '平邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371327', '371300', '3', '莒南', '莒南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371328', '371300', '3', '蒙阴', '蒙阴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371329', '371300', '3', '临沭', '临沭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371400', '370000', '2', '德州', '德州市', 'dezhou', '0');
INSERT INTO `logistics_pca` VALUES ('371402', '371400', '3', '德城', '德城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371403', '371400', '3', '陵城', '陵城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371422', '371400', '3', '宁津', '宁津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371423', '371400', '3', '庆云', '庆云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371424', '371400', '3', '临邑', '临邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371425', '371400', '3', '齐河', '齐河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371426', '371400', '3', '平原', '平原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371427', '371400', '3', '夏津', '夏津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371428', '371400', '3', '武城', '武城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371481', '371400', '3', '乐陵', '乐陵市', '', '0');
INSERT INTO `logistics_pca` VALUES ('371482', '371400', '3', '禹城', '禹城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('371500', '370000', '2', '聊城', '聊城市', 'liaocheng', '0');
INSERT INTO `logistics_pca` VALUES ('371502', '371500', '3', '东昌府', '东昌府区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371521', '371500', '3', '阳谷', '阳谷县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371522', '371500', '3', '莘县', '莘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371523', '371500', '3', '茌平', '茌平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371524', '371500', '3', '东阿', '东阿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371525', '371500', '3', '冠县', '冠县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371526', '371500', '3', '高唐', '高唐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371581', '371500', '3', '临清', '临清市', '', '0');
INSERT INTO `logistics_pca` VALUES ('371600', '370000', '2', '滨州', '滨州市', 'binzhou', '0');
INSERT INTO `logistics_pca` VALUES ('371602', '371600', '3', '滨城', '滨城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371603', '371600', '3', '沾化', '沾化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371621', '371600', '3', '惠民', '惠民县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371622', '371600', '3', '阳信', '阳信县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371623', '371600', '3', '无棣', '无棣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371625', '371600', '3', '博兴', '博兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371626', '371600', '3', '邹平', '邹平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371627', '371600', '3', '北海新区', '北海新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371700', '370000', '2', '菏泽', '菏泽市', 'heze', '0');
INSERT INTO `logistics_pca` VALUES ('371702', '371700', '3', '牡丹', '牡丹区', '', '0');
INSERT INTO `logistics_pca` VALUES ('371721', '371700', '3', '曹县', '曹县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371722', '371700', '3', '单县', '单县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371723', '371700', '3', '成武', '成武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371724', '371700', '3', '巨野', '巨野县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371725', '371700', '3', '郓城', '郓城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371726', '371700', '3', '鄄城', '鄄城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371727', '371700', '3', '定陶', '定陶县', '', '0');
INSERT INTO `logistics_pca` VALUES ('371728', '371700', '3', '东明', '东明县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410000', '0', '1', '河南', '河南省', '', '0');
INSERT INTO `logistics_pca` VALUES ('410100', '410000', '2', '郑州', '郑州市', 'zhengzhou', '0');
INSERT INTO `logistics_pca` VALUES ('410102', '410100', '3', '中原', '中原区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410103', '410100', '3', '二七', '二七区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410104', '410100', '3', '管城', '管城回族区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410105', '410100', '3', '金水', '金水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410106', '410100', '3', '上街', '上街区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410108', '410100', '3', '惠济', '惠济区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410122', '410100', '3', '中牟', '中牟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410181', '410100', '3', '巩义', '巩义市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410182', '410100', '3', '荥阳', '荥阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410183', '410100', '3', '新密', '新密市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410184', '410100', '3', '新郑', '新郑市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410185', '410100', '3', '登封', '登封市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410200', '410000', '2', '开封', '开封市', 'kaifeng', '0');
INSERT INTO `logistics_pca` VALUES ('410202', '410200', '3', '龙亭', '龙亭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410203', '410200', '3', '顺河', '顺河回族区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410204', '410200', '3', '鼓楼', '鼓楼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410205', '410200', '3', '禹王台', '禹王台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410212', '410200', '3', '祥符', '祥符区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410221', '410200', '3', '杞县', '杞县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410222', '410200', '3', '通许', '通许县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410223', '410200', '3', '尉氏', '尉氏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410225', '410200', '3', '兰考', '兰考县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410300', '410000', '2', '洛阳', '洛阳市', 'luoyang', '0');
INSERT INTO `logistics_pca` VALUES ('410302', '410300', '3', '老城', '老城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410303', '410300', '3', '西工', '西工区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410304', '410300', '3', '瀍河', '瀍河回族区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410305', '410300', '3', '涧西', '涧西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410306', '410300', '3', '吉利', '吉利区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410311', '410300', '3', '洛龙', '洛龙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410322', '410300', '3', '孟津', '孟津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410323', '410300', '3', '新安', '新安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410324', '410300', '3', '栾川', '栾川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410325', '410300', '3', '嵩县', '嵩县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410326', '410300', '3', '汝阳', '汝阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410327', '410300', '3', '宜阳', '宜阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410328', '410300', '3', '洛宁', '洛宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410329', '410300', '3', '伊川', '伊川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410381', '410300', '3', '偃师', '偃师市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410400', '410000', '2', '平顶山', '平顶山市', 'pingdingshan', '0');
INSERT INTO `logistics_pca` VALUES ('410402', '410400', '3', '新华', '新华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410403', '410400', '3', '卫东', '卫东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410404', '410400', '3', '石龙', '石龙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410411', '410400', '3', '湛河', '湛河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410421', '410400', '3', '宝丰', '宝丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410422', '410400', '3', '叶县', '叶县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410423', '410400', '3', '鲁山', '鲁山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410425', '410400', '3', '郏县', '郏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410481', '410400', '3', '舞钢', '舞钢市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410482', '410400', '3', '汝州', '汝州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410500', '410000', '2', '安阳', '安阳市', 'anyang', '0');
INSERT INTO `logistics_pca` VALUES ('410502', '410500', '3', '文峰', '文峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410503', '410500', '3', '北关', '北关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410505', '410500', '3', '殷都', '殷都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410506', '410500', '3', '龙安', '龙安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410522', '410500', '3', '安阳', '安阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410523', '410500', '3', '汤阴', '汤阴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410526', '410500', '3', '滑县', '滑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410527', '410500', '3', '内黄', '内黄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410581', '410500', '3', '林州', '林州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410600', '410000', '2', '鹤壁', '鹤壁市', 'hebi', '0');
INSERT INTO `logistics_pca` VALUES ('410602', '410600', '3', '鹤山', '鹤山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410603', '410600', '3', '山城', '山城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410611', '410600', '3', '淇滨', '淇滨区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410621', '410600', '3', '浚县', '浚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410622', '410600', '3', '淇县', '淇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410700', '410000', '2', '新乡', '新乡市', 'xinxiang', '0');
INSERT INTO `logistics_pca` VALUES ('410702', '410700', '3', '红旗', '红旗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410703', '410700', '3', '卫滨', '卫滨区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410704', '410700', '3', '凤泉', '凤泉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410711', '410700', '3', '牧野', '牧野区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410721', '410700', '3', '新乡', '新乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410724', '410700', '3', '获嘉', '获嘉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410725', '410700', '3', '原阳', '原阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410726', '410700', '3', '延津', '延津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410727', '410700', '3', '封丘', '封丘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410728', '410700', '3', '长垣', '长垣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410781', '410700', '3', '卫辉', '卫辉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410782', '410700', '3', '辉县', '辉县市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410800', '410000', '2', '焦作', '焦作市', 'jiaozuo', '0');
INSERT INTO `logistics_pca` VALUES ('410802', '410800', '3', '解放', '解放区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410803', '410800', '3', '中站', '中站区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410804', '410800', '3', '马村', '马村区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410811', '410800', '3', '山阳', '山阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410821', '410800', '3', '修武', '修武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410822', '410800', '3', '博爱', '博爱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410823', '410800', '3', '武陟', '武陟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410825', '410800', '3', '温县', '温县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410882', '410800', '3', '沁阳', '沁阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410883', '410800', '3', '孟州', '孟州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('410900', '410000', '2', '濮阳', '濮阳市', 'puyang', '0');
INSERT INTO `logistics_pca` VALUES ('410902', '410900', '3', '华龙', '华龙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('410922', '410900', '3', '清丰', '清丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410923', '410900', '3', '南乐', '南乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410926', '410900', '3', '范县', '范县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410927', '410900', '3', '台前', '台前县', '', '0');
INSERT INTO `logistics_pca` VALUES ('410928', '410900', '3', '濮阳', '濮阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411000', '410000', '2', '许昌', '许昌市', 'xuchang', '0');
INSERT INTO `logistics_pca` VALUES ('411002', '411000', '3', '魏都', '魏都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411023', '411000', '3', '许昌', '许昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411024', '411000', '3', '鄢陵', '鄢陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411025', '411000', '3', '襄城', '襄城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411081', '411000', '3', '禹州', '禹州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411082', '411000', '3', '长葛', '长葛市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411100', '410000', '2', '漯河', '漯河市', 'luohe', '0');
INSERT INTO `logistics_pca` VALUES ('411102', '411100', '3', '源汇', '源汇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411103', '411100', '3', '郾城', '郾城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411104', '411100', '3', '召陵', '召陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411121', '411100', '3', '舞阳', '舞阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411122', '411100', '3', '临颍', '临颍县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411200', '410000', '2', '三门峡', '三门峡市', 'sanmenxia', '0');
INSERT INTO `logistics_pca` VALUES ('411202', '411200', '3', '湖滨', '湖滨区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411221', '411200', '3', '渑池', '渑池县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411222', '411200', '3', '陕县', '陕县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411224', '411200', '3', '卢氏', '卢氏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411281', '411200', '3', '义马', '义马市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411282', '411200', '3', '灵宝', '灵宝市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411300', '410000', '2', '南阳', '南阳市', 'nanyang', '0');
INSERT INTO `logistics_pca` VALUES ('411302', '411300', '3', '宛城', '宛城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411303', '411300', '3', '卧龙', '卧龙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411321', '411300', '3', '南召', '南召县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411322', '411300', '3', '方城', '方城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411323', '411300', '3', '西峡', '西峡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411324', '411300', '3', '镇平', '镇平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411325', '411300', '3', '内乡', '内乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411326', '411300', '3', '淅川', '淅川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411327', '411300', '3', '社旗', '社旗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411328', '411300', '3', '唐河', '唐河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411329', '411300', '3', '新野', '新野县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411330', '411300', '3', '桐柏', '桐柏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411381', '411300', '3', '邓州', '邓州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411400', '410000', '2', '商丘', '商丘市', 'shangqiu', '0');
INSERT INTO `logistics_pca` VALUES ('411402', '411400', '3', '梁园', '梁园区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411403', '411400', '3', '睢阳', '睢阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411421', '411400', '3', '民权', '民权县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411422', '411400', '3', '睢县', '睢县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411423', '411400', '3', '宁陵', '宁陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411424', '411400', '3', '柘城', '柘城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411425', '411400', '3', '虞城', '虞城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411426', '411400', '3', '夏邑', '夏邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411481', '411400', '3', '永城', '永城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411500', '410000', '2', '信阳', '信阳市', 'xinyang', '0');
INSERT INTO `logistics_pca` VALUES ('411502', '411500', '3', '浉河', '浉河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411503', '411500', '3', '平桥', '平桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411521', '411500', '3', '罗山', '罗山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411522', '411500', '3', '光山', '光山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411523', '411500', '3', '新县', '新县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411524', '411500', '3', '商城', '商城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411525', '411500', '3', '固始', '固始县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411526', '411500', '3', '潢川', '潢川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411527', '411500', '3', '淮滨', '淮滨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411528', '411500', '3', '息县', '息县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411600', '410000', '2', '周口', '周口市', 'zhoukou', '0');
INSERT INTO `logistics_pca` VALUES ('411602', '411600', '3', '川汇', '川汇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411621', '411600', '3', '扶沟', '扶沟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411622', '411600', '3', '西华', '西华县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411623', '411600', '3', '商水', '商水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411624', '411600', '3', '沈丘', '沈丘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411625', '411600', '3', '郸城', '郸城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411626', '411600', '3', '淮阳', '淮阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411627', '411600', '3', '太康', '太康县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411628', '411600', '3', '鹿邑', '鹿邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411681', '411600', '3', '项城', '项城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('411700', '410000', '2', '驻马店', '驻马店市', 'zhumadian', '0');
INSERT INTO `logistics_pca` VALUES ('411702', '411700', '3', '驿城', '驿城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('411721', '411700', '3', '西平', '西平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411722', '411700', '3', '上蔡', '上蔡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411723', '411700', '3', '平舆', '平舆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411724', '411700', '3', '正阳', '正阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411725', '411700', '3', '确山', '确山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411726', '411700', '3', '泌阳', '泌阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411727', '411700', '3', '汝南', '汝南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411728', '411700', '3', '遂平', '遂平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('411729', '411700', '3', '新蔡', '新蔡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('419001', '419000', '3', '济源', '济源市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420000', '0', '1', '湖北', '湖北省', '', '0');
INSERT INTO `logistics_pca` VALUES ('420100', '420000', '2', '武汉', '武汉市', 'wuhan', '0');
INSERT INTO `logistics_pca` VALUES ('420102', '420100', '3', '江岸', '江岸区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420103', '420100', '3', '江汉', '江汉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420104', '420100', '3', '硚口', '硚口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420105', '420100', '3', '汉阳', '汉阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420106', '420100', '3', '武昌', '武昌区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420107', '420100', '3', '青山', '青山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420111', '420100', '3', '洪山', '洪山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420112', '420100', '3', '东西湖', '东西湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420113', '420100', '3', '汉南', '汉南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420114', '420100', '3', '蔡甸', '蔡甸区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420115', '420100', '3', '江夏', '江夏区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420116', '420100', '3', '黄陂', '黄陂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420117', '420100', '3', '新洲', '新洲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420200', '420000', '2', '黄石', '黄石市', 'huangshi', '0');
INSERT INTO `logistics_pca` VALUES ('420202', '420200', '3', '黄石港', '黄石港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420203', '420200', '3', '西塞山', '西塞山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420204', '420200', '3', '下陆', '下陆区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420205', '420200', '3', '铁山', '铁山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420222', '420200', '3', '阳新', '阳新县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420281', '420200', '3', '大冶', '大冶市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420300', '420000', '2', '十堰', '十堰市', 'shiyan', '0');
INSERT INTO `logistics_pca` VALUES ('420302', '420300', '3', '茅箭', '茅箭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420303', '420300', '3', '张湾', '张湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420304', '420300', '3', '郧阳', '郧阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420322', '420300', '3', '郧西', '郧西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420323', '420300', '3', '竹山', '竹山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420324', '420300', '3', '竹溪', '竹溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420325', '420300', '3', '房县', '房县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420381', '420300', '3', '丹江口', '丹江口市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420500', '420000', '2', '宜昌', '宜昌市', 'yichang', '0');
INSERT INTO `logistics_pca` VALUES ('420502', '420500', '3', '西陵', '西陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420503', '420500', '3', '伍家岗', '伍家岗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420504', '420500', '3', '点军', '点军区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420505', '420500', '3', '猇亭', '猇亭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420506', '420500', '3', '夷陵', '夷陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420525', '420500', '3', '远安', '远安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420526', '420500', '3', '兴山', '兴山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420527', '420500', '3', '秭归', '秭归县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420528', '420500', '3', '长阳', '长阳土家族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420529', '420500', '3', '五峰', '五峰土家族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420581', '420500', '3', '宜都', '宜都市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420582', '420500', '3', '当阳', '当阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420583', '420500', '3', '枝江', '枝江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420600', '420000', '2', '襄阳', '襄阳市', 'xiangyang', '0');
INSERT INTO `logistics_pca` VALUES ('420602', '420600', '3', '襄城', '襄城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420606', '420600', '3', '樊城', '樊城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420607', '420600', '3', '襄州', '襄州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420624', '420600', '3', '南漳', '南漳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420625', '420600', '3', '谷城', '谷城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420626', '420600', '3', '保康', '保康县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420682', '420600', '3', '老河口', '老河口市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420683', '420600', '3', '枣阳', '枣阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420684', '420600', '3', '宜城', '宜城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420700', '420000', '2', '鄂州', '鄂州市', 'ezhou', '0');
INSERT INTO `logistics_pca` VALUES ('420702', '420700', '3', '梁子湖', '梁子湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420703', '420700', '3', '华容', '华容区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420704', '420700', '3', '鄂城', '鄂城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420800', '420000', '2', '荆门', '荆门市', 'jingmen', '0');
INSERT INTO `logistics_pca` VALUES ('420802', '420800', '3', '东宝', '东宝区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420804', '420800', '3', '掇刀', '掇刀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420821', '420800', '3', '京山', '京山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420822', '420800', '3', '沙洋', '沙洋县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420881', '420800', '3', '钟祥', '钟祥市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420900', '420000', '2', '孝感', '孝感市', 'xiaogan', '0');
INSERT INTO `logistics_pca` VALUES ('420902', '420900', '3', '孝南', '孝南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('420921', '420900', '3', '孝昌', '孝昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420922', '420900', '3', '大悟', '大悟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420923', '420900', '3', '云梦', '云梦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('420981', '420900', '3', '应城', '应城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420982', '420900', '3', '安陆', '安陆市', '', '0');
INSERT INTO `logistics_pca` VALUES ('420984', '420900', '3', '汉川', '汉川市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421000', '420000', '2', '荆州', '荆州市', 'jingzhou', '0');
INSERT INTO `logistics_pca` VALUES ('421002', '421000', '3', '沙市', '沙市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('421003', '421000', '3', '荆州', '荆州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('421022', '421000', '3', '公安', '公安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421023', '421000', '3', '监利', '监利县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421024', '421000', '3', '江陵', '江陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421081', '421000', '3', '石首', '石首市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421083', '421000', '3', '洪湖', '洪湖市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421087', '421000', '3', '松滋', '松滋市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421100', '420000', '2', '黄冈', '黄冈市', 'huanggang', '0');
INSERT INTO `logistics_pca` VALUES ('421102', '421100', '3', '黄州', '黄州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('421121', '421100', '3', '团风', '团风县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421122', '421100', '3', '红安', '红安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421123', '421100', '3', '罗田', '罗田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421124', '421100', '3', '英山', '英山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421125', '421100', '3', '浠水', '浠水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421126', '421100', '3', '蕲春', '蕲春县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421127', '421100', '3', '黄梅', '黄梅县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421181', '421100', '3', '麻城', '麻城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421182', '421100', '3', '武穴', '武穴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421200', '420000', '2', '咸宁', '咸宁市', 'xianning', '0');
INSERT INTO `logistics_pca` VALUES ('421202', '421200', '3', '咸安', '咸安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('421221', '421200', '3', '嘉鱼', '嘉鱼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421222', '421200', '3', '通城', '通城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421223', '421200', '3', '崇阳', '崇阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421224', '421200', '3', '通山', '通山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421281', '421200', '3', '赤壁', '赤壁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('421300', '420000', '2', '随州', '随州市', 'suizhou', '0');
INSERT INTO `logistics_pca` VALUES ('421303', '421300', '3', '曾都', '曾都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('421321', '421300', '3', '随县', '随县', '', '0');
INSERT INTO `logistics_pca` VALUES ('421381', '421300', '3', '广水', '广水市', '', '0');
INSERT INTO `logistics_pca` VALUES ('422800', '420000', '2', '恩施', '恩施土家族苗族自治州', 'enshi', '0');
INSERT INTO `logistics_pca` VALUES ('422801', '422800', '3', '恩施', '恩施市', '', '0');
INSERT INTO `logistics_pca` VALUES ('422802', '422800', '3', '利川', '利川市', '', '0');
INSERT INTO `logistics_pca` VALUES ('422822', '422800', '3', '建始', '建始县', '', '0');
INSERT INTO `logistics_pca` VALUES ('422823', '422800', '3', '巴东', '巴东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('422825', '422800', '3', '宣恩', '宣恩县', '', '0');
INSERT INTO `logistics_pca` VALUES ('422826', '422800', '3', '咸丰', '咸丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('422827', '422800', '3', '来凤', '来凤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('422828', '422800', '3', '鹤峰', '鹤峰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('429004', '429000', '3', '仙桃', '仙桃市', '', '0');
INSERT INTO `logistics_pca` VALUES ('429005', '429000', '3', '潜江', '潜江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('429006', '429000', '3', '天门', '天门市', '', '0');
INSERT INTO `logistics_pca` VALUES ('429021', '429000', '3', '神农架', '神农架林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430000', '0', '1', '湖南', '湖南省', '', '0');
INSERT INTO `logistics_pca` VALUES ('430100', '430000', '2', '长沙', '长沙市', 'changsha', '0');
INSERT INTO `logistics_pca` VALUES ('430102', '430100', '3', '芙蓉', '芙蓉区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430103', '430100', '3', '天心', '天心区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430104', '430100', '3', '岳麓', '岳麓区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430105', '430100', '3', '开福', '开福区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430111', '430100', '3', '雨花', '雨花区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430112', '430100', '3', '望城', '望城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430121', '430100', '3', '长沙', '长沙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430124', '430100', '3', '宁乡', '宁乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430181', '430100', '3', '浏阳', '浏阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430200', '430000', '2', '株洲', '株洲市', 'zhuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('430202', '430200', '3', '荷塘', '荷塘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430203', '430200', '3', '芦淞', '芦淞区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430204', '430200', '3', '石峰', '石峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430211', '430200', '3', '天元', '天元区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430221', '430200', '3', '株洲', '株洲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430223', '430200', '3', '攸县', '攸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430224', '430200', '3', '茶陵', '茶陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430225', '430200', '3', '炎陵', '炎陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430281', '430200', '3', '醴陵', '醴陵市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430300', '430000', '2', '湘潭', '湘潭市', 'xiangtan', '0');
INSERT INTO `logistics_pca` VALUES ('430302', '430300', '3', '雨湖', '雨湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430304', '430300', '3', '岳塘', '岳塘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430321', '430300', '3', '湘潭', '湘潭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430381', '430300', '3', '湘乡', '湘乡市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430382', '430300', '3', '韶山', '韶山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430400', '430000', '2', '衡阳', '衡阳市', 'hengyang', '0');
INSERT INTO `logistics_pca` VALUES ('430405', '430400', '3', '珠晖', '珠晖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430406', '430400', '3', '雁峰', '雁峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430407', '430400', '3', '石鼓', '石鼓区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430408', '430400', '3', '蒸湘', '蒸湘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430412', '430400', '3', '南岳', '南岳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430421', '430400', '3', '衡阳', '衡阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430422', '430400', '3', '衡南', '衡南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430423', '430400', '3', '衡山', '衡山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430424', '430400', '3', '衡东', '衡东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430426', '430400', '3', '祁东', '祁东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430481', '430400', '3', '耒阳', '耒阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430482', '430400', '3', '常宁', '常宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430500', '430000', '2', '邵阳', '邵阳市', 'shaoyang', '0');
INSERT INTO `logistics_pca` VALUES ('430502', '430500', '3', '双清', '双清区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430503', '430500', '3', '大祥', '大祥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430511', '430500', '3', '北塔', '北塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430521', '430500', '3', '邵东', '邵东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430522', '430500', '3', '新邵', '新邵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430523', '430500', '3', '邵阳', '邵阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430524', '430500', '3', '隆回', '隆回县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430525', '430500', '3', '洞口', '洞口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430527', '430500', '3', '绥宁', '绥宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430528', '430500', '3', '新宁', '新宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430529', '430500', '3', '城步', '城步苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430581', '430500', '3', '武冈', '武冈市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430600', '430000', '2', '岳阳', '岳阳市', 'yueyang', '0');
INSERT INTO `logistics_pca` VALUES ('430602', '430600', '3', '岳阳楼', '岳阳楼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430603', '430600', '3', '云溪', '云溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430611', '430600', '3', '君山', '君山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430621', '430600', '3', '岳阳', '岳阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430623', '430600', '3', '华容', '华容县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430624', '430600', '3', '湘阴', '湘阴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430626', '430600', '3', '平江', '平江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430681', '430600', '3', '汨罗', '汨罗市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430682', '430600', '3', '临湘', '临湘市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430700', '430000', '2', '常德', '常德市', 'changde', '0');
INSERT INTO `logistics_pca` VALUES ('430702', '430700', '3', '武陵', '武陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430703', '430700', '3', '鼎城', '鼎城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430721', '430700', '3', '安乡', '安乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430722', '430700', '3', '汉寿', '汉寿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430723', '430700', '3', '澧县', '澧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430724', '430700', '3', '临澧', '临澧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430725', '430700', '3', '桃源', '桃源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430726', '430700', '3', '石门', '石门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430781', '430700', '3', '津市', '津市市', '', '0');
INSERT INTO `logistics_pca` VALUES ('430800', '430000', '2', '张家界', '张家界市', 'zhangjiajie', '0');
INSERT INTO `logistics_pca` VALUES ('430802', '430800', '3', '永定', '永定区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430811', '430800', '3', '武陵源', '武陵源区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430821', '430800', '3', '慈利', '慈利县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430822', '430800', '3', '桑植', '桑植县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430900', '430000', '2', '益阳', '益阳市', 'yiyang', '0');
INSERT INTO `logistics_pca` VALUES ('430902', '430900', '3', '资阳', '资阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430903', '430900', '3', '赫山', '赫山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('430921', '430900', '3', '南县', '南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430922', '430900', '3', '桃江', '桃江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430923', '430900', '3', '安化', '安化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('430981', '430900', '3', '沅江', '沅江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('431000', '430000', '2', '郴州', '郴州市', 'chenzhou', '0');
INSERT INTO `logistics_pca` VALUES ('431002', '431000', '3', '北湖', '北湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('431003', '431000', '3', '苏仙', '苏仙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('431021', '431000', '3', '桂阳', '桂阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431022', '431000', '3', '宜章', '宜章县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431023', '431000', '3', '永兴', '永兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431024', '431000', '3', '嘉禾', '嘉禾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431025', '431000', '3', '临武', '临武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431026', '431000', '3', '汝城', '汝城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431027', '431000', '3', '桂东', '桂东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431028', '431000', '3', '安仁', '安仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431081', '431000', '3', '资兴', '资兴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('431100', '430000', '2', '永州', '永州市', 'yongzhou', '0');
INSERT INTO `logistics_pca` VALUES ('431102', '431100', '3', '零陵', '零陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('431103', '431100', '3', '冷水滩', '冷水滩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('431121', '431100', '3', '祁阳', '祁阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431122', '431100', '3', '东安', '东安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431123', '431100', '3', '双牌', '双牌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431124', '431100', '3', '道县', '道县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431125', '431100', '3', '江永', '江永县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431126', '431100', '3', '宁远', '宁远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431127', '431100', '3', '蓝山', '蓝山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431128', '431100', '3', '新田', '新田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431129', '431100', '3', '江华', '江华瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431200', '430000', '2', '怀化', '怀化市', 'huaihua', '0');
INSERT INTO `logistics_pca` VALUES ('431202', '431200', '3', '鹤城', '鹤城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('431221', '431200', '3', '中方', '中方县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431222', '431200', '3', '沅陵', '沅陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431223', '431200', '3', '辰溪', '辰溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431224', '431200', '3', '溆浦', '溆浦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431225', '431200', '3', '会同', '会同县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431226', '431200', '3', '麻阳', '麻阳苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431227', '431200', '3', '新晃', '新晃侗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431228', '431200', '3', '芷江', '芷江侗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431229', '431200', '3', '靖州', '靖州苗族侗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431230', '431200', '3', '通道', '通道侗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431281', '431200', '3', '洪江', '洪江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('431300', '430000', '2', '娄底', '娄底市', 'loudi', '0');
INSERT INTO `logistics_pca` VALUES ('431302', '431300', '3', '娄星', '娄星区', '', '0');
INSERT INTO `logistics_pca` VALUES ('431321', '431300', '3', '双峰', '双峰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431322', '431300', '3', '新化', '新化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('431381', '431300', '3', '冷水江', '冷水江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('431382', '431300', '3', '涟源', '涟源市', '', '0');
INSERT INTO `logistics_pca` VALUES ('433100', '430000', '2', '湘西', '湘西土家族苗族自治州', 'xiangxi', '0');
INSERT INTO `logistics_pca` VALUES ('433101', '433100', '3', '吉首', '吉首市', '', '0');
INSERT INTO `logistics_pca` VALUES ('433122', '433100', '3', '泸溪', '泸溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('433123', '433100', '3', '凤凰', '凤凰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('433124', '433100', '3', '花垣', '花垣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('433125', '433100', '3', '保靖', '保靖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('433126', '433100', '3', '古丈', '古丈县', '', '0');
INSERT INTO `logistics_pca` VALUES ('433127', '433100', '3', '永顺', '永顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('433130', '433100', '3', '龙山', '龙山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440000', '0', '1', '广东', '广东省', '', '0');
INSERT INTO `logistics_pca` VALUES ('440100', '440000', '2', '广州', '广州市', 'guangzhou', '0');
INSERT INTO `logistics_pca` VALUES ('440103', '440100', '3', '荔湾', '荔湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440104', '440100', '3', '越秀', '越秀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440105', '440100', '3', '海珠', '海珠区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440106', '440100', '3', '天河', '天河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440111', '440100', '3', '白云', '白云区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440112', '440100', '3', '黄埔', '黄埔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440113', '440100', '3', '番禺', '番禺区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440114', '440100', '3', '花都', '花都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440115', '440100', '3', '南沙', '南沙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440117', '440100', '3', '从化', '从化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440118', '440100', '3', '增城', '增城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440200', '440000', '2', '韶关', '韶关市', 'shaoguan', '0');
INSERT INTO `logistics_pca` VALUES ('440203', '440200', '3', '武江', '武江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440204', '440200', '3', '浈江', '浈江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440205', '440200', '3', '曲江', '曲江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440222', '440200', '3', '始兴', '始兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440224', '440200', '3', '仁化', '仁化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440229', '440200', '3', '翁源', '翁源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440232', '440200', '3', '乳源', '乳源瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440233', '440200', '3', '新丰', '新丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440281', '440200', '3', '乐昌', '乐昌市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440282', '440200', '3', '南雄', '南雄市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440300', '440000', '2', '深圳', '深圳市', 'shenzhen', '0');
INSERT INTO `logistics_pca` VALUES ('440303', '440300', '3', '罗湖', '罗湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440304', '440300', '3', '福田', '福田区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440305', '440300', '3', '南山', '南山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440306', '440300', '3', '宝安', '宝安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440307', '440300', '3', '龙岗', '龙岗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440308', '440300', '3', '盐田', '盐田区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440309', '440300', '3', '光明新区', '光明新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440310', '440300', '3', '坪山新区', '坪山新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440311', '440300', '3', '大鹏新区', '大鹏新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440312', '440300', '3', '龙华新区', '龙华新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440400', '440000', '2', '珠海', '珠海市', 'zhuhai', '0');
INSERT INTO `logistics_pca` VALUES ('440402', '440400', '3', '香洲', '香洲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440403', '440400', '3', '斗门', '斗门区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440404', '440400', '3', '金湾', '金湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440500', '440000', '2', '汕头', '汕头市', 'shantou', '0');
INSERT INTO `logistics_pca` VALUES ('440507', '440500', '3', '龙湖', '龙湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440511', '440500', '3', '金平', '金平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440512', '440500', '3', '濠江', '濠江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440513', '440500', '3', '潮阳', '潮阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440514', '440500', '3', '潮南', '潮南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440515', '440500', '3', '澄海', '澄海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440523', '440500', '3', '南澳', '南澳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440600', '440000', '2', '佛山', '佛山市', 'foshan', '0');
INSERT INTO `logistics_pca` VALUES ('440604', '440600', '3', '禅城', '禅城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440605', '440600', '3', '南海', '南海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440606', '440600', '3', '顺德', '顺德区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440607', '440600', '3', '三水', '三水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440608', '440600', '3', '高明', '高明区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440700', '440000', '2', '江门', '江门市', 'jiangmen', '0');
INSERT INTO `logistics_pca` VALUES ('440703', '440700', '3', '蓬江', '蓬江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440704', '440700', '3', '江海', '江海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440705', '440700', '3', '新会', '新会区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440781', '440700', '3', '台山', '台山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440783', '440700', '3', '开平', '开平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440784', '440700', '3', '鹤山', '鹤山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440785', '440700', '3', '恩平', '恩平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440800', '440000', '2', '湛江', '湛江市', 'zhanjiang', '0');
INSERT INTO `logistics_pca` VALUES ('440802', '440800', '3', '赤坎', '赤坎区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440803', '440800', '3', '霞山', '霞山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440804', '440800', '3', '坡头', '坡头区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440811', '440800', '3', '麻章', '麻章区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440823', '440800', '3', '遂溪', '遂溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440825', '440800', '3', '徐闻', '徐闻县', '', '0');
INSERT INTO `logistics_pca` VALUES ('440881', '440800', '3', '廉江', '廉江市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440882', '440800', '3', '雷州', '雷州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440883', '440800', '3', '吴川', '吴川市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440900', '440000', '2', '茂名', '茂名市', 'maoming', '0');
INSERT INTO `logistics_pca` VALUES ('440902', '440900', '3', '茂南', '茂南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440904', '440900', '3', '电白', '电白区', '', '0');
INSERT INTO `logistics_pca` VALUES ('440981', '440900', '3', '高州', '高州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440982', '440900', '3', '化州', '化州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('440983', '440900', '3', '信宜', '信宜市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441200', '440000', '2', '肇庆', '肇庆市', 'zhaoqing', '0');
INSERT INTO `logistics_pca` VALUES ('441202', '441200', '3', '端州', '端州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441203', '441200', '3', '鼎湖', '鼎湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441223', '441200', '3', '广宁', '广宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441224', '441200', '3', '怀集', '怀集县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441225', '441200', '3', '封开', '封开县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441226', '441200', '3', '德庆', '德庆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441283', '441200', '3', '高要', '高要市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441284', '441200', '3', '四会', '四会市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441300', '440000', '2', '惠州', '惠州市', 'huizhou', '0');
INSERT INTO `logistics_pca` VALUES ('441302', '441300', '3', '惠城', '惠城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441303', '441300', '3', '惠阳', '惠阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441322', '441300', '3', '博罗', '博罗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441323', '441300', '3', '惠东', '惠东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441324', '441300', '3', '龙门', '龙门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441400', '440000', '2', '梅州', '梅州市', 'meizhou', '0');
INSERT INTO `logistics_pca` VALUES ('441402', '441400', '3', '梅江', '梅江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441403', '441400', '3', '梅县', '梅县区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441422', '441400', '3', '大埔', '大埔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441423', '441400', '3', '丰顺', '丰顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441424', '441400', '3', '五华', '五华县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441426', '441400', '3', '平远', '平远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441427', '441400', '3', '蕉岭', '蕉岭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441481', '441400', '3', '兴宁', '兴宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441500', '440000', '2', '汕尾', '汕尾市', 'shanwei', '0');
INSERT INTO `logistics_pca` VALUES ('441502', '441500', '3', '城区', '城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441521', '441500', '3', '海丰', '海丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441523', '441500', '3', '陆河', '陆河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441581', '441500', '3', '陆丰', '陆丰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441600', '440000', '2', '河源', '河源市', 'heyuan', '0');
INSERT INTO `logistics_pca` VALUES ('441602', '441600', '3', '源城', '源城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441621', '441600', '3', '紫金', '紫金县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441622', '441600', '3', '龙川', '龙川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441623', '441600', '3', '连平', '连平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441624', '441600', '3', '和平', '和平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441625', '441600', '3', '东源', '东源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441700', '440000', '2', '阳江', '阳江市', 'yangjiang', '0');
INSERT INTO `logistics_pca` VALUES ('441702', '441700', '3', '江城', '江城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441704', '441700', '3', '阳东', '阳东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441721', '441700', '3', '阳西', '阳西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441781', '441700', '3', '阳春', '阳春市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441800', '440000', '2', '清远', '清远市', 'qingyuan', '0');
INSERT INTO `logistics_pca` VALUES ('441802', '441800', '3', '清城', '清城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441803', '441800', '3', '清新', '清新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441821', '441800', '3', '佛冈', '佛冈县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441823', '441800', '3', '阳山', '阳山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441825', '441800', '3', '连山', '连山壮族瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441826', '441800', '3', '连南', '连南瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('441881', '441800', '3', '英德', '英德市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441882', '441800', '3', '连州', '连州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('441900', '440000', '2', '东莞', '东莞市', 'dongwan', '0');
INSERT INTO `logistics_pca` VALUES ('441901', '441900', '3', '莞城', '莞城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441902', '441900', '3', '南城', '南城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441904', '441900', '3', '万江', '万江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('441905', '441900', '3', '石碣', '石碣镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441906', '441900', '3', '石龙', '石龙镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441907', '441900', '3', '茶山', '茶山镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441908', '441900', '3', '石排', '石排镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441909', '441900', '3', '企石', '企石镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441910', '441900', '3', '横沥', '横沥镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441911', '441900', '3', '桥头', '桥头镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441912', '441900', '3', '谢岗', '谢岗镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441913', '441900', '3', '东坑', '东坑镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441914', '441900', '3', '常平', '常平镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441915', '441900', '3', '寮步', '寮步镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441916', '441900', '3', '大朗', '大朗镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441917', '441900', '3', '麻涌', '麻涌镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441918', '441900', '3', '中堂', '中堂镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441919', '441900', '3', '高埗', '高埗镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441920', '441900', '3', '樟木头', '樟木头镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441921', '441900', '3', '大岭山', '大岭山镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441922', '441900', '3', '望牛墩', '望牛墩镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441923', '441900', '3', '黄江', '黄江镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441924', '441900', '3', '洪梅', '洪梅镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441925', '441900', '3', '清溪', '清溪镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441926', '441900', '3', '沙田', '沙田镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441927', '441900', '3', '道滘', '道滘镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441928', '441900', '3', '塘厦', '塘厦镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441929', '441900', '3', '虎门', '虎门镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441930', '441900', '3', '厚街', '厚街镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441931', '441900', '3', '凤岗', '凤岗镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('441932', '441900', '3', '长安', '长安镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442000', '440000', '2', '中山', '中山市', 'zhongshan', '0');
INSERT INTO `logistics_pca` VALUES ('442001', '442000', '3', '石岐', '石岐区', '', '0');
INSERT INTO `logistics_pca` VALUES ('442004', '442000', '3', '南区', '南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('442005', '442000', '3', '五桂山', '五桂山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('442006', '442000', '3', '火炬', '火炬开发区', '', '0');
INSERT INTO `logistics_pca` VALUES ('442007', '442000', '3', '黄圃', '黄圃镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442008', '442000', '3', '南头', '南头镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442009', '442000', '3', '东凤', '东凤镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442010', '442000', '3', '阜沙', '阜沙镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442011', '442000', '3', '小榄', '小榄镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442012', '442000', '3', '东升', '东升镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442013', '442000', '3', '古镇', '古镇镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442014', '442000', '3', '横栏', '横栏镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442015', '442000', '3', '三角', '三角镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442016', '442000', '3', '民众', '民众镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442017', '442000', '3', '南朗', '南朗镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442018', '442000', '3', '港口', '港口镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442019', '442000', '3', '大涌', '大涌镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442020', '442000', '3', '沙溪', '沙溪镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442021', '442000', '3', '三乡', '三乡镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442022', '442000', '3', '板芙', '板芙镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442023', '442000', '3', '神湾', '神湾镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('442024', '442000', '3', '坦洲', '坦洲镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('445100', '440000', '2', '潮州', '潮州市', 'chaozhou', '0');
INSERT INTO `logistics_pca` VALUES ('445102', '445100', '3', '湘桥', '湘桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('445103', '445100', '3', '潮安', '潮安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('445122', '445100', '3', '饶平', '饶平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('445200', '440000', '2', '揭阳', '揭阳市', 'jieyang', '0');
INSERT INTO `logistics_pca` VALUES ('445202', '445200', '3', '榕城', '榕城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('445203', '445200', '3', '揭东', '揭东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('445222', '445200', '3', '揭西', '揭西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('445224', '445200', '3', '惠来', '惠来县', '', '0');
INSERT INTO `logistics_pca` VALUES ('445281', '445200', '3', '普宁', '普宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('445300', '440000', '2', '云浮', '云浮市', 'yunfu', '0');
INSERT INTO `logistics_pca` VALUES ('445302', '445300', '3', '云城', '云城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('445303', '445300', '3', '云安', '云安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('445321', '445300', '3', '新兴', '新兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('445322', '445300', '3', '郁南', '郁南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('445381', '445300', '3', '罗定', '罗定市', '', '0');
INSERT INTO `logistics_pca` VALUES ('450000', '0', '1', '广西', '广西壮族自治区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450100', '450000', '2', '南宁', '南宁市', 'nanning', '0');
INSERT INTO `logistics_pca` VALUES ('450102', '450100', '3', '兴宁', '兴宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450103', '450100', '3', '青秀', '青秀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450105', '450100', '3', '江南', '江南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450107', '450100', '3', '西乡塘', '西乡塘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450108', '450100', '3', '良庆', '良庆区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450109', '450100', '3', '邕宁', '邕宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450122', '450100', '3', '武鸣', '武鸣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450123', '450100', '3', '隆安', '隆安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450124', '450100', '3', '马山', '马山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450125', '450100', '3', '上林', '上林县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450126', '450100', '3', '宾阳', '宾阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450127', '450100', '3', '横县', '横县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450128', '450100', '3', '埌东', '埌东新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450200', '450000', '2', '柳州', '柳州市', 'liuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('450202', '450200', '3', '城中', '城中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450203', '450200', '3', '鱼峰', '鱼峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450204', '450200', '3', '柳南', '柳南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450205', '450200', '3', '柳北', '柳北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450221', '450200', '3', '柳江', '柳江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450222', '450200', '3', '柳城', '柳城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450223', '450200', '3', '鹿寨', '鹿寨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450224', '450200', '3', '融安', '融安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450225', '450200', '3', '融水', '融水苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450226', '450200', '3', '三江', '三江侗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450227', '450200', '3', '柳东', '柳东新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450300', '450000', '2', '桂林', '桂林市', 'guilin', '0');
INSERT INTO `logistics_pca` VALUES ('450302', '450300', '3', '秀峰', '秀峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450303', '450300', '3', '叠彩', '叠彩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450304', '450300', '3', '象山', '象山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450305', '450300', '3', '七星', '七星区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450311', '450300', '3', '雁山', '雁山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450312', '450300', '3', '临桂', '临桂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450321', '450300', '3', '阳朔', '阳朔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450323', '450300', '3', '灵川', '灵川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450324', '450300', '3', '全州', '全州县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450325', '450300', '3', '兴安', '兴安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450326', '450300', '3', '永福', '永福县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450327', '450300', '3', '灌阳', '灌阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450328', '450300', '3', '龙胜', '龙胜各族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450329', '450300', '3', '资源', '资源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450330', '450300', '3', '平乐', '平乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450331', '450300', '3', '荔浦', '荔浦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450332', '450300', '3', '恭城', '恭城瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450400', '450000', '2', '梧州', '梧州市', 'wuzhou', '0');
INSERT INTO `logistics_pca` VALUES ('450403', '450400', '3', '万秀', '万秀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450405', '450400', '3', '长洲', '长洲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450406', '450400', '3', '龙圩', '龙圩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450421', '450400', '3', '苍梧', '苍梧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450422', '450400', '3', '藤县', '藤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450423', '450400', '3', '蒙山', '蒙山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450481', '450400', '3', '岑溪', '岑溪市', '', '0');
INSERT INTO `logistics_pca` VALUES ('450500', '450000', '2', '北海', '北海市', 'beihai', '0');
INSERT INTO `logistics_pca` VALUES ('450502', '450500', '3', '海城', '海城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450503', '450500', '3', '银海', '银海区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450512', '450500', '3', '铁山港', '铁山港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450521', '450500', '3', '合浦', '合浦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450600', '450000', '2', '防城港', '防城港市', 'fangchenggang', '0');
INSERT INTO `logistics_pca` VALUES ('450602', '450600', '3', '港口', '港口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450603', '450600', '3', '防城', '防城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450621', '450600', '3', '上思', '上思县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450681', '450600', '3', '东兴', '东兴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('450700', '450000', '2', '钦州', '钦州市', 'qinzhou', '0');
INSERT INTO `logistics_pca` VALUES ('450702', '450700', '3', '钦南', '钦南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450703', '450700', '3', '钦北', '钦北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450721', '450700', '3', '灵山', '灵山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450722', '450700', '3', '浦北', '浦北县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450800', '450000', '2', '贵港', '贵港市', 'guigang', '0');
INSERT INTO `logistics_pca` VALUES ('450802', '450800', '3', '港北', '港北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450803', '450800', '3', '港南', '港南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450804', '450800', '3', '覃塘', '覃塘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450821', '450800', '3', '平南', '平南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450881', '450800', '3', '桂平', '桂平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('450900', '450000', '2', '玉林', '玉林市', 'yulin', '0');
INSERT INTO `logistics_pca` VALUES ('450902', '450900', '3', '玉州', '玉州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450903', '450900', '3', '福绵', '福绵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450904', '450900', '3', '玉东', '玉东新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('450921', '450900', '3', '容县', '容县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450922', '450900', '3', '陆川', '陆川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450923', '450900', '3', '博白', '博白县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450924', '450900', '3', '兴业', '兴业县', '', '0');
INSERT INTO `logistics_pca` VALUES ('450981', '450900', '3', '北流', '北流市', '', '0');
INSERT INTO `logistics_pca` VALUES ('451000', '450000', '2', '百色', '百色市', 'baise', '0');
INSERT INTO `logistics_pca` VALUES ('451002', '451000', '3', '右江', '右江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('451021', '451000', '3', '田阳', '田阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451022', '451000', '3', '田东', '田东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451023', '451000', '3', '平果', '平果县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451024', '451000', '3', '德保', '德保县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451025', '451000', '3', '靖西', '靖西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451026', '451000', '3', '那坡', '那坡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451027', '451000', '3', '凌云', '凌云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451028', '451000', '3', '乐业', '乐业县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451029', '451000', '3', '田林', '田林县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451030', '451000', '3', '西林', '西林县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451031', '451000', '3', '隆林', '隆林各族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451100', '450000', '2', '贺州', '贺州市', 'hezhou', '0');
INSERT INTO `logistics_pca` VALUES ('451102', '451100', '3', '八步', '八步区', '', '0');
INSERT INTO `logistics_pca` VALUES ('451121', '451100', '3', '昭平', '昭平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451122', '451100', '3', '钟山', '钟山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451123', '451100', '3', '富川', '富川瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451124', '451100', '3', '平桂', '平桂管理区', '', '0');
INSERT INTO `logistics_pca` VALUES ('451200', '450000', '2', '河池', '河池市', 'hechi', '0');
INSERT INTO `logistics_pca` VALUES ('451202', '451200', '3', '金城江', '金城江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('451221', '451200', '3', '南丹', '南丹县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451222', '451200', '3', '天峨', '天峨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451223', '451200', '3', '凤山', '凤山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451224', '451200', '3', '东兰', '东兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451225', '451200', '3', '罗城', '罗城仫佬族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451226', '451200', '3', '环江', '环江毛南族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451227', '451200', '3', '巴马', '巴马瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451228', '451200', '3', '都安', '都安瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451229', '451200', '3', '大化', '大化瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451281', '451200', '3', '宜州', '宜州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('451300', '450000', '2', '来宾', '来宾市', 'laibin', '0');
INSERT INTO `logistics_pca` VALUES ('451302', '451300', '3', '兴宾', '兴宾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('451321', '451300', '3', '忻城', '忻城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451322', '451300', '3', '象州', '象州县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451323', '451300', '3', '武宣', '武宣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451324', '451300', '3', '金秀', '金秀瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451381', '451300', '3', '合山', '合山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('451400', '450000', '2', '崇左', '崇左市', 'chongzuo', '0');
INSERT INTO `logistics_pca` VALUES ('451402', '451400', '3', '江州', '江州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('451421', '451400', '3', '扶绥', '扶绥县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451422', '451400', '3', '宁明', '宁明县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451423', '451400', '3', '龙州', '龙州县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451424', '451400', '3', '大新', '大新县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451425', '451400', '3', '天等', '天等县', '', '0');
INSERT INTO `logistics_pca` VALUES ('451481', '451400', '3', '凭祥', '凭祥市', '', '0');
INSERT INTO `logistics_pca` VALUES ('460000', '0', '1', '海南', '海南省', '', '0');
INSERT INTO `logistics_pca` VALUES ('460100', '460000', '2', '海口', '海口市', 'haikou', '0');
INSERT INTO `logistics_pca` VALUES ('460105', '460100', '3', '秀英', '秀英区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460106', '460100', '3', '龙华', '龙华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460107', '460100', '3', '琼山', '琼山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460108', '460100', '3', '美兰', '美兰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460200', '460000', '2', '三亚', '三亚市', 'sanya', '0');
INSERT INTO `logistics_pca` VALUES ('460202', '460200', '3', '海棠', '海棠区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460203', '460200', '3', '吉阳', '吉阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460204', '460200', '3', '天涯', '天涯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460205', '460200', '3', '崖州', '崖州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('460300', '460000', '2', '三沙', '三沙市', 'sansha', '0');
INSERT INTO `logistics_pca` VALUES ('460321', '460300', '3', '西沙', '西沙群岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('460322', '460300', '3', '南沙', '南沙群岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('460323', '460300', '3', '中沙', '中沙群岛', '', '0');
INSERT INTO `logistics_pca` VALUES ('469001', '469000', '3', '五指山', '五指山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('469002', '469000', '3', '琼海', '琼海市', '', '0');
INSERT INTO `logistics_pca` VALUES ('469003', '469000', '3', '儋州', '儋州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('469005', '469000', '3', '文昌', '文昌市', '', '0');
INSERT INTO `logistics_pca` VALUES ('469006', '469000', '3', '万宁', '万宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('469007', '469000', '3', '东方', '东方市', '', '0');
INSERT INTO `logistics_pca` VALUES ('469021', '469000', '3', '定安', '定安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469022', '469000', '3', '屯昌', '屯昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469023', '469000', '3', '澄迈', '澄迈县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469024', '469000', '3', '临高', '临高县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469025', '469000', '3', '白沙', '白沙黎族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469026', '469000', '3', '昌江', '昌江黎族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469027', '469000', '3', '乐东', '乐东黎族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469028', '469000', '3', '陵水', '陵水黎族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469029', '469000', '3', '保亭', '保亭黎族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('469030', '469000', '3', '琼中', '琼中黎族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500000', '0', '1', '重庆', '重庆', '', '0');
INSERT INTO `logistics_pca` VALUES ('500100', '500000', '2', '重庆', '重庆市', 'chongqing', '0');
INSERT INTO `logistics_pca` VALUES ('500101', '500100', '3', '万州', '万州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500102', '500100', '3', '涪陵', '涪陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500103', '500100', '3', '渝中', '渝中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500104', '500100', '3', '大渡口', '大渡口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500105', '500100', '3', '江北', '江北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500106', '500100', '3', '沙坪坝', '沙坪坝区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500107', '500100', '3', '九龙坡', '九龙坡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500108', '500100', '3', '南岸', '南岸区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500109', '500100', '3', '北碚', '北碚区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500110', '500100', '3', '綦江', '綦江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500111', '500100', '3', '大足', '大足区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500112', '500100', '3', '渝北', '渝北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500113', '500100', '3', '巴南', '巴南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500114', '500100', '3', '黔江', '黔江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500115', '500100', '3', '长寿', '长寿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500116', '500100', '3', '江津', '江津区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500117', '500100', '3', '合川', '合川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500118', '500100', '3', '永川', '永川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500119', '500100', '3', '南川', '南川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500120', '500100', '3', '璧山', '璧山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500151', '500100', '3', '铜梁', '铜梁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500223', '500100', '3', '潼南', '潼南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500226', '500100', '3', '荣昌', '荣昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500228', '500100', '3', '梁平', '梁平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500229', '500100', '3', '城口', '城口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500230', '500100', '3', '丰都', '丰都县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500231', '500100', '3', '垫江', '垫江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500232', '500100', '3', '武隆', '武隆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500233', '500100', '3', '忠县', '忠县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500234', '500100', '3', '开县', '开县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500235', '500100', '3', '云阳', '云阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500236', '500100', '3', '奉节', '奉节县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500237', '500100', '3', '巫山', '巫山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500238', '500100', '3', '巫溪', '巫溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500240', '500100', '3', '石柱', '石柱土家族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500241', '500100', '3', '秀山', '秀山土家族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500242', '500100', '3', '酉阳', '酉阳土家族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500243', '500100', '3', '彭水', '彭水苗族土家族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('500300', '500000', '2', '两江新区', '两江新区', 'liangjiangxinqu', '0');
INSERT INTO `logistics_pca` VALUES ('500301', '500300', '3', '北部新区', '北部新区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500302', '500300', '3', '保税港区', '保税港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('500303', '500300', '3', '工业园区', '工业园区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510000', '0', '1', '四川', '四川省', '', '0');
INSERT INTO `logistics_pca` VALUES ('510100', '510000', '2', '成都', '成都市', 'chengdou', '0');
INSERT INTO `logistics_pca` VALUES ('510104', '510100', '3', '锦江', '锦江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510105', '510100', '3', '青羊', '青羊区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510106', '510100', '3', '金牛', '金牛区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510107', '510100', '3', '武侯', '武侯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510108', '510100', '3', '成华', '成华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510112', '510100', '3', '龙泉驿', '龙泉驿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510113', '510100', '3', '青白江', '青白江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510114', '510100', '3', '新都', '新都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510115', '510100', '3', '温江', '温江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510121', '510100', '3', '金堂', '金堂县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510122', '510100', '3', '双流', '双流县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510124', '510100', '3', '郫县', '郫县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510129', '510100', '3', '大邑', '大邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510131', '510100', '3', '蒲江', '蒲江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510132', '510100', '3', '新津', '新津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510181', '510100', '3', '都江堰', '都江堰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510182', '510100', '3', '彭州', '彭州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510183', '510100', '3', '邛崃', '邛崃市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510184', '510100', '3', '崇州', '崇州市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510300', '510000', '2', '自贡', '自贡市', 'zigong', '0');
INSERT INTO `logistics_pca` VALUES ('510302', '510300', '3', '自流井', '自流井区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510303', '510300', '3', '贡井', '贡井区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510304', '510300', '3', '大安', '大安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510311', '510300', '3', '沿滩', '沿滩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510321', '510300', '3', '荣县', '荣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510322', '510300', '3', '富顺', '富顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510400', '510000', '2', '攀枝花', '攀枝花市', 'panzhihua', '0');
INSERT INTO `logistics_pca` VALUES ('510402', '510400', '3', '东区', '东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510403', '510400', '3', '西区', '西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510411', '510400', '3', '仁和', '仁和区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510421', '510400', '3', '米易', '米易县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510422', '510400', '3', '盐边', '盐边县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510500', '510000', '2', '泸州', '泸州市', 'luzhou', '0');
INSERT INTO `logistics_pca` VALUES ('510502', '510500', '3', '江阳', '江阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510503', '510500', '3', '纳溪', '纳溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510504', '510500', '3', '龙马潭', '龙马潭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510521', '510500', '3', '泸县', '泸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510522', '510500', '3', '合江', '合江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510524', '510500', '3', '叙永', '叙永县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510525', '510500', '3', '古蔺', '古蔺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510600', '510000', '2', '德阳', '德阳市', 'deyang', '0');
INSERT INTO `logistics_pca` VALUES ('510603', '510600', '3', '旌阳', '旌阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510623', '510600', '3', '中江', '中江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510626', '510600', '3', '罗江', '罗江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510681', '510600', '3', '广汉', '广汉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510682', '510600', '3', '什邡', '什邡市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510683', '510600', '3', '绵竹', '绵竹市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510700', '510000', '2', '绵阳', '绵阳市', 'mianyang', '0');
INSERT INTO `logistics_pca` VALUES ('510703', '510700', '3', '涪城', '涪城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510704', '510700', '3', '游仙', '游仙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510722', '510700', '3', '三台', '三台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510723', '510700', '3', '盐亭', '盐亭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510724', '510700', '3', '安县', '安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510725', '510700', '3', '梓潼', '梓潼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510726', '510700', '3', '北川', '北川羌族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510727', '510700', '3', '平武', '平武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510781', '510700', '3', '江油', '江油市', '', '0');
INSERT INTO `logistics_pca` VALUES ('510800', '510000', '2', '广元', '广元市', 'guangyuan', '0');
INSERT INTO `logistics_pca` VALUES ('510802', '510800', '3', '利州', '利州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510811', '510800', '3', '昭化', '昭化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510812', '510800', '3', '朝天', '朝天区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510821', '510800', '3', '旺苍', '旺苍县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510822', '510800', '3', '青川', '青川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510823', '510800', '3', '剑阁', '剑阁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510824', '510800', '3', '苍溪', '苍溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510900', '510000', '2', '遂宁', '遂宁市', 'suining', '0');
INSERT INTO `logistics_pca` VALUES ('510903', '510900', '3', '船山', '船山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510904', '510900', '3', '安居', '安居区', '', '0');
INSERT INTO `logistics_pca` VALUES ('510921', '510900', '3', '蓬溪', '蓬溪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510922', '510900', '3', '射洪', '射洪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('510923', '510900', '3', '大英', '大英县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511000', '510000', '2', '内江', '内江市', 'neijiang', '0');
INSERT INTO `logistics_pca` VALUES ('511002', '511000', '3', '市中区', '市中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511011', '511000', '3', '东兴', '东兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511024', '511000', '3', '威远', '威远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511025', '511000', '3', '资中', '资中县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511028', '511000', '3', '隆昌', '隆昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511100', '510000', '2', '乐山', '乐山市', 'leshan', '0');
INSERT INTO `logistics_pca` VALUES ('511102', '511100', '3', '市中区', '市中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511111', '511100', '3', '沙湾', '沙湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511112', '511100', '3', '五通桥', '五通桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511113', '511100', '3', '金口河', '金口河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511123', '511100', '3', '犍为', '犍为县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511124', '511100', '3', '井研', '井研县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511126', '511100', '3', '夹江', '夹江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511129', '511100', '3', '沐川', '沐川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511132', '511100', '3', '峨边', '峨边彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511133', '511100', '3', '马边', '马边彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511181', '511100', '3', '峨眉山', '峨眉山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('511300', '510000', '2', '南充', '南充市', 'nanchong', '0');
INSERT INTO `logistics_pca` VALUES ('511302', '511300', '3', '顺庆', '顺庆区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511303', '511300', '3', '高坪', '高坪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511304', '511300', '3', '嘉陵', '嘉陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511321', '511300', '3', '南部', '南部县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511322', '511300', '3', '营山', '营山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511323', '511300', '3', '蓬安', '蓬安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511324', '511300', '3', '仪陇', '仪陇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511325', '511300', '3', '西充', '西充县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511381', '511300', '3', '阆中', '阆中市', '', '0');
INSERT INTO `logistics_pca` VALUES ('511400', '510000', '2', '眉山', '眉山市', 'meishan', '0');
INSERT INTO `logistics_pca` VALUES ('511402', '511400', '3', '东坡', '东坡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511403', '511400', '3', '彭山', '彭山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511421', '511400', '3', '仁寿', '仁寿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511423', '511400', '3', '洪雅', '洪雅县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511424', '511400', '3', '丹棱', '丹棱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511425', '511400', '3', '青神', '青神县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511500', '510000', '2', '宜宾', '宜宾市', 'yibin', '0');
INSERT INTO `logistics_pca` VALUES ('511502', '511500', '3', '翠屏', '翠屏区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511503', '511500', '3', '南溪', '南溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511521', '511500', '3', '宜宾', '宜宾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511523', '511500', '3', '江安', '江安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511524', '511500', '3', '长宁', '长宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511525', '511500', '3', '高县', '高县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511526', '511500', '3', '珙县', '珙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511527', '511500', '3', '筠连', '筠连县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511528', '511500', '3', '兴文', '兴文县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511529', '511500', '3', '屏山', '屏山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511600', '510000', '2', '广安', '广安市', 'guangan', '0');
INSERT INTO `logistics_pca` VALUES ('511602', '511600', '3', '广安', '广安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511603', '511600', '3', '前锋', '前锋区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511621', '511600', '3', '岳池', '岳池县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511622', '511600', '3', '武胜', '武胜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511623', '511600', '3', '邻水', '邻水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511681', '511600', '3', '华蓥', '华蓥市', '', '0');
INSERT INTO `logistics_pca` VALUES ('511700', '510000', '2', '达州', '达州市', 'dazhou', '0');
INSERT INTO `logistics_pca` VALUES ('511702', '511700', '3', '通川', '通川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511703', '511700', '3', '达川', '达川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511722', '511700', '3', '宣汉', '宣汉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511723', '511700', '3', '开江', '开江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511724', '511700', '3', '大竹', '大竹县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511725', '511700', '3', '渠县', '渠县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511781', '511700', '3', '万源', '万源市', '', '0');
INSERT INTO `logistics_pca` VALUES ('511800', '510000', '2', '雅安', '雅安市', 'yaan', '0');
INSERT INTO `logistics_pca` VALUES ('511802', '511800', '3', '雨城', '雨城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511803', '511800', '3', '名山', '名山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511822', '511800', '3', '荥经', '荥经县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511823', '511800', '3', '汉源', '汉源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511824', '511800', '3', '石棉', '石棉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511825', '511800', '3', '天全', '天全县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511826', '511800', '3', '芦山', '芦山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511827', '511800', '3', '宝兴', '宝兴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511900', '510000', '2', '巴中', '巴中市', 'bazhong', '0');
INSERT INTO `logistics_pca` VALUES ('511902', '511900', '3', '巴州', '巴州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511903', '511900', '3', '恩阳', '恩阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('511921', '511900', '3', '通江', '通江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511922', '511900', '3', '南江', '南江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('511923', '511900', '3', '平昌', '平昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('512000', '510000', '2', '资阳', '资阳市', 'ziyang', '0');
INSERT INTO `logistics_pca` VALUES ('512002', '512000', '3', '雁江', '雁江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('512021', '512000', '3', '安岳', '安岳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('512022', '512000', '3', '乐至', '乐至县', '', '0');
INSERT INTO `logistics_pca` VALUES ('512081', '512000', '3', '简阳', '简阳市', '', '0');
INSERT INTO `logistics_pca` VALUES ('513200', '510000', '2', '阿坝', '阿坝藏族羌族自治州', 'aba', '0');
INSERT INTO `logistics_pca` VALUES ('513221', '513200', '3', '汶川', '汶川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513222', '513200', '3', '理县', '理县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513223', '513200', '3', '茂县', '茂县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513224', '513200', '3', '松潘', '松潘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513225', '513200', '3', '九寨沟', '九寨沟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513226', '513200', '3', '金川', '金川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513227', '513200', '3', '小金', '小金县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513228', '513200', '3', '黑水', '黑水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513229', '513200', '3', '马尔康', '马尔康县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513230', '513200', '3', '壤塘', '壤塘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513231', '513200', '3', '阿坝', '阿坝县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513232', '513200', '3', '若尔盖', '若尔盖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513233', '513200', '3', '红原', '红原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513300', '510000', '2', '甘孜', '甘孜藏族自治州', 'ganzi', '0');
INSERT INTO `logistics_pca` VALUES ('513321', '513300', '3', '康定', '康定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513322', '513300', '3', '泸定', '泸定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513323', '513300', '3', '丹巴', '丹巴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513324', '513300', '3', '九龙', '九龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513325', '513300', '3', '雅江', '雅江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513326', '513300', '3', '道孚', '道孚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513327', '513300', '3', '炉霍', '炉霍县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513328', '513300', '3', '甘孜', '甘孜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513329', '513300', '3', '新龙', '新龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513330', '513300', '3', '德格', '德格县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513331', '513300', '3', '白玉', '白玉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513332', '513300', '3', '石渠', '石渠县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513333', '513300', '3', '色达', '色达县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513334', '513300', '3', '理塘', '理塘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513335', '513300', '3', '巴塘', '巴塘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513336', '513300', '3', '乡城', '乡城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513337', '513300', '3', '稻城', '稻城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513338', '513300', '3', '得荣', '得荣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513400', '510000', '2', '凉山', '凉山彝族自治州', 'liangshan', '0');
INSERT INTO `logistics_pca` VALUES ('513401', '513400', '3', '西昌', '西昌市', '', '0');
INSERT INTO `logistics_pca` VALUES ('513422', '513400', '3', '木里', '木里藏族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513423', '513400', '3', '盐源', '盐源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513424', '513400', '3', '德昌', '德昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513425', '513400', '3', '会理', '会理县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513426', '513400', '3', '会东', '会东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513427', '513400', '3', '宁南', '宁南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513428', '513400', '3', '普格', '普格县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513429', '513400', '3', '布拖', '布拖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513430', '513400', '3', '金阳', '金阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513431', '513400', '3', '昭觉', '昭觉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513432', '513400', '3', '喜德', '喜德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513433', '513400', '3', '冕宁', '冕宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513434', '513400', '3', '越西', '越西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513435', '513400', '3', '甘洛', '甘洛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513436', '513400', '3', '美姑', '美姑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('513437', '513400', '3', '雷波', '雷波县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520000', '0', '1', '贵州', '贵州省', '', '0');
INSERT INTO `logistics_pca` VALUES ('520100', '520000', '2', '贵阳', '贵阳市', 'guiyang', '0');
INSERT INTO `logistics_pca` VALUES ('520102', '520100', '3', '南明', '南明区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520103', '520100', '3', '云岩', '云岩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520111', '520100', '3', '花溪', '花溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520112', '520100', '3', '乌当', '乌当区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520113', '520100', '3', '白云', '白云区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520115', '520100', '3', '观山湖', '观山湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520121', '520100', '3', '开阳', '开阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520122', '520100', '3', '息烽', '息烽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520123', '520100', '3', '修文', '修文县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520181', '520100', '3', '清镇', '清镇市', '', '0');
INSERT INTO `logistics_pca` VALUES ('520200', '520000', '2', '六盘水', '六盘水市', 'liupanshui', '0');
INSERT INTO `logistics_pca` VALUES ('520201', '520200', '3', '钟山', '钟山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520203', '520200', '3', '六枝', '六枝特区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520221', '520200', '3', '水城', '水城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520222', '520200', '3', '盘县', '盘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520300', '520000', '2', '遵义', '遵义市', 'zunyi', '0');
INSERT INTO `logistics_pca` VALUES ('520302', '520300', '3', '红花岗', '红花岗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520303', '520300', '3', '汇川', '汇川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520321', '520300', '3', '遵义', '遵义县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520322', '520300', '3', '桐梓', '桐梓县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520323', '520300', '3', '绥阳', '绥阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520324', '520300', '3', '正安', '正安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520325', '520300', '3', '道真', '道真仡佬族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520326', '520300', '3', '务川', '务川仡佬族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520327', '520300', '3', '凤冈', '凤冈县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520328', '520300', '3', '湄潭', '湄潭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520329', '520300', '3', '余庆', '余庆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520330', '520300', '3', '习水', '习水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520381', '520300', '3', '赤水', '赤水市', '', '0');
INSERT INTO `logistics_pca` VALUES ('520382', '520300', '3', '仁怀', '仁怀市', '', '0');
INSERT INTO `logistics_pca` VALUES ('520400', '520000', '2', '安顺', '安顺市', 'anshun', '0');
INSERT INTO `logistics_pca` VALUES ('520402', '520400', '3', '西秀', '西秀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520421', '520400', '3', '平坝', '平坝区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520422', '520400', '3', '普定', '普定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520423', '520400', '3', '镇宁', '镇宁布依族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520424', '520400', '3', '关岭', '关岭布依族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520425', '520400', '3', '紫云', '紫云苗族布依族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520500', '520000', '2', '毕节', '毕节市', 'bijie', '0');
INSERT INTO `logistics_pca` VALUES ('520502', '520500', '3', '七星关', '七星关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520521', '520500', '3', '大方', '大方县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520522', '520500', '3', '黔西', '黔西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520523', '520500', '3', '金沙', '金沙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520524', '520500', '3', '织金', '织金县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520525', '520500', '3', '纳雍', '纳雍县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520526', '520500', '3', '威宁', '威宁彝族回族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520527', '520500', '3', '赫章', '赫章县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520600', '520000', '2', '铜仁', '铜仁市', 'tongren', '0');
INSERT INTO `logistics_pca` VALUES ('520602', '520600', '3', '碧江', '碧江区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520603', '520600', '3', '万山', '万山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('520621', '520600', '3', '江口', '江口县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520622', '520600', '3', '玉屏', '玉屏侗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520623', '520600', '3', '石阡', '石阡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520624', '520600', '3', '思南', '思南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520625', '520600', '3', '印江', '印江土家族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520626', '520600', '3', '德江', '德江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520627', '520600', '3', '沿河', '沿河土家族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('520628', '520600', '3', '松桃', '松桃苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522300', '520000', '2', '黔西南', '黔西南布依族苗族自治州', 'qianxinan', '0');
INSERT INTO `logistics_pca` VALUES ('522301', '522300', '3', '兴义', '兴义市 ', '', '0');
INSERT INTO `logistics_pca` VALUES ('522322', '522300', '3', '兴仁', '兴仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522323', '522300', '3', '普安', '普安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522324', '522300', '3', '晴隆', '晴隆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522325', '522300', '3', '贞丰', '贞丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522326', '522300', '3', '望谟', '望谟县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522327', '522300', '3', '册亨', '册亨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522328', '522300', '3', '安龙', '安龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522600', '520000', '2', '黔东南', '黔东南苗族侗族自治州', 'qiandongnan', '0');
INSERT INTO `logistics_pca` VALUES ('522601', '522600', '3', '凯里', '凯里市', '', '0');
INSERT INTO `logistics_pca` VALUES ('522622', '522600', '3', '黄平', '黄平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522623', '522600', '3', '施秉', '施秉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522624', '522600', '3', '三穗', '三穗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522625', '522600', '3', '镇远', '镇远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522626', '522600', '3', '岑巩', '岑巩县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522627', '522600', '3', '天柱', '天柱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522628', '522600', '3', '锦屏', '锦屏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522629', '522600', '3', '剑河', '剑河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522630', '522600', '3', '台江', '台江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522631', '522600', '3', '黎平', '黎平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522632', '522600', '3', '榕江', '榕江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522633', '522600', '3', '从江', '从江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522634', '522600', '3', '雷山', '雷山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522635', '522600', '3', '麻江', '麻江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522636', '522600', '3', '丹寨', '丹寨县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522700', '520000', '2', '黔南', '黔南布依族苗族自治州', 'qiannan', '0');
INSERT INTO `logistics_pca` VALUES ('522701', '522700', '3', '都匀', '都匀市', '', '0');
INSERT INTO `logistics_pca` VALUES ('522702', '522700', '3', '福泉', '福泉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('522722', '522700', '3', '荔波', '荔波县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522723', '522700', '3', '贵定', '贵定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522725', '522700', '3', '瓮安', '瓮安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522726', '522700', '3', '独山', '独山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522727', '522700', '3', '平塘', '平塘县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522728', '522700', '3', '罗甸', '罗甸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522729', '522700', '3', '长顺', '长顺县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522730', '522700', '3', '龙里', '龙里县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522731', '522700', '3', '惠水', '惠水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('522732', '522700', '3', '三都', '三都水族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530000', '0', '1', '云南', '云南省', '', '0');
INSERT INTO `logistics_pca` VALUES ('530100', '530000', '2', '昆明', '昆明市', 'kunming', '0');
INSERT INTO `logistics_pca` VALUES ('530102', '530100', '3', '五华', '五华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530103', '530100', '3', '盘龙', '盘龙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530111', '530100', '3', '官渡', '官渡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530112', '530100', '3', '西山', '西山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530113', '530100', '3', '东川', '东川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530114', '530100', '3', '呈贡', '呈贡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530122', '530100', '3', '晋宁', '晋宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530124', '530100', '3', '富民', '富民县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530125', '530100', '3', '宜良', '宜良县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530126', '530100', '3', '石林', '石林彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530127', '530100', '3', '嵩明', '嵩明县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530128', '530100', '3', '禄劝', '禄劝彝族苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530129', '530100', '3', '寻甸', '寻甸回族彝族自治县 ', '', '0');
INSERT INTO `logistics_pca` VALUES ('530181', '530100', '3', '安宁', '安宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('530300', '530000', '2', '曲靖', '曲靖市', 'qujing', '0');
INSERT INTO `logistics_pca` VALUES ('530302', '530300', '3', '麒麟', '麒麟区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530321', '530300', '3', '马龙', '马龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530322', '530300', '3', '陆良', '陆良县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530323', '530300', '3', '师宗', '师宗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530324', '530300', '3', '罗平', '罗平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530325', '530300', '3', '富源', '富源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530326', '530300', '3', '会泽', '会泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530328', '530300', '3', '沾益', '沾益县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530381', '530300', '3', '宣威', '宣威市', '', '0');
INSERT INTO `logistics_pca` VALUES ('530400', '530000', '2', '玉溪', '玉溪市', 'yuxi', '0');
INSERT INTO `logistics_pca` VALUES ('530402', '530400', '3', '红塔', '红塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530421', '530400', '3', '江川', '江川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530422', '530400', '3', '澄江', '澄江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530423', '530400', '3', '通海', '通海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530424', '530400', '3', '华宁', '华宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530425', '530400', '3', '易门', '易门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530426', '530400', '3', '峨山', '峨山彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530427', '530400', '3', '新平', '新平彝族傣族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530428', '530400', '3', '元江', '元江哈尼族彝族傣族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530500', '530000', '2', '保山', '保山市', 'baoshan', '0');
INSERT INTO `logistics_pca` VALUES ('530502', '530500', '3', '隆阳', '隆阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530521', '530500', '3', '施甸', '施甸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530522', '530500', '3', '腾冲', '腾冲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530523', '530500', '3', '龙陵', '龙陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530524', '530500', '3', '昌宁', '昌宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530600', '530000', '2', '昭通', '昭通市', 'zhaotong', '0');
INSERT INTO `logistics_pca` VALUES ('530602', '530600', '3', '昭阳', '昭阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530621', '530600', '3', '鲁甸', '鲁甸县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530622', '530600', '3', '巧家', '巧家县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530623', '530600', '3', '盐津', '盐津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530624', '530600', '3', '大关', '大关县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530625', '530600', '3', '永善', '永善县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530626', '530600', '3', '绥江', '绥江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530627', '530600', '3', '镇雄', '镇雄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530628', '530600', '3', '彝良', '彝良县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530629', '530600', '3', '威信', '威信县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530630', '530600', '3', '水富', '水富县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530700', '530000', '2', '丽江', '丽江市', 'lijiang', '0');
INSERT INTO `logistics_pca` VALUES ('530702', '530700', '3', '古城', '古城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530721', '530700', '3', '玉龙', '玉龙纳西族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530722', '530700', '3', '永胜', '永胜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530723', '530700', '3', '华坪', '华坪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530724', '530700', '3', '宁蒗', '宁蒗彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530800', '530000', '2', '普洱', '普洱市', 'puer', '0');
INSERT INTO `logistics_pca` VALUES ('530802', '530800', '3', '思茅', '思茅区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530821', '530800', '3', '宁洱', '宁洱哈尼族彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530822', '530800', '3', '墨江', '墨江哈尼族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530823', '530800', '3', '景东', '景东彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530824', '530800', '3', '景谷', '景谷傣族彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530825', '530800', '3', '镇沅', '镇沅彝族哈尼族拉祜族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530826', '530800', '3', '江城', '江城哈尼族彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530827', '530800', '3', '孟连', '孟连傣族拉祜族佤族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530828', '530800', '3', '澜沧', '澜沧拉祜族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530829', '530800', '3', '西盟', '西盟佤族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530900', '530000', '2', '临沧', '临沧市', 'lincang', '0');
INSERT INTO `logistics_pca` VALUES ('530902', '530900', '3', '临翔', '临翔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('530921', '530900', '3', '凤庆', '凤庆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530922', '530900', '3', '云县', '云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530923', '530900', '3', '永德', '永德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530924', '530900', '3', '镇康', '镇康县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530925', '530900', '3', '双江', '双江拉祜族佤族布朗族傣族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530926', '530900', '3', '耿马', '耿马傣族佤族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('530927', '530900', '3', '沧源', '沧源佤族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532300', '530000', '2', '楚雄', '楚雄彝族自治州', 'chuxiong', '0');
INSERT INTO `logistics_pca` VALUES ('532301', '532300', '3', '楚雄', '楚雄市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532322', '532300', '3', '双柏', '双柏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532323', '532300', '3', '牟定', '牟定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532324', '532300', '3', '南华', '南华县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532325', '532300', '3', '姚安', '姚安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532326', '532300', '3', '大姚', '大姚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532327', '532300', '3', '永仁', '永仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532328', '532300', '3', '元谋', '元谋县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532329', '532300', '3', '武定', '武定县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532331', '532300', '3', '禄丰', '禄丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532500', '530000', '2', '红河', '红河哈尼族彝族自治州', 'honghe', '0');
INSERT INTO `logistics_pca` VALUES ('532501', '532500', '3', '个旧', '个旧市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532502', '532500', '3', '开远', '开远市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532503', '532500', '3', '蒙自', '蒙自市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532504', '532500', '3', '弥勒', '弥勒市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532523', '532500', '3', '屏边', '屏边苗族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532524', '532500', '3', '建水', '建水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532525', '532500', '3', '石屏', '石屏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532527', '532500', '3', '泸西', '泸西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532528', '532500', '3', '元阳', '元阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532529', '532500', '3', '红河县', '红河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532530', '532500', '3', '金平', '金平苗族瑶族傣族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532531', '532500', '3', '绿春', '绿春县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532532', '532500', '3', '河口', '河口瑶族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532600', '530000', '2', '文山', '文山壮族苗族自治州', 'wenshan', '0');
INSERT INTO `logistics_pca` VALUES ('532601', '532600', '3', '文山', '文山市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532622', '532600', '3', '砚山', '砚山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532623', '532600', '3', '西畴', '西畴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532624', '532600', '3', '麻栗坡', '麻栗坡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532625', '532600', '3', '马关', '马关县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532626', '532600', '3', '丘北', '丘北县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532627', '532600', '3', '广南', '广南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532628', '532600', '3', '富宁', '富宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532800', '530000', '2', '西双版纳', '西双版纳傣族自治州', 'xishuangbanna', '0');
INSERT INTO `logistics_pca` VALUES ('532801', '532800', '3', '景洪', '景洪市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532822', '532800', '3', '勐海', '勐海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532823', '532800', '3', '勐腊', '勐腊县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532900', '530000', '2', '大理', '大理白族自治州', 'dali', '0');
INSERT INTO `logistics_pca` VALUES ('532901', '532900', '3', '大理', '大理市', '', '0');
INSERT INTO `logistics_pca` VALUES ('532922', '532900', '3', '漾濞', '漾濞彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532923', '532900', '3', '祥云', '祥云县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532924', '532900', '3', '宾川', '宾川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532925', '532900', '3', '弥渡', '弥渡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532926', '532900', '3', '南涧', '南涧彝族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532927', '532900', '3', '巍山', '巍山彝族回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532928', '532900', '3', '永平', '永平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532929', '532900', '3', '云龙', '云龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532930', '532900', '3', '洱源', '洱源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532931', '532900', '3', '剑川', '剑川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('532932', '532900', '3', '鹤庆', '鹤庆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533100', '530000', '2', '德宏', '德宏傣族景颇族自治州', 'dehong', '0');
INSERT INTO `logistics_pca` VALUES ('533102', '533100', '3', '瑞丽', '瑞丽市', '', '0');
INSERT INTO `logistics_pca` VALUES ('533103', '533100', '3', '芒市', '芒市', '', '0');
INSERT INTO `logistics_pca` VALUES ('533122', '533100', '3', '梁河', '梁河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533123', '533100', '3', '盈江', '盈江县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533124', '533100', '3', '陇川', '陇川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533300', '530000', '2', '怒江', '怒江傈僳族自治州', 'nujiang', '0');
INSERT INTO `logistics_pca` VALUES ('533321', '533300', '3', '泸水', '泸水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533323', '533300', '3', '福贡', '福贡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533324', '533300', '3', '贡山', '贡山独龙族怒族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533325', '533300', '3', '兰坪', '兰坪白族普米族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533400', '530000', '2', '迪庆', '迪庆藏族自治州', 'diqing', '0');
INSERT INTO `logistics_pca` VALUES ('533421', '533400', '3', '香格里拉', '香格里拉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('533422', '533400', '3', '德钦', '德钦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('533423', '533400', '3', '维西', '维西傈僳族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540000', '0', '1', '西藏', '西藏自治区', '', '0');
INSERT INTO `logistics_pca` VALUES ('540100', '540000', '2', '拉萨', '拉萨市', 'lasa', '0');
INSERT INTO `logistics_pca` VALUES ('540102', '540100', '3', '城关', '城关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('540121', '540100', '3', '林周', '林周县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540122', '540100', '3', '当雄', '当雄县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540123', '540100', '3', '尼木', '尼木县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540124', '540100', '3', '曲水', '曲水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540125', '540100', '3', '堆龙德庆', '堆龙德庆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540126', '540100', '3', '达孜', '达孜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540127', '540100', '3', '墨竹工卡', '墨竹工卡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540200', '540000', '2', '日喀则', '日喀则市', 'rikaze', '0');
INSERT INTO `logistics_pca` VALUES ('540202', '540200', '3', '桑珠孜', '桑珠孜区', '', '0');
INSERT INTO `logistics_pca` VALUES ('540221', '540200', '3', '南木林', '南木林县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540222', '540200', '3', '江孜', '江孜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540223', '540200', '3', '定日', '定日县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540224', '540200', '3', '萨迦', '萨迦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540225', '540200', '3', '拉孜', '拉孜县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540226', '540200', '3', '昂仁', '昂仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540227', '540200', '3', '谢通门', '谢通门县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540228', '540200', '3', '白朗', '白朗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540229', '540200', '3', '仁布', '仁布县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540230', '540200', '3', '康马', '康马县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540231', '540200', '3', '定结', '定结县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540232', '540200', '3', '仲巴', '仲巴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540233', '540200', '3', '亚东', '亚东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540234', '540200', '3', '吉隆', '吉隆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540235', '540200', '3', '聂拉木', '聂拉木县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540236', '540200', '3', '萨嘎', '萨嘎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540237', '540200', '3', '岗巴', '岗巴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540300', '540000', '2', '昌都', '昌都市', 'changdou', '0');
INSERT INTO `logistics_pca` VALUES ('540302', '540300', '3', '昌都', '卡若区', '', '0');
INSERT INTO `logistics_pca` VALUES ('540321', '540300', '3', '江达', '江达县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540322', '540300', '3', '贡觉', '贡觉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540323', '540300', '3', '类乌齐', '类乌齐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540324', '540300', '3', '丁青', '丁青县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540325', '540300', '3', '察雅', '察雅县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540326', '540300', '3', '八宿', '八宿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540327', '540300', '3', '左贡', '左贡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540328', '540300', '3', '芒康', '芒康县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540329', '540300', '3', '洛隆', '洛隆县', '', '0');
INSERT INTO `logistics_pca` VALUES ('540330', '540300', '3', '边坝', '边坝县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542200', '540000', '2', '山南', '山南地区', 'shannan', '0');
INSERT INTO `logistics_pca` VALUES ('542221', '542200', '3', '乃东', '乃东县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542222', '542200', '3', '扎囊', '扎囊县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542223', '542200', '3', '贡嘎', '贡嘎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542224', '542200', '3', '桑日', '桑日县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542225', '542200', '3', '琼结', '琼结县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542226', '542200', '3', '曲松', '曲松县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542227', '542200', '3', '措美', '措美县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542228', '542200', '3', '洛扎', '洛扎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542229', '542200', '3', '加查', '加查县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542231', '542200', '3', '隆子', '隆子县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542232', '542200', '3', '错那', '错那县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542233', '542200', '3', '浪卡子', '浪卡子县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542400', '540000', '2', '那曲', '那曲地区', 'naqu', '0');
INSERT INTO `logistics_pca` VALUES ('542421', '542400', '3', '那曲', '那曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542422', '542400', '3', '嘉黎', '嘉黎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542423', '542400', '3', '比如', '比如县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542424', '542400', '3', '聂荣', '聂荣县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542425', '542400', '3', '安多', '安多县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542426', '542400', '3', '申扎', '申扎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542427', '542400', '3', '索县', '索县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542428', '542400', '3', '班戈', '班戈县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542429', '542400', '3', '巴青', '巴青县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542430', '542400', '3', '尼玛', '尼玛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542431', '542400', '3', '双湖', '双湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542500', '540000', '2', '阿里', '阿里地区', 'ali', '0');
INSERT INTO `logistics_pca` VALUES ('542521', '542500', '3', '普兰', '普兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542522', '542500', '3', '札达', '札达县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542523', '542500', '3', '噶尔', '噶尔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542524', '542500', '3', '日土', '日土县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542525', '542500', '3', '革吉', '革吉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542526', '542500', '3', '改则', '改则县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542527', '542500', '3', '措勤', '措勤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542600', '540000', '2', '林芝', '林芝地区', 'linzhi', '0');
INSERT INTO `logistics_pca` VALUES ('542621', '542600', '3', '林芝', '林芝县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542622', '542600', '3', '工布江达', '工布江达县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542623', '542600', '3', '米林', '米林县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542624', '542600', '3', '墨脱', '墨脱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542625', '542600', '3', '波密', '波密县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542626', '542600', '3', '察隅', '察隅县', '', '0');
INSERT INTO `logistics_pca` VALUES ('542627', '542600', '3', '朗县', '朗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610000', '0', '1', '陕西', '陕西省', '', '0');
INSERT INTO `logistics_pca` VALUES ('610100', '610000', '2', '西安', '西安市', 'xian', '0');
INSERT INTO `logistics_pca` VALUES ('610102', '610100', '3', '新城', '新城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610103', '610100', '3', '碑林', '碑林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610104', '610100', '3', '莲湖', '莲湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610111', '610100', '3', '灞桥', '灞桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610112', '610100', '3', '未央', '未央区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610113', '610100', '3', '雁塔', '雁塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610114', '610100', '3', '阎良', '阎良区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610115', '610100', '3', '临潼', '临潼区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610116', '610100', '3', '长安', '长安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610122', '610100', '3', '蓝田', '蓝田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610124', '610100', '3', '周至', '周至县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610125', '610100', '3', '户县', '户县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610126', '610100', '3', '高陵', '高陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610200', '610000', '2', '铜川', '铜川市', 'tongchuan', '0');
INSERT INTO `logistics_pca` VALUES ('610202', '610200', '3', '王益', '王益区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610203', '610200', '3', '印台', '印台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610204', '610200', '3', '耀州', '耀州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610222', '610200', '3', '宜君', '宜君县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610300', '610000', '2', '宝鸡', '宝鸡市', 'baoji', '0');
INSERT INTO `logistics_pca` VALUES ('610302', '610300', '3', '渭滨', '渭滨区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610303', '610300', '3', '金台', '金台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610304', '610300', '3', '陈仓', '陈仓区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610322', '610300', '3', '凤翔', '凤翔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610323', '610300', '3', '岐山', '岐山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610324', '610300', '3', '扶风', '扶风县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610326', '610300', '3', '眉县', '眉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610327', '610300', '3', '陇县', '陇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610328', '610300', '3', '千阳', '千阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610329', '610300', '3', '麟游', '麟游县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610330', '610300', '3', '凤县', '凤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610331', '610300', '3', '太白', '太白县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610400', '610000', '2', '咸阳', '咸阳市', 'xianyang', '0');
INSERT INTO `logistics_pca` VALUES ('610402', '610400', '3', '秦都', '秦都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610403', '610400', '3', '杨陵', '杨陵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610404', '610400', '3', '渭城', '渭城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610422', '610400', '3', '三原', '三原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610423', '610400', '3', '泾阳', '泾阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610424', '610400', '3', '乾县', '乾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610425', '610400', '3', '礼泉', '礼泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610426', '610400', '3', '永寿', '永寿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610427', '610400', '3', '彬县', '彬县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610428', '610400', '3', '长武', '长武县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610429', '610400', '3', '旬邑', '旬邑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610430', '610400', '3', '淳化', '淳化县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610431', '610400', '3', '武功', '武功县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610481', '610400', '3', '兴平', '兴平市', '', '0');
INSERT INTO `logistics_pca` VALUES ('610500', '610000', '2', '渭南', '渭南市', 'weinan', '0');
INSERT INTO `logistics_pca` VALUES ('610502', '610500', '3', '临渭', '临渭区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610521', '610500', '3', '华县', '华县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610522', '610500', '3', '潼关', '潼关县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610523', '610500', '3', '大荔', '大荔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610524', '610500', '3', '合阳', '合阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610525', '610500', '3', '澄城', '澄城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610526', '610500', '3', '蒲城', '蒲城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610527', '610500', '3', '白水', '白水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610528', '610500', '3', '富平', '富平县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610581', '610500', '3', '韩城', '韩城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('610582', '610500', '3', '华阴', '华阴市', '', '0');
INSERT INTO `logistics_pca` VALUES ('610600', '610000', '2', '延安', '延安市', 'yanan', '0');
INSERT INTO `logistics_pca` VALUES ('610602', '610600', '3', '宝塔', '宝塔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610621', '610600', '3', '延长', '延长县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610622', '610600', '3', '延川', '延川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610623', '610600', '3', '子长', '子长县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610624', '610600', '3', '安塞', '安塞县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610625', '610600', '3', '志丹', '志丹县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610626', '610600', '3', '吴起', '吴起县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610627', '610600', '3', '甘泉', '甘泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610628', '610600', '3', '富县', '富县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610629', '610600', '3', '洛川', '洛川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610630', '610600', '3', '宜川', '宜川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610631', '610600', '3', '黄龙', '黄龙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610632', '610600', '3', '黄陵', '黄陵县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610700', '610000', '2', '汉中', '汉中市', 'hanzhong', '0');
INSERT INTO `logistics_pca` VALUES ('610702', '610700', '3', '汉台', '汉台区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610721', '610700', '3', '南郑', '南郑县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610722', '610700', '3', '城固', '城固县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610723', '610700', '3', '洋县', '洋县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610724', '610700', '3', '西乡', '西乡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610725', '610700', '3', '勉县', '勉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610726', '610700', '3', '宁强', '宁强县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610727', '610700', '3', '略阳', '略阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610728', '610700', '3', '镇巴', '镇巴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610729', '610700', '3', '留坝', '留坝县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610730', '610700', '3', '佛坪', '佛坪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610800', '610000', '2', '榆林', '榆林市', 'yulin', '0');
INSERT INTO `logistics_pca` VALUES ('610802', '610800', '3', '榆阳', '榆阳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610821', '610800', '3', '神木', '神木县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610822', '610800', '3', '府谷', '府谷县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610823', '610800', '3', '横山', '横山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610824', '610800', '3', '靖边', '靖边县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610825', '610800', '3', '定边', '定边县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610826', '610800', '3', '绥德', '绥德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610827', '610800', '3', '米脂', '米脂县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610828', '610800', '3', '佳县', '佳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610829', '610800', '3', '吴堡', '吴堡县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610830', '610800', '3', '清涧', '清涧县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610831', '610800', '3', '子洲', '子洲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610900', '610000', '2', '安康', '安康市', 'ankang', '0');
INSERT INTO `logistics_pca` VALUES ('610902', '610900', '3', '汉滨', '汉滨区', '', '0');
INSERT INTO `logistics_pca` VALUES ('610921', '610900', '3', '汉阴', '汉阴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610922', '610900', '3', '石泉', '石泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610923', '610900', '3', '宁陕', '宁陕县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610924', '610900', '3', '紫阳', '紫阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610925', '610900', '3', '岚皋', '岚皋县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610926', '610900', '3', '平利', '平利县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610927', '610900', '3', '镇坪', '镇坪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610928', '610900', '3', '旬阳', '旬阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('610929', '610900', '3', '白河', '白河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611000', '610000', '2', '商洛', '商洛市', 'shangluo', '0');
INSERT INTO `logistics_pca` VALUES ('611002', '611000', '3', '商州', '商州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('611021', '611000', '3', '洛南', '洛南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611022', '611000', '3', '丹凤', '丹凤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611023', '611000', '3', '商南', '商南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611024', '611000', '3', '山阳', '山阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611025', '611000', '3', '镇安', '镇安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611026', '611000', '3', '柞水', '柞水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('611100', '610000', '2', '西咸', '西咸新区', 'xixian', '0');
INSERT INTO `logistics_pca` VALUES ('611101', '611100', '3', '空港', '空港新城', '', '0');
INSERT INTO `logistics_pca` VALUES ('611102', '611100', '3', '沣东', '沣东新城', '', '0');
INSERT INTO `logistics_pca` VALUES ('611103', '611100', '3', '秦汉', '秦汉新城', '', '0');
INSERT INTO `logistics_pca` VALUES ('611104', '611100', '3', '沣西', '沣西新城', '', '0');
INSERT INTO `logistics_pca` VALUES ('611105', '611100', '3', '泾河', '泾河新城', '', '0');
INSERT INTO `logistics_pca` VALUES ('620000', '0', '1', '甘肃', '甘肃省', '', '0');
INSERT INTO `logistics_pca` VALUES ('620100', '620000', '2', '兰州', '兰州市', 'lanzhou', '0');
INSERT INTO `logistics_pca` VALUES ('620102', '620100', '3', '城关', '城关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620103', '620100', '3', '七里河', '七里河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620104', '620100', '3', '西固', '西固区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620105', '620100', '3', '安宁', '安宁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620111', '620100', '3', '红古', '红古区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620121', '620100', '3', '永登', '永登县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620122', '620100', '3', '皋兰', '皋兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620123', '620100', '3', '榆中', '榆中县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620200', '620000', '2', '嘉峪关', '嘉峪关市', 'jiayuguan', '0');
INSERT INTO `logistics_pca` VALUES ('620201', '620200', '3', '雄关', '雄关区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620202', '620200', '3', '长城', '长城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620203', '620200', '3', '镜铁', '镜铁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620300', '620000', '2', '金昌', '金昌市', 'jinchang', '0');
INSERT INTO `logistics_pca` VALUES ('620302', '620300', '3', '金川', '金川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620321', '620300', '3', '永昌', '永昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620400', '620000', '2', '白银', '白银市', 'baiyin', '0');
INSERT INTO `logistics_pca` VALUES ('620402', '620400', '3', '白银', '白银区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620403', '620400', '3', '平川', '平川区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620421', '620400', '3', '靖远', '靖远县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620422', '620400', '3', '会宁', '会宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620423', '620400', '3', '景泰', '景泰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620500', '620000', '2', '天水', '天水市', 'tianshui', '0');
INSERT INTO `logistics_pca` VALUES ('620502', '620500', '3', '秦州', '秦州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620503', '620500', '3', '麦积', '麦积区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620521', '620500', '3', '清水', '清水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620522', '620500', '3', '秦安', '秦安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620523', '620500', '3', '甘谷', '甘谷县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620524', '620500', '3', '武山', '武山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620525', '620500', '3', '张家川', '张家川回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620600', '620000', '2', '武威', '武威市', 'wuwei', '0');
INSERT INTO `logistics_pca` VALUES ('620602', '620600', '3', '凉州', '凉州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620621', '620600', '3', '民勤', '民勤县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620622', '620600', '3', '古浪', '古浪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620623', '620600', '3', '天祝', '天祝藏族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620700', '620000', '2', '张掖', '张掖市', 'zhangye', '0');
INSERT INTO `logistics_pca` VALUES ('620702', '620700', '3', '甘州', '甘州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620721', '620700', '3', '肃南', '肃南裕固族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620722', '620700', '3', '民乐', '民乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620723', '620700', '3', '临泽', '临泽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620724', '620700', '3', '高台', '高台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620725', '620700', '3', '山丹', '山丹县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620800', '620000', '2', '平凉', '平凉市', 'pingliang', '0');
INSERT INTO `logistics_pca` VALUES ('620802', '620800', '3', '崆峒', '崆峒区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620821', '620800', '3', '泾川', '泾川县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620822', '620800', '3', '灵台', '灵台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620823', '620800', '3', '崇信', '崇信县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620824', '620800', '3', '华亭', '华亭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620825', '620800', '3', '庄浪', '庄浪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620826', '620800', '3', '静宁', '静宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620900', '620000', '2', '酒泉', '酒泉市', 'jiuquan', '0');
INSERT INTO `logistics_pca` VALUES ('620902', '620900', '3', '肃州', '肃州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('620921', '620900', '3', '金塔', '金塔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620922', '620900', '3', '瓜州', '瓜州县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620923', '620900', '3', '肃北', '肃北蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620924', '620900', '3', '阿克塞', '阿克塞哈萨克族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('620981', '620900', '3', '玉门', '玉门市', '', '0');
INSERT INTO `logistics_pca` VALUES ('620982', '620900', '3', '敦煌', '敦煌市', '', '0');
INSERT INTO `logistics_pca` VALUES ('621000', '620000', '2', '庆阳', '庆阳市', 'qingyang', '0');
INSERT INTO `logistics_pca` VALUES ('621002', '621000', '3', '西峰', '西峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('621021', '621000', '3', '庆城', '庆城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621022', '621000', '3', '环县', '环县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621023', '621000', '3', '华池', '华池县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621024', '621000', '3', '合水', '合水县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621025', '621000', '3', '正宁', '正宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621026', '621000', '3', '宁县', '宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621027', '621000', '3', '镇原', '镇原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621100', '620000', '2', '定西', '定西市', 'dingxi', '0');
INSERT INTO `logistics_pca` VALUES ('621102', '621100', '3', '安定', '安定区', '', '0');
INSERT INTO `logistics_pca` VALUES ('621121', '621100', '3', '通渭', '通渭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621122', '621100', '3', '陇西', '陇西县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621123', '621100', '3', '渭源', '渭源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621124', '621100', '3', '临洮', '临洮县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621125', '621100', '3', '漳县', '漳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621126', '621100', '3', '岷县', '岷县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621200', '620000', '2', '陇南', '陇南市', 'longnan', '0');
INSERT INTO `logistics_pca` VALUES ('621202', '621200', '3', '武都', '武都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('621221', '621200', '3', '成县', '成县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621222', '621200', '3', '文县', '文县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621223', '621200', '3', '宕昌', '宕昌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621224', '621200', '3', '康县', '康县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621225', '621200', '3', '西和', '西和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621226', '621200', '3', '礼县', '礼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621227', '621200', '3', '徽县', '徽县', '', '0');
INSERT INTO `logistics_pca` VALUES ('621228', '621200', '3', '两当', '两当县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622900', '620000', '2', '临夏', '临夏回族自治州', 'linxia', '0');
INSERT INTO `logistics_pca` VALUES ('622901', '622900', '3', '临夏', '临夏市', '', '0');
INSERT INTO `logistics_pca` VALUES ('622921', '622900', '3', '临夏', '临夏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622922', '622900', '3', '康乐', '康乐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622923', '622900', '3', '永靖', '永靖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622924', '622900', '3', '广河', '广河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622925', '622900', '3', '和政', '和政县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622926', '622900', '3', '东乡族', '东乡族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('622927', '622900', '3', '积石山', '积石山保安族东乡族撒拉族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623000', '620000', '2', '甘南', '甘南藏族自治州', 'gannan', '0');
INSERT INTO `logistics_pca` VALUES ('623001', '623000', '3', '合作', '合作市', '', '0');
INSERT INTO `logistics_pca` VALUES ('623021', '623000', '3', '临潭', '临潭县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623022', '623000', '3', '卓尼', '卓尼县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623023', '623000', '3', '舟曲', '舟曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623024', '623000', '3', '迭部', '迭部县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623025', '623000', '3', '玛曲', '玛曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623026', '623000', '3', '碌曲', '碌曲县', '', '0');
INSERT INTO `logistics_pca` VALUES ('623027', '623000', '3', '夏河', '夏河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630000', '0', '1', '青海', '青海省', '', '0');
INSERT INTO `logistics_pca` VALUES ('630100', '630000', '2', '西宁', '西宁市', 'xining', '0');
INSERT INTO `logistics_pca` VALUES ('630102', '630100', '3', '城东', '城东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('630103', '630100', '3', '城中', '城中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('630104', '630100', '3', '城西', '城西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('630105', '630100', '3', '城北', '城北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('630121', '630100', '3', '大通', '大通回族土族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630122', '630100', '3', '湟中', '湟中县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630123', '630100', '3', '湟源', '湟源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630200', '630000', '2', '海东', '海东市', 'haidong', '0');
INSERT INTO `logistics_pca` VALUES ('630202', '630200', '3', '乐都', '乐都区', '', '0');
INSERT INTO `logistics_pca` VALUES ('630221', '630200', '3', '平安', '平安县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630222', '630200', '3', '民和', '民和回族土族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630223', '630200', '3', '互助', '互助土族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630224', '630200', '3', '化隆', '化隆回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('630225', '630200', '3', '循化', '循化撒拉族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632200', '630000', '2', '海北', '海北藏族自治州', 'haibei', '0');
INSERT INTO `logistics_pca` VALUES ('632221', '632200', '3', '门源', '门源回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632222', '632200', '3', '祁连', '祁连县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632223', '632200', '3', '海晏', '海晏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632224', '632200', '3', '刚察', '刚察县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632300', '630000', '2', '黄南', '黄南藏族自治州', 'huangnan', '0');
INSERT INTO `logistics_pca` VALUES ('632321', '632300', '3', '同仁', '同仁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632322', '632300', '3', '尖扎', '尖扎县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632323', '632300', '3', '泽库', '泽库县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632324', '632300', '3', '河南', '河南蒙古族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632500', '630000', '2', '海南', '海南藏族自治州', 'hainan', '0');
INSERT INTO `logistics_pca` VALUES ('632521', '632500', '3', '共和', '共和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632522', '632500', '3', '同德', '同德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632523', '632500', '3', '贵德', '贵德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632524', '632500', '3', '兴海', '兴海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632525', '632500', '3', '贵南', '贵南县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632600', '630000', '2', '果洛', '果洛藏族自治州', 'guoluo', '0');
INSERT INTO `logistics_pca` VALUES ('632621', '632600', '3', '玛沁', '玛沁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632622', '632600', '3', '班玛', '班玛县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632623', '632600', '3', '甘德', '甘德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632624', '632600', '3', '达日', '达日县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632625', '632600', '3', '久治', '久治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632626', '632600', '3', '玛多', '玛多县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632700', '630000', '2', '玉树', '玉树藏族自治州', 'yushu', '0');
INSERT INTO `logistics_pca` VALUES ('632701', '632700', '3', '玉树', '玉树市', '', '0');
INSERT INTO `logistics_pca` VALUES ('632722', '632700', '3', '杂多', '杂多县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632723', '632700', '3', '称多', '称多县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632724', '632700', '3', '治多', '治多县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632725', '632700', '3', '囊谦', '囊谦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632726', '632700', '3', '曲麻莱', '曲麻莱县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632800', '630000', '2', '海西', '海西蒙古族藏族自治州', 'haixi', '0');
INSERT INTO `logistics_pca` VALUES ('632801', '632800', '3', '格尔木', '格尔木市', '', '0');
INSERT INTO `logistics_pca` VALUES ('632802', '632800', '3', '德令哈', '德令哈市', '', '0');
INSERT INTO `logistics_pca` VALUES ('632821', '632800', '3', '乌兰', '乌兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632822', '632800', '3', '都兰', '都兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('632823', '632800', '3', '天峻', '天峻县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640000', '0', '1', '宁夏', '宁夏回族自治区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640100', '640000', '2', '银川', '银川市', 'yinchuan', '0');
INSERT INTO `logistics_pca` VALUES ('640104', '640100', '3', '兴庆', '兴庆区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640105', '640100', '3', '西夏', '西夏区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640106', '640100', '3', '金凤', '金凤区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640121', '640100', '3', '永宁', '永宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640122', '640100', '3', '贺兰', '贺兰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640181', '640100', '3', '灵武', '灵武市', '', '0');
INSERT INTO `logistics_pca` VALUES ('640200', '640000', '2', '石嘴山', '石嘴山市', 'shizuishan', '0');
INSERT INTO `logistics_pca` VALUES ('640202', '640200', '3', '大武口', '大武口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640205', '640200', '3', '惠农', '惠农区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640221', '640200', '3', '平罗', '平罗县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640300', '640000', '2', '吴忠', '吴忠市', 'wuzhong', '0');
INSERT INTO `logistics_pca` VALUES ('640302', '640300', '3', '利通', '利通区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640303', '640300', '3', '红寺堡', '红寺堡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640323', '640300', '3', '盐池', '盐池县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640324', '640300', '3', '同心', '同心县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640381', '640300', '3', '青铜峡', '青铜峡市', '', '0');
INSERT INTO `logistics_pca` VALUES ('640400', '640000', '2', '固原', '固原市', 'guyuan', '0');
INSERT INTO `logistics_pca` VALUES ('640402', '640400', '3', '原州', '原州区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640422', '640400', '3', '西吉', '西吉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640423', '640400', '3', '隆德', '隆德县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640424', '640400', '3', '泾源', '泾源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640425', '640400', '3', '彭阳', '彭阳县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640500', '640000', '2', '中卫', '中卫市', 'zhongwei', '0');
INSERT INTO `logistics_pca` VALUES ('640502', '640500', '3', '沙坡头', '沙坡头区', '', '0');
INSERT INTO `logistics_pca` VALUES ('640521', '640500', '3', '中宁', '中宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('640522', '640500', '3', '海原', '海原县', '', '0');
INSERT INTO `logistics_pca` VALUES ('650000', '0', '1', '新疆', '新疆维吾尔自治区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650100', '650000', '2', '乌鲁木齐', '乌鲁木齐市', 'wulumuqi', '0');
INSERT INTO `logistics_pca` VALUES ('650102', '650100', '3', '天山', '天山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650103', '650100', '3', '沙依巴克', '沙依巴克区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650104', '650100', '3', '新市', '新市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650105', '650100', '3', '水磨沟', '水磨沟区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650106', '650100', '3', '头屯河', '头屯河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650107', '650100', '3', '达坂城', '达坂城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650109', '650100', '3', '米东', '米东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650121', '650100', '3', '乌鲁木齐', '乌鲁木齐县', '', '0');
INSERT INTO `logistics_pca` VALUES ('650200', '650000', '2', '克拉玛依', '克拉玛依市', 'kelamayi', '0');
INSERT INTO `logistics_pca` VALUES ('650202', '650200', '3', '独山子', '独山子区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650203', '650200', '3', '克拉玛依', '克拉玛依区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650204', '650200', '3', '白碱滩', '白碱滩区', '', '0');
INSERT INTO `logistics_pca` VALUES ('650205', '650200', '3', '乌尔禾', '乌尔禾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('652100', '650000', '2', '吐鲁番', '吐鲁番地区', 'tulufan', '0');
INSERT INTO `logistics_pca` VALUES ('652101', '652100', '3', '吐鲁番', '吐鲁番市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652122', '652100', '3', '鄯善', '鄯善县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652123', '652100', '3', '托克逊', '托克逊县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652200', '650000', '2', '哈密', '哈密地区', 'hami', '0');
INSERT INTO `logistics_pca` VALUES ('652201', '652200', '3', '哈密', '哈密市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652222', '652200', '3', '巴里坤', '巴里坤哈萨克自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652223', '652200', '3', '伊吾', '伊吾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652300', '650000', '2', '昌吉', '昌吉回族自治州', 'changji', '0');
INSERT INTO `logistics_pca` VALUES ('652301', '652300', '3', '昌吉', '昌吉市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652302', '652300', '3', '阜康', '阜康市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652323', '652300', '3', '呼图壁', '呼图壁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652324', '652300', '3', '玛纳斯', '玛纳斯县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652325', '652300', '3', '奇台', '奇台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652327', '652300', '3', '吉木萨尔', '吉木萨尔县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652328', '652300', '3', '木垒', '木垒哈萨克自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652700', '650000', '2', '博尔塔拉', '博尔塔拉蒙古自治州', 'boertala', '0');
INSERT INTO `logistics_pca` VALUES ('652701', '652700', '3', '博乐', '博乐市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652702', '652700', '3', '阿拉山口', '阿拉山口市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652722', '652700', '3', '精河', '精河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652723', '652700', '3', '温泉', '温泉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652800', '650000', '2', '巴音郭楞', '巴音郭楞蒙古自治州', 'bayinguoleng', '0');
INSERT INTO `logistics_pca` VALUES ('652801', '652800', '3', '库尔勒', '库尔勒市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652822', '652800', '3', '轮台', '轮台县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652823', '652800', '3', '尉犁', '尉犁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652824', '652800', '3', '若羌', '若羌县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652825', '652800', '3', '且末', '且末县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652826', '652800', '3', '焉耆', '焉耆回族自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652827', '652800', '3', '和静', '和静县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652828', '652800', '3', '和硕', '和硕县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652829', '652800', '3', '博湖', '博湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652900', '650000', '2', '阿克苏', '阿克苏地区', 'akesu', '0');
INSERT INTO `logistics_pca` VALUES ('652901', '652900', '3', '阿克苏', '阿克苏市', '', '0');
INSERT INTO `logistics_pca` VALUES ('652922', '652900', '3', '温宿', '温宿县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652923', '652900', '3', '库车', '库车县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652924', '652900', '3', '沙雅', '沙雅县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652925', '652900', '3', '新和', '新和县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652926', '652900', '3', '拜城', '拜城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652927', '652900', '3', '乌什', '乌什县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652928', '652900', '3', '阿瓦提', '阿瓦提县', '', '0');
INSERT INTO `logistics_pca` VALUES ('652929', '652900', '3', '柯坪', '柯坪县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653000', '650000', '2', '克孜勒苏', '克孜勒苏柯尔克孜自治州', 'kezilesu', '0');
INSERT INTO `logistics_pca` VALUES ('653001', '653000', '3', '阿图什', '阿图什市', '', '0');
INSERT INTO `logistics_pca` VALUES ('653022', '653000', '3', '阿克陶', '阿克陶县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653023', '653000', '3', '阿合奇', '阿合奇县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653024', '653000', '3', '乌恰', '乌恰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653100', '650000', '2', '喀什', '喀什地区', 'kashi', '0');
INSERT INTO `logistics_pca` VALUES ('653101', '653100', '3', '喀什', '喀什市', '', '0');
INSERT INTO `logistics_pca` VALUES ('653121', '653100', '3', '疏附', '疏附县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653122', '653100', '3', '疏勒', '疏勒县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653123', '653100', '3', '英吉沙', '英吉沙县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653124', '653100', '3', '泽普', '泽普县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653125', '653100', '3', '莎车', '莎车县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653126', '653100', '3', '叶城', '叶城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653127', '653100', '3', '麦盖提', '麦盖提县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653128', '653100', '3', '岳普湖', '岳普湖县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653129', '653100', '3', '伽师', '伽师县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653130', '653100', '3', '巴楚', '巴楚县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653131', '653100', '3', '塔什库尔干塔吉克', '塔什库尔干塔吉克自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653200', '650000', '2', '和田', '和田地区', 'hetian', '0');
INSERT INTO `logistics_pca` VALUES ('653201', '653200', '3', '和田市', '和田市', '', '0');
INSERT INTO `logistics_pca` VALUES ('653221', '653200', '3', '和田县', '和田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653222', '653200', '3', '墨玉', '墨玉县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653223', '653200', '3', '皮山', '皮山县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653224', '653200', '3', '洛浦', '洛浦县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653225', '653200', '3', '策勒', '策勒县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653226', '653200', '3', '于田', '于田县', '', '0');
INSERT INTO `logistics_pca` VALUES ('653227', '653200', '3', '民丰', '民丰县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654000', '650000', '2', '伊犁', '伊犁哈萨克自治州', 'yili', '0');
INSERT INTO `logistics_pca` VALUES ('654002', '654000', '3', '伊宁', '伊宁市', '', '0');
INSERT INTO `logistics_pca` VALUES ('654003', '654000', '3', '奎屯', '奎屯市', '', '0');
INSERT INTO `logistics_pca` VALUES ('654004', '654000', '3', '霍尔果斯', '霍尔果斯市', '', '0');
INSERT INTO `logistics_pca` VALUES ('654021', '654000', '3', '伊宁', '伊宁县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654022', '654000', '3', '察布查尔锡伯', '察布查尔锡伯自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654023', '654000', '3', '霍城', '霍城县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654024', '654000', '3', '巩留', '巩留县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654025', '654000', '3', '新源', '新源县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654026', '654000', '3', '昭苏', '昭苏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654027', '654000', '3', '特克斯', '特克斯县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654028', '654000', '3', '尼勒克', '尼勒克县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654200', '650000', '2', '塔城', '塔城地区', 'tacheng', '0');
INSERT INTO `logistics_pca` VALUES ('654201', '654200', '3', '塔城', '塔城市', '', '0');
INSERT INTO `logistics_pca` VALUES ('654202', '654200', '3', '乌苏', '乌苏市', '', '0');
INSERT INTO `logistics_pca` VALUES ('654221', '654200', '3', '额敏', '额敏县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654223', '654200', '3', '沙湾', '沙湾县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654224', '654200', '3', '托里', '托里县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654225', '654200', '3', '裕民', '裕民县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654226', '654200', '3', '和布克赛尔', '和布克赛尔蒙古自治县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654300', '650000', '2', '阿勒泰', '阿勒泰地区', 'aletai', '0');
INSERT INTO `logistics_pca` VALUES ('654301', '654300', '3', '阿勒泰', '阿勒泰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('654321', '654300', '3', '布尔津', '布尔津县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654322', '654300', '3', '富蕴', '富蕴县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654323', '654300', '3', '福海', '福海县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654324', '654300', '3', '哈巴河', '哈巴河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654325', '654300', '3', '青河', '青河县', '', '0');
INSERT INTO `logistics_pca` VALUES ('654326', '654300', '3', '吉木乃', '吉木乃县', '', '0');
INSERT INTO `logistics_pca` VALUES ('659001', '659000', '3', '石河子', '石河子市', '', '0');
INSERT INTO `logistics_pca` VALUES ('659002', '659000', '3', '阿拉尔', '阿拉尔市', '', '0');
INSERT INTO `logistics_pca` VALUES ('659003', '659000', '3', '图木舒克', '图木舒克市', '', '0');
INSERT INTO `logistics_pca` VALUES ('659004', '659000', '3', '五家渠', '五家渠市', '', '0');
INSERT INTO `logistics_pca` VALUES ('659005', '659000', '3', '北屯', '北屯市', '', '0');
INSERT INTO `logistics_pca` VALUES ('659006', '659000', '3', '铁门关', '铁门关市', '', '0');
INSERT INTO `logistics_pca` VALUES ('659007', '659000', '3', '双河', '双河市', '', '0');
INSERT INTO `logistics_pca` VALUES ('710000', '0', '1', '台湾', '台湾', '', '0');
INSERT INTO `logistics_pca` VALUES ('710100', '710000', '2', '台北', '台北市', 'taibei', '0');
INSERT INTO `logistics_pca` VALUES ('710101', '710100', '3', '松山', '松山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710102', '710100', '3', '信义', '信义区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710103', '710100', '3', '大安', '大安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710104', '710100', '3', '中山', '中山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710105', '710100', '3', '中正', '中正区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710106', '710100', '3', '大同', '大同区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710107', '710100', '3', '万华', '万华区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710108', '710100', '3', '文山', '文山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710109', '710100', '3', '南港', '南港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710110', '710100', '3', '内湖', '内湖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710111', '710100', '3', '士林', '士林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710112', '710100', '3', '北投', '北投区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710200', '710000', '2', '高雄', '高雄市', 'gaoxiong', '0');
INSERT INTO `logistics_pca` VALUES ('710201', '710200', '3', '盐埕', '盐埕区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710202', '710200', '3', '鼓山', '鼓山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710203', '710200', '3', '左营', '左营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710204', '710200', '3', '楠梓', '楠梓区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710205', '710200', '3', '三民', '三民区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710206', '710200', '3', '新兴', '新兴区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710207', '710200', '3', '前金', '前金区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710208', '710200', '3', '苓雅', '苓雅区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710209', '710200', '3', '前镇', '前镇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710210', '710200', '3', '旗津', '旗津区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710211', '710200', '3', '小港', '小港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710212', '710200', '3', '凤山', '凤山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710213', '710200', '3', '林园', '林园区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710214', '710200', '3', '大寮', '大寮区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710215', '710200', '3', '大树', '大树区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710216', '710200', '3', '大社', '大社区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710217', '710200', '3', '仁武', '仁武区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710218', '710200', '3', '鸟松', '鸟松区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710219', '710200', '3', '冈山', '冈山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710220', '710200', '3', '桥头', '桥头区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710221', '710200', '3', '燕巢', '燕巢区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710222', '710200', '3', '田寮', '田寮区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710223', '710200', '3', '阿莲', '阿莲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710224', '710200', '3', '路竹', '路竹区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710225', '710200', '3', '湖内', '湖内区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710226', '710200', '3', '茄萣', '茄萣区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710227', '710200', '3', '永安', '永安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710228', '710200', '3', '弥陀', '弥陀区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710229', '710200', '3', '梓官', '梓官区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710230', '710200', '3', '旗山', '旗山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710231', '710200', '3', '美浓', '美浓区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710232', '710200', '3', '六龟', '六龟区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710233', '710200', '3', '甲仙', '甲仙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710234', '710200', '3', '杉林', '杉林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710235', '710200', '3', '内门', '内门区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710236', '710200', '3', '茂林', '茂林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710237', '710200', '3', '桃源', '桃源区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710238', '710200', '3', '那玛夏', '那玛夏区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710300', '710000', '2', '基隆', '基隆市', 'jilong', '0');
INSERT INTO `logistics_pca` VALUES ('710301', '710300', '3', '中正', '中正区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710302', '710300', '3', '七堵', '七堵区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710303', '710300', '3', '暖暖', '暖暖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710304', '710300', '3', '仁爱', '仁爱区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710305', '710300', '3', '中山', '中山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710306', '710300', '3', '安乐', '安乐区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710307', '710300', '3', '信义', '信义区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710400', '710000', '2', '台中', '台中市', 'taizhong', '0');
INSERT INTO `logistics_pca` VALUES ('710401', '710400', '3', '中区', '中区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710402', '710400', '3', '东区', '东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710403', '710400', '3', '南区', '南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710404', '710400', '3', '西区', '西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710405', '710400', '3', '北区', '北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710406', '710400', '3', '西屯', '西屯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710407', '710400', '3', '南屯', '南屯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710408', '710400', '3', '北屯', '北屯区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710409', '710400', '3', '丰原', '丰原区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710410', '710400', '3', '东势', '东势区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710411', '710400', '3', '大甲', '大甲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710412', '710400', '3', '清水', '清水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710413', '710400', '3', '沙鹿', '沙鹿区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710414', '710400', '3', '梧栖', '梧栖区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710415', '710400', '3', '后里', '后里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710416', '710400', '3', '神冈', '神冈区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710417', '710400', '3', '潭子', '潭子区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710418', '710400', '3', '大雅', '大雅区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710419', '710400', '3', '新社', '新社区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710420', '710400', '3', '石冈', '石冈区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710421', '710400', '3', '外埔', '外埔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710422', '710400', '3', '大安', '大安区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710423', '710400', '3', '乌日', '乌日区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710424', '710400', '3', '大肚', '大肚区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710425', '710400', '3', '龙井', '龙井区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710426', '710400', '3', '雾峰', '雾峰区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710427', '710400', '3', '太平', '太平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710428', '710400', '3', '大里', '大里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710429', '710400', '3', '和平', '和平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710500', '710000', '2', '台南', '台南市', 'tainan', '0');
INSERT INTO `logistics_pca` VALUES ('710501', '710500', '3', '东区', '东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710502', '710500', '3', '南区', '南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710504', '710500', '3', '北区', '北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710506', '710500', '3', '安南', '安南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710507', '710500', '3', '安平', '安平区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710508', '710500', '3', '中西', '中西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710509', '710500', '3', '新营', '新营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710510', '710500', '3', '盐水', '盐水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710511', '710500', '3', '白河', '白河区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710512', '710500', '3', '柳营', '柳营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710513', '710500', '3', '后壁', '后壁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710514', '710500', '3', '东山', '东山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710515', '710500', '3', '麻豆', '麻豆区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710516', '710500', '3', '下营', '下营区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710517', '710500', '3', '六甲', '六甲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710518', '710500', '3', '官田', '官田区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710519', '710500', '3', '大内', '大内区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710520', '710500', '3', '佳里', '佳里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710521', '710500', '3', '学甲', '学甲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710522', '710500', '3', '西港', '西港区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710523', '710500', '3', '七股', '七股区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710524', '710500', '3', '将军', '将军区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710525', '710500', '3', '北门', '北门区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710526', '710500', '3', '新化', '新化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710527', '710500', '3', '善化', '善化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710528', '710500', '3', '新市', '新市区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710529', '710500', '3', '安定', '安定区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710530', '710500', '3', '山上', '山上区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710531', '710500', '3', '玉井', '玉井区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710532', '710500', '3', '楠西', '楠西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710533', '710500', '3', '南化', '南化区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710534', '710500', '3', '左镇', '左镇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710535', '710500', '3', '仁德', '仁德区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710536', '710500', '3', '归仁', '归仁区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710537', '710500', '3', '关庙', '关庙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710538', '710500', '3', '龙崎', '龙崎区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710539', '710500', '3', '永康', '永康区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710600', '710000', '2', '新竹', '新竹市', 'xinzhu', '0');
INSERT INTO `logistics_pca` VALUES ('710601', '710600', '3', '东区', '东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710602', '710600', '3', '北区', '北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710603', '710600', '3', '香山', '香山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710700', '710000', '2', '嘉义', '嘉义市', 'jiayi', '0');
INSERT INTO `logistics_pca` VALUES ('710701', '710700', '3', '东区', '东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710702', '710700', '3', '西区', '西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710800', '710000', '2', '新北', '新北市', 'xinbei', '0');
INSERT INTO `logistics_pca` VALUES ('710801', '710800', '3', '板桥', '板桥区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710802', '710800', '3', '三重', '三重区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710803', '710800', '3', '中和', '中和区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710804', '710800', '3', '永和', '永和区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710805', '710800', '3', '新庄', '新庄区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710806', '710800', '3', '新店', '新店区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710807', '710800', '3', '树林', '树林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710808', '710800', '3', '莺歌', '莺歌区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710809', '710800', '3', '三峡', '三峡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710810', '710800', '3', '淡水', '淡水区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710811', '710800', '3', '汐止', '汐止区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710812', '710800', '3', '瑞芳', '瑞芳区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710813', '710800', '3', '土城', '土城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710814', '710800', '3', '芦洲', '芦洲区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710815', '710800', '3', '五股', '五股区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710816', '710800', '3', '泰山', '泰山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710817', '710800', '3', '林口', '林口区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710818', '710800', '3', '深坑', '深坑区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710819', '710800', '3', '石碇', '石碇区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710820', '710800', '3', '坪林', '坪林区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710821', '710800', '3', '三芝', '三芝区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710822', '710800', '3', '石门', '石门区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710823', '710800', '3', '八里', '八里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710824', '710800', '3', '平溪', '平溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710825', '710800', '3', '双溪', '双溪区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710826', '710800', '3', '贡寮', '贡寮区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710827', '710800', '3', '金山', '金山区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710828', '710800', '3', '万里', '万里区', '', '0');
INSERT INTO `logistics_pca` VALUES ('710829', '710800', '3', '乌来', '乌来区', '', '0');
INSERT INTO `logistics_pca` VALUES ('712200', '710000', '2', '宜兰', '宜兰县', 'yilan', '0');
INSERT INTO `logistics_pca` VALUES ('712201', '712200', '3', '宜兰', '宜兰市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712221', '712200', '3', '罗东', '罗东镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712222', '712200', '3', '苏澳', '苏澳镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712223', '712200', '3', '头城', '头城镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712224', '712200', '3', '礁溪', '礁溪乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712225', '712200', '3', '壮围', '壮围乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712226', '712200', '3', '员山', '员山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712227', '712200', '3', '冬山', '冬山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712228', '712200', '3', '五结', '五结乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712229', '712200', '3', '三星', '三星乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712230', '712200', '3', '大同', '大同乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712231', '712200', '3', '南澳', '南澳乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712300', '710000', '2', '桃园', '桃园县', 'taoyuan', '0');
INSERT INTO `logistics_pca` VALUES ('712301', '712300', '3', '桃园', '桃园市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712302', '712300', '3', '中坜', '中坜市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712303', '712300', '3', '平镇', '平镇市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712304', '712300', '3', '八德', '八德市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712305', '712300', '3', '杨梅', '杨梅市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712306', '712300', '3', '芦竹', '芦竹市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712321', '712300', '3', '大溪', '大溪镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712324', '712300', '3', '大园', '大园乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712325', '712300', '3', '龟山', '龟山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712327', '712300', '3', '龙潭', '龙潭乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712329', '712300', '3', '新屋', '新屋乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712330', '712300', '3', '观音', '观音乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712331', '712300', '3', '复兴', '复兴乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712400', '710000', '2', '新竹', '新竹县', 'xinzhu', '0');
INSERT INTO `logistics_pca` VALUES ('712401', '712400', '3', '竹北', '竹北市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712421', '712400', '3', '竹东', '竹东镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712422', '712400', '3', '新埔', '新埔镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712423', '712400', '3', '关西', '关西镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712424', '712400', '3', '湖口', '湖口乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712425', '712400', '3', '新丰', '新丰乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712426', '712400', '3', '芎林', '芎林乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712427', '712400', '3', '横山', '横山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712428', '712400', '3', '北埔', '北埔乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712429', '712400', '3', '宝山', '宝山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712430', '712400', '3', '峨眉', '峨眉乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712431', '712400', '3', '尖石', '尖石乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712432', '712400', '3', '五峰', '五峰乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712500', '710000', '2', '苗栗', '苗栗县', 'miaoli', '0');
INSERT INTO `logistics_pca` VALUES ('712501', '712500', '3', '苗栗', '苗栗市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712521', '712500', '3', '苑里', '苑里镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712522', '712500', '3', '通霄', '通霄镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712523', '712500', '3', '竹南', '竹南镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712524', '712500', '3', '头份', '头份镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712525', '712500', '3', '后龙', '后龙镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712526', '712500', '3', '卓兰', '卓兰镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712527', '712500', '3', '大湖', '大湖乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712528', '712500', '3', '公馆', '公馆乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712529', '712500', '3', '铜锣', '铜锣乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712530', '712500', '3', '南庄', '南庄乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712531', '712500', '3', '头屋', '头屋乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712532', '712500', '3', '三义', '三义乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712533', '712500', '3', '西湖', '西湖乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712534', '712500', '3', '造桥', '造桥乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712535', '712500', '3', '三湾', '三湾乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712536', '712500', '3', '狮潭', '狮潭乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712537', '712500', '3', '泰安', '泰安乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712700', '710000', '2', '彰化', '彰化县', 'zhanghua', '0');
INSERT INTO `logistics_pca` VALUES ('712701', '712700', '3', '彰化市', '彰化市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712721', '712700', '3', '鹿港', '鹿港镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712722', '712700', '3', '和美', '和美镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712723', '712700', '3', '线西', '线西乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712724', '712700', '3', '伸港', '伸港乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712725', '712700', '3', '福兴', '福兴乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712726', '712700', '3', '秀水', '秀水乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712727', '712700', '3', '花坛', '花坛乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712728', '712700', '3', '芬园', '芬园乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712729', '712700', '3', '员林', '员林镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712730', '712700', '3', '溪湖', '溪湖镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712731', '712700', '3', '田中', '田中镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712732', '712700', '3', '大村', '大村乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712733', '712700', '3', '埔盐', '埔盐乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712734', '712700', '3', '埔心', '埔心乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712735', '712700', '3', '永靖', '永靖乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712736', '712700', '3', '社头', '社头乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712737', '712700', '3', '二水', '二水乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712738', '712700', '3', '北斗', '北斗镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712739', '712700', '3', '二林', '二林镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712740', '712700', '3', '田尾', '田尾乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712741', '712700', '3', '埤头', '埤头乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712742', '712700', '3', '芳苑', '芳苑乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712743', '712700', '3', '大城', '大城乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712744', '712700', '3', '竹塘', '竹塘乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712745', '712700', '3', '溪州', '溪州乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712800', '710000', '2', '南投', '南投县', 'nantou', '0');
INSERT INTO `logistics_pca` VALUES ('712801', '712800', '3', '南投市', '南投市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712821', '712800', '3', '埔里', '埔里镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712822', '712800', '3', '草屯', '草屯镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712823', '712800', '3', '竹山', '竹山镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712824', '712800', '3', '集集', '集集镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712825', '712800', '3', '名间', '名间乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712826', '712800', '3', '鹿谷', '鹿谷乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712827', '712800', '3', '中寮', '中寮乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712828', '712800', '3', '鱼池', '鱼池乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712829', '712800', '3', '国姓', '国姓乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712830', '712800', '3', '水里', '水里乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712831', '712800', '3', '信义', '信义乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712832', '712800', '3', '仁爱', '仁爱乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712900', '710000', '2', '云林', '云林县', 'yunlin', '0');
INSERT INTO `logistics_pca` VALUES ('712901', '712900', '3', '斗六', '斗六市', '', '0');
INSERT INTO `logistics_pca` VALUES ('712921', '712900', '3', '斗南', '斗南镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712922', '712900', '3', '虎尾', '虎尾镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712923', '712900', '3', '西螺', '西螺镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712924', '712900', '3', '土库', '土库镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712925', '712900', '3', '北港', '北港镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('712926', '712900', '3', '古坑', '古坑乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712927', '712900', '3', '大埤', '大埤乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712928', '712900', '3', '莿桐', '莿桐乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712929', '712900', '3', '林内', '林内乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712930', '712900', '3', '二仑', '二仑乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712931', '712900', '3', '仑背', '仑背乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712932', '712900', '3', '麦寮', '麦寮乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712933', '712900', '3', '东势', '东势乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712934', '712900', '3', '褒忠', '褒忠乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712935', '712900', '3', '台西', '台西乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712936', '712900', '3', '元长', '元长乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712937', '712900', '3', '四湖', '四湖乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712938', '712900', '3', '口湖', '口湖乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('712939', '712900', '3', '水林', '水林乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713000', '710000', '2', '嘉义', '嘉义县', 'jiayi', '0');
INSERT INTO `logistics_pca` VALUES ('713001', '713000', '3', '太保', '太保市', '', '0');
INSERT INTO `logistics_pca` VALUES ('713002', '713000', '3', '朴子', '朴子市', '', '0');
INSERT INTO `logistics_pca` VALUES ('713023', '713000', '3', '布袋', '布袋镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713024', '713000', '3', '大林', '大林镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713025', '713000', '3', '民雄', '民雄乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713026', '713000', '3', '溪口', '溪口乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713027', '713000', '3', '新港', '新港乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713028', '713000', '3', '六脚', '六脚乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713029', '713000', '3', '东石', '东石乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713030', '713000', '3', '义竹', '义竹乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713031', '713000', '3', '鹿草', '鹿草乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713032', '713000', '3', '水上', '水上乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713033', '713000', '3', '中埔', '中埔乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713034', '713000', '3', '竹崎', '竹崎乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713035', '713000', '3', '梅山', '梅山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713036', '713000', '3', '番路', '番路乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713037', '713000', '3', '大埔', '大埔乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713038', '713000', '3', '阿里山', '阿里山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713300', '710000', '2', '屏东', '屏东县', 'pingdong', '0');
INSERT INTO `logistics_pca` VALUES ('713301', '713300', '3', '屏东', '屏东市', '', '0');
INSERT INTO `logistics_pca` VALUES ('713321', '713300', '3', '潮州', '潮州镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713322', '713300', '3', '东港', '东港镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713323', '713300', '3', '恒春', '恒春镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713324', '713300', '3', '万丹', '万丹乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713325', '713300', '3', '长治', '长治乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713326', '713300', '3', '麟洛', '麟洛乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713327', '713300', '3', '九如', '九如乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713328', '713300', '3', '里港', '里港乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713329', '713300', '3', '盐埔', '盐埔乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713330', '713300', '3', '高树', '高树乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713331', '713300', '3', '万峦', '万峦乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713332', '713300', '3', '内埔', '内埔乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713333', '713300', '3', '竹田', '竹田乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713334', '713300', '3', '新埤', '新埤乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713335', '713300', '3', '枋寮', '枋寮乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713336', '713300', '3', '新园', '新园乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713337', '713300', '3', '崁顶', '崁顶乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713338', '713300', '3', '林边', '林边乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713339', '713300', '3', '南州', '南州乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713340', '713300', '3', '佳冬', '佳冬乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713341', '713300', '3', '琉球', '琉球乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713342', '713300', '3', '车城', '车城乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713343', '713300', '3', '满州', '满州乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713344', '713300', '3', '枋山', '枋山乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713345', '713300', '3', '三地门', '三地门乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713346', '713300', '3', '雾台', '雾台乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713347', '713300', '3', '玛家', '玛家乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713348', '713300', '3', '泰武', '泰武乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713349', '713300', '3', '来义', '来义乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713350', '713300', '3', '春日', '春日乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713351', '713300', '3', '狮子', '狮子乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713352', '713300', '3', '牡丹', '牡丹乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713400', '710000', '2', '台东', '台东县', 'taidong', '0');
INSERT INTO `logistics_pca` VALUES ('713401', '713400', '3', '台东', '台东市', '', '0');
INSERT INTO `logistics_pca` VALUES ('713421', '713400', '3', '成功', '成功镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713422', '713400', '3', '关山', '关山镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713423', '713400', '3', '卑南', '卑南乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713424', '713400', '3', '鹿野', '鹿野乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713425', '713400', '3', '池上', '池上乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713426', '713400', '3', '东河', '东河乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713427', '713400', '3', '长滨', '长滨乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713428', '713400', '3', '太麻里', '太麻里乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713429', '713400', '3', '大武', '大武乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713430', '713400', '3', '绿岛', '绿岛乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713431', '713400', '3', '海端', '海端乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713432', '713400', '3', '延平', '延平乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713433', '713400', '3', '金峰', '金峰乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713434', '713400', '3', '达仁', '达仁乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713435', '713400', '3', '兰屿', '兰屿乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713500', '710000', '2', '花莲', '花莲县', 'hualian', '0');
INSERT INTO `logistics_pca` VALUES ('713501', '713500', '3', '花莲', '花莲市', '', '0');
INSERT INTO `logistics_pca` VALUES ('713521', '713500', '3', '凤林', '凤林镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713522', '713500', '3', '玉里', '玉里镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713523', '713500', '3', '新城', '新城乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713524', '713500', '3', '吉安', '吉安乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713525', '713500', '3', '寿丰', '寿丰乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713526', '713500', '3', '光复', '光复乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713527', '713500', '3', '丰滨', '丰滨乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713528', '713500', '3', '瑞穗', '瑞穗乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713529', '713500', '3', '富里', '富里乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713530', '713500', '3', '秀林', '秀林乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713531', '713500', '3', '万荣', '万荣乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713532', '713500', '3', '卓溪', '卓溪乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713600', '710000', '2', '澎湖', '澎湖县', 'penghu', '0');
INSERT INTO `logistics_pca` VALUES ('713601', '713600', '3', '马公', '马公市', '', '0');
INSERT INTO `logistics_pca` VALUES ('713621', '713600', '3', '湖西', '湖西乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713622', '713600', '3', '白沙', '白沙乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713623', '713600', '3', '西屿', '西屿乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713624', '713600', '3', '望安', '望安乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713625', '713600', '3', '七美', '七美乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713700', '710000', '2', '金门', '金门县', 'jinmen', '0');
INSERT INTO `logistics_pca` VALUES ('713701', '713700', '3', '金城', '金城镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713702', '713700', '3', '金湖', '金湖镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713703', '713700', '3', '金沙', '金沙镇', '', '0');
INSERT INTO `logistics_pca` VALUES ('713704', '713700', '3', '金宁', '金宁乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713705', '713700', '3', '烈屿', '烈屿乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713706', '713700', '3', '乌丘', '乌丘乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713800', '710000', '2', '连江', '连江县', 'lianjiang', '0');
INSERT INTO `logistics_pca` VALUES ('713801', '713800', '3', '南竿', '南竿乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713802', '713800', '3', '北竿', '北竿乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713803', '713800', '3', '莒光', '莒光乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('713804', '713800', '3', '东引', '东引乡', '', '0');
INSERT INTO `logistics_pca` VALUES ('810000', '0', '1', '香港', '香港特别行政区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810100', '810000', '2', '香港岛', '香港岛', 'xianggangdao', '0');
INSERT INTO `logistics_pca` VALUES ('810101', '810100', '3', '中西区', '中西区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810102', '810100', '3', '湾仔区', '湾仔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810103', '810100', '3', '东区', '东区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810104', '810100', '3', '南区', '南区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810200', '810000', '2', '九龙', '九龙', 'jiulong', '0');
INSERT INTO `logistics_pca` VALUES ('810201', '810200', '3', '油尖旺', '油尖旺区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810202', '810200', '3', '深水埗', '深水埗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810203', '810200', '3', '九龙城', '九龙城区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810204', '810200', '3', '黄大仙', '黄大仙区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810205', '810200', '3', '观塘', '观塘区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810300', '810000', '2', '新界', '新界', 'xinjie', '0');
INSERT INTO `logistics_pca` VALUES ('810301', '810300', '3', '荃湾', '荃湾区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810302', '810300', '3', '屯门', '屯门区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810303', '810300', '3', '元朗', '元朗区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810304', '810300', '3', '北区', '北区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810305', '810300', '3', '大埔', '大埔区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810306', '810300', '3', '西贡', '西贡区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810307', '810300', '3', '沙田', '沙田区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810308', '810300', '3', '葵青', '葵青区', '', '0');
INSERT INTO `logistics_pca` VALUES ('810309', '810300', '3', '离岛', '离岛区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820000', '0', '1', '澳门', '澳门特别行政区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820100', '820000', '2', '澳门半岛', '澳门半岛', 'aomenbandao', '0');
INSERT INTO `logistics_pca` VALUES ('820101', '820100', '3', '花地玛堂区', '花地玛堂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820102', '820100', '3', '圣安多尼堂区', '圣安多尼堂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820103', '820100', '3', '大堂', '大堂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820104', '820100', '3', '望德堂区', '望德堂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820105', '820100', '3', '风顺堂区', '风顺堂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820200', '820000', '2', '氹仔岛', '氹仔岛', 'dangzaidao', '0');
INSERT INTO `logistics_pca` VALUES ('820201', '820200', '3', '嘉模堂区', '嘉模堂区', '', '0');
INSERT INTO `logistics_pca` VALUES ('820300', '820000', '2', '路环岛', '路环岛', 'luhuandao', '0');
INSERT INTO `logistics_pca` VALUES ('820301', '820300', '3', '圣方济各堂区', '圣方济各堂区', '', '0');

-- ----------------------------
-- Table structure for logistics_picture
-- ----------------------------
DROP TABLE IF EXISTS `logistics_picture`;
CREATE TABLE `logistics_picture` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键id自增',
  `path` varchar(255) NOT NULL default '' COMMENT '路径',
  `url` varchar(255) NOT NULL default '' COMMENT '图片链接',
  `md5` char(32) NOT NULL default '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL default '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_picture
-- ----------------------------
INSERT INTO `logistics_picture` VALUES ('1', '/Uploads/Picture/cover/2016/0615/14659634426689.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('2', '/Uploads/Picture/cover/2016/0615/14659681367899.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('3', '/Uploads/Picture/cover/2016/0616/14660430812665.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('4', '/Uploads/Picture/cover/2016/0616/14660447029900.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('5', '/Uploads/Picture/cover/2016/0616/14660473673516.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('6', '/Uploads/Picture/cover/2016/0617/14660973082269.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('7', '/Uploads/Picture/cover/2016/0617/14660977794587.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('8', '/Uploads/Picture/cover/2016/0617/14661629881638.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('9', '/Uploads/Picture/cover/2016/0617/14661641753957.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('10', '/Uploads/Picture/cover/2016/0617/14661659771106.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('11', '/Uploads/Picture/cover/2016/0617/14661668665276.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('12', '/Uploads/Picture/cover/2016/0618/14662508281684.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('13', '/Uploads/Picture/cover/2016/0619/14663439621890.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('14', '/Uploads/Picture/cover/2016/0619/14663445037457.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('15', '/Uploads/Picture/cover/2016/0621/14664817969160.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('16', '/Uploads/Picture/cover/2016/0622/14666017712387.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('17', '/Uploads/Picture/cover/2013/0610/13708376987104.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('18', '/Uploads/Picture/cover/2016/0602/14648354656650.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('19', '/Uploads/Picture/cover/2016/0602/14648360256435.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('20', '/Uploads/Picture/cover/2016/0601/14647662406195.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('21', '/Uploads/Picture/cover/2016/0602/14648609473974.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('22', '/Uploads/Picture/cover/2016/0602/14648612373063.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('23', '/Uploads/Picture/cover/2016/0602/14648615368162.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('24', '/Uploads/Picture/cover/2016/0603/14649157772257.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('25', '/Uploads/Picture/cover/2016/0603/14649163752490.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('26', '/Uploads/Picture/cover/2016/0603/14649181865888.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('27', '/Uploads/Picture/cover/2016/0603/14649189187083.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('28', '/Uploads/Picture/cover/2016/0611/14656236438213.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('29', '/Uploads/Picture/cover/2016/0605/14650900897352.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('30', '/Uploads/Picture/cover/2016/0608/14653559879223.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('31', '/Uploads/Picture/cover/2016/0606/14651852308367.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('32', '/Uploads/Picture/cover/2016/0606/14651865608959.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('33', '/Uploads/Picture/cover/2016/0607/14652790575033.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('34', '/Uploads/Picture/cover/2016/0607/14653003137526.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('35', '/Uploads/Picture/cover/2016/0608/14653513164477.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('36', '/Uploads/Picture/cover/2016/0608/14653525716640.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('37', '/Uploads/Picture/cover/2016/0608/14653817773144.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('38', '/Uploads/Picture/cover/2016/0613/14657864494072.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('39', '/Uploads/Picture/cover/2016/0613/14657871522275.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('40', '/Uploads/Picture/cover/2016/0613/14657889723753.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('41', '/Uploads/Picture/cover/2016/0613/14657883495268.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('42', '/Uploads/Picture/cover/2016/0613/14657902691250.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('43', '/Uploads/Picture/cover/2016/0613/14658211318362.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('44', '/Uploads/Picture/cover/2016/0613/14658216578548.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('45', '/Uploads/Picture/cover/2016/0613/14658238931325.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('46', '/Uploads/Picture/cover/2016/0614/14659065726402.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('47', '/Uploads/Picture/cover/2016/0614/14659105457711.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('48', '/Uploads/Picture/cover/2016/0615/14659580792180.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('49', '/Uploads/Picture/cover/2016/0615/14659601229594.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('50', '/Uploads/Picture/cover/2016/0516/14633629231240.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('51', '/Uploads/Picture/cover/2016/0516/14633632166845.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('52', '/Uploads/Picture/cover/2016/0518/14635548342332.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('53', '/Uploads/Picture/cover/2016/0520/14637144862423.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('54', '/Uploads/Picture/cover/2016/0520/14637145659516.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('55', '/Uploads/Picture/cover/2016/0608/14653566287380.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('56', '/Uploads/Picture/cover/2016/0602/14648321901419.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('57', '/Uploads/Picture/cover/2016/0602/14648336586708.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('58', '/Uploads/Picture/cover/2016/0602/14648351404449.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('59', '/Uploads/Picture/cover/2016/0527/14643143405530.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('60', '/Uploads/Picture/cover/2016/0527/14643151547207.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('61', '/Uploads/Picture/cover/2016/0530/14645791042337.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('62', '/Uploads/Picture/cover/2016/0530/14645796351665.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('63', '/Uploads/Picture/cover/2016/0527/14643157491417.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('64', '/Uploads/Picture/cover/2016/0530/14645777941097.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('65', '/Uploads/Picture/cover/2016/0527/14643178045469.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('66', '/Uploads/Picture/cover/2016/0527/14643183191612.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('67', '/Uploads/Picture/cover/2016/0530/14645800394398.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('68', '/Uploads/Picture/cover/2016/0527/14643188324632.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('69', '/Uploads/Picture/cover/2016/0529/14644914718302.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('70', '/Uploads/Picture/cover/2016/0529/14644926912054.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('71', '/Uploads/Picture/cover/2016/0529/14644939034623.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('72', '/Uploads/Picture/cover/2016/0529/14645365966434.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('73', '/Uploads/Picture/cover/2016/0530/14645382592965.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('74', '/Uploads/Picture/cover/2016/0530/14645386511196.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('75', '/Uploads/Picture/cover/2016/0530/14645390331065.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('76', '/Uploads/Picture/cover/2016/0530/14645394787296.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('77', '/Uploads/Picture/cover/2016/0530/14646027664979.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('78', '/Uploads/Picture/cover/2016/0530/14646032742474.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('79', '/Uploads/Picture/cover/2016/0530/14646081562459.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('80', '/Uploads/Picture/cover/2016/0530/14646085573173.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('81', '/Uploads/Picture/cover/2016/0530/14646161176923.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('82', '/Uploads/Picture/cover/2016/0531/14646792052221.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('83', '/Uploads/Picture/cover/2016/0531/14646794839057.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('84', '/Uploads/Picture/cover/2016/0531/14647070188690.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('85', '/Uploads/Picture/cover/2016/0531/14647083864414.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('86', '/Uploads/Picture/cover/2016/0601/14647661759020.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('87', '/Uploads/Picture/cover/2016/0623/14666874354727.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('88', '/Uploads/Picture/cover/2016/0623/14666972412330.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('89', '/Uploads/Picture/cover/2016/0624/14666992583822.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('90', '/Uploads/Picture/cover/2016/0625/14667842663254.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('91', '/Uploads/Picture/cover/2016/0625/14668649894593.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('92', '/Uploads/Picture/cover/2016/0625/14668668722146.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('93', '/Uploads/Picture/cover/2016/0627/14669949311359.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('94', '/Uploads/Picture/cover/2017/0428/14933493937207.jpg', '', '', '', '1', '0');
INSERT INTO `logistics_picture` VALUES ('95', '/Uploads/Picture/cover/2017/0513/591713ae95e5a.png', '', '45e71d09946ad8edb9af61b0b031321f', 'baa8ce18c646b04af1dbedc51b32921adc0bfdbb', '1', '1494684590');
INSERT INTO `logistics_picture` VALUES ('96', '/Uploads/Picture/ad_img/2017/0513/591726b4ba2a6.jpg', '', '5aa2d69a142735e5b5353f6373a90cfe', '8c0a41243a9baa915d8ddd846d638f6c34be0ad8', '1', '1494689460');
INSERT INTO `logistics_picture` VALUES ('97', '/Uploads/Picture/ad_img/2017/0513/591726bec77d5.png', '', 'd6432a28701f4e352b2d19b6c29c7216', '21e3da8bbe648fbf1ed71e12285ce6e629a5cb15', '1', '1494689470');

-- ----------------------------
-- Table structure for logistics_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `logistics_ucenter_admin`;
CREATE TABLE `logistics_ucenter_admin` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL default '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL default '0' COMMENT '管理员状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of logistics_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `logistics_ucenter_app`;
CREATE TABLE `logistics_ucenter_app` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL default '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '应用状态',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of logistics_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `logistics_ucenter_member`;
CREATE TABLE `logistics_ucenter_member` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) default '' COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL default '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL default '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL default '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL default '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) default '0' COMMENT '用户状态',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `email` USING BTREE (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of logistics_ucenter_member
-- ----------------------------
INSERT INTO `logistics_ucenter_member` VALUES ('1', 'shexie303', '65b5375e3ee5cc2cd02c91363d8d8ab4', 'lc@qq.com', '', '1494778491', '2130706433', '1494778866', '2130706433', '1494778491', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('2', '13932662063', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('3', '18931649415', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('4', '0316-5310982', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('5', '13315605505', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('6', '0316-2626044', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('7', '0316-5314522', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('8', '15930643072', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('9', '0316-7966966', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('10', '0316-7986476', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('11', '15076605987', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('12', '0316-5670010', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('13', '0316-5316710', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('14', '0316-5322104', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('15', '0312-2858312', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('16', '0316-5322666', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('17', '0316-5322268', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('18', '0316-5321020', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('19', '0316-5328572', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('20', '0316-5327711', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('21', '15832657222', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('22', '0316-5314286', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('23', '0316-5322345', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('24', '0316-5328470', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('25', '0316-5328305', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('26', '0316-7860274', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('27', '0316-5320516', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('28', '0316-5320993', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('29', '13785661313', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('30', '0316-5321008', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('31', '0316-5313316', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('32', '0316-5018225', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('33', '0316-5326388', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('34', '15030666770', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('35', '0316-5310418', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('36', '0316-5323693', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('37', '0316-5312639', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('38', '15630610666', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('39', '0316-5310761', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('40', '0312-5711997', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('41', '13833622077', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('42', '0316-2626091', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('43', '0316-5328658', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('44', '0316-2626060', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('45', '0316-5322026', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('46', '18832666333', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('47', '0316-5313615', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('48', '18731670898', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('49', '15081661826', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('50', '13931636035', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('51', '0316-8100888', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('52', '0316-5328760', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('53', '0316-5321670', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('54', '15531613668', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('55', '0316-5016618', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('56', '0316-5018718', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('57', '18631682688', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('58', '0316-5328141', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('59', '0316-8656303', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('60', '13731630046', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('61', '0316-5327738', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('62', '0316-5321497', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('63', '0316-2626030', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('64', '0316-7983373', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('65', '0316-5019775', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('66', '0316-5321991', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('67', '0316-5328497', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '1494771003', '2130706433', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('68', '0316-5317360', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('69', '0316-2785288', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('70', '15133600323', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('71', '0316-7986666', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('72', '0316-5328554', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('73', '0316-5322625', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('74', '0312-5722733', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('75', '0316-5322734', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('76', '0316-5018788', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('77', '0316-2626036', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('78', '18531635305', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('79', '0316-2785299', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('80', '0316-5327892', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('81', '0316-5327885', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('82', '0316-7343760', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('83', '0316-5322491', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('84', '0316-2785281', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('85', 'yuantengadmin', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '1494779344', '2130706433', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('86', 'adminyuanteng', '92a31aa2a091a78072cfbc4948096588', '', '', '1494770713', '2130706433', '1494770757', '2130706433', '1494770713', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('87', '18871718899', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('88', '0316-7987009', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('89', '0316-7981116', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('90', '0316-2308088', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('91', '0316-5312928', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('92', '0316-5333458', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('93', '15030450752', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('94', '13933930320', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('95', '0316-5328878', '92a31aa2a091a78072cfbc4948096588', '', '', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for logistics_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `logistics_ucenter_setting`;
CREATE TABLE `logistics_ucenter_setting` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL default '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of logistics_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_url
-- ----------------------------
DROP TABLE IF EXISTS `logistics_url`;
CREATE TABLE `logistics_url` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '链接唯一标识',
  `url` char(255) NOT NULL default '' COMMENT '链接地址',
  `short` char(100) NOT NULL default '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL default '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of logistics_url
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_userdata
-- ----------------------------
DROP TABLE IF EXISTS `logistics_userdata`;
CREATE TABLE `logistics_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_userdata
-- ----------------------------
