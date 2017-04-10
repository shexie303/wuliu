/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50086
Source Host           : localhost:3306
Source Database       : logistics

Target Server Type    : MYSQL
Target Server Version : 50086
File Encoding         : 65001

Date: 2017-04-10 17:51:32
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
INSERT INTO `logistics_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `logistics_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `logistics_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
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
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of logistics_action_log
-- ----------------------------
INSERT INTO `logistics_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:01登录了后台', '1', '1490320910');
INSERT INTO `logistics_action_log` VALUES ('2', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 10:09登录了后台', '1', '1490321384');
INSERT INTO `logistics_action_log` VALUES ('3', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 10:12登录了后台', '1', '1490321528');
INSERT INTO `logistics_action_log` VALUES ('4', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:14登录了后台', '1', '1490321655');
INSERT INTO `logistics_action_log` VALUES ('5', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 10:27登录了后台', '1', '1490322438');
INSERT INTO `logistics_action_log` VALUES ('6', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:28登录了后台', '1', '1490322480');
INSERT INTO `logistics_action_log` VALUES ('7', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:35登录了后台', '1', '1490322909');
INSERT INTO `logistics_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:35登录了后台', '1', '1490322931');
INSERT INTO `logistics_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:36登录了后台', '1', '1490322977');
INSERT INTO `logistics_action_log` VALUES ('10', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 10:36登录了后台', '1', '1490323010');
INSERT INTO `logistics_action_log` VALUES ('11', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 10:37登录了后台', '1', '1490323037');
INSERT INTO `logistics_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 10:52登录了后台', '1', '1490323954');
INSERT INTO `logistics_action_log` VALUES ('13', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 10:53登录了后台', '1', '1490324014');
INSERT INTO `logistics_action_log` VALUES ('14', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 11:09登录了后台', '1', '1490324940');
INSERT INTO `logistics_action_log` VALUES ('15', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 11:11登录了后台', '1', '1490325070');
INSERT INTO `logistics_action_log` VALUES ('16', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 11:13登录了后台', '1', '1490325224');
INSERT INTO `logistics_action_log` VALUES ('17', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1490325314');
INSERT INTO `logistics_action_log` VALUES ('18', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/add.html', '1', '1490325406');
INSERT INTO `logistics_action_log` VALUES ('19', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1490326791');
INSERT INTO `logistics_action_log` VALUES ('20', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1490326816');
INSERT INTO `logistics_action_log` VALUES ('21', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/add.html', '1', '1490326849');
INSERT INTO `logistics_action_log` VALUES ('22', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 11:43登录了后台', '1', '1490327024');
INSERT INTO `logistics_action_log` VALUES ('23', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 11:49登录了后台', '1', '1490327367');
INSERT INTO `logistics_action_log` VALUES ('24', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 13:29登录了后台', '1', '1490333384');
INSERT INTO `logistics_action_log` VALUES ('25', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1490334576');
INSERT INTO `logistics_action_log` VALUES ('26', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/admin/category/edit.html', '1', '1490334583');
INSERT INTO `logistics_action_log` VALUES ('27', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-24 16:33登录了后台', '1', '1490344425');
INSERT INTO `logistics_action_log` VALUES ('28', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-24 16:59登录了后台', '1', '1490345952');
INSERT INTO `logistics_action_log` VALUES ('29', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 09:41登录了后台', '1', '1490578896');
INSERT INTO `logistics_action_log` VALUES ('30', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1490579429');
INSERT INTO `logistics_action_log` VALUES ('31', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 10:15登录了后台', '1', '1490580927');
INSERT INTO `logistics_action_log` VALUES ('32', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 10:19登录了后台', '1', '1490581175');
INSERT INTO `logistics_action_log` VALUES ('33', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 10:21登录了后台', '1', '1490581277');
INSERT INTO `logistics_action_log` VALUES ('34', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 10:21登录了后台', '1', '1490581294');
INSERT INTO `logistics_action_log` VALUES ('35', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 10:23登录了后台', '1', '1490581439');
INSERT INTO `logistics_action_log` VALUES ('36', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 10:40登录了后台', '1', '1490582459');
INSERT INTO `logistics_action_log` VALUES ('37', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 10:47登录了后台', '1', '1490582865');
INSERT INTO `logistics_action_log` VALUES ('38', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 10:48登录了后台', '1', '1490582922');
INSERT INTO `logistics_action_log` VALUES ('39', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 10:49登录了后台', '1', '1490582949');
INSERT INTO `logistics_action_log` VALUES ('40', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 10:50登录了后台', '1', '1490583029');
INSERT INTO `logistics_action_log` VALUES ('41', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 10:56登录了后台', '1', '1490583415');
INSERT INTO `logistics_action_log` VALUES ('42', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/add.html', '1', '1490584913');
INSERT INTO `logistics_action_log` VALUES ('43', '10', '1', '2130706433', 'Menu', '123', '操作url：/index.php?s=/admin/menu/add.html', '1', '1490592505');
INSERT INTO `logistics_action_log` VALUES ('44', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 13:30登录了后台', '1', '1490592640');
INSERT INTO `logistics_action_log` VALUES ('45', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 13:35登录了后台', '1', '1490592944');
INSERT INTO `logistics_action_log` VALUES ('46', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 13:36登录了后台', '1', '1490592965');
INSERT INTO `logistics_action_log` VALUES ('47', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 13:40登录了后台', '1', '1490593208');
INSERT INTO `logistics_action_log` VALUES ('48', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 13:41登录了后台', '1', '1490593277');
INSERT INTO `logistics_action_log` VALUES ('49', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 13:42登录了后台', '1', '1490593366');
INSERT INTO `logistics_action_log` VALUES ('50', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/add.html', '1', '1490595686');
INSERT INTO `logistics_action_log` VALUES ('51', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1490596859');
INSERT INTO `logistics_action_log` VALUES ('52', '10', '1', '2130706433', 'Menu', '16', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1490596881');
INSERT INTO `logistics_action_log` VALUES ('53', '10', '1', '2130706433', 'Menu', '16', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1490597071');
INSERT INTO `logistics_action_log` VALUES ('54', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1490597134');
INSERT INTO `logistics_action_log` VALUES ('55', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1490597231');
INSERT INTO `logistics_action_log` VALUES ('56', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 15:03登录了后台', '1', '1490598234');
INSERT INTO `logistics_action_log` VALUES ('57', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 15:04登录了后台', '1', '1490598286');
INSERT INTO `logistics_action_log` VALUES ('58', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 15:05登录了后台', '1', '1490598357');
INSERT INTO `logistics_action_log` VALUES ('59', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 15:06登录了后台', '1', '1490598412');
INSERT INTO `logistics_action_log` VALUES ('60', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 15:30登录了后台', '1', '1490599810');
INSERT INTO `logistics_action_log` VALUES ('64', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 16:22登录了后台', '1', '1490602955');
INSERT INTO `logistics_action_log` VALUES ('65', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-27 17:04登录了后台', '1', '1490605499');
INSERT INTO `logistics_action_log` VALUES ('66', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 17:11登录了后台', '1', '1490605867');
INSERT INTO `logistics_action_log` VALUES ('67', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 17:12登录了后台', '1', '1490605926');
INSERT INTO `logistics_action_log` VALUES ('68', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 17:12登录了后台', '1', '1490605946');
INSERT INTO `logistics_action_log` VALUES ('69', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-27 17:13登录了后台', '1', '1490605998');
INSERT INTO `logistics_action_log` VALUES ('70', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 17:24登录了后台', '1', '1490606642');
INSERT INTO `logistics_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-27 17:32登录了后台', '1', '1490607148');
INSERT INTO `logistics_action_log` VALUES ('72', '1', '4', '2130706433', 'member', '4', 'shexie55在2017-03-27 17:40登录了后台', '1', '1490607656');
INSERT INTO `logistics_action_log` VALUES ('73', '1', '7', '2130706433', 'member', '7', 'shexie77在2017-03-27 17:53登录了后台', '1', '1490608386');
INSERT INTO `logistics_action_log` VALUES ('74', '1', '9', '2130706433', 'member', '9', 'shexie99在2017-03-28 11:02登录了后台', '1', '1490670123');
INSERT INTO `logistics_action_log` VALUES ('75', '1', '10', '2130706433', 'member', '10', 'shexie98在2017-03-28 11:03登录了后台', '1', '1490670236');
INSERT INTO `logistics_action_log` VALUES ('76', '1', '10', '2130706433', 'member', '10', 'shexie98在2017-03-28 11:05登录了后台', '1', '1490670317');
INSERT INTO `logistics_action_log` VALUES ('77', '1', '15', '2130706433', 'member', '15', 'shexie93在2017-03-28 11:24登录了后台', '1', '1490671452');
INSERT INTO `logistics_action_log` VALUES ('78', '1', '14', '2130706433', 'member', '14', 'shexie94在2017-03-28 11:33登录了后台', '1', '1490672004');
INSERT INTO `logistics_action_log` VALUES ('79', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:39登录了后台', '1', '1490672383');
INSERT INTO `logistics_action_log` VALUES ('80', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:41登录了后台', '1', '1490672469');
INSERT INTO `logistics_action_log` VALUES ('81', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:42登录了后台', '1', '1490672542');
INSERT INTO `logistics_action_log` VALUES ('82', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:44登录了后台', '1', '1490672654');
INSERT INTO `logistics_action_log` VALUES ('83', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 11:45登录了后台', '1', '1490672754');
INSERT INTO `logistics_action_log` VALUES ('84', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:47登录了后台', '1', '1490672866');
INSERT INTO `logistics_action_log` VALUES ('85', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 11:54登录了后台', '1', '1490673258');
INSERT INTO `logistics_action_log` VALUES ('86', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:55登录了后台', '1', '1490673320');
INSERT INTO `logistics_action_log` VALUES ('87', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 11:56登录了后台', '1', '1490673400');
INSERT INTO `logistics_action_log` VALUES ('88', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 11:57登录了后台', '1', '1490673458');
INSERT INTO `logistics_action_log` VALUES ('89', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-28 13:25登录了后台', '1', '1490678701');
INSERT INTO `logistics_action_log` VALUES ('90', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 14:24登录了后台', '1', '1490682250');
INSERT INTO `logistics_action_log` VALUES ('91', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-03-28 14:44登录了后台', '1', '1490683465');
INSERT INTO `logistics_action_log` VALUES ('92', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 14:45登录了后台', '1', '1490683558');
INSERT INTO `logistics_action_log` VALUES ('93', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-28 14:47登录了后台', '1', '1490683653');
INSERT INTO `logistics_action_log` VALUES ('94', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-28 14:50登录了后台', '1', '1490683802');
INSERT INTO `logistics_action_log` VALUES ('95', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-28 14:53登录了后台', '1', '1490684014');
INSERT INTO `logistics_action_log` VALUES ('96', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 15:04登录了后台', '1', '1490684664');
INSERT INTO `logistics_action_log` VALUES ('97', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-28 15:07登录了后台', '1', '1490684831');
INSERT INTO `logistics_action_log` VALUES ('98', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 15:26登录了后台', '1', '1490685991');
INSERT INTO `logistics_action_log` VALUES ('99', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-28 15:53登录了后台', '1', '1490687598');
INSERT INTO `logistics_action_log` VALUES ('100', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 15:57登录了后台', '1', '1490687834');
INSERT INTO `logistics_action_log` VALUES ('101', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490688949');
INSERT INTO `logistics_action_log` VALUES ('102', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490689502');
INSERT INTO `logistics_action_log` VALUES ('103', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490689836');
INSERT INTO `logistics_action_log` VALUES ('104', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490689861');
INSERT INTO `logistics_action_log` VALUES ('105', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490689931');
INSERT INTO `logistics_action_log` VALUES ('106', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490689970');
INSERT INTO `logistics_action_log` VALUES ('107', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490690013');
INSERT INTO `logistics_action_log` VALUES ('108', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490690053');
INSERT INTO `logistics_action_log` VALUES ('109', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490690153');
INSERT INTO `logistics_action_log` VALUES ('110', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490690546');
INSERT INTO `logistics_action_log` VALUES ('111', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490690603');
INSERT INTO `logistics_action_log` VALUES ('112', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 17:00登录了后台', '1', '1490691625');
INSERT INTO `logistics_action_log` VALUES ('113', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 17:08登录了后台', '1', '1490692095');
INSERT INTO `logistics_action_log` VALUES ('114', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 17:12登录了后台', '1', '1490692341');
INSERT INTO `logistics_action_log` VALUES ('115', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 17:15登录了后台', '1', '1490692516');
INSERT INTO `logistics_action_log` VALUES ('116', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-28 17:16登录了后台', '1', '1490692574');
INSERT INTO `logistics_action_log` VALUES ('117', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 17:17登录了后台', '1', '1490692674');
INSERT INTO `logistics_action_log` VALUES ('118', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-28 17:21登录了后台', '1', '1490692865');
INSERT INTO `logistics_action_log` VALUES ('119', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-29 09:26登录了后台', '1', '1490750816');
INSERT INTO `logistics_action_log` VALUES ('120', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-30 09:28登录了后台', '1', '1490837290');
INSERT INTO `logistics_action_log` VALUES ('121', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-30 09:43登录了后台', '1', '1490838215');
INSERT INTO `logistics_action_log` VALUES ('122', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490839549');
INSERT INTO `logistics_action_log` VALUES ('123', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490840117');
INSERT INTO `logistics_action_log` VALUES ('124', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490842444');
INSERT INTO `logistics_action_log` VALUES ('125', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490842513');
INSERT INTO `logistics_action_log` VALUES ('126', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-30 11:23登录了后台', '1', '1490844181');
INSERT INTO `logistics_action_log` VALUES ('127', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-30 14:21登录了后台', '1', '1490854868');
INSERT INTO `logistics_action_log` VALUES ('128', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/Admin/Model/update.html', '1', '1490859874');
INSERT INTO `logistics_action_log` VALUES ('129', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-31 13:56登录了后台', '1', '1490939786');
INSERT INTO `logistics_action_log` VALUES ('130', '10', '1', '2130706433', 'Menu', '124', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1490940181');
INSERT INTO `logistics_action_log` VALUES ('131', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-31 14:07登录了后台', '1', '1490940429');
INSERT INTO `logistics_action_log` VALUES ('132', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-31 14:08登录了后台', '1', '1490940506');
INSERT INTO `logistics_action_log` VALUES ('133', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-03-31 15:36登录了后台', '1', '1490945761');
INSERT INTO `logistics_action_log` VALUES ('134', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-31 15:37登录了后台', '1', '1490945827');
INSERT INTO `logistics_action_log` VALUES ('135', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-03-31 15:57登录了后台', '1', '1490947020');
INSERT INTO `logistics_action_log` VALUES ('136', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-03-31 16:36登录了后台', '1', '1490949382');
INSERT INTO `logistics_action_log` VALUES ('137', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 10:12登录了后台', '1', '1491012740');
INSERT INTO `logistics_action_log` VALUES ('138', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 13:44登录了后台', '1', '1491025499');
INSERT INTO `logistics_action_log` VALUES ('139', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 13:51登录了后台', '1', '1491025889');
INSERT INTO `logistics_action_log` VALUES ('140', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 13:52登录了后台', '1', '1491025922');
INSERT INTO `logistics_action_log` VALUES ('141', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 13:52登录了后台', '1', '1491025975');
INSERT INTO `logistics_action_log` VALUES ('142', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 13:54登录了后台', '1', '1491026094');
INSERT INTO `logistics_action_log` VALUES ('143', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 14:18登录了后台', '1', '1491027512');
INSERT INTO `logistics_action_log` VALUES ('144', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 14:52登录了后台', '1', '1491029559');
INSERT INTO `logistics_action_log` VALUES ('145', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 14:53登录了后台', '1', '1491029605');
INSERT INTO `logistics_action_log` VALUES ('146', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 14:54登录了后台', '1', '1491029661');
INSERT INTO `logistics_action_log` VALUES ('147', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 14:59登录了后台', '1', '1491029955');
INSERT INTO `logistics_action_log` VALUES ('148', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1491029994');
INSERT INTO `logistics_action_log` VALUES ('149', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 15:01登录了后台', '1', '1491030086');
INSERT INTO `logistics_action_log` VALUES ('150', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 15:05登录了后台', '1', '1491030315');
INSERT INTO `logistics_action_log` VALUES ('151', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-01 15:13登录了后台', '1', '1491030815');
INSERT INTO `logistics_action_log` VALUES ('152', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 15:14登录了后台', '1', '1491030860');
INSERT INTO `logistics_action_log` VALUES ('153', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-01 15:18登录了后台', '1', '1491031125');
INSERT INTO `logistics_action_log` VALUES ('154', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-01 15:19登录了后台', '1', '1491031165');
INSERT INTO `logistics_action_log` VALUES ('155', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-01 15:20登录了后台', '1', '1491031214');
INSERT INTO `logistics_action_log` VALUES ('156', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 15:20登录了后台', '1', '1491031257');
INSERT INTO `logistics_action_log` VALUES ('157', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 15:22登录了后台', '1', '1491031359');
INSERT INTO `logistics_action_log` VALUES ('158', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 15:27登录了后台', '1', '1491031666');
INSERT INTO `logistics_action_log` VALUES ('159', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-01 15:32登录了后台', '1', '1491031933');
INSERT INTO `logistics_action_log` VALUES ('160', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 15:33登录了后台', '1', '1491032021');
INSERT INTO `logistics_action_log` VALUES ('161', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 15:55登录了后台', '1', '1491033337');
INSERT INTO `logistics_action_log` VALUES ('162', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 15:57登录了后台', '1', '1491033424');
INSERT INTO `logistics_action_log` VALUES ('163', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-01 16:24登录了后台', '1', '1491035081');
INSERT INTO `logistics_action_log` VALUES ('164', '11', '1', '2130706433', 'category', '4', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1491035129');
INSERT INTO `logistics_action_log` VALUES ('165', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1491035194');
INSERT INTO `logistics_action_log` VALUES ('166', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1491035237');
INSERT INTO `logistics_action_log` VALUES ('167', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 16:33登录了后台', '1', '1491035587');
INSERT INTO `logistics_action_log` VALUES ('168', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 17:23登录了后台', '1', '1491038598');
INSERT INTO `logistics_action_log` VALUES ('169', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 17:24登录了后台', '1', '1491038686');
INSERT INTO `logistics_action_log` VALUES ('170', '1', '4', '2130706433', 'member', '4', 'shexie55在2017-04-01 17:33登录了后台', '1', '1491039189');
INSERT INTO `logistics_action_log` VALUES ('171', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-01 17:33登录了后台', '1', '1491039218');
INSERT INTO `logistics_action_log` VALUES ('172', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-06 13:24登录了后台', '1', '1491456251');
INSERT INTO `logistics_action_log` VALUES ('173', '1', '7', '2130706433', 'member', '7', 'shexie77在2017-04-06 17:02登录了后台', '1', '1491469359');
INSERT INTO `logistics_action_log` VALUES ('174', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-06 17:04登录了后台', '1', '1491469467');
INSERT INTO `logistics_action_log` VALUES ('175', '1', '7', '2130706433', 'member', '7', 'shexie77在2017-04-07 10:30登录了后台', '1', '1491532249');
INSERT INTO `logistics_action_log` VALUES ('176', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-07 13:32登录了后台', '1', '1491543144');
INSERT INTO `logistics_action_log` VALUES ('177', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-07 13:57登录了后台', '1', '1491544653');
INSERT INTO `logistics_action_log` VALUES ('178', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-07 14:01登录了后台', '1', '1491544883');
INSERT INTO `logistics_action_log` VALUES ('179', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-07 15:40登录了后台', '1', '1491550859');
INSERT INTO `logistics_action_log` VALUES ('180', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:41登录了后台', '1', '1491550916');
INSERT INTO `logistics_action_log` VALUES ('181', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:47登录了后台', '1', '1491551252');
INSERT INTO `logistics_action_log` VALUES ('182', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:49登录了后台', '1', '1491551385');
INSERT INTO `logistics_action_log` VALUES ('183', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:52登录了后台', '1', '1491551536');
INSERT INTO `logistics_action_log` VALUES ('184', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:55登录了后台', '1', '1491551711');
INSERT INTO `logistics_action_log` VALUES ('185', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:56登录了后台', '1', '1491551760');
INSERT INTO `logistics_action_log` VALUES ('186', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 15:58登录了后台', '1', '1491551931');
INSERT INTO `logistics_action_log` VALUES ('187', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 16:01登录了后台', '1', '1491552083');
INSERT INTO `logistics_action_log` VALUES ('188', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 16:03登录了后台', '1', '1491552228');
INSERT INTO `logistics_action_log` VALUES ('189', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 16:10登录了后台', '1', '1491552634');
INSERT INTO `logistics_action_log` VALUES ('190', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 16:26登录了后台', '1', '1491553576');
INSERT INTO `logistics_action_log` VALUES ('191', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-07 17:48登录了后台', '1', '1491558501');
INSERT INTO `logistics_action_log` VALUES ('192', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-10 10:16登录了后台', '1', '1491790601');
INSERT INTO `logistics_action_log` VALUES ('193', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-10 10:21登录了后台', '1', '1491790896');
INSERT INTO `logistics_action_log` VALUES ('194', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-10 10:43登录了后台', '1', '1491792191');
INSERT INTO `logistics_action_log` VALUES ('195', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-10 10:45登录了后台', '1', '1491792320');
INSERT INTO `logistics_action_log` VALUES ('196', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-10 10:47登录了后台', '1', '1491792465');
INSERT INTO `logistics_action_log` VALUES ('197', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-10 11:37登录了后台', '1', '1491795478');
INSERT INTO `logistics_action_log` VALUES ('198', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-10 11:54登录了后台', '1', '1491796494');
INSERT INTO `logistics_action_log` VALUES ('199', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-10 16:09登录了后台', '1', '1491811794');

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
INSERT INTO `logistics_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `logistics_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
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
INSERT INTO `logistics_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
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
INSERT INTO `logistics_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `logistics_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '1', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '2', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '3', '1');
INSERT INTO `logistics_auth_extend` VALUES ('2', '4', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_auth_group
-- ----------------------------
INSERT INTO `logistics_auth_group` VALUES ('1', 'admin', '1', '管理员', '', '1', '1,3,23,24,26,88,107,108,110,220');
INSERT INTO `logistics_auth_group` VALUES ('2', 'admin', '1', '普通用户', '', '1', '3,7,10,108,218,220,221');

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
INSERT INTO `logistics_auth_group_access` VALUES ('2', '1');
INSERT INTO `logistics_auth_group_access` VALUES ('3', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('4', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('5', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('6', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('7', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('8', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('9', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('10', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('11', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('12', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('13', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('14', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('15', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('16', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('17', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_auth_rule
-- ----------------------------
INSERT INTO `logistics_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `logistics_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
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
INSERT INTO `logistics_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
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
INSERT INTO `logistics_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
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
INSERT INTO `logistics_auth_rule` VALUES ('220', 'admin', '2', 'Admin/Article/index?cate_id=2', '内容', '1', '');
INSERT INTO `logistics_auth_rule` VALUES ('221', 'admin', '1', 'Admin/User/info', '完善资料', '1', '');

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
  `list_row` tinyint(3) unsigned NOT NULL default '10' COMMENT '列表每页行数',
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
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of logistics_category
-- ----------------------------
INSERT INTO `logistics_category` VALUES ('1', 'wlzx', '物流大全', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1491035237', '1', '0');
INSERT INTO `logistics_category` VALUES ('2', 'jpzx', '精品专线', '1', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '0', '1', '', '', '1490326849', '1490326849', '1', '0');
INSERT INTO `logistics_category` VALUES ('3', 'ldp', '落地配', '1', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1490595686', '1490595686', '1', '0');
INSERT INTO `logistics_category` VALUES ('4', 'zhwl', '综合物流', '1', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1491035129', '1491035129', '1', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_channel
-- ----------------------------
INSERT INTO `logistics_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `logistics_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `logistics_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

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
INSERT INTO `logistics_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '内容管理框架', '0');
INSERT INTO `logistics_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '内容管理框架', '1');
INSERT INTO `logistics_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `logistics_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `logistics_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `logistics_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `logistics_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `logistics_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `logistics_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `logistics_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `logistics_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `logistics_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `logistics_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '0', '1');
INSERT INTO `logistics_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `logistics_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '15', '10');
INSERT INTO `logistics_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `logistics_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `logistics_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `logistics_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `logistics_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `logistics_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `logistics_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `logistics_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
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
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of logistics_document
-- ----------------------------
INSERT INTO `logistics_document` VALUES ('1', '15', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '2', '1', '0', '0', '15', '0', '0', '5', '1387260660', '1490850896', '1');
INSERT INTO `logistics_document` VALUES ('2', '16', '', '试试好使不', '2', '看看这个', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '15', '0', '0', '1', '1490325060', '1490342702', '1');
INSERT INTO `logistics_document` VALUES ('3', '5', '', '【双圆物流】上海至淮安、宿迁、徐州、盐城、连云港专线(苏北三线中转周边地区)', '3', '呜呜呜呜呜呜呜呜呜呜呜呜', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '10', '0', '0', '0', '1490327068', '1490327068', '1');
INSERT INTO `logistics_document` VALUES ('6', '1', '', '尼玛', '39', '111', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1490342760', '1490343570', '1');
INSERT INTO `logistics_document` VALUES ('8', '17', '', '123123', '2', '123123', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '3', '1490685281', '1491032206', '1');

-- ----------------------------
-- Table structure for logistics_document_article
-- ----------------------------
DROP TABLE IF EXISTS `logistics_document_article`;
CREATE TABLE `logistics_document_article` (
  `id` int(10) unsigned NOT NULL default '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL default '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL default '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL default '0' COMMENT '收藏数',
  `qr_code` mediumblob COMMENT '二维码',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of logistics_document_article
-- ----------------------------
INSERT INTO `logistics_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('2', '0', '5555', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('3', '0', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '', '0', 0x89504E470D0A1A0A0000000D4948445200000084000000840802000000DE2614F00000115449444154789CED9D7B4C1C5517C007586029AF5DA88457A55B362D9596474A2505CBC6A0B4B5D80754697D441A2342AB15A986C4AA58B1D1D0D6943468D0844AB450FEC0AA48843610DA6AA2A504497994970584756D2948792DECC27E7FCC7EE73BCECEDC1D96A59D7EB9BFBFEEEC7DCC9D3970CFDC7BCF39D7C16432311469E078BF3B4041984CA625FDE7080C0C3409505353834B767777F3169B9A9A1279AFAB57AF42AD9292121B7A5B535323D4DBC0C0401B1A14097B0BFA9F2121A830240415868470601586838303FC949696969090B09846ABAAAA401F0406060E0D0DF1161B1818F8F1C71FE1B2ABAB6B7676D6B298D168FCF2CB2FE1F285175ED8B469139BEEEFEF2F282880ACD4D4543F3F3F36AD542A838282202B3B3BDB603058ED797272F28A152BD8744444446666266405050569B55A36BD75EBD6A79F7EDA6A6B042E5FBE5C5151019766B56DA9C08B8A8A849498488E1C3902AD11143887D0D050318F5152520255AE5EBD2A542C3D3D1D372E97CB17FABE76EEDC895BC00AFCC891238B7C45454545F85EEC8F749892105418124246CED6EBF53D3D3D621A0A0B0B93C9ACB4C6304C7F7FFFF8F8386F165618BEBEBEFEFEFE6CDA6432B5B7B743D6E0E0606B6B2B9BEEEDEDC52DAC5AB5CACDCD8D4D070707E3ACF0F070BD5ECF7BD3EEEE6EB80C0909F1F0F060D30F3FFCB0D5C76118C66834DEB871434C49B55A6D65B464472BFC0BD619D7AF5F17731B8661EEDCB903B5083A63E7CE9D625ACBC9C9812AB64DFA448225C1889EF4619D71E7CE1D91DDBB7EFD3AD5190F0C541812820A43425857B9F6E5D8B1633939396CBAB1B1F1ADB7DEE22D565151D1D8D8C8A69D9D9D2F5DBA04599F7CF2C94F3FFDC45B2B2323C3D3D39337EBE2C58BAEAEAE96BF070505E1C6D7AF5F2FE221968A7B2D8CF0F070484F4F4F0B151B1A1A8279BB5C2EC72B0267CE9C11AAF5FBEFBF0B65CDCFCFF3FEEEE6E6B6C8E5063B4287290941852121EEF53085F1F7F74F4B4B83CBEAEAEA89890936BD66CD9AA8A82836EDE2E2826BC5C6C6C2F836323272F1E245DEC6552AD5A38F3E0A97DF7EFBAD939393D52E69349A808080853C843DB99FC2888C8C3C77EE1C5CAAD56A10C6F6EDDB4F9E3CC95B2B33331316531B1B1B8584A1D168B076717373E39D8173A8A9A9B98FC2A0C39484A0C29010541812C28ACE080B0B13B910A65028167AEFFAFAFA3D7BF6E04B582825AC6EBEF6DA6B6565656C3A222242A87B9C299E56AB85F5D0F7DE7BEFB3CF3EE3ADB567CF1E67676736FDD4534F7DF3CD37569F42A150887C455E5E5EE40256842193C97C7C7CC4DCC9060C06C3E8E8285C7A787888B9D7E4E424D49A9C9C14D93DA552096982A4E10B829326E0E8E868AF5744872909418521217886A9AAAA2A3083B08D868606A1ACB367CF767474B0694747C7FCFC7CC82A2D2D85613D3E3E7EDBB66D6CDA60301C3D7A148AAD5CB9126A994CA677DF7D17B23233336183AFA9A9E9FCF9F39095979707CA00E3E3E3F3E69B6FE23E88D9D96C6868C0F7B581A6A6269E5F2D77FAEC0B61A72F2929096761EB10C24E1FC13A8460DE3935350559B06CCC304C686828EE435252126411AC43EC0EDDE9931C541812C2AC3396EE7F108C3C2C999999C1C68646A3514C83A3A3A350EBF6EDDB38EBF6EDDB90853F9A1986D16AB5F0454BF866F5F5F58557C1F960253C88DD103286582296D43AC406383AE3FE4287290941852121A83024845981EFDAB54B4CE963C78E8145C1952B5784F67F08FCF6DB6F908E8A8ACACBCB83CBACAC2C9D4EC7A6BFFFFE7B30DD747272C2D3374C4F4FCFDB6FBF0D97C78F1F57ABD56CBABEBEFEF4E9D3BCB5F6EFDFBF63C70E36EDEEEE8EB33EF8E003825503F0CC33CF3CFFFCF3568BB5B5B561E3CAC2C2C290901052055675586D97E5D2A54BA06DCACBCB45D6128230E9C3C8E572218D277ED2873971E284508378D24740A44B00360262FE6DDEC90B1DA6240415868430EB0CFCEFD9D1D1F1E79F7F2EA651B55ABD6AD52A363D333383FF5BA3A2A2C0D36BC3860D8BB98B25BFFEFAEBC8C8089B06B7817B4C4B4B0B68BEA1A121FC62C1D98061988181015830651866CB962D0CC337E9CBCACA12BA93489D919F9F0FC506070771D6F9F3E78546CCC5EB0C912CA9CEC0C6479B376F162A465D02A40E158684A0C290100BB328DCB76F1F38CD69341A8E0F16505A5A0A932F5F5F5F5CECE8D1A3426E0067CE9CE1B5E67374FCD75F4C6E6E6E6565259B5EBD7A356E3C252545C8EFADB5B515EC45962F5FCE5B86C3134F3CF1F9E79FF366959797C3037A7B7BE36DBB53A74E7DF4D147705328C6616C6CCCF2C78509036FC7C6C4C408DDC96432C1FC797A7A1A171B1F1FE7784502010101420D626EDDBA052D28954A5C85D7038305FB5E8AC4DDDD5DA83F0E0E0EB80F380BAFB46BB55AA187E5850E5312820A4342988729BCE4D7D2D222A666676727AE75F0E041D84A8B8F8F874D7F2727275C0CDB5E848484A4A6A6C225B649BC76ED1A4C156532D91B6FBC01595BB66C813D3888F36195C2C242B00ED1683431313156ABF4F4F4E09EBFFAEAAB78D62644757535B885CFCECE62E387D2D252B03D8C8C8C4C4C4CE45666A71B56EF6115EC078EE14CFA309C8542CC891327A01861D2C741CC2B666C9DF40D0E0E42316C61A4542A710B84491F76A1CBCACAB2BC3B1DA6240415868430EB0C6C0B6C3018E6E6E6ACD6747272C2367A7ABD9ED77B558CBF104FB76432E8925C2EC72D3B3B3B8B095262D93DDE62F3F3F333333370497870CE03E2EE59ED8C2546A311B766FEECB61CB9080B8598B4B4345C8BF3B92D0682CEC0102C0A39609D418837857586D0BC958C6D0B85586770600BD0614A42506148082A0C096137D7E3D3A74FF3867B2440B029ADADAD05AF648E522D2929B97CF9329B56A954EFBFFFFE027BFA2FFCFCFC844C179A9B9B85EC4B44D2D5D5B57FFF7EB8CCCCCC046394FAFA7A1E1F354B15649B02B72F78D24720262606D7B241811310B20F62442B700E34F8D783041586845898CE080B0B83C5324218DAC1C1C1BFFEFA8B374BAD56C38C646C6CACABAB0BB2D6AF5F2F6602B572E54AD81D0A090981B054EC25A43D3D3D715674743404191669DCAF542AF1B8D7D2D222264C716868A8D012596F6F2F4CF4FAFBFB794A588E7A22AD4308609B460ED83A84704A0041672CDE8DCC36161F64984EFA1E24A8302404158684E051E0B9B9B93055E9EDEDDDB76F1F6FCD0B172E60DD50575707B13132333385DCC5082607292929605190989808FA60666666F3E6CD50ECC30F3F84C81F939393B885975E7A0966559B366DC21A253131518CFAC568341AACBAAAABABA1056CC572F7EE5D9E3D3B866118263A3AFA8B2FBEE0CD4A4D4DCDCDCDE5FCC8238C909010F82C2158548C8C8C5CBB760D2EB17B6470703027FAB518B0954D4242C2C68D1BD9346765BEAFAFAFAFAF8FB7056CBDBA6EDD3A68816198E6E6E6852EE6E3131F188681C8701C8C46237E0F18C2DBF3F3F3C3DD63A1C39484A0C29010E6614A28582CC19C40A552A5A7A7C365656525EF06DCB265CBF0724D5D5DDDC0C0009B2658EDB7B6B64297E6E7E7F18D30C3C3C3F86C9AE4E464980F3EF6D863428D6FDCB891F0C90FF8FAFA0ABD96888808F06770757515EADEEAD5AB851ABF71E3066EDCACA4D9E986D59EB110267D423B7DB69D1280B1CD8D8CC33D5B282440277D0F12541812820A434AB0A3D514E295575E112A2C5267E4E5E5416BD3D3D3B8985EAF87AC1F7EF8414C0FC5EB0C171717F97FC9C8C8C025B1CE60ED80581E79E4115C2C393919B2525252F06BC1133DDC4240408050F7AE5CB92247343535416BA74E9DB29482F9FB074F4FC458259191C96442F31D6CB5CF89ABBD78F0BE2F610FD86834C214151B4DB1B5606E383737879F021F65885B20CC25E7E7E771AE8B8B0B34C81B168E0E5312820A4342988F133D7CF830FCE4EDED0DCB6D3A9D0E2F963DFBECB3B0E8141515F5E28B2F4256515111FC4B8E8F8FC3F96F5E5E5E3840484949495B5B1B9B767575F5F5F585AC8F3FFE182CE6351A0D9CD7C971093877EE1C3E74E6A1871E82ACC2C242F0604F4F4FC7B3AAC2C242DEE0620A85E2E5975F86CBCACA4A58F8D2EBF5E055CE304C717131675D9245A954E2625F7FFD35441F717171C12E6BB76EDD823EB4B4B4D4D5D5419649CC71A284A3E108D621228F8613193092039EEE8AB70EB101C2A40F639B4B0007B6001DA62404158684307FC5E221627676169CBD743A9D901588BBBB3BF60953A95470748B8F8F0FD48248212CFEFEFE90C57134C6C7773A393941E38E8E8E1089846D105AE0EC9A040707439C48373737A170C1CB972F07973583C1800D35020303972D5B060F889FBDAFAF0F6C1B150A05683B6F6F6FDEBB90F1F2F2C2DACE8CE55889AD43C2C3C38586544EEC10213732DBB0CD8D0C2332DED4E28F13E540DDC8FE4FA0C29010541812C2ACC0CDC1A718866198C4C444B0F51B1E1EC65998356BD66093407C8EE7575F7D25148D2A2F2F2F2E2ECE6AB7525353D7AD5BC7A68D4623EE434E4E8E509730494949B87B3B76EC10E3B1F0CE3BEF7CFAE9A7BC59F8F898B2B2326C3B8AD9BE7D3BD8D67036DC8A8B8B21D834BF073BAB3AF02FF69DF4712004FF1242BC4F1F01FBFAF411282F2FB7A17B2C74989210541812C2AC33F092914AA582B4A7A7A79009012136C4DAB56B856A0D0C0C7CF7DD77BC594F3EF9242C50F6F4F480ED0867AC6F6E6E86B158A9546A341AA16E2C127F7FFFD8D858ABC5666767858EC41E1E1EFEF9E79FC5DCCB1CE4D9E601CE3608D621225D02309C85420236E80CCEC9324270CE85C33A83136498005B9E0E5312820A434250614808B302E7585CDB117F7F7FFE63D06CE5E4C993B018D7DEDE8E7B5E5D5D0DB6E215151538F0565B5B1BD842141616422D91670B310CB361C30608E57CE8D0214B837E9603070EC0B669747434B68F4D4C4CECECEC24DCC22C8C451ECC772F512A95F02AB55A2DEE39F6C0989A9AC259010101609931373767C3F3EA743AA8059BCA968C8E8EC2327E686828FE5BB16A76438729094185212178FE71B66EDDBAC8F8FD0D0D0DBFFCF28BD5622A95EAB9E79E83CBF2F2723014331A8DB0C06530180A0A0AA0585555159CFF864F966318A6A4A4A4B6B6964DCFCDCDE125321CFA119F6EA350280E1E3C0897656565376FDEE4EDEDA14387607422CC3477EDDA059B4856CE91B1849D6EE05FF042A16DD8D73AC4B6A3E108B14330E28F13158230E9E340AD431E24A8302484958F2DA3D178F7EE5D310D29140A4E0479AB180C066C8B87E34A616B3EBD5E2FE41665341AF157A6A7A7277C3ECA6432DC38C6CDCD0D462D826DC7ECECAC500B987FFEF9075F4E4C4C402D994C06EED81C5C5D5DC10CE57FB0A315FE45E4E612076C1D225267884482A79189845A873CC0506148082A0C0961B7809122397CF8F0DEBD7B79B3B2B3B3FFFEFB6F7BDD48A3D10859A8E0C0133A9D2E3B3B1B2EB16D8748262626B0E3DDEBAFBF0EE62F1C03CEE3C78FC38132FC3154EEB1022760DFE3444522DEBC5308F1933EABD0614A42506148887BAD33DADADA38FFD7000E65141414046E009C63AD3A3B3B41B50C0D0DE15054F8E4179D4E87A351C6C7C783C7C21F7FFC017B3E9CA546CCF0F0707B7B3B5CC6C6C6424F060606C0DB8CB3B7D1D1D1013190BDBDBD232323791BD76AB5D8632121218161A43AE9B3CD8D0C43081889770039609DC17123133A5986003D4EF401860A4342506148082B0A5CAD568B541B42CB9304E2E2E28A8B8B79B3AAABABC125402E97E32080F9F9F9607EC1098AB177EF5E300AE52CA6C6C4C4C0362218795882CF7F8B8989C1CF8E9D13333232);
INSERT INTO `logistics_document_article` VALUES ('4', '0', '1', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('5', '0', '2', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('6', '0', '<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>上海双圆物流有限公司</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#E53333;\">上海至淮安、宿迁、徐州、盐城、连云港专线（苏北三线中转周边地区）</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>联系人：房经理</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13611783986\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>上海收货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	上海市宝山区业绩路21号A区甲棚\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	电话：021-51691330\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13611956409\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：陈小姐\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>嘉定收货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	上海市宝安公路2633号祈敏停车场进门第一排13档\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	电话：021-31262856\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13917144475\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：房经理\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>淮安卸货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	淮安市国际农贸城南大门西区A8幢113-115号\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	电话：0517-84991018\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：15358691018\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：房经理\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>宿迁卸货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	宿迁市平安大道748号卡行天下\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	电话：0527-88850210\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13815785901\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：苏经理\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>徐州卸货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	徐州市铜山区长安路大成物流园内D12区-12号\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13013987617\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13775848989\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：张经理\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>连云港卸货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	连云港丁字路福客尔物流园A12卡行天下\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	电话：0518-85153837\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13912165825\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：王经理\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>盐城卸货地址：</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	盐城开放大道361号白马物流园D区7号\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	电话：0515-88892558\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	手机：13651962558\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	联系人：杨经理\r\n</p>', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('8', '0', '123123', '', '0', null);

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
INSERT INTO `logistics_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo');
INSERT INTO `logistics_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', '');
INSERT INTO `logistics_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for logistics_member
-- ----------------------------
DROP TABLE IF EXISTS `logistics_member`;
CREATE TABLE `logistics_member` (
  `uid` int(10) unsigned NOT NULL auto_increment COMMENT '用户ID',
  `nickname` char(16) NOT NULL default '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL default '0' COMMENT '性别',
  `id_card` char(18) NOT NULL default '' COMMENT '身份证',
  `qq` char(10) NOT NULL default '' COMMENT 'qq号',
  `wechat` varchar(50) NOT NULL default '' COMMENT '微信号',
  `telephone` char(11) NOT NULL default '' COMMENT '手机号',
  `facade` varchar(100) NOT NULL default '' COMMENT '门面图片id',
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of logistics_member
-- ----------------------------
INSERT INTO `logistics_member` VALUES ('1', 'shexie303', '0', '131128198911296612', '', '', '', '/Uploads/Picture/facade/2017-04-01/58df1a91bef87.jpg', '/Uploads/Picture/license/2017-04-01/58df1b8d7882c.jpg', '1', '1491494400', '1499356800', '50', '60', '0', '1490319959', '2130706433', '1491795478', '1');
INSERT INTO `logistics_member` VALUES ('2', 'shexie33', '0', '', '', '', '', '', '', '0', '0', '0', '40', '37', '2130706433', '1490321384', '2130706433', '1491550859', '1');
INSERT INTO `logistics_member` VALUES ('3', 'shexie44', '0', '', '', '', '', '', '', '0', '0', '0', '10', '12', '2130706433', '1490582865', '2130706433', '1490683465', '1');
INSERT INTO `logistics_member` VALUES ('4', 'shexie55', '0', '', '', '', '', '', '', '0', '0', '0', '20', '2', '0', '0', '2130706433', '1491039189', '1');
INSERT INTO `logistics_member` VALUES ('5', 'shexie66', '0', '131128198911296613', '123456', '1333333333', '13333333333', '', '', '1', '1491494400', '1499356800', '30', '28', '0', '0', '2130706433', '1491558501', '1');
INSERT INTO `logistics_member` VALUES ('6', 'shexie67', '0', '131128198911296614', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('7', 'shexie77', '0', '', '', '', '', '', '', '0', '0', '0', '20', '3', '2130706433', '1490608386', '2130706433', '1491532249', '1');
INSERT INTO `logistics_member` VALUES ('9', 'shexie99', '0', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490670123', '2130706433', '1490670123', '1');
INSERT INTO `logistics_member` VALUES ('10', 'shexie98', '0', '', '', '', '', '', '', '0', '0', '0', '10', '2', '2130706433', '1490670236', '2130706433', '1490670317', '1');
INSERT INTO `logistics_member` VALUES ('11', 'shexie97', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670500', '0', '0', '-1');
INSERT INTO `logistics_member` VALUES ('12', 'shexie96', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670715', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('13', 'shexie95', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670829', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('14', 'shexie94', '0', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490671091', '2130706433', '1490672004', '-1');
INSERT INTO `logistics_member` VALUES ('15', 'shexie93', '0', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490671422', '2130706433', '1490671452', '-1');
INSERT INTO `logistics_member` VALUES ('16', '李二蛋', '0', '', '', '', '', '', '', '0', '0', '0', '10', '7', '0', '0', '2130706433', '1491031933', '1');
INSERT INTO `logistics_member` VALUES ('17', '二蛋', '0', '131111111111111111', '12314563', '123sdf', '13302134562', '', '', '3', '1491753600', '1499616000', '20', '7', '0', '0', '2130706433', '1491811794', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_menu
-- ----------------------------
INSERT INTO `logistics_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('2', '内容', '0', '2', 'Article/index?cate_id=2', '0', '', '', '0');
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
INSERT INTO `logistics_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0');
INSERT INTO `logistics_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `logistics_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `logistics_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_pay_log
-- ----------------------------
INSERT INTO `logistics_pay_log` VALUES ('2', '66837239298008686269686760860866', '0', '0', '17', '3', '1491790908');

-- ----------------------------
-- Table structure for logistics_pca
-- ----------------------------
DROP TABLE IF EXISTS `logistics_pca`;
CREATE TABLE `logistics_pca` (
  `cityid` int(10) NOT NULL auto_increment COMMENT 'cityid',
  `name` varchar(100) NOT NULL,
  `parentid` int(10) NOT NULL,
  `pinyin` varchar(100) NOT NULL,
  `fistchar` varchar(100) NOT NULL,
  `district` varchar(100) default NULL,
  `capital` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否省会 1:是 0:否',
  `level` int(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cityid`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1767 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_pca
-- ----------------------------
INSERT INTO `logistics_pca` VALUES ('1', '北京', '0', 'beijing', 'B', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('2', '上海', '0', 'shanghai', 'S', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('3', '天津', '0', 'tianjin', 'T', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('4', '重庆', '0', 'chongqing', 'C', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('5', '黑龙江', '0', 'heilongjiang', 'H', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('6', '吉林', '0', 'jilin', 'J', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('7', '辽宁', '0', 'liaoning', 'L', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('8', '内蒙', '0', 'nei', 'N', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('9', '宁夏', '0', 'ningxia', 'N', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('10', '新疆', '0', 'xinjiang', 'X', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('11', '青海', '0', 'qinghai', 'Q', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('12', '甘肃', '0', 'gansu', 'G', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('13', '陕西', '0', 'shanxi', 'S', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('14', '河北', '0', 'hebei', 'H', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('15', '河南', '0', 'henan', 'H', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('16', '山东', '0', 'shandong', 'S', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('17', '山西', '0', 'shanxi', 'S', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('18', '湖北', '0', 'hubei', 'H', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('19', '湖南', '0', 'hunan', 'H', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('20', '安徽', '0', 'anhui', 'A', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('21', '江苏', '0', 'jiangsu', 'J', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('22', '浙江', '0', 'zhejiang', 'Z', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('23', '江西', '0', 'jiangxi', 'J', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('24', '广东', '0', 'guangdong', 'G', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('25', '广西', '0', 'guangxi', 'G', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('26', '福建', '0', 'fujian', 'F', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('27', '四川', '0', 'sichuan', 'S', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('28', '云南', '0', 'yunnan', 'Y', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('29', '贵州', '0', 'guizhou', 'G', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('1749', '郑东新区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('31', '海南', '0', 'hainan', 'H', null, '0', '0');
INSERT INTO `logistics_pca` VALUES ('1751', '沙依巴克区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1750', '天山区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('35', '东城区', '976', 'dongcheng', 'D', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('36', '西城区', '976', 'xicheng', 'X', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('37', '宣武区', '976', 'xuanwu', 'X', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('38', '崇文区', '976', 'chongwen', 'C', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('39', '朝阳区', '976', 'chaoyang', 'C', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('40', '海淀区', '976', 'haidian', 'H', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('41', '丰台区', '976', 'fengtai', 'F', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('42', '石景山区', '976', 'shijingshan', 'S', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('43', '门头沟区', '976', 'mentougou', 'M', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('44', '昌平区', '976', 'changpin', 'C', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('45', '大兴区', '976', 'daxing', 'D', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('46', '怀柔区', '976', 'huairou', 'H', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('47', '密云县', '976', 'miyun', 'M', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('48', '平谷区', '976', 'pinguo', 'P', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('49', '顺义区', '976', 'shunyi', 'S', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('50', '通州区', '976', 'tongzhou', 'T', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('51', '延庆县', '976', 'yanqing', 'Y', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('52', '黄浦区', '977', 'huangpu', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('53', '南市区', '977', 'nanshi', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('54', '卢湾区', '977', 'luwan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('55', '徐汇区', '977', 'xuhui', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('56', '长宁区', '977', 'changning', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('57', '静安区', '977', 'jingan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('58', '普陀区', '977', 'putuo', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('59', '金山区', '977', 'jinshan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('60', '闸北区', '977', 'zhabei', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('61', '虹口区', '977', 'hongkou', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('62', '杨浦区', '977', 'yangpu', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('63', '宝山区', '977', 'baoshan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('64', '闵行区', '977', 'minhang', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('65', '嘉定区', '977', 'jiading', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('66', '松江区', '977', 'songjiang', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('67', '浦东新区', '977', 'xin', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('68', '青浦县', '977', 'pu', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('69', '奉贤县', '977', 'fengxian', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('70', '南汇县', '977', 'nanhui', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('71', '崇明县', '977', 'chongming', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('72', '和平区', '978', 'heping', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('73', '河东区', '978', 'hedong', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('74', '河西区', '978', 'hexi', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('75', '河北区', '978', 'hebei', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('76', '南开区', '978', 'nankai', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('77', '红桥区', '978', 'hongqiao', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('78', '塘沽区', '978', 'tanggu', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('79', '汉沽区', '978', 'hangu', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('80', '永川市', '979', 'yongchuan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('81', '黔江区', '979', 'qinjiang', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('82', '涪陵区', '979', 'fuling', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('83', '万州区', '979', 'wanzhou', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('84', '哈尔滨', '5', 'harbin', 'H', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('85', '齐齐哈尔', '5', 'qiqihar', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('86', '牡丹江', '5', 'mudanjiang', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('87', '长春', '6', 'changchun', 'C', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('88', '吉林市', '6', 'jilin', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('89', '沈阳', '7', 'shenyang', 'S', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('90', '大连', '7', 'dalian', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('91', '锦州', '7', 'jinzhou', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('92', '呼和浩特', '8', 'hohhot', 'H', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('93', '包头', '8', 'baotou', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('94', '银川', '9', 'yinchuan', 'Y', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('95', '乌鲁木齐', '10', 'urumqi', 'U', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('96', '西宁', '11', 'xining', 'X', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('97', '兰州', '12', 'lanzhou', 'L', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('98', '天水', '12', 'tianshui', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('99', '西安', '13', 'xian', 'X', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('100', '宝鸡', '13', 'baoji', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('101', '延安', '13', 'yanan', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('102', '石家庄', '14', 'shijiazhuang', 'S', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('103', '保定', '14', 'baoding', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('104', '郑州', '15', 'zhengzhou', 'Z', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('105', '洛阳', '15', 'luoyang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('106', '济南', '16', 'jinan', 'J', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('107', '青岛', '16', 'qingdao', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('108', '烟台', '16', 'yantai', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('109', '太原', '17', 'taiyuan', 'T', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('110', '大同', '17', 'datong', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('111', '武汉', '18', 'wuhan', 'W', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('112', '长沙', '19', 'changsha', 'C', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('113', '合肥', '20', 'hefei', 'H', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('114', '芜湖', '20', 'wuhu', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('115', '南京', '21', 'nanjing', 'N', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('116', '杭州', '22', 'hangzhou', 'H', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('117', '南昌', '23', 'nanchang', 'N', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('118', '广州', '24', 'guangzhou', 'G', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('119', '深圳', '24', 'shenzhen', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('120', '南宁', '25', 'nanning', 'N', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('121', '福州', '26', 'fuzhou', 'F', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('122', '厦门', '26', 'xiamen', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('123', '成都', '27', 'chengdu', 'C', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('124', '昆明', '28', 'kunming', 'K', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('125', '贵阳', '29', 'guiyang', 'G', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('1748', '政务区', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('127', '海口', '31', 'haikou', 'H', null, '1', '1');
INSERT INTO `logistics_pca` VALUES ('128', '三亚', '31', 'sanya', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('1741', '临潼区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1740', '阎良区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1739', '雁塔区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1738', '未央区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1737', '灞桥区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1736', '莲湖区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1735', '碑林区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1734', '新城区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('137', '房山区', '976', 'fangshan', 'F', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('138', '大港区', '978', 'dagang', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('139', '东丽区', '978', 'dongli', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('140', '西青区', '978', 'xiqing', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('141', '津南区', '978', 'jinnan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('142', '北辰区', '978', 'beichen', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('143', '武清区', '978', 'wuqing', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('144', '宝坻区', '978', 'baodi', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('145', '蓟县', '978', 'ji', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('146', '宁河县', '978', 'ninghe', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('147', '静海县', '978', 'jinghai', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('148', '渝中区', '979', 'yuzhong', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('149', '大渡口区', '979', 'dadukou', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('150', '江北区', '979', 'jiangbei', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('151', '沙坪坝区', '979', 'shapingba', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('152', '九龙坡区', '979', 'jiulongpo', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('153', '南岸区', '979', 'nanan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('154', '北碚区', '979', 'beibei', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('155', '万盛区', '979', 'wansheng', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('156', '双桥区', '979', 'shuangqiao', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('157', '渝北区', '979', 'yubei', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('158', '巴南区', '979', 'banan', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('159', '长寿区', '979', 'changshou', '0', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('160', '鹤岗', '5', 'hegang', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('161', '双鸭山', '5', 'shuangyashan', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('162', '鸡西', '5', 'jixi', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('163', '大庆', '5', 'daqing', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('164', '伊春', '5', 'yichun', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('165', '佳木斯', '5', 'jiamusi', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('166', '七台河', '5', 'qitaihe', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('167', '黑河', '5', 'heihe', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('168', '绥化', '5', 'suihua', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('169', '大兴安岭地区', '5', 'da', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('170', '四平', '6', 'siping', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('171', '辽源', '6', 'liaoyuan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('172', '通化', '6', 'tonghua', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('173', '白山', '6', 'baishan', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('174', '松原', '6', 'songyuan', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('175', '白城', '6', 'baicheng', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('176', '延边朝鲜族自治州', '6', 'yanbian', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('177', '鞍山', '7', 'anshan', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('178', '抚顺', '7', 'fushun', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('179', '本溪', '7', 'benxi', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('180', '丹东', '7', 'dandong', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('181', '葫芦岛', '7', 'huludao', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('182', '营口', '7', 'yingkou', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('183', '盘锦', '7', 'panjin', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('184', '阜新', '7', 'fuxin', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('185', '辽阳', '7', 'liaoyang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('186', '铁岭', '7', 'tieling', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('187', '朝阳', '7', 'chaoyang', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('188', '乌海', '8', 'wuhai', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('189', '赤峰', '8', 'chifeng', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('190', '通辽', '8', 'tongliao', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('191', '鄂尔多斯', '8', 'erduosi', 'E', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('192', '乌兰察布盟', '8', 'ulanqab', 'U', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('193', '锡林郭勒盟', '8', 'xilin', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('194', '巴彦淖尔盟', '8', 'bayannur', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('195', '阿拉善盟', '8', 'alxa', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('196', '兴安盟', '8', 'hinggan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('197', '石嘴山', '9', 'shizuishan', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('198', '吴忠', '9', 'wuzhong', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('199', '固原', '9', 'guyuan', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('200', '克拉玛依', '10', 'karamay', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('201', '吐鲁番地区', '10', 'turpan', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('202', '哈密地区', '10', 'hami(kumul)', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('203', '和田地区', '10', 'hotan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('204', '阿克苏地区', '10', 'aksu', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('205', '喀什地区', '10', 'kashi(kaxgar)', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('206', '克孜勒苏柯尔克孜自治州', '10', 'kizilsu', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('207', '巴音郭楞蒙古自治州', '10', '', '', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('208', '昌吉回族自治州', '10', 'changji', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('209', '博尔塔拉蒙古自治州', '10', 'bortala', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('210', '伊犁哈萨克自治州', '10', 'ili', 'I', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('211', '海东地区', '11', 'haidong', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('212', '海北藏族自治州', '11', 'haibei', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('213', '黄南藏族自治州', '11', 'huangnan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('214', '海南藏族自治州', '11', 'hainan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('215', '果洛藏族自治州', '11', 'golog', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('216', '玉树藏族自治州', '11', 'yushu', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('217', '海西蒙古族藏族自治州', '11', 'haixi', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('218', '金昌', '12', 'jinchang', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('219', '白银', '12', 'baiyin', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('220', '嘉峪关', '12', 'jiayuguan', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('221', '武威', '12', 'wuwei', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('222', '张掖', '12', 'zhangye', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('223', '平凉', '12', 'pingliang', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('224', '酒泉', '12', 'jiuquan', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('225', '庆阳', '12', 'qingyang', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('226', '定西地区', '12', 'dingxi', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('227', '陇南地区', '12', 'longnan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('228', '甘南藏族自治州', '12', 'gannan', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('229', '临夏回族自治州', '12', 'linxia', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('230', '铜川', '13', 'tongchuan', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('231', '咸阳', '13', 'xianyang', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('232', '渭南', '13', 'weinan', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('233', '汉中', '13', 'hanzhong', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('234', '榆林', '13', 'yulin', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('235', '安康', '13', 'ankang', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('236', '商洛', '13', 'shangluo', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('237', '唐山', '14', 'tangshan', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('238', '秦皇岛', '14', 'qinhuangdao', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('239', '邯郸', '14', 'handan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('240', '邢台', '14', 'xingtai', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('241', '张家口', '14', 'zhangjiakou', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('242', '承德', '14', 'chengde', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('243', '沧州', '14', 'cangzhou', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('244', '廊坊', '14', 'langfang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('245', '衡水', '14', 'hengshui', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('246', '开封', '15', 'kaifeng', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('247', '平顶山', '15', 'pingdingshan', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('248', '焦作', '15', 'jiaozuo', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('249', '鹤壁', '15', 'hebi', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('250', '新乡', '15', 'xinxiang', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('251', '安阳', '15', 'anyang', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('252', '濮阳', '15', 'puyang', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('253', '许昌', '15', 'xuchang', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('254', '漯河', '15', 'luohe', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('255', '三门峡', '15', 'sanmenxia', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('256', '南阳', '15', 'nanyang', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('257', '商丘', '15', 'shangqiu', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('258', '信阳', '15', 'xinyang', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('259', '周口', '15', 'zhoukou', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('260', '驻马店', '15', 'zhumadian', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('261', '淄博', '16', 'zibo', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('262', '枣庄', '16', 'zaozhuang', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('263', '东营', '16', 'dongying', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('264', '潍坊', '16', 'weifang', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('265', '威海', '16', 'weihai', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('266', '济宁', '16', 'jining', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('267', '泰安', '16', 'taian', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('268', '日照', '16', 'rizhao', 'R', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('269', '莱芜', '16', 'laiwu', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('270', '德州', '16', 'dezhou', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('271', '临沂', '16', 'linyi', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('272', '聊城', '16', 'liaocheng', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('273', '滨州', '16', 'binzhou', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('274', '菏泽', '16', 'heze', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('275', '朔州', '17', 'shuozhou', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('276', '阳泉', '17', 'yangquan', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('277', '长治', '17', 'changzhi', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('278', '晋城', '17', 'jincheng', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('279', '忻州', '17', 'xinzhou', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('280', '晋中', '17', 'jinzhong', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('281', '临汾', '17', 'linfen', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('282', '运城', '17', 'yuncheng', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('283', '吕梁地区', '17', 'lvliang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('284', '黄石', '18', 'huangshi', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('285', '襄樊', '18', 'xiangfan', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('286', '十堰', '18', 'shiyan', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('287', '荆州', '18', 'jingzhou', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('288', '宜昌', '18', 'yichang', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('289', '荆门', '18', 'jingmen', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('290', '鄂州', '18', 'ezhou', 'E', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('291', '孝感', '18', 'xiaogan', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('292', '黄冈', '18', 'huanggang', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('293', '咸宁', '18', 'xianning', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('294', '随州', '18', 'suizhou', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('295', '恩施土家族苗族自治州', '18', 'enshi', 'E', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('296', '株洲', '19', 'zhuzhou', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('297', '湘潭', '19', 'xiangtan', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('298', '衡阳', '19', 'hengyang', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('299', '邵阳', '19', 'shaoyang', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('300', '岳阳', '19', 'yueyang', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('301', '常德', '19', 'changde', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('302', '张家界', '19', 'zhangjiajie', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('303', '益阳', '19', 'yiyang', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('304', '郴州', '19', 'chenzhou', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('305', '永州', '19', 'yongzhou', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('306', '怀化', '19', 'huaihua', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('307', '娄底', '19', 'loudi', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('308', '湘西土家族苗族自治州', '19', 'xiangxi', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('309', '蚌埠', '20', 'bengbu', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('310', '淮南', '20', 'huainan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('311', '马鞍山', '20', 'maanshan', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('312', '淮北', '20', 'huaibei', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('313', '铜陵', '20', 'tongling', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('314', '安庆', '20', 'anqing', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('315', '黄山', '20', 'huangshan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('316', '滁州', '20', 'chuzhou', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('317', '阜阳', '20', 'fuyang', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('318', '宿州', '20', 'suzhouu', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('319', '巢湖', '20', 'chaohu', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('320', '六安', '20', 'liuan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('321', '亳州', '20', 'bozhou', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('322', '池州', '20', 'chizhou', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('323', '宣城', '20', 'xuancheng', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('324', '徐州', '21', 'xuzhou', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('325', '连云港', '21', 'lianyungang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('326', '淮安', '21', 'huaian', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('327', '宿迁', '21', 'suqian', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('328', '盐城', '21', 'yancheng', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('329', '扬州', '21', 'yangzhou', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('330', '泰州', '21', 'taizhouu', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('331', '南通', '21', 'nantong', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('332', '镇江', '21', 'zhenjiang', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('333', '常州', '21', 'changzhou', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('334', '无锡', '21', 'wuxi', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('335', '苏州', '21', 'suzhou', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('336', '宁波', '22', 'ningbo', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('337', '温州', '22', 'wenzhou', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('338', '嘉兴', '22', 'jiaxing', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('339', '湖州', '22', 'huzhou', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('340', '绍兴', '22', 'shaoxing', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('341', '金华', '22', 'jinhua', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('342', '衢州', '22', 'quzhou', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('343', '舟山', '22', 'zhoushan', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('344', '台州', '22', 'taizhou', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('345', '丽水', '22', 'lishui', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('346', '景德镇', '23', 'jingdezhen', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('347', '萍乡', '23', 'pingxiang', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('348', '新余', '23', 'xinyu', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('349', '九江', '23', 'jiujiang', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('350', '鹰潭', '23', 'yingtan', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('351', '赣州', '23', 'ganzhou', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('352', '吉安', '23', 'jian', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('353', '宜春', '23', 'yichun', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('354', '抚州', '23', 'fuzhou', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('355', '上饶', '23', 'shangrao', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('356', '珠海', '24', 'zhuhai', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('357', '汕头', '24', 'shantou', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('358', '韶关', '24', 'shaoguan', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('359', '河源', '24', 'heyuan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('360', '梅州', '24', 'meizhou', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('361', '惠州', '24', 'huizhou', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('362', '汕尾', '24', 'shanwei', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('363', '东莞', '24', 'dongguan', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('364', '中山', '24', 'zhongshan', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('365', '江门', '24', 'jiangmen', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('366', '佛山', '24', 'foshan', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('367', '阳江', '24', 'yangjiang', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('368', '湛江', '24', 'zhanjiang', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('369', '茂名', '24', 'maoming', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('370', '肇庆', '24', 'zhaoqing', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('371', '清远', '24', 'qingyuan', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('372', '潮州', '24', 'chaozhou', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('373', '揭阳', '24', 'jieyang', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('374', '云浮', '24', 'yunfu', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('375', '柳州', '25', 'liuzhou', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('376', '桂林', '25', 'guilin', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('377', '梧州', '25', 'wuzhou', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('378', '北海', '25', 'beihai', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('379', '防城港', '25', 'fangchenggang', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('380', '钦州', '25', 'qinzhou', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('381', '贵港', '25', 'guigang', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('382', '玉林', '25', 'yulin', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('383', '百色', '25', 'baise', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('384', '贺州', '25', 'hezhou', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('385', '河池', '25', 'hechi', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('386', '来宾', '25', 'laibin', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('387', '崇左', '25', 'chongzuo', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('388', '三明', '26', 'sanming', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('389', '莆田', '26', 'putian', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('390', '泉州', '26', 'quanzhou', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('391', '漳州', '26', 'zhangzhou', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('392', '南平', '26', 'nanping', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('393', '龙岩', '26', 'longyan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('394', '宁德', '26', 'ningde', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('395', '自贡', '27', 'zigong', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('396', '攀枝花', '27', 'panzhihua', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('397', '泸州', '27', 'luzhou', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('398', '德阳', '27', 'deyang', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('399', '绵阳', '27', 'mianyang', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('400', '广元', '27', 'guangyuan', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('401', '遂宁', '27', 'suining', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('402', '内江', '27', 'neijiang', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('403', '乐山', '27', 'leshan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('404', '南充', '27', 'nanchong', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('405', '宜宾', '27', 'yibin', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('406', '广安', '27', 'guangan', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('407', '达州', '27', 'dazhou', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('408', '巴中', '27', 'bazhong', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('409', '雅安', '27', 'yaan', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('410', '眉山', '27', 'meishan', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('411', '资阳', '27', 'ziyang', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('412', '阿坝藏族羌族自治州', '27', 'aba(ngawa)', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('413', '甘孜藏族自治州', '27', 'garze', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('414', '凉山彝族自治州', '27', 'liangshan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('415', '曲靖', '28', 'qujing', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('416', '玉溪', '28', 'yuxi', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('417', '保山', '28', 'baoshan', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('418', '昭通', '28', 'zhaotong', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('419', '思茅地区', '28', 'simao', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('420', '临沧地区', '28', 'lincang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('421', '丽江', '28', 'lijiang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('422', '文山壮族苗族自治州', '28', 'wenshan', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('423', '红河哈尼族彝族自治州', '28', 'honghe', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('424', '西双版纳傣族自治州', '28', 'xishuangbanna', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('425', '楚雄彝族自治州', '28', 'chuxiong', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('426', '大理白族自治州', '28', 'dali', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('427', '德宏傣族景颇族自治州', '28', 'dehong', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('428', '怒江傈傈族自治州', '28', '', '', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('429', '迪庆藏族自治州', '28', 'deqen', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('430', '六盘水', '29', 'liupanshui', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('431', '遵义', '29', 'zunyi', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('432', '安顺', '29', 'anshun', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('433', '铜仁地区', '29', 'tongren', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('434', '毕节地区', '29', 'bijie', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('435', '黔西南布依族苗族自治州', '29', 'qianxinan', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('436', '黔东南苗族侗族自治州', '29', 'qiandongnan', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('437', '黔南布依族苗族自治州', '29', 'qiannan', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('1747', '高新区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1746', '高陵县', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1745', '户县', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1744', '周至县', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1743', '蓝田县', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1742', '长安区', '99', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('444', '蒙城', '20', 'mengcheng', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('445', '宁国', '20', 'ningguo', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('446', '桐城', '20', 'tongcheng', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('447', '福清', '26', 'fuqing', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('448', '建瓯', '26', 'jianou', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('449', '晋江', '26', 'jinjiang', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('450', '南安', '26', 'nanan', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('451', '邵武', '26', 'shaowu', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('452', '石狮', '26', 'shishi', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('453', '仙游', '26', 'xianyou', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('454', '嘉峪', '12', 'jiayu', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('455', '武威', '12', 'wuwei', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('456', '花都', '24', 'huadu', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('457', '开平', '24', 'kaiping', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('458', '南海', '24', 'nanhai', 'N', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('459', '顺德', '24', 'shunde', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('460', '台山', '24', 'taishan', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('461', '增城', '24', 'zengcheng', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('462', '市梅', '24', '', '', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('463', '都匀', '29', 'duyun', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('464', '贵恙', '29', 'guiyang', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('465', '凯里', '29', 'kaili', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('466', '铜仁', '29', 'tongren', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('467', '霸州', '14', 'bazhou', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('468', '青县', '14', 'qing', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('469', '任丘', '14', 'renqiu', 'R', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('470', '涿州', '14', 'zhuozhou', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('471', '安陆', '18', 'anlu', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('472', '恩施', '18', 'enshi', 'E', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('473', '汉口', '18', 'hankou', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('474', '汉阳', '18', 'hanyang', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('475', '潜江', '18', 'qianjiang', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('476', '仙桃', '18', 'xiantao', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('477', '株州', '18', 'zhuzhou', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('479', '邵东', '19', 'shaodong', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('480', '高新', '6', '', '', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('481', '延吉', '6', 'yanji', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('482', '梅河口', '6', 'meihekou', 'M', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('483', '常熟', '21', 'changshu', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('484', '丹阳', '21', 'danyang', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('485', '海门', '21', 'haimen', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('486', '江都', '21', 'jiangdu', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('487', '江阴', '21', 'jiangyin', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('488', '靖江', '21', 'jingjiang', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('489', '昆山', '21', 'kunshan', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('490', '溧阳', '21', 'liyang', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('491', '太仓', '21', 'taicang', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('492', '泰州华', '21', '', '', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('493', '吴江', '21', 'wujiang', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('494', '吴县', '21', 'wuxian', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('495', '宜兴', '21', 'yixing', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('496', '张家港', '21', 'zhangjiagang', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('497', '高安', '23', 'gaoan', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('498', '瓦房店', '7', 'wafangdian', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('499', '巴彦淖尔', '8', 'bayannur', 'B', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('500', '呼伦贝尔', '8', 'hulun', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('501', '集宁', '8', 'jining', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('502', '乌兰浩特', '8', 'ulan', 'U', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('503', '锡林浩特', '8', 'xilinhot', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('504', '格尔木', '11', 'golmud', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('505', '高密', '16', 'gaomi', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('507', '淮坊', '16', 'weifang', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('508', '即墨', '16', 'jimo', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('509', '胶南', '16', 'jiaonan', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('510', '莱州', '16', 'laizhou', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('511', '林沂', '16', 'linyi', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('512', '临忻', '16', 'linyi', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('513', '龙口', '16', 'longkou', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('514', '蓬莱', '16', 'penglai', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('515', '青州', '16', 'qingzhou', 'Q', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('516', '乳山', '16', 'rushan', 'R', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('517', '寿光', '16', 'shouguang', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('518', '滕州', '16', 'tengzhou', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('519', '文登', '16', 'wendeng', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('520', '招远', '16', 'zhaoyuan', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('521', '河津', '17', 'hejin', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('522', '侯马', '17', 'houma', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('523', '孝义', '17', 'xiaoyi', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('524', '榆次', '17', 'yuci', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('525', '韩城', '13', 'hancheng', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('526', '广汉', '27', 'guanghan', 'G', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('527', '锦阳', '27', 'jingyang', 'J', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('528', '西昌', '27', 'xichang', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('529', '阿克苏', '10', 'aksu', 'A', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('530', '昌吉', '10', 'changji', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('531', '哈密', '10', 'hami(kumul)', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('532', '和田', '10', 'hotan', 'H', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('533', '喀什', '10', 'kashi', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('534', '克拉马依', '10', 'kelamayi', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('535', '库尔勒', '10', 'korla', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('536', '石河子', '10', 'shihezi', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('537', '吐鲁番', '10', 'turpan', 'T', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('538', '乌市', '10', 'yiwu', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('539', '奎屯', '10', 'kuytun', 'K', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('540', '伊犁', '10', 'yili', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('541', '伊宁', '10', 'yining(gulja)', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('542', '大理', '28', 'dali', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('543', '慈溪', '22', 'cixi', 'C', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('544', '东阳', '22', 'dongyang', 'D', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('545', '奉化', '22', 'fenghua', 'F', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('546', '乐清', '22', 'yueqing', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('547', '临安', '22', 'linan', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('548', '临海', '22', 'linhai', 'L', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('549', '平湖', '22', 'pinghu', 'P', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('550', '瑞安', '22', 'ruian', 'R', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('551', '上虞', '22', 'shangyu', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('552', '嵊州', '22', 'shengzhou', 'S', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('553', '温岭', '22', 'wenling', 'W', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('554', '义乌', '22', 'yiwu', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('555', '永康', '22', 'yongkang', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('556', '余姚', '22', 'yuyao', 'Y', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('557', '诸暨', '22', 'zhuji', 'Z', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('558', '新昌', '22', 'xinchang', 'X', null, '0', '1');
INSERT INTO `logistics_pca` VALUES ('965', '偃师市', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('559', '邯山区', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('560', '丛台区', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('561', '复兴区', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('562', '峰峰矿区', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('563', '邯郸县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('564', '临漳县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('565', '成安县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('566', '大名县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('567', '涉县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('568', '磁县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('569', '肥乡县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('570', '永年县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('571', '邱县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('572', '鸡泽县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('573', '广平县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('574', '馆陶县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('575', '魏县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('576', '曲周县', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('577', '武安市', '239', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('578', '长安区', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('579', '桥东区', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('580', '桥西区', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('581', '新华区', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('582', '井陉矿区', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('583', '裕华区', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('584', '井陉县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('585', '正定县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('586', '栾城县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('587', '行唐县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('588', '灵寿县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('589', '高邑县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('590', '深泽县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('591', '赞皇县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('592', '无极县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('593', '平山县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('594', '元氏县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('595', '赵县', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('596', '辛集市', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('597', '藁城市', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('598', '晋州市', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('599', '新乐市', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('600', '鹿泉市', '102', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('601', '新市区', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('602', '北市区', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('603', '南市区', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('604', '满城县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('605', '清苑县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('606', '涞水县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('607', '阜平县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('608', '徐水县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('609', '定兴县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('610', '唐县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('611', '高阳县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('612', '容城县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('613', '涞源县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('614', '望都县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('615', '安新县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('616', '易县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('617', '曲阳县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('618', '蠡县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('619', '顺平县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('620', '博野县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('621', '雄县', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('622', '涿州市', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('623', '定州市', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('624', '安国市', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('625', '高碑店市', '103', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('626', '桥东区', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('627', '桥西区', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('628', '宣化区', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('629', '下花园区', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('630', '宣化县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('631', '张北县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('632', '康保县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('633', '沽源县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('634', '尚义县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('635', '蔚县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('636', '阳原县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('637', '怀安县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('638', '万全县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('639', '怀来县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('640', '涿鹿县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('641', '赤城县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('642', '崇礼县', '241', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('643', '双桥区', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('644', '双滦区', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('645', '鹰手营子矿区', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('646', '承德县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('647', '兴隆县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('648', '平泉县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('649', '滦平县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('650', '隆化县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('651', '丰宁满族自治县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('652', '宽城满族自治县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('653', '围场满族蒙古族自治县', '242', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('654', '路南区', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('655', '路北区', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('656', '古冶区', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('657', '开平区', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('658', '丰南区', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('659', '丰润区', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('660', '滦县', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('661', '滦南县', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('662', '乐亭县', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('663', '迁西县', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('664', '玉田县', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('665', '唐海县', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('666', '遵化市', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('667', '迁安市', '237', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('668', '安次区', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('669', '广阳区', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('670', '固安县', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('671', '永清县', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('672', '香河县', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('673', '大城县', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('674', '文安县', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('675', '大厂回族自治县', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('676', '霸州市', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('677', '三河市', '244', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('678', '新华区', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('679', '运河区', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('680', '沧县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('681', '青县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('682', '东光县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('683', '海兴县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('684', '盐山县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('685', '肃宁县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('686', '南皮县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('687', '吴桥县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('688', '献县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('689', '孟村回族自治县', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('690', '泊头市', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('691', '任丘市', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('692', '黄骅市', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('693', '河间市', '243', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('694', '桃城区', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('695', '枣强县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('696', '武邑县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('697', '武强县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('698', '饶阳县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('699', '安平县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('700', '故城县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('701', '景县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('702', '阜城县', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('703', '冀州市', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('704', '深州市', '245', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('705', '桥东区', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('706', '桥西区', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('707', '邢台县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('708', '临城县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('709', '内丘县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('710', '柏乡县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('711', '隆尧县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('712', '任县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('713', '南和县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('714', '宁晋县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('715', '巨鹿县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('716', '新河县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('717', '广宗县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('718', '平乡县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('719', '威县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('720', '清河县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('721', '临西县', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('722', '南宫市', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('723', '沙河市', '240', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('724', '海港区', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('725', '山海关区', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('726', '北戴河区', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('727', '青龙满族自治县', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('728', '昌黎县', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('729', '抚宁县', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('730', '卢龙县', '238', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('731', '朔城区', '275', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('732', '平鲁区', '275', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('733', '山阴县', '275', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('734', '应县', '275', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('735', '右玉县', '275', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('736', '怀仁县', '275', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('737', '忻府区', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('738', '定襄县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('739', '五台县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('740', '代县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('741', '繁峙县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('742', '宁武县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('743', '静乐县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('744', '神池县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('745', '五寨县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('746', '岢岚县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('747', '河曲县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('748', '保德县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('749', '偏关县', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('750', '原平市', '279', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('751', '小店区', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('752', '迎泽区', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('753', '杏花岭区', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('754', '尖草坪区', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('755', '万柏林区', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('756', '晋源区', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('757', '清徐县', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('758', '阳曲县', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('759', '娄烦县', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('760', '古交市', '109', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('761', '矿区', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('762', '南郊区', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('763', '新荣区', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('764', '阳高县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('765', '天镇县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('766', '广灵县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('767', '灵丘县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('768', '浑源县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('769', '左云县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('770', '大同县', '110', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('771', '长海县', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('772', '旅顺口区', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('773', '中山区', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('774', '西岗区', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('775', '沙河口区', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('776', '甘井子区', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('777', '金州区', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('778', '普兰店市', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('779', '瓦房店市', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('780', '庄河市', '90', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('782', '沈河区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('783', '大东区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('784', '皇姑区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('785', '铁西区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('786', '苏家屯区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('787', '东陵区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('788', '沈北新区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('789', '于洪区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('790', '辽中县', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('791', '康平县', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('792', '法库县', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('793', '新民市', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('794', '道里区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('795', '南岗区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('796', '道外区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('797', '平房区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('798', '松北区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('799', '香坊区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('800', '呼兰区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('801', '阿城区', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('802', '依兰县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('803', '方正县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('804', '宾县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('805', '巴彦县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('806', '木兰县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('807', '通河县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('808', '延寿县', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('809', '双城市', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('810', '尚志市', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('811', '五常市', '84', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('812', '新城区', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('813', '回民区', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('814', '玉泉区', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('815', '赛罕区', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('816', '土默特左旗', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('817', '托克托县', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('818', '和林格尔县', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('819', '清水河县', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('820', '武川县', '92', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('821', '历下区', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('822', '市中区', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('823', '槐荫区', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('824', '天桥区', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('825', '历城区', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('826', '长清区', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('827', '平阴县', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('828', '济阳县', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('829', '商河县', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('830', '章丘市', '106', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('831', '市南区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('832', '市北区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('833', '四方区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('834', '黄岛区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('835', '崂山区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('836', '李沧区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('837', '城阳区', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('838', '胶州市', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('839', '即墨市', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('840', '平度市', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('841', '胶南市', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('842', '莱西市', '107', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('843', '江宁区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('844', '浦口区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('845', '玄武区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('846', '白下区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('847', '秦淮区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('848', '建邺区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('849', '鼓楼区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('850', '下关区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('851', '栖霞区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('852', '雨花台区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('853', '六合区', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('854', '溧水县', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('855', '高淳县', '115', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('856', '沧浪区', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('857', '常熟市', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('858', '平江区', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('859', '金阊区', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('860', '虎丘区', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('861', '昆山市', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('862', '太仓市', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('863', '吴江市', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('864', '吴中区', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('865', '相城区', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('866', '张家港市', '335', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('867', '崇安区', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('868', '南长区', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('869', '北塘区', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('870', '锡山区', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('871', '惠山区', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('872', '滨湖区', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('873', '江阴市', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('874', '宜兴市', '334', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('875', '上城区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('876', '下城区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('877', '江干区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('878', '拱墅区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('879', '西湖区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('880', '滨江区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('881', '余杭区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('882', '桐庐县', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('883', '淳安县', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('884', '建德市', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('885', '富阳市', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('886', '临安市', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('887', '萧山区', '116', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('888', '鹿城区', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('889', '龙湾区', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('890', '瓯海区', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('891', '洞头县', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('892', '永嘉县', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('893', '平阳县', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('894', '苍南县', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('895', '文成县', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('896', '泰顺县', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('897', '瑞安市', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('898', '乐清市', '337', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('899', '海曙区', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('900', '江东区', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('901', '江北区', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('902', '北仑区', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('903', '镇海区', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('904', '鄞州区', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('905', '象山县', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('906', '宁海县', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('907', '余姚市', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('908', '慈溪市', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('909', '奉化市', '336', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('910', '瑶海区', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('911', '庐阳区', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('912', '蜀山区', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('913', '包河区', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('914', '长丰县', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('915', '肥东县', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('916', '肥西县', '113', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('917', '东湖区', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('918', '西湖区', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('919', '青云谱区', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('920', '湾里区', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('921', '青山湖区', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('922', '南昌县', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('923', '新建县', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('924', '安义县', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('925', '进贤县', '117', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('926', '鼓楼区', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('927', '台江区', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('928', '仓山区', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('929', '马尾区', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('930', '晋安区', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('931', '闽侯县', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('932', '连江县', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('933', '罗源县', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('934', '闽清县', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('935', '永泰县', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('936', '平潭县', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('937', '福清市', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('938', '长乐市', '121', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('939', '中原区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('940', '二七区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('941', '管城回族区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('942', '金水区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('943', '上街区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('944', '惠济区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('945', '中牟县', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('946', '巩义市', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('947', '荥阳市', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('948', '新密市', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('949', '新郑市', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('950', '登封市', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('951', '老城区', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('952', '西工区', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('953', '瀍河回族区', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('954', '涧西区', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('955', '吉利区', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('956', '洛龙区', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('957', '孟津县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('958', '新安县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('959', '栾川县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('960', '嵩县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('961', '汝阳县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('962', '宜阳县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('963', '洛宁县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('964', '伊川县', '105', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('966', '解放区', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('967', '中站区', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('968', '马村区', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('969', '山阳区', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('970', '修武县', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('971', '博爱县', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('972', '武陟县', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('973', '温县', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('974', '沁阳市', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('975', '孟州市', '248', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('976', '北京', '1', 'beijing', 'B', '华北地区', '1', '1');
INSERT INTO `logistics_pca` VALUES ('977', '上海', '2', 'shanghai', 'S', '华东地区', '1', '1');
INSERT INTO `logistics_pca` VALUES ('978', '天津', '3', 'tianjin', 'T', '华北地区', '1', '1');
INSERT INTO `logistics_pca` VALUES ('979', '重庆', '4', 'chongqing', 'C', '西南地区', '1', '1');
INSERT INTO `logistics_pca` VALUES ('980', '兴庆区', '94', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('981', '西夏区', '94', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('982', '金凤区', '94', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('983', '永宁县', '94', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('984', '贺兰县', '94', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('985', '灵武市', '94', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('986', '城东区', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('987', '城中区', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('988', '城西区', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('989', '城北区', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('990', '大通回族土族自治县', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('991', '湟中县', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('992', '湟源县', '96', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('993', '思明区', '122', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('994', '海沧区', '122', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('995', '湖里区', '122', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('996', '集美区', '122', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('997', '同安区', '122', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('998', '翔安区', '122', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('999', '德城区', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1000', '陵县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1001', '宁津县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1002', '庆云县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1003', '临邑县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1004', '齐河县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1005', '平原县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1006', '夏津县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1007', '武城县', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1008', '乐陵市', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1009', '禹城市', '270', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1010', '滨城区', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1011', '惠民县', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1012', '阳信县', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1013', '无棣县', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1014', '沾化县', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1015', '博兴县', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1016', '邹平县', '273', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1017', '东营区', '263', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1018', '河口区', '263', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1019', '垦利县', '263', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1020', '利津县', '263', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1021', '广饶县', '263', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1022', '兰山区', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1023', '罗庄区', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1024', '河东区', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1025', '沂南县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1026', '郯城县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1027', '沂水县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1028', '苍山县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1029', '费县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1030', '平邑县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1031', '莒南县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1032', '蒙阴县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1033', '临沭县', '271', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1034', '潍城区', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1035', '寒亭区', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1036', '坊子区', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1037', '奎文区', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1038', '临朐县', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1039', '昌乐县', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1040', '青州市', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1041', '诸城市', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1042', '寿光市', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1043', '安丘市', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1044', '高密市', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1045', '昌邑市', '264', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1046', '东昌府区', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1047', '阳谷县', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1048', '莘县', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1049', '茌平县', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1050', '东阿县', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1051', '冠县', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1052', '高唐县', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1053', '临清市', '272', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1054', '东港区', '268', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1055', '岚山区', '268', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1056', '五莲县', '268', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1057', '莒县', '268', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1058', '牡丹区', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1059', '曹县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1060', '单县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1061', '成武县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1062', '巨野县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1063', '郓城县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1064', '鄄城县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1065', '定陶县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1066', '东明县', '274', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1067', '莱城区', '269', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1068', '钢城区', '269', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1069', '芝罘区', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1070', '福山区', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1071', '牟平区', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1072', '莱山区', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1073', '长岛县', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1074', '龙口市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1075', '莱阳市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1076', '莱州市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1077', '蓬莱市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1078', '招远市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1079', '栖霞市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1080', '海阳市', '108', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1081', '环翠区', '265', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1082', '文登市', '265', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1083', '荣成市', '265', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1084', '乳山市', '265', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1085', '淄川区', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1086', '张店区', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1087', '博山区', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1088', '临淄区', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1089', '周村区', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1090', '桓台县', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1091', '高青县', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1092', '沂源县', '261', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1093', '市中区', '262', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1094', '薛城区', '262', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1095', '峄城区', '262', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1096', '台儿庄区', '262', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1097', '山亭区', '262', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1098', '滕州市', '262', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1099', '市中区', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1100', '任城区', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1101', '微山县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1102', '鱼台县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1103', '金乡县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1104', '嘉祥县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1105', '汶上县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1106', '泗水县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1107', '梁山县', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1108', '曲阜市', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1109', '兖州市', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1110', '邹城市', '266', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1111', '铁东区', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1112', '铁西区', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1113', '立山区', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1114', '千山区', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1115', '台安县', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1116', '岫岩满族自治县', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1117', '海城市', '177', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1118', '南关区', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1119', '宽城区', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1120', '朝阳区', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1121', '二道区', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1122', '绿园区', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1123', '双阳区', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1124', '农安县', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1125', '九台市', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1126', '榆树市', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1127', '德惠市', '87', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1128', '五华区', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1129', '盘龙区', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1130', '官渡区', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1131', '西山区', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1132', '东川区', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1133', '呈贡县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1134', '晋宁县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1135', '富民县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1136', '宜良县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1137', '石林彝族自治县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1138', '嵩明县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1139', '禄劝彝族苗族自治县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1140', '寻甸回族彝族自治县', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1141', '安宁市', '124', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1142', '江岸区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1143', '江汉区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1144', '硚口区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1145', '汉阳区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1146', '武昌区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1147', '青山区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1148', '洪山区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1149', '东西湖区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1150', '汉南区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1151', '蔡甸区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1152', '江夏区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1153', '黄陂区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1154', '新洲区', '111', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1155', '茅箭区', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1156', '张湾区', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1157', '郧县', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1158', '郧西县', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1159', '竹山县', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1160', '竹溪县', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1161', '房县', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1162', '丹江口市', '286', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1163', '襄城区', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1164', '樊城区', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1165', '襄阳区', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1166', '南漳县', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1167', '谷城县', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1168', '保康县', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1169', '老河口市', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1170', '枣阳市', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1171', '宜城市', '285', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1172', '兴宁区', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1173', '青秀区', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1174', '江南区', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1175', '西乡塘区', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1176', '良庆区', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1177', '邕宁区', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1178', '武鸣县', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1179', '隆安县', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1180', '马山县', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1181', '上林县', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1182', '宾阳县', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1183', '横县', '120', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1184', '秀峰区', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1185', '叠彩区', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1186', '象山区', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1187', '七星区', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1188', '雁山区', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1189', '阳朔县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1190', '临桂县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1191', '灵川县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1192', '全州县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1193', '兴安县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1194', '永福县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1195', '灌阳县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1196', '龙胜各族自治县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1197', '资源县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1198', '平乐县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1199', '荔浦县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1200', '恭城瑶族自治县', '376', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1201', '庐山区', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1202', '浔阳区', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1203', '九江县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1204', '武宁县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1205', '修水县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1206', '永修县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1207', '德安县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1208', '星子县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1209', '都昌县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1210', '湖口县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1211', '彭泽县', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1212', '瑞昌市', '349', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1213', '魏都区', '253', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1214', '许昌县', '253', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1215', '鄢陵县', '253', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1216', '襄城县', '253', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1217', '禹州市', '253', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1218', '长葛市', '253', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1219', '湖滨区', '255', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1220', '渑池县', '255', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1221', '陕县', '255', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1222', '卢氏县', '255', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1223', '义马市', '255', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1224', '灵宝市', '255', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1225', '梁园区', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1226', '睢阳区', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1227', '民权县', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1228', '睢县', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1229', '宁陵县', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1230', '柘城县', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1231', '虞城县', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1232', '夏邑县', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1233', '永城市', '257', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1234', '龙亭区', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1235', '顺河回族区', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1236', '鼓楼区', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1237', '禹王台区', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1238', '金明区', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1239', '杞县', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1240', '通许县', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1241', '尉氏县', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1242', '开封县', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1243', '兰考县', '246', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1244', '宛城区', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1245', '卧龙区', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1246', '南召县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1247', '方城县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1248', '西峡县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1249', '镇平县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1250', '内乡县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1251', '淅川县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1252', '社旗县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1253', '唐河县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1254', '新野县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1255', '桐柏县', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1256', '邓州市', '256', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1257', '红旗区', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1258', '卫滨区', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1259', '凤泉区', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1260', '牧野区', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1261', '新乡县', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1262', '获嘉县', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1263', '原阳县', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1264', '延津县', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1265', '封丘县', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1266', '长垣县', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1267', '卫辉市', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1268', '辉县市', '250', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1269', '文峰区', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1270', '北关区', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1271', '殷都区', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1272', '龙安区', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1273', '安阳县', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1274', '汤阴县', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1275', '滑县', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1276', '内黄县', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1277', '林州市', '251', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1278', '华龙区', '252', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1279', '清丰县', '252', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1280', '南乐县', '252', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1281', '范县', '252', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1282', '台前县', '252', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1283', '濮阳县', '252', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1284', '鹤山区', '249', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1285', '山城区', '249', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1286', '淇滨区', '249', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1287', '浚县', '249', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1288', '淇县', '249', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1289', '驿城区', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1290', '西平县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1291', '上蔡县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1292', '平舆县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1293', '正阳县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1294', '确山县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1295', '泌阳县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1296', '汝南县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1297', '遂平县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1298', '新蔡县', '260', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1299', '浉河区', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1300', '平桥区', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1301', '罗山县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1302', '光山县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1303', '新县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1304', '商城县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1305', '固始县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1306', '潢川县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1307', '淮滨县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1308', '息县', '258', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1309', '川汇区', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1310', '扶沟县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1311', '西华县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1312', '商水县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1313', '沈丘县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1314', '郸城县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1315', '淮阳县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1316', '太康县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1317', '鹿邑县', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1318', '项城市', '259', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1319', '源汇区', '254', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1320', '郾城区', '254', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1321', '召陵区', '254', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1322', '舞阳县', '254', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1323', '临颍县', '254', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1324', '新华区', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1325', '卫东区', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1326', '石龙区', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1327', '湛河区', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1328', '宝丰县', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1329', '叶县', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1330', '鲁山县', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1331', '郏县', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1332', '舞钢市', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1333', '汝州市', '247', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1334', '从化市', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1335', '荔湾区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1336', '越秀区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1337', '海珠区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1338', '天河区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1339', '白云区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1340', '花都区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1341', '黄埔区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1342', '萝岗区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1343', '南沙区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1344', '番禺区', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1345', '增城市', '118', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1346', '禅城区', '366', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1347', '南海区', '366', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1348', '顺德区', '366', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1349', '三水区', '366', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1350', '高明区', '366', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1351', '清城区', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1352', '佛冈县', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1353', '阳山县', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1354', '连山壮族瑶族自治县', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1355', '连南瑶族自治县', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1356', '清新县', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1357', '英德市', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1358', '连州市', '371', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1359', '惠城区', '361', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1360', '惠阳区', '361', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1361', '博罗县', '361', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1362', '惠东县', '361', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1363', '龙门县', '361', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1364', '端州区', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1365', '鼎湖区', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1366', '广宁县', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1367', '怀集县', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1368', '封开县', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1369', '德庆县', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1370', '高要市', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1371', '四会市', '370', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1372', '武江区', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1373', '浈江区', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1374', '曲江区', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1375', '始兴县', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1376', '仁化县', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1377', '翁源县', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1378', '乳源瑶族自治县', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1379', '新丰县', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1380', '乐昌市', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1381', '南雄市', '358', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1382', '镜湖区', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1383', '弋江区', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1384', '鸠江区', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1385', '三山区', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1386', '芜湖县', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1387', '繁昌县', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1388', '南陵县', '114', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1389', '南明区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1390', '云岩区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1391', '花溪区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1392', '乌当区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1393', '白云区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1394', '小河区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1395', '开阳县', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1396', '息烽县', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1397', '修文县', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1398', '清镇市', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1399', '秀英区', '127', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1400', '龙华区', '127', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1401', '琼山区', '127', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1402', '美兰区', '127', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1403', '芙蓉区', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1404', '天心区', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1405', '岳麓区', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1406', '开福区', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1407', '雨花区', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1408', '长沙县', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1409', '望城县', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1410', '宁乡县', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1411', '浏阳市', '112', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1412', '秦都区', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1413', '杨陵区', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1414', '渭城区', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1415', '三原县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1416', '泾阳县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1417', '乾县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1418', '礼泉县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1419', '永寿县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1420', '彬县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1421', '长武县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1422', '旬邑县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1423', '淳化县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1424', '武功县', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1425', '兴平市', '231', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1426', '渭滨区', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1427', '金台区', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1428', '陈仓区', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1429', '凤翔县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1430', '岐山县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1431', '扶风县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1432', '眉县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1433', '陇县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1434', '千阳县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1435', '麟游县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1436', '凤县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1437', '太白县', '100', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1438', '珠晖区', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1439', '雁峰区', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1440', '石鼓区', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1441', '蒸湘区', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1442', '南岳区', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1443', '衡阳县', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1444', '衡南县', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1445', '衡山县', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1446', '衡东县', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1447', '祁东县', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1448', '耒阳市', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1449', '常宁市', '298', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1450', '双清区', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1451', '大祥区', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1452', '北塔区', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1453', '邵东县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1454', '新邵县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1455', '邵阳县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1456', '隆回县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1457', '洞口县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1458', '绥宁县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1459', '新宁县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1460', '城步苗族自治县', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1461', '武冈市', '299', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1462', '武陵区', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1463', '鼎城区', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1464', '安乡县', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1465', '汉寿县', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1466', '澧县', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1467', '临澧县', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1468', '桃源县', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1469', '石门县', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1470', '津市市', '301', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1471', '香洲区', '356', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1472', '斗门区', '356', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1473', '金湾区', '356', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1474', '蓬江区', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1475', '江海区', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1476', '新会区', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1477', '台山市', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1478', '开平市', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1479', '鹤山市', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1480', '恩平市', '365', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1481', '宿城区', '327', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1482', '宿豫区', '327', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1483', '沭阳县', '327', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1484', '泗阳县', '327', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1485', '泗洪县', '327', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1486', '连云区', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1487', '新浦区', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1488', '海州区', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1489', '赣榆县', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1490', '东海县', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1491', '灌云县', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1492', '灌南县', '325', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1493', '高邮市', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1494', '广陵区', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1495', '邗江区', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1496', '维扬区', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1497', '宝应县', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1498', '江都市', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1499', '仪征市', '329', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1500', '鼓楼区', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1501', '云龙区', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1502', '九里区', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1503', '贾汪区', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1504', '泉山区', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1505', '丰县', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1506', '沛县', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1507', '铜山县', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1508', '睢宁县', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1509', '新沂市', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1510', '邳州市', '324', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1511', '亭湖区', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1512', '盐都区', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1513', '响水县', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1514', '滨海县', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1515', '阜宁县', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1516', '射阳县', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1517', '建湖县', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1518', '东台市', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1519', '大丰市', '328', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1520', '海陵区', '330', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1521', '高港区', '330', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1522', '兴化市', '330', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1523', '靖江市', '330', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1524', '泰兴市', '330', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1525', '姜堰市', '330', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1526', '天宁区', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1527', '钟楼区', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1528', '戚墅堰区', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1529', '新北区', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1530', '武进区', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1531', '溧阳市', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1532', '金坛市', '333', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1533', '崇川区', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1534', '港闸区', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1535', '海安县', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1536', '如东县', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1537', '启东市', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1538', '如皋市', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1539', '通州市', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1540', '海门市', '331', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1541', '京口区', '332', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1542', '润州区', '332', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1543', '丹徒区', '332', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1544', '丹阳市', '332', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1545', '扬中市', '332', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1546', '句容市', '332', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1547', '吴兴区', '339', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1548', '南浔区', '339', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1549', '德清县', '339', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1550', '长兴县', '339', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1551', '安吉县', '339', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1552', '南湖区', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1553', '秀洲区', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1554', '嘉善县', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1555', '海盐县', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1556', '海宁市', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1557', '平湖市', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1558', '桐乡市 ', '338', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1559', '越城区', '340', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1560', '绍兴县', '340', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1561', '新昌县', '340', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1562', '诸暨市', '340', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1563', '上虞市', '340', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1564', '嵊州市', '340', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1565', '定海区', '343', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1566', '普陀区', '343', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1567', '岱山县', '343', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1568', '嵊泗县', '343', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1569', '婺城区', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1570', '金东区', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1571', '武义县', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1572', '浦江县', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1573', '磐安县', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1574', '兰溪市', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1575', '义乌市', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1576', '东阳市', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1577', '永康市', '341', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1578', '柯城区', '342', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1579', '衢江区', '342', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1580', '常山县', '342', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1581', '开化县', '342', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1582', '龙游县', '342', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1583', '江山市', '342', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1584', '椒江区', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1585', '黄岩区', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1586', '路桥区', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1587', '玉环县', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1588', '三门县', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1589', '天台县', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1590', '仙居县', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1591', '温岭市', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1592', '临海市', '344', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1593', '莲都区', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1594', '青田县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1595', '缙云县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1596', '遂昌县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1597', '松阳县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1598', '云和县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1599', '庆元县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1600', '景宁畲族自治县', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1601', '龙泉市', '345', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1602', '城关区', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1603', '七里河区', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1604', '西固区', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1605', '安宁区', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1606', '红古区', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1607', '永登县', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1608', '皋兰县', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1609', '榆中县', '97', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1610', '赤坎区', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1611', '霞山区', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1612', '坡头区', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1613', '麻章区', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1614', '遂溪县', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1615', '徐闻县', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1616', '廉江市', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1617', '雷州市', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1618', '吴川市', '368', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1619', '茂南区', '369', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1620', '茂港区', '369', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1621', '电白县', '369', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1622', '高州市', '369', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1623', '化州市', '369', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1624', '信宜市', '369', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1625', '云城区', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1626', '新兴县', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1627', '郁南县', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1628', '云安县', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1629', '罗定市', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1630', '海丰县', '362', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1631', '陆河县', '362', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1632', '陆丰市', '362', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1633', '江城区', '367', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1634', '阳西县', '367', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1635', '阳东县', '367', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1636', '阳春市', '367', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1637', '龙湖区', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1638', '金平区', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1639', '濠江区', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1640', '潮阳区', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1641', '潮南区', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1642', '澄海区', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1643', '南澳县', '357', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1644', '湘桥区', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1645', '潮安县', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1646', '饶平县', '372', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1647', '源城区', '359', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1648', '紫金县', '359', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1649', '龙川县', '359', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1650', '连平县', '359', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1651', '和平县', '359', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1652', '东源县', '359', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1653', '榕城区', '373', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1654', '揭东县', '373', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1655', '揭西县', '373', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1656', '惠来县', '373', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1657', '普宁市', '373', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1658', '梅江区', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1659', '梅县', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1660', '大埔县', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1661', '丰顺县', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1662', '五华县', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1663', '平远县', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1664', '蕉岭县', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1665', '兴宁市', '360', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1666', '锦江区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1667', '青羊区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1668', '金牛区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1669', '武侯区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1670', '成华区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1671', '龙泉驿区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1672', '青白江区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1673', '新都区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1674', '温江区', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1675', '金堂县', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1676', '双流县', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1677', '郫县', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1678', '大邑县', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1679', '蒲江县', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1680', '新津县', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1681', '都江堰市', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1682', '彭州市', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1683', '邛崃市', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1684', '崇州市', '123', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1685', '涪城区', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1686', '游仙区', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1687', '三台县', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1688', '盐亭县', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1689', '安县', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1690', '梓潼县', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1691', '北川羌族自治县', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1692', '平武县', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1693', '江油市', '399', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1694', '旌阳区', '398', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1695', '中江县', '398', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1696', '罗江县', '398', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1697', '广汉市', '398', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1698', '什邡市', '398', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1699', '绵竹市', '398', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1700', '自流井区', '395', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1701', '贡井区', '395', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1702', '大安区', '395', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1703', '沿滩区', '395', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1704', '荣县', '395', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1705', '富顺县', '395', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1706', '东区', '396', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1707', '西区', '396', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1708', '仁和区', '396', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1709', '米易县', '396', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1710', '盐边县', '396', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1711', '江阳区', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1712', '纳溪区', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1713', '龙马潭区', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1714', '泸县', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1715', '合江县', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1716', '叙永县', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1717', '古蔺县', '397', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1718', '罗湖区', '119', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1719', '福田区', '119', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1720', '南山区', '119', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1721', '宝安区', '119', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1722', '龙岗区', '119', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1723', '盐田区', '119', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1724', '东河区', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1725', '昆都仑区', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1726', '青山区', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1727', '石拐区', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1728', '白云鄂博矿区', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1729', '九原区', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1730', '土默特右旗', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1731', '固阳县', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1732', '达尔罕茂明安联合旗', '93', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1733', '文昌', '31', 'wenchang', 'W', '西北地区', '0', '1');
INSERT INTO `logistics_pca` VALUES ('1752', '新市区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1753', '水磨沟区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1754', '头屯河区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1755', '达坂城区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1756', '东山区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1757', '乌鲁木齐县', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1758', '高新区', '95', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1759', '高新区', '104', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1760', '莞城区', '210', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1761', '万江区', '210', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1762', '东城区', '210', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1763', '南城区', '210', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1764', '金阳新区', '125', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1765', '和平区', '89', '', '', null, '0', '2');
INSERT INTO `logistics_pca` VALUES ('1766', '高新区', '105', '', '', null, '0', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_picture
-- ----------------------------
INSERT INTO `logistics_picture` VALUES ('12', '/Uploads/Picture/cover/2017-03-30/58dcb515a3fbc.jpg', '', '2756b863c5402c565f82006907d31619', 'f21d86c69907bb8cd90dd58b4efe28778d4bb8d3', '1', '1490859285');
INSERT INTO `logistics_picture` VALUES ('13', '/Uploads/Picture/cover/2017-04-01/58df1734504ef.jpg', '', '17e7c7fea9aa9d431e84bd6dba07eda4', 'a71cf434ad8260237eeb3918b064dbfa02f6bba1', '1', '1491015476');
INSERT INTO `logistics_picture` VALUES ('7', '/Uploads/Picture/2017-03-30/58dc9ed226022.jpg', '', 'db1c9137a11e9844acd05fc615ceea83', '56ce4945a173df53b15ea801e62af1011be41f51', '1', '1490853586');
INSERT INTO `logistics_picture` VALUES ('14', '/Uploads/Picture/facade/2017-04-01/58df1955e48d6.jpg', '', '445fc9b097ca109cd546c2eac4ea5300', '545cb246b9ba8cc62b779460f42dbedd4baee0ff', '1', '1491016021');
INSERT INTO `logistics_picture` VALUES ('15', '/Uploads/Picture/facade/2017-04-01/58df1a91bef87.jpg', '', 'ea2b1510b6a795fac8a39ce27e9f9e3a', 'bdb41337dd6fde99572b35b3d0289d2442a901ae', '1', '1491016337');
INSERT INTO `logistics_picture` VALUES ('16', '/Uploads/Picture/license/2017-04-01/58df1b8d7882c.jpg', '', '2378b85a5744dd800f74703b10e7f9c0', '7d95f5e9b44d0daa46c371c30096f5aa5a264ca3', '1', '1491016589');

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
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL default '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL default '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL default '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL default '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) default '0' COMMENT '用户状态',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of logistics_ucenter_member
-- ----------------------------
INSERT INTO `logistics_ucenter_member` VALUES ('1', 'shexie303', '74512fad441da1d65478e0698d82386a', 'lc@qq.com', '', '1490319959', '2130706433', '1491795478', '2130706433', '1490319959', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('2', 'shexie33', '74512fad441da1d65478e0698d82386a', 'lc_php@126.com', '', '1490321367', '2130706433', '1491550859', '2130706433', '1490321367', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('3', 'shexie44', '74512fad441da1d65478e0698d82386a', 'asd@qq.com', '', '1490582797', '2130706433', '1490683465', '2130706433', '1490582797', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('4', 'shexie55', '74512fad441da1d65478e0698d82386a', '112@126.com', '', '1490604355', '2130706433', '1491039189', '2130706433', '1490604355', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('5', 'shexie66', '74512fad441da1d65478e0698d82386a', '123@qq.com', '', '1490605123', '2130706433', '1491558501', '2130706433', '1490605123', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('6', 'shexie67', '74512fad441da1d65478e0698d82386a', '1234@qq.com', '', '1490605165', '2130706433', '0', '0', '1490605165', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('7', 'shexie77', '74512fad441da1d65478e0698d82386a', 'sadfwer@126.com', '', '1490607882', '2130706433', '1491532249', '2130706433', '1490607882', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('8', 'shexie88', '74512fad441da1d65478e0698d82386a', 'lewis@126.com', '', '1490608463', '2130706433', '1490608482', '2130706433', '1490608463', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('9', 'shexie99', '74512fad441da1d65478e0698d82386a', 'asdf2@126.com', '', '1490669878', '2130706433', '1490670123', '2130706433', '1490669878', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('10', 'shexie98', '74512fad441da1d65478e0698d82386a', 'asdf22@126.com', '', '1490669942', '2130706433', '1490670317', '2130706433', '1490669942', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('11', 'shexie97', '74512fad441da1d65478e0698d82386a', 'adsf234@126.com', '', '1490670500', '2130706433', '0', '0', '1490670500', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('12', 'shexie96', 'b5a62f0af732f0d6d01c497d71940fb0', 'AD@126.com', '', '1490670715', '2130706433', '0', '0', '1490670715', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('13', 'shexie95', '74512fad441da1d65478e0698d82386a', 'ADd@126.com', '', '1490670829', '2130706433', '0', '0', '1490670829', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('14', 'shexie94', '74512fad441da1d65478e0698d82386a', 'asdfasd@126.com', '', '1490671091', '2130706433', '1490672004', '2130706433', '1490671091', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('15', 'shexie93', '74512fad441da1d65478e0698d82386a', 'df234@126.com', '', '1490671422', '2130706433', '1490671452', '2130706433', '1490671422', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('16', '李二蛋', '74512fad441da1d65478e0698d82386a', '123@22.com', '', '1490949511', '2130706433', '1491031933', '2130706433', '1490949511', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('17', '二蛋', '74512fad441da1d65478e0698d82386a', '123@123.com', '', '1491792443', '2130706433', '1491811794', '2130706433', '1491792443', '1');

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
