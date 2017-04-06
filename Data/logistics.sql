/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50086
Source Host           : localhost:3306
Source Database       : logistics

Target Server Type    : MYSQL
Target Server Version : 50086
File Encoding         : 65001

Date: 2017-04-06 17:57:48
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
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

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
  `description` char(140) NOT NULL default '' COMMENT '描述',
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of logistics_document
-- ----------------------------
INSERT INTO `logistics_document` VALUES ('1', '15', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '2', '1', '0', '0', '14', '0', '0', '5', '1387260660', '1490850896', '1');
INSERT INTO `logistics_document` VALUES ('2', '16', '', '试试好使不', '2', '看看这个', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '15', '0', '0', '1', '1490325060', '1490342702', '1');
INSERT INTO `logistics_document` VALUES ('3', '5', '', '【双圆物流】上海至淮安、宿迁、徐州、盐城、连云港专线(苏北三线中转周边地区)', '3', '呜呜呜呜呜呜呜呜呜呜呜呜', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '9', '0', '0', '0', '1490327068', '1490327068', '1');
INSERT INTO `logistics_document` VALUES ('6', '1', '', '尼玛', '39', '111', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1490342760', '1490343570', '1');
INSERT INTO `logistics_document` VALUES ('8', '17', '', '123123', '2', '123123', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '3', '1490685281', '1491032206', '1');
INSERT INTO `logistics_document` VALUES ('9', '5', '', '456', '3', '456', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '4', '1490685509', '1491037629', '-1');

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
INSERT INTO `logistics_document_article` VALUES ('9', '0', '456', '', '0', null);

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
INSERT INTO `logistics_member` VALUES ('1', 'shexie303', '0', '131128198911296612', '', '', '', '/Uploads/Picture/facade/2017-04-01/58df1a91bef87.jpg', '/Uploads/Picture/license/2017-04-01/58df1b8d7882c.jpg', '0', '0', '0', '40', '56', '0', '1490319959', '2130706433', '1491469467', '1');
INSERT INTO `logistics_member` VALUES ('2', 'shexie33', '0', '', '', '', '', '', '', '0', '0', '0', '30', '36', '2130706433', '1490321384', '2130706433', '1491031214', '1');
INSERT INTO `logistics_member` VALUES ('3', 'shexie44', '0', '', '', '', '', '', '', '0', '0', '0', '10', '12', '2130706433', '1490582865', '2130706433', '1490683465', '1');
INSERT INTO `logistics_member` VALUES ('4', 'shexie55', '0', '', '', '', '', '', '', '0', '0', '0', '20', '2', '0', '0', '2130706433', '1491039189', '1');
INSERT INTO `logistics_member` VALUES ('5', 'shexie66', '0', '131128198911296613', '123456', '1333333333', '13333333333', '', '', '0', '0', '0', '20', '16', '0', '0', '2130706433', '1491039218', '1');
INSERT INTO `logistics_member` VALUES ('6', 'shexie67', '0', '131128198911296614', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('7', 'shexie77', '0', '', '', '', '', '', '', '0', '0', '0', '20', '2', '2130706433', '1490608386', '2130706433', '1491469359', '1');
INSERT INTO `logistics_member` VALUES ('9', 'shexie99', '0', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490670123', '2130706433', '1490670123', '1');
INSERT INTO `logistics_member` VALUES ('10', 'shexie98', '0', '', '', '', '', '', '', '0', '0', '0', '10', '2', '2130706433', '1490670236', '2130706433', '1490670317', '1');
INSERT INTO `logistics_member` VALUES ('11', 'shexie97', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670500', '0', '0', '-1');
INSERT INTO `logistics_member` VALUES ('12', 'shexie96', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670715', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('13', 'shexie95', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670829', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('14', 'shexie94', '0', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490671091', '2130706433', '1490672004', '-1');
INSERT INTO `logistics_member` VALUES ('15', 'shexie93', '0', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490671422', '2130706433', '1490671452', '-1');
INSERT INTO `logistics_member` VALUES ('16', '李二蛋', '0', '', '', '', '', '', '', '0', '0', '0', '10', '7', '0', '0', '2130706433', '1491031933', '1');
INSERT INTO `logistics_member` VALUES ('17', '二蛋', '0', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');

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
INSERT INTO `logistics_ucenter_member` VALUES ('1', 'shexie303', '74512fad441da1d65478e0698d82386a', 'lc@qq.com', '', '1490319959', '2130706433', '1491469467', '2130706433', '1490319959', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('2', 'shexie33', '74512fad441da1d65478e0698d82386a', 'lc_php@126.com', '', '1490321367', '2130706433', '1491031214', '2130706433', '1490321367', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('3', 'shexie44', '74512fad441da1d65478e0698d82386a', 'asd@qq.com', '', '1490582797', '2130706433', '1490683465', '2130706433', '1490582797', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('4', 'shexie55', '74512fad441da1d65478e0698d82386a', '112@126.com', '', '1490604355', '2130706433', '1491039189', '2130706433', '1490604355', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('5', 'shexie66', '74512fad441da1d65478e0698d82386a', '123@qq.com', '', '1490605123', '2130706433', '1491039218', '2130706433', '1490605123', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('6', 'shexie67', '74512fad441da1d65478e0698d82386a', '1234@qq.com', '', '1490605165', '2130706433', '0', '0', '1490605165', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('7', 'shexie77', '74512fad441da1d65478e0698d82386a', 'sadfwer@126.com', '', '1490607882', '2130706433', '1491469359', '2130706433', '1490607882', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('8', 'shexie88', '74512fad441da1d65478e0698d82386a', 'lewis@126.com', '', '1490608463', '2130706433', '1490608482', '2130706433', '1490608463', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('9', 'shexie99', '74512fad441da1d65478e0698d82386a', 'asdf2@126.com', '', '1490669878', '2130706433', '1490670123', '2130706433', '1490669878', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('10', 'shexie98', '74512fad441da1d65478e0698d82386a', 'asdf22@126.com', '', '1490669942', '2130706433', '1490670317', '2130706433', '1490669942', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('11', 'shexie97', '74512fad441da1d65478e0698d82386a', 'adsf234@126.com', '', '1490670500', '2130706433', '0', '0', '1490670500', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('12', 'shexie96', 'b5a62f0af732f0d6d01c497d71940fb0', 'AD@126.com', '', '1490670715', '2130706433', '0', '0', '1490670715', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('13', 'shexie95', '74512fad441da1d65478e0698d82386a', 'ADd@126.com', '', '1490670829', '2130706433', '0', '0', '1490670829', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('14', 'shexie94', '74512fad441da1d65478e0698d82386a', 'asdfasd@126.com', '', '1490671091', '2130706433', '1490672004', '2130706433', '1490671091', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('15', 'shexie93', '74512fad441da1d65478e0698d82386a', 'df234@126.com', '', '1490671422', '2130706433', '1490671452', '2130706433', '1490671422', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('16', '李二蛋', '74512fad441da1d65478e0698d82386a', '123@22.com', '', '1490949511', '2130706433', '1491031933', '2130706433', '1490949511', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('17', '二蛋', '74512fad441da1d65478e0698d82386a', '123@123.com', '', '1490950301', '2130706433', '0', '0', '1490950301', '1');

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
