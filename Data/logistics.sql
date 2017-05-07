/*
Navicat MySQL Data Transfer

Source Server         : 127
Source Server Version : 50086
Source Host           : localhost:3306
Source Database       : logistics

Target Server Type    : MYSQL
Target Server Version : 50086
File Encoding         : 65001

Date: 2017-05-07 23:59:40
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
) ENGINE=MyISAM AUTO_INCREMENT=397 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

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
INSERT INTO `logistics_action_log` VALUES ('200', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-10 21:07登录了后台', '1', '1491829648');
INSERT INTO `logistics_action_log` VALUES ('201', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-12 16:19登录了后台', '1', '1491985161');
INSERT INTO `logistics_action_log` VALUES ('202', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-13 09:48登录了后台', '1', '1492048080');
INSERT INTO `logistics_action_log` VALUES ('203', '11', '1', '2130706433', 'category', '5', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1492065358');
INSERT INTO `logistics_action_log` VALUES ('204', '11', '1', '2130706433', 'category', '6', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1492065425');
INSERT INTO `logistics_action_log` VALUES ('205', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492065489');
INSERT INTO `logistics_action_log` VALUES ('206', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492065524');
INSERT INTO `logistics_action_log` VALUES ('207', '11', '1', '2130706433', 'category', '4', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492065525');
INSERT INTO `logistics_action_log` VALUES ('208', '11', '1', '2130706433', 'category', '5', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492065527');
INSERT INTO `logistics_action_log` VALUES ('209', '11', '1', '2130706433', 'category', '6', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492065529');
INSERT INTO `logistics_action_log` VALUES ('210', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-13 14:41登录了后台', '1', '1492065693');
INSERT INTO `logistics_action_log` VALUES ('211', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-13 16:04登录了后台', '1', '1492070677');
INSERT INTO `logistics_action_log` VALUES ('212', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-13 16:23登录了后台', '1', '1492071838');
INSERT INTO `logistics_action_log` VALUES ('213', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-14 09:24登录了后台', '1', '1492133064');
INSERT INTO `logistics_action_log` VALUES ('214', '11', '1', '2130706433', 'category', '7', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1492133721');
INSERT INTO `logistics_action_log` VALUES ('215', '11', '1', '2130706433', 'category', '7', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492133728');
INSERT INTO `logistics_action_log` VALUES ('216', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-14 11:13登录了后台', '1', '1492139614');
INSERT INTO `logistics_action_log` VALUES ('217', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-14 11:39登录了后台', '1', '1492141148');
INSERT INTO `logistics_action_log` VALUES ('218', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 11:56登录了后台', '1', '1492142207');
INSERT INTO `logistics_action_log` VALUES ('219', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 13:21登录了后台', '1', '1492147302');
INSERT INTO `logistics_action_log` VALUES ('220', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-14 13:40登录了后台', '1', '1492148415');
INSERT INTO `logistics_action_log` VALUES ('221', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 13:48登录了后台', '1', '1492148921');
INSERT INTO `logistics_action_log` VALUES ('222', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-14 13:51登录了后台', '1', '1492149085');
INSERT INTO `logistics_action_log` VALUES ('223', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-14 13:56登录了后台', '1', '1492149368');
INSERT INTO `logistics_action_log` VALUES ('224', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1492150809');
INSERT INTO `logistics_action_log` VALUES ('225', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1492150936');
INSERT INTO `logistics_action_log` VALUES ('226', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-14 14:24登录了后台', '1', '1492151057');
INSERT INTO `logistics_action_log` VALUES ('227', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 14:41登录了后台', '1', '1492152119');
INSERT INTO `logistics_action_log` VALUES ('228', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 14:43登录了后台', '1', '1492152222');
INSERT INTO `logistics_action_log` VALUES ('229', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-14 14:53登录了后台', '1', '1492152795');
INSERT INTO `logistics_action_log` VALUES ('230', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-14 14:54登录了后台', '1', '1492152897');
INSERT INTO `logistics_action_log` VALUES ('231', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 14:59登录了后台', '1', '1492153158');
INSERT INTO `logistics_action_log` VALUES ('232', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 15:10登录了后台', '1', '1492153831');
INSERT INTO `logistics_action_log` VALUES ('233', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-14 15:32登录了后台', '1', '1492155174');
INSERT INTO `logistics_action_log` VALUES ('234', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 15:34登录了后台', '1', '1492155298');
INSERT INTO `logistics_action_log` VALUES ('235', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 15:37登录了后台', '1', '1492155449');
INSERT INTO `logistics_action_log` VALUES ('236', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 15:40登录了后台', '1', '1492155615');
INSERT INTO `logistics_action_log` VALUES ('237', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 15:52登录了后台', '1', '1492156375');
INSERT INTO `logistics_action_log` VALUES ('238', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-14 15:53登录了后台', '1', '1492156426');
INSERT INTO `logistics_action_log` VALUES ('239', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-15 14:58登录了后台', '1', '1492239488');
INSERT INTO `logistics_action_log` VALUES ('240', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-15 15:00登录了后台', '1', '1492239609');
INSERT INTO `logistics_action_log` VALUES ('241', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-15 15:17登录了后台', '1', '1492240624');
INSERT INTO `logistics_action_log` VALUES ('242', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-15 15:19登录了后台', '1', '1492240779');
INSERT INTO `logistics_action_log` VALUES ('243', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-15 15:31登录了后台', '1', '1492241482');
INSERT INTO `logistics_action_log` VALUES ('244', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-15 15:36登录了后台', '1', '1492241786');
INSERT INTO `logistics_action_log` VALUES ('245', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-15 16:06登录了后台', '1', '1492243572');
INSERT INTO `logistics_action_log` VALUES ('246', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-15 17:36登录了后台', '1', '1492248985');
INSERT INTO `logistics_action_log` VALUES ('247', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-04-15 17:45登录了后台', '1', '1492249556');
INSERT INTO `logistics_action_log` VALUES ('248', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-16 11:01登录了后台', '1', '1492311702');
INSERT INTO `logistics_action_log` VALUES ('249', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-16 11:15登录了后台', '1', '1492312531');
INSERT INTO `logistics_action_log` VALUES ('250', '1', '3', '2130706433', 'member', '3', 'shexie44在2017-04-16 11:16登录了后台', '1', '1492312574');
INSERT INTO `logistics_action_log` VALUES ('251', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-17 16:34登录了后台', '1', '1492418078');
INSERT INTO `logistics_action_log` VALUES ('252', '11', '1', '2130706433', 'category', '8', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1492419007');
INSERT INTO `logistics_action_log` VALUES ('253', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-18 09:59登录了后台', '1', '1492480750');
INSERT INTO `logistics_action_log` VALUES ('254', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-18 13:34登录了后台', '1', '1492493649');
INSERT INTO `logistics_action_log` VALUES ('255', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-18 14:18登录了后台', '1', '1492496338');
INSERT INTO `logistics_action_log` VALUES ('256', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-18 14:30登录了后台', '1', '1492497001');
INSERT INTO `logistics_action_log` VALUES ('257', '6', '1', '2130706433', 'config', '33', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1492497121');
INSERT INTO `logistics_action_log` VALUES ('258', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-18 14:32登录了后台', '1', '1492497142');
INSERT INTO `logistics_action_log` VALUES ('259', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-18 14:58登录了后台', '1', '1492498728');
INSERT INTO `logistics_action_log` VALUES ('260', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-18 15:03登录了后台', '1', '1492498998');
INSERT INTO `logistics_action_log` VALUES ('261', '4', '2', '2130706433', 'document', '24', 'shexie33在2017-04-18 15:08发表了一篇文章。\r\n表document，记录编号24。', '1', '1492499325');
INSERT INTO `logistics_action_log` VALUES ('262', '4', '2', '2130706433', 'document', '25', 'shexie33在2017-04-18 15:45发表了一篇文章。\r\n表document，记录编号25。', '1', '1492501511');
INSERT INTO `logistics_action_log` VALUES ('263', '4', '2', '2130706433', 'document', '26', 'shexie33在2017-04-18 15:51发表了一篇文章。\r\n表document，记录编号26。', '1', '1492501892');
INSERT INTO `logistics_action_log` VALUES ('264', '6', '1', '2130706433', 'config', '33', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1492573764');
INSERT INTO `logistics_action_log` VALUES ('265', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-19 11:50登录了后台', '1', '1492573834');
INSERT INTO `logistics_action_log` VALUES ('266', '6', '1', '2130706433', 'config', '33', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1492573998');
INSERT INTO `logistics_action_log` VALUES ('267', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-19 11:53登录了后台', '1', '1492574025');
INSERT INTO `logistics_action_log` VALUES ('268', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-19 11:57登录了后台', '1', '1492574268');
INSERT INTO `logistics_action_log` VALUES ('269', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-19 13:21登录了后台', '1', '1492579262');
INSERT INTO `logistics_action_log` VALUES ('270', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-19 14:55登录了后台', '1', '1492584936');
INSERT INTO `logistics_action_log` VALUES ('271', '1', '22', '2130706433', 'member', '22', 'she<>\'\';在2017-04-19 15:21登录了后台', '1', '1492586463');
INSERT INTO `logistics_action_log` VALUES ('272', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-19 15:55登录了后台', '1', '1492588556');
INSERT INTO `logistics_action_log` VALUES ('273', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-19 16:14登录了后台', '1', '1492589662');
INSERT INTO `logistics_action_log` VALUES ('274', '4', '17', '2130706433', 'document', '35', '二蛋在2017-04-19 16:24发表了一篇文章。\r\n表document，记录编号35。', '1', '1492590255');
INSERT INTO `logistics_action_log` VALUES ('275', '4', '17', '2130706433', 'document', '36', '二蛋在2017-04-19 16:33发表了一篇文章。\r\n表document，记录编号36。', '1', '1492590781');
INSERT INTO `logistics_action_log` VALUES ('276', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-19 16:34登录了后台', '1', '1492590888');
INSERT INTO `logistics_action_log` VALUES ('277', '4', '2', '2130706433', 'document', '37', 'shexie33在2017-04-19 16:38发表了一篇文章。\r\n表document，记录编号37。', '1', '1492591127');
INSERT INTO `logistics_action_log` VALUES ('278', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-19 16:41登录了后台', '1', '1492591306');
INSERT INTO `logistics_action_log` VALUES ('279', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-19 16:42登录了后台', '1', '1492591353');
INSERT INTO `logistics_action_log` VALUES ('280', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-19 16:52登录了后台', '1', '1492591940');
INSERT INTO `logistics_action_log` VALUES ('281', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-19 16:56登录了后台', '1', '1492592217');
INSERT INTO `logistics_action_log` VALUES ('282', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-19 17:39登录了后台', '1', '1492594761');
INSERT INTO `logistics_action_log` VALUES ('283', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-20 09:17登录了后台', '1', '1492651048');
INSERT INTO `logistics_action_log` VALUES ('284', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-20 09:49登录了后台', '1', '1492652940');
INSERT INTO `logistics_action_log` VALUES ('285', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-20 09:57登录了后台', '1', '1492653452');
INSERT INTO `logistics_action_log` VALUES ('286', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-20 09:58登录了后台', '1', '1492653485');
INSERT INTO `logistics_action_log` VALUES ('287', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-20 10:54登录了后台', '1', '1492656845');
INSERT INTO `logistics_action_log` VALUES ('288', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-04-20 13:47登录了后台', '1', '1492667274');
INSERT INTO `logistics_action_log` VALUES ('289', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-21 09:30登录了后台', '1', '1492738215');
INSERT INTO `logistics_action_log` VALUES ('290', '10', '1', '2130706433', 'Menu', '126', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1492739831');
INSERT INTO `logistics_action_log` VALUES ('291', '10', '1', '2130706433', 'Menu', '127', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1492740066');
INSERT INTO `logistics_action_log` VALUES ('292', '10', '1', '2130706433', 'Menu', '128', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1492740098');
INSERT INTO `logistics_action_log` VALUES ('293', '10', '1', '2130706433', 'Menu', '76', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1492740263');
INSERT INTO `logistics_action_log` VALUES ('294', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1492740411');
INSERT INTO `logistics_action_log` VALUES ('295', '10', '1', '2130706433', 'Menu', '68', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1492740515');
INSERT INTO `logistics_action_log` VALUES ('296', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-21 10:09登录了后台', '1', '1492740571');
INSERT INTO `logistics_action_log` VALUES ('297', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-21 10:10登录了后台', '1', '1492740630');
INSERT INTO `logistics_action_log` VALUES ('298', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-21 10:11登录了后台', '1', '1492740699');
INSERT INTO `logistics_action_log` VALUES ('299', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-21 10:14登录了后台', '1', '1492740851');
INSERT INTO `logistics_action_log` VALUES ('300', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-21 10:16登录了后台', '1', '1492741012');
INSERT INTO `logistics_action_log` VALUES ('301', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-21 10:18登录了后台', '1', '1492741103');
INSERT INTO `logistics_action_log` VALUES ('302', '9', '1', '2130706433', 'channel', '0', '操作url：/index.php?s=/Admin/Channel/del/id/3.html', '1', '1492741543');
INSERT INTO `logistics_action_log` VALUES ('303', '9', '1', '2130706433', 'channel', '1', '操作url：/index.php?s=/Admin/Channel/edit.html', '1', '1492741606');
INSERT INTO `logistics_action_log` VALUES ('304', '9', '1', '2130706433', 'channel', '2', '操作url：/index.php?s=/Admin/Channel/edit.html', '1', '1492741634');
INSERT INTO `logistics_action_log` VALUES ('305', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-21 10:28登录了后台', '1', '1492741725');
INSERT INTO `logistics_action_log` VALUES ('306', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-21 10:41登录了后台', '1', '1492742461');
INSERT INTO `logistics_action_log` VALUES ('307', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-21 14:21登录了后台', '1', '1492755674');
INSERT INTO `logistics_action_log` VALUES ('308', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492755766');
INSERT INTO `logistics_action_log` VALUES ('309', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492755826');
INSERT INTO `logistics_action_log` VALUES ('310', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492755877');
INSERT INTO `logistics_action_log` VALUES ('311', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492755916');
INSERT INTO `logistics_action_log` VALUES ('312', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492755922');
INSERT INTO `logistics_action_log` VALUES ('313', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492755931');
INSERT INTO `logistics_action_log` VALUES ('314', '11', '1', '2130706433', 'category', '9', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492764935');
INSERT INTO `logistics_action_log` VALUES ('315', '11', '1', '2130706433', 'category', '9', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1492764992');
INSERT INTO `logistics_action_log` VALUES ('316', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-24 09:53登录了后台', '1', '1492998838');
INSERT INTO `logistics_action_log` VALUES ('317', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-24 17:33登录了后台', '1', '1493026406');
INSERT INTO `logistics_action_log` VALUES ('318', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-25 10:16登录了后台', '1', '1493086611');
INSERT INTO `logistics_action_log` VALUES ('319', '10', '1', '2130706433', 'Menu', '130', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1493086865');
INSERT INTO `logistics_action_log` VALUES ('320', '10', '1', '2130706433', 'Menu', '131', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1493086992');
INSERT INTO `logistics_action_log` VALUES ('321', '10', '1', '2130706433', 'Menu', '132', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1493087014');
INSERT INTO `logistics_action_log` VALUES ('322', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-25 10:24登录了后台', '1', '1493087054');
INSERT INTO `logistics_action_log` VALUES ('323', '9', '2', '2130706433', 'channel', '0', '操作url：/index.php?s=/Admin/Channel/del.html', '1', '1493088932');
INSERT INTO `logistics_action_log` VALUES ('324', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-25 10:57登录了后台', '1', '1493089035');
INSERT INTO `logistics_action_log` VALUES ('325', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1493089152');
INSERT INTO `logistics_action_log` VALUES ('326', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-25 13:57登录了后台', '1', '1493099866');
INSERT INTO `logistics_action_log` VALUES ('327', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-25 14:04登录了后台', '1', '1493100278');
INSERT INTO `logistics_action_log` VALUES ('328', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-25 14:43登录了后台', '1', '1493102637');
INSERT INTO `logistics_action_log` VALUES ('329', '11', '1', '2130706433', 'category', '7', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1493102654');
INSERT INTO `logistics_action_log` VALUES ('330', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-25 16:32登录了后台', '1', '1493109137');
INSERT INTO `logistics_action_log` VALUES ('331', '4', '1', '2130706433', 'document', '38', 'shexie303在2017-04-25 16:33发表了一篇文章。\r\n表document，记录编号38。', '1', '1493109203');
INSERT INTO `logistics_action_log` VALUES ('332', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-25 17:00登录了后台', '1', '1493110834');
INSERT INTO `logistics_action_log` VALUES ('333', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-26 08:58登录了后台', '1', '1493168294');
INSERT INTO `logistics_action_log` VALUES ('334', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-26 10:13登录了后台', '1', '1493172834');
INSERT INTO `logistics_action_log` VALUES ('335', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-27 09:46登录了后台', '1', '1493257577');
INSERT INTO `logistics_action_log` VALUES ('336', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-27 15:11登录了后台', '1', '1493277117');
INSERT INTO `logistics_action_log` VALUES ('337', '11', '1', '2130706433', 'category', '42', '操作url：/index.php?s=/Category/add.html', '1', '1493284818');
INSERT INTO `logistics_action_log` VALUES ('338', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/Category/add.html', '1', '1493284851');
INSERT INTO `logistics_action_log` VALUES ('339', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/Category/add.html', '1', '1493284877');
INSERT INTO `logistics_action_log` VALUES ('340', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/Category/add.html', '1', '1493284907');
INSERT INTO `logistics_action_log` VALUES ('341', '11', '1', '2130706433', 'category', '42', '操作url：/index.php?s=/Category/edit.html', '1', '1493284920');
INSERT INTO `logistics_action_log` VALUES ('342', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/Category/edit.html', '1', '1493284921');
INSERT INTO `logistics_action_log` VALUES ('343', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/Category/edit.html', '1', '1493284922');
INSERT INTO `logistics_action_log` VALUES ('344', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/Category/edit.html', '1', '1493284924');
INSERT INTO `logistics_action_log` VALUES ('345', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-28 10:36登录了后台', '1', '1493347008');
INSERT INTO `logistics_action_log` VALUES ('346', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/Category/add.html', '1', '1493351865');
INSERT INTO `logistics_action_log` VALUES ('347', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-29 22:07登录了后台', '1', '1493474843');
INSERT INTO `logistics_action_log` VALUES ('348', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-29 22:16登录了后台', '1', '1493475375');
INSERT INTO `logistics_action_log` VALUES ('349', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1493475462');
INSERT INTO `logistics_action_log` VALUES ('350', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-29 22:21登录了后台', '1', '1493475711');
INSERT INTO `logistics_action_log` VALUES ('351', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1493475779');
INSERT INTO `logistics_action_log` VALUES ('352', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-29 23:00登录了后台', '1', '1493478033');
INSERT INTO `logistics_action_log` VALUES ('353', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-29 23:03登录了后台', '1', '1493478219');
INSERT INTO `logistics_action_log` VALUES ('354', '10', '1', '2130706433', 'Menu', '1', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1493478396');
INSERT INTO `logistics_action_log` VALUES ('355', '10', '1', '2130706433', 'Menu', '1', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1493478460');
INSERT INTO `logistics_action_log` VALUES ('356', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/1.html', '1', '1493478646');
INSERT INTO `logistics_action_log` VALUES ('357', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-30 13:24登录了后台', '1', '1493529862');
INSERT INTO `logistics_action_log` VALUES ('358', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-30 14:27登录了后台', '1', '1493533650');
INSERT INTO `logistics_action_log` VALUES ('359', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-04-30 14:52登录了后台', '1', '1493535173');
INSERT INTO `logistics_action_log` VALUES ('360', '1', '17', '2130706433', 'member', '17', '二蛋在2017-04-30 15:06登录了后台', '1', '1493535986');
INSERT INTO `logistics_action_log` VALUES ('361', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-04-30 15:17登录了后台', '1', '1493536623');
INSERT INTO `logistics_action_log` VALUES ('362', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-01 11:19登录了后台', '1', '1493608799');
INSERT INTO `logistics_action_log` VALUES ('363', '1', '17', '2130706433', 'member', '17', '二蛋在2017-05-01 11:35登录了后台', '1', '1493609743');
INSERT INTO `logistics_action_log` VALUES ('364', '4', '17', '2130706433', 'document', '39', '二蛋在2017-05-01 11:41发表了一篇文章。\r\n表document，记录编号39。', '1', '1493610067');
INSERT INTO `logistics_action_log` VALUES ('365', '4', '17', '2130706433', 'document', '40', '二蛋在2017-05-01 11:46发表了一篇文章。\r\n表document，记录编号40。', '1', '1493610412');
INSERT INTO `logistics_action_log` VALUES ('366', '1', '17', '2130706433', 'member', '17', '二蛋在2017-05-01 18:43登录了后台', '1', '1493635407');
INSERT INTO `logistics_action_log` VALUES ('367', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-01 18:45登录了后台', '1', '1493635551');
INSERT INTO `logistics_action_log` VALUES ('368', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-01 18:50登录了后台', '1', '1493635805');
INSERT INTO `logistics_action_log` VALUES ('369', '8', '1', '2130706433', 'attribute', '22', '操作url：/index.php?s=/attribute/update.html', '1', '1493635953');
INSERT INTO `logistics_action_log` VALUES ('370', '1', '17', '2130706433', 'member', '17', '二蛋在2017-05-01 19:04登录了后台', '1', '1493636650');
INSERT INTO `logistics_action_log` VALUES ('371', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-01 20:29登录了后台', '1', '1493641753');
INSERT INTO `logistics_action_log` VALUES ('372', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/Category/add.html', '1', '1493641934');
INSERT INTO `logistics_action_log` VALUES ('373', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-01 21:28登录了后台', '1', '1493645319');
INSERT INTO `logistics_action_log` VALUES ('374', '11', '1', '2130706433', 'category', '47', '操作url：/index.php?s=/Category/add.html', '1', '1493645349');
INSERT INTO `logistics_action_log` VALUES ('375', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-02 10:13登录了后台', '1', '1493691215');
INSERT INTO `logistics_action_log` VALUES ('376', '1', '6', '2130706433', 'member', '6', 'shexie67在2017-05-02 19:28登录了后台', '1', '1493724489');
INSERT INTO `logistics_action_log` VALUES ('377', '1', '6', '2130706433', 'member', '6', 'shexie67在2017-05-02 19:39登录了后台', '1', '1493725196');
INSERT INTO `logistics_action_log` VALUES ('378', '4', '6', '2130706433', 'document', '41', 'shexie67在2017-05-02 19:45发表了一篇文章。\r\n表document，记录编号41。', '1', '1493725548');
INSERT INTO `logistics_action_log` VALUES ('379', '4', '6', '2130706433', 'document', '42', 'shexie67在2017-05-02 19:48发表了一篇文章。\r\n表document，记录编号42。', '1', '1493725682');
INSERT INTO `logistics_action_log` VALUES ('380', '4', '6', '2130706433', 'document', '43', 'shexie67在2017-05-02 19:49发表了一篇文章。\r\n表document，记录编号43。', '1', '1493725745');
INSERT INTO `logistics_action_log` VALUES ('381', '4', '6', '2130706433', 'document', '44', 'shexie67在2017-05-02 19:50发表了一篇文章。\r\n表document，记录编号44。', '1', '1493725807');
INSERT INTO `logistics_action_log` VALUES ('382', '4', '6', '2130706433', 'document', '45', 'shexie67在2017-05-02 19:53发表了一篇文章。\r\n表document，记录编号45。', '1', '1493726027');
INSERT INTO `logistics_action_log` VALUES ('383', '1', '6', '2130706433', 'member', '6', 'shexie67在2017-05-02 19:58登录了后台', '1', '1493726325');
INSERT INTO `logistics_action_log` VALUES ('384', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-02 20:04登录了后台', '1', '1493726647');
INSERT INTO `logistics_action_log` VALUES ('385', '1', '2', '2130706433', 'member', '2', 'shexie33在2017-05-02 20:04登录了后台', '1', '1493726690');
INSERT INTO `logistics_action_log` VALUES ('386', '1', '7', '2130706433', 'member', '7', 'shexie77在2017-05-02 21:50登录了后台', '1', '1493733004');
INSERT INTO `logistics_action_log` VALUES ('387', '1', '16', '2130706433', 'member', '16', '李二蛋在2017-05-02 21:52登录了后台', '1', '1493733170');
INSERT INTO `logistics_action_log` VALUES ('388', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-05-02 21:54登录了后台', '1', '1493733274');
INSERT INTO `logistics_action_log` VALUES ('389', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-05-02 22:27登录了后台', '1', '1493735238');
INSERT INTO `logistics_action_log` VALUES ('390', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-05-02 22:44登录了后台', '1', '1493736257');
INSERT INTO `logistics_action_log` VALUES ('391', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-05-02 22:45登录了后台', '1', '1493736307');
INSERT INTO `logistics_action_log` VALUES ('392', '1', '5', '2130706433', 'member', '5', 'shexie66在2017-05-02 22:50登录了后台', '1', '1493736606');
INSERT INTO `logistics_action_log` VALUES ('393', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-05 20:44登录了后台', '1', '1493988267');
INSERT INTO `logistics_action_log` VALUES ('394', '1', '17', '2130706433', 'member', '17', '二蛋在2017-05-07 13:34登录了后台', '1', '1494135243');
INSERT INTO `logistics_action_log` VALUES ('395', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-07 13:53登录了后台', '1', '1494136420');
INSERT INTO `logistics_action_log` VALUES ('396', '1', '1', '2130706433', 'member', '1', 'shexie303在2017-05-07 14:38登录了后台', '1', '1494139099');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_ad
-- ----------------------------
INSERT INTO `logistics_ad` VALUES ('6', '8264落地配', '3', '/Uploads/Picture/ad_img/2017-05-07/590ebd27f1fa0.png', 'https://www.baidu.com', '0', '1492743832', '1494138152', '1');
INSERT INTO `logistics_ad` VALUES ('7', '心愿落地配', '3', '/Uploads/Picture/ad_img/2017-05-07/590ebd145c887.png', '', '0', '1493273485', '1494138133', '1');
INSERT INTO `logistics_ad` VALUES ('8', '落地配阿萨德发射点发', '1', '/Uploads/Picture/ad_img/2017-05-07/590eb967f1443.png', '', '3', '1493274290', '1494137195', '1');

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
INSERT INTO `logistics_auth_group` VALUES ('1', 'admin', '1', '管理员', '', '1', '2,3,7,8,9,10,17,23,24,26,67,68,69,70,88,108,178,211,214,221,222,223,224,225,226,227,228,229');
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
INSERT INTO `logistics_auth_group_access` VALUES ('16', '3');
INSERT INTO `logistics_auth_group_access` VALUES ('17', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('18', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('19', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('20', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('22', '2');
INSERT INTO `logistics_auth_group_access` VALUES ('23', '1');
INSERT INTO `logistics_auth_group_access` VALUES ('24', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

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
  `list_row` tinyint(3) unsigned NOT NULL default '45' COMMENT '列表每页行数',
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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of logistics_category
-- ----------------------------
INSERT INTO `logistics_category` VALUES ('5', 'tjhc', '推荐货车', '0', '4', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492065358', '1492065527', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('2', 'jpzx', '精品专线', '0', '1', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '0', '1', '', '', '1490326849', '1492755931', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('3', 'ldp', '落地配', '0', '2', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1490595686', '1492065524', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('4', 'zhwl', '综合物流', '0', '3', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1491035129', '1492065525', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('6', 'sccj', '生产厂家', '0', '5', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492065425', '1492065529', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('7', 'fbhy', '货源', '0', '6', '45', '', '', '', '', 'Index/hy', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492133721', '1493102654', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('8', 'sn', '市内', '2', '1', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '100000');
INSERT INTO `logistics_category` VALUES ('9', 'bj', '北京', '2', '2', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492764992', '1', '0', '110000');
INSERT INTO `logistics_category` VALUES ('10', 'tj', '天津', '2', '3', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '120000');
INSERT INTO `logistics_category` VALUES ('11', 'sh', '上海', '2', '4', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '310000');
INSERT INTO `logistics_category` VALUES ('12', 'cq', '重庆', '2', '5', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '500000');
INSERT INTO `logistics_category` VALUES ('13', 'zj', '浙江', '2', '6', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '330000');
INSERT INTO `logistics_category` VALUES ('14', 'js', '江苏', '2', '7', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '320000');
INSERT INTO `logistics_category` VALUES ('15', 'sd', '山东', '2', '8', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '370000');
INSERT INTO `logistics_category` VALUES ('16', 'ah', '安徽', '2', '9', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '340000');
INSERT INTO `logistics_category` VALUES ('17', 'gd', '广东', '2', '10', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '440000');
INSERT INTO `logistics_category` VALUES ('18', 'fj', '福建', '2', '11', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '350000');
INSERT INTO `logistics_category` VALUES ('19', 'jx', '江西', '2', '12', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '360000');
INSERT INTO `logistics_category` VALUES ('20', 'hn', '湖南', '2', '13', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '430000');
INSERT INTO `logistics_category` VALUES ('21', 'hb', '湖北', '2', '14', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '420000');
INSERT INTO `logistics_category` VALUES ('22', 'hen', '河南', '2', '15', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '410000');
INSERT INTO `logistics_category` VALUES ('23', 'heb', '河北', '2', '16', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '130000');
INSERT INTO `logistics_category` VALUES ('24', 'sx', '山西', '2', '17', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '140000');
INSERT INTO `logistics_category` VALUES ('25', 'shx', '陕西', '2', '18', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '610000');
INSERT INTO `logistics_category` VALUES ('26', 'gx', '广西', '2', '19', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '450000');
INSERT INTO `logistics_category` VALUES ('27', 'yn', '云南', '2', '20', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '530000');
INSERT INTO `logistics_category` VALUES ('28', 'gz', '贵州', '2', '21', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '520000');
INSERT INTO `logistics_category` VALUES ('29', 'sc', '四川', '2', '22', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '510000');
INSERT INTO `logistics_category` VALUES ('30', 'jl', '吉林', '2', '23', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '220000');
INSERT INTO `logistics_category` VALUES ('31', 'hlj', '黑龙江', '2', '24', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '230000');
INSERT INTO `logistics_category` VALUES ('32', 'ln', '辽宁', '2', '25', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '210000');
INSERT INTO `logistics_category` VALUES ('33', 'xj', '新疆', '2', '26', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '650000');
INSERT INTO `logistics_category` VALUES ('34', 'nx', '宁夏', '2', '27', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '630000');
INSERT INTO `logistics_category` VALUES ('35', 'nm', '内蒙', '2', '28', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '150000');
INSERT INTO `logistics_category` VALUES ('36', 'gs', '甘肃', '2', '29', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '620000');
INSERT INTO `logistics_category` VALUES ('37', 'qh', '青海', '2', '30', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '630000');
INSERT INTO `logistics_category` VALUES ('38', 'xz', '西藏', '2', '31', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '540000');
INSERT INTO `logistics_category` VALUES ('39', 'hain', '海南', '2', '32', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '460000');
INSERT INTO `logistics_category` VALUES ('40', 'gat', '港澳台', '2', '33', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '850000');
INSERT INTO `logistics_category` VALUES ('41', 'shengn', '省内', '2', '34', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1492419007', '1492419007', '1', '0', '900000');
INSERT INTO `logistics_category` VALUES ('42', 'wjzp', '五金制品', '6', '1', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284818', '1493284920', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('43', 'gcgj', '管材管件', '6', '2', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284851', '1493284921', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('44', 'dlqj', '电缆桥架', '6', '3', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284877', '1493284922', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('45', 'zxjc', '装修建材', '6', '4', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493284907', '1493284924', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('46', 'yyyj', '液压元件', '42', '0', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493641934', '1493641934', '1', '0', '0');
INSERT INTO `logistics_category` VALUES ('47', 'clyq', '测量仪器', '42', '0', '45', '', '', '', '', '', '', '', '2', '2,1', '0', '2', '1', '0', '1', '', '', '1493645349', '1493645349', '1', '0', '0');

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
INSERT INTO `logistics_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of logistics_document
-- ----------------------------
INSERT INTO `logistics_document` VALUES ('1', '15', '', 'OneThink1.0正式版发布', '123', '', '6', '0', '0', '120000', '120100', '120110', '0', '0', '0', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '24', '1', '0', '0', '21', '0', '0', '5', '1493199185', '1493199185', '0');
INSERT INTO `logistics_document` VALUES ('2', '16', '', '试试好使不', '456', '', '6', '42', '0', '140000', '0', '0', '0', '0', '0', '看看这个', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '19', '0', '0', '1', '1490325060', '1493199349', '1');
INSERT INTO `logistics_document` VALUES ('3', '5', '', '【双圆物流】上海至淮安、宿迁、徐州、盐城、连云港专线(苏北三线中转周边地区)', '18733333333', '', '6', '0', '0', '130000', '130300', '130303', '0', '0', '0', '呜呜呜呜呜呜呜呜呜呜呜呜', '0', '0', '2', '2', '0', '0', '17', '1', '0', '0', '18', '0', '0', '0', '1493199411', '1493199411', '1');
INSERT INTO `logistics_document` VALUES ('6', '1', '', '尼玛', '', '', '6', '0', '0', '140000', '0', '0', '0', '0', '0', '111', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '5', '0', '0', '0', '1490342760', '1490343570', '1');
INSERT INTO `logistics_document` VALUES ('37', '17', '', '12asdf', '', '', '6', '0', '0', '120000', '120100', '120111', '0', '0', '0', '张家窝万科四季花城', '0', '0', '2', '2', '0', '0', '24', '1', '0', '0', '5', '0', '0', '0', '1492591127', '1493199349', '1');
INSERT INTO `logistics_document` VALUES ('11', '1', '', '213', '', '', '6', '42', '46', '130000', '131000', '131026', '0', '0', '0', '106国道105公里处文安县史各庄新桥北', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '123', '1492504875', '1492504875', '1');
INSERT INTO `logistics_document` VALUES ('12', '1', '', 'dfgsdas123123', '13333333333', '', '6', '0', '0', '130000', '130100', '130104', '0', '0', '0', '123123asdfadsf', '0', '0', '2', '2', '0', '0', '30', '1', '0', '0', '1', '0', '0', '2', '1493199270', '1493199270', '1');
INSERT INTO `logistics_document` VALUES ('13', '1', '', '阿桑德拉发卡数量的疯狂', '', '', '6', '0', '0', '140000', '0', '0', '0', '0', '0', '阿萨德发送方', '0', '0', '2', '2', '0', '0', '17', '1', '0', '0', '3', '0', '0', '1', '1492073195', '1493199349', '1');
INSERT INTO `logistics_document` VALUES ('14', '1', '', '123345sadfasdfasdf', '', '', '6', '0', '0', '140000', '0', '0', '0', '0', '0', '12312阿斯蒂芬', '0', '0', '2', '2', '0', '0', '13', '1', '0', '0', '0', '0', '0', '123', '1492073977', '1493199169', '1');
INSERT INTO `logistics_document` VALUES ('35', '17', '', '阿萨德法律&lt;&gt;&quot;:', '13333333333', '', '6', '42', '47', '130000', '131000', '131003', '0', '0', '0', '106国道105公里处文安县史各庄新桥北', '0', '0', '2', '2', '0', '0', '27', '1', '0', '0', '3', '0', '0', '2', '1493199197', '1493199197', '1');
INSERT INTO `logistics_document` VALUES ('17', '2', '', '测试jpzx', '', '', '6', '0', '0', '140000', '140100', '140107', '0', '0', '0', 'sadfjl123123', '0', '0', '2', '2', '0', '0', '17', '1', '0', '0', '2', '0', '0', '1', '1492497685', '1492497685', '1');
INSERT INTO `logistics_document` VALUES ('18', '2', '', 'ces测试jpzx', '', '', '6', '0', '0', '140000', '140100', '140107', '0', '0', '0', 'sadfjl123123', '0', '0', '2', '2', '0', '0', '17', '1', '0', '0', '0', '0', '0', '1', '1492497801', '1493199349', '1');
INSERT INTO `logistics_document` VALUES ('19', '2', '', '123luodi', '13322221112', '', '6', '42', '0', '130000', '130400', '130434', '0', '0', '0', '1233', '0', '0', '2', '2', '0', '0', '24', '1', '0', '0', '2', '0', '0', '1', '1493199316', '1493199316', '1');
INSERT INTO `logistics_document` VALUES ('20', '2', '', '123123zxzc', '13322221111', '', '5', '0', '0', '130000', '130200', '130208', '0', '0', '0', '123', '0', '0', '2', '2', '0', '0', '24', '1', '0', '0', '22', '0', '0', '1', '1493199292', '1493199292', '1');
INSERT INTO `logistics_document` VALUES ('21', '2', '', '123ddddd', '', '', '5', '46', '0', '140000', '140300', '140311', '0', '0', '0', '1', '0', '0', '2', '2', '0', '0', '12', '1', '0', '0', '22', '0', '0', '1', '1492498406', '1492498406', '1');
INSERT INTO `logistics_document` VALUES ('22', '2', '', '我要推荐货车3', '13333333333', '', '5', '0', '0', '130000', '131000', '131081', '0', '0', '0', '河北省秦皇岛市海港区河北大街西段512号', '0', '0', '2', '2', '0', '0', '12', '1', '0', '0', '130', '0', '0', '2', '1493199238', '1493199238', '1');
INSERT INTO `logistics_document` VALUES ('23', '2', '', '我要推荐货车2', '13333333333', '', '6', '42', '47', '130000', '131000', '131003', '0', '0', '0', '阿斯蒂芬立刻机未遂', '0', '0', '2', '2', '0', '0', '12', '1', '0', '0', '49', '0', '0', '2', '1493199230', '1493199230', '1');
INSERT INTO `logistics_document` VALUES ('24', '2', '', '我要推荐货车1', '13333333333', '', '6', '42', '0', '130000', '131000', '131003', '0', '0', '0', '阿斯蒂芬立刻机未遂', '0', '0', '2', '2', '0', '0', '12', '1', '0', '0', '3', '0', '0', '2', '1493199213', '1493199213', '1');
INSERT INTO `logistics_document` VALUES ('25', '2', '', '【金力快运（原旺发）】丽水至江苏、北京、天津、丽水地区专线', '13345678907', '', '6', '0', '0', '330000', '331100', '331102', '0', '0', '0', '丽水市莲都区南环西路18号城南停车场内', '0', '0', '2', '2', '0', '0', '20', '1', '0', '0', '9', '0', '0', '0', '1493199395', '1493199395', '1');
INSERT INTO `logistics_document` VALUES ('26', '2', '', '123嘻嘻嘻', '1856664432', '', '6', '42', '0', '130000', '130100', '130102', '0', '0', '0', '123', '0', '0', '2', '2', '0', '0', '17', '1', '0', '0', '3', '0', '0', '0', '1493199377', '1493199377', '1');
INSERT INTO `logistics_document` VALUES ('36', '17', '', '【中唐物流】承接苏州至全国各地整车、零担运输业务', '13333333333', '', '6', '43', '0', '130000', '131000', '131003', '0', '0', '0', '苏州市姑苏区金筑街588号传化公路港A361室', '0', '0', '2', '2', '0', '0', '27', '1', '0', '0', '33', '0', '0', '0', '1493342576', '1493342576', '1');
INSERT INTO `logistics_document` VALUES ('38', '10', '', '阿斯蒂芬', '13333333333', '', '6', '42', '47', '130000', '131000', '131023', '0', '0', '0', '106国道105公里处文安县史各庄新桥北', '0', '0', '2', '2', '0', '0', '30', '1', '0', '0', '6', '0', '0', '0', '1493109394', '1493199349', '1');
INSERT INTO `logistics_document` VALUES ('39', '17', '', '北京到上海', '13545666565', '任丘、衡水、洛阳', '2', '0', '0', '130000', '131000', '131026', '0', '0', '0', '发鬼地方个', '0', '0', '2', '2', '0', '0', '35', '1', '0', '0', '3', '0', '0', '0', '1494139694', '1494139694', '1');
INSERT INTO `logistics_document` VALUES ('40', '17', '', '一', '13456781234', '', '3', '0', '0', '120000', '120100', '120102', '0', '0', '0', '机构和脚后跟', '0', '0', '2', '2', '0', '0', '36', '1', '0', '0', '0', '0', '0', '0', '1493634776', '1493634776', '0');
INSERT INTO `logistics_document` VALUES ('41', '6', '', '吕梁文水到天津宝坻有货12-13吨 需6.8米车', '13689065432', '', '7', '0', '0', '140000', '141100', '141121', '120000', '120100', '120115', '吕梁文水', '0', '0', '2', '2', '0', '0', '41', '1', '0', '0', '2', '0', '0', '0', '1493725548', '1493725548', '1');
INSERT INTO `logistics_document` VALUES ('42', '6', '', '吕梁文水到天津河西有货10-13吨 需6.8米车', '13765478903', '', '7', '0', '0', '140000', '141100', '141121', '120000', '120100', '120103', '吕梁文水到天津宝', '0', '0', '2', '2', '0', '0', '42', '1', '0', '0', '0', '0', '0', '0', '1493725682', '1493725682', '1');
INSERT INTO `logistics_document` VALUES ('43', '6', '', '吕梁文水到天津河东有货', '13323433432', '', '7', '0', '0', '140000', '141100', '141121', '120000', '120100', '120102', '吕梁文水到天津', '0', '0', '2', '2', '0', '0', '43', '1', '0', '0', '0', '0', '0', '0', '1493725745', '1493725745', '1');
INSERT INTO `logistics_document` VALUES ('44', '6', '', '吕梁文水到天津北辰有货', '18656543456', '', '7', '0', '0', '140000', '141100', '141121', '120000', '120100', '120113', '吕梁文水到天津', '0', '0', '2', '2', '0', '0', '43', '1', '0', '0', '1', '0', '0', '0', '1493725807', '1493725807', '1');
INSERT INTO `logistics_document` VALUES ('45', '6', '', '吕梁文水到天津西青有货', '13302163266', '', '7', '0', '0', '140000', '141100', '141121', '120000', '120100', '120111', '天津市西青区张家窝镇枫雅道', '0', '0', '2', '2', '0', '0', '42', '1', '0', '0', '44', '0', '0', '0', '1493729137', '1493729137', '1');

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
INSERT INTO `logistics_document_article` VALUES ('8', '0', '1231233', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('11', '0', '123', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('12', '0', '23s', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('13', '0', '123123', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('32', '0', '23123', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('35', '0', '123<img src=\"/Uploads/Editor/2017-04-19/58f71e5acd21a.jpg\" alt=\"\" />', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('15', '0', '2', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('16', '0', '23', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('17', '0', '1123234234', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('18', '0', '1123234234', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('19', '0', '1', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('20', '0', '<img src=\"/Uploads/Editor/2017-04-19/58f6f2d0559d3.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-04-19/58f6f2e32a6b8.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-04-19/58f6f2da177e8.jpg\" alt=\"\" />', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('21', '0', '1', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('22', '0', '123阿斯蒂芬', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('23', '0', '123阿斯蒂芬', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('24', '0', '123阿斯蒂芬', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('25', '0', '<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <strong>丽水市金力快运有限公司（原旺发）</strong> \r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	承接全国各地整车货物，丽水地区中转分流，仓储配送业务\r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <strong><span style=\"color:#E53333;\">丽水地区分流：</span></strong> \r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	龙泉、庆元、云和、景宁、松阳<br />\r\n遂昌、青田、温溪、缙云、壶镇<br />\r\n电话：0578-2666288\r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	电话：0578-2951133<br />\r\n手机：18157838889<br />\r\n联系人：程经理\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <strong>丽水公司地址：</strong> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	丽水市城南停车场内(客运西站斜对面)\r\n	</p>\r\n<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">传真：0578-2690978</span><br />\r\n<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">手机：15305789996</span><br />\r\n<strong><span style=\"color:#E53333;\">丽水至江苏专线&nbsp;</span></strong><br />\r\n<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">热线：153&nbsp;7227&nbsp;9333&nbsp;&nbsp;&nbsp;133&nbsp;0578&nbsp;0799</span><br />\r\n<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">联系人：王经理</span><br />\r\n<strong><span style=\"color:#E53333;\">丽水至北京、天津专线&nbsp;</span></strong><br />\r\n<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">热线：138&nbsp;1424&nbsp;8666</span><br />\r\n<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">联系人：金经理</span><br />\r\n<strong>无锡卸货地址:</strong><span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"></span> <p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <span style=\"line-height:1.5;\">无锡市锡港路和通沙路口金阳停车场东侧</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	电话：&nbsp;0510-82350672<br />\r\n手机：186&nbsp;5101&nbsp;5566\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://lishui.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20150707/20150707113031_31470.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://lishui.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20150707/20150707101621_38100.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://lishui.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20150707/20150707101631_93243.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://lishui.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20150707/20150707101639_21813.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://lishui.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20150707/20150707101659_82622.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<div>\r\n	<br />\r\n</div>', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('26', '0', '123123', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('36', '0', '<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <strong>苏州中唐物流有限公司</strong> \r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <span style=\"line-height:1.5;\">承</span><span style=\"line-height:1.5;\">接苏州至全国各地整车、零担运输业</span><span style=\"line-height:1.5;\">务</span> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	南京、徐州、宿迁、盐城、连云港、淮安、扬州、南通、合肥、芜湖、杭州、宁波、温州、福州、厦门、南昌、九江、长沙、广州、深圳、东莞、桂林、柳州、武汉、贵阳、昆明、成都、重庆、青岛、济南、烟台、石家庄、郑州、西安、太原、呼和浩特、北京、天津、沈阳、大连、长春、哈尔滨\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <strong>总经理：唐长水</strong> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	手机：18915515786\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	苏州公司地址：\r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	苏州市姑苏区金筑街588号传化公路港A361室\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	电话：0512-86880779\r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	传真：0512-65565786\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	邮箱：54446169@qq.com\r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">\r\n	网址：http://www.zhongtang56.com\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415162906_14056.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415162925_79678.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415162933_58260.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415162941_73728.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415162956_62476.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163004_35361.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163011_15545.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163020_33994.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163028_57628.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163036_47880.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163044_24817.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163052_38097.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"><br />\r\n	</p>\r\n<p style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\"> <img src=\"http://www.chawuliu.com/resource/kindeditor-4.1.10/attached/image/20160415/20160415163059_38100.jpg_water.jpg\" alt=\"\" /> \r\n</p>\r\n<div>\r\n	<br />\r\n</div>', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('37', '0', '苏打粉', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('38', '0', '123', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('39', '0', '就会更好vnbvnb11', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('40', '0', '45', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('41', '0', '吕梁文水到天津宝坻有货', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('42', '0', '吕梁文水到天津河西有货', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('43', '0', '吕梁文水到天津', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('44', '0', '吕梁文水到天津', '', '0', null);
INSERT INTO `logistics_document_article` VALUES ('45', '0', '天津市西青区张家窝镇万科四季雅园 货到付款', '', '0', null);

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
INSERT INTO `logistics_jpzx` VALUES ('1', '8', '120100');
INSERT INTO `logistics_jpzx` VALUES ('1', '24', '120100');
INSERT INTO `logistics_jpzx` VALUES ('1', '25', '120100');
INSERT INTO `logistics_jpzx` VALUES ('1', '32', '120100');
INSERT INTO `logistics_jpzx` VALUES ('35', '11', '131000');
INSERT INTO `logistics_jpzx` VALUES ('35', '27', '131000');
INSERT INTO `logistics_jpzx` VALUES ('35', '29', '131000');
INSERT INTO `logistics_jpzx` VALUES ('35', '32', '131000');
INSERT INTO `logistics_jpzx` VALUES ('24', '14', '131000');
INSERT INTO `logistics_jpzx` VALUES ('24', '24', '131000');
INSERT INTO `logistics_jpzx` VALUES ('24', '26', '131000');
INSERT INTO `logistics_jpzx` VALUES ('24', '27', '131000');
INSERT INTO `logistics_jpzx` VALUES ('24', '29', '131000');
INSERT INTO `logistics_jpzx` VALUES ('24', '40', '131000');
INSERT INTO `logistics_jpzx` VALUES ('23', '19', '131000');
INSERT INTO `logistics_jpzx` VALUES ('23', '32', '131000');
INSERT INTO `logistics_jpzx` VALUES ('22', '20', '131000');
INSERT INTO `logistics_jpzx` VALUES ('22', '30', '131000');
INSERT INTO `logistics_jpzx` VALUES ('12', '19', '130100');
INSERT INTO `logistics_jpzx` VALUES ('12', '25', '130100');
INSERT INTO `logistics_jpzx` VALUES ('20', '17', '130200');
INSERT INTO `logistics_jpzx` VALUES ('20', '32', '130200');
INSERT INTO `logistics_jpzx` VALUES ('19', '13', '130400');
INSERT INTO `logistics_jpzx` VALUES ('19', '20', '130400');
INSERT INTO `logistics_jpzx` VALUES ('19', '28', '130400');
INSERT INTO `logistics_jpzx` VALUES ('36', '18', '131000');
INSERT INTO `logistics_jpzx` VALUES ('36', '25', '131000');
INSERT INTO `logistics_jpzx` VALUES ('26', '17', '130100');
INSERT INTO `logistics_jpzx` VALUES ('26', '40', '130100');
INSERT INTO `logistics_jpzx` VALUES ('26', '41', '130100');
INSERT INTO `logistics_jpzx` VALUES ('25', '12', '331100');
INSERT INTO `logistics_jpzx` VALUES ('25', '20', '331100');
INSERT INTO `logistics_jpzx` VALUES ('3', '11', '130300');
INSERT INTO `logistics_jpzx` VALUES ('3', '25', '130300');
INSERT INTO `logistics_jpzx` VALUES ('3', '40', '130300');
INSERT INTO `logistics_jpzx` VALUES ('39', '11', '131000');

-- ----------------------------
-- Table structure for logistics_member
-- ----------------------------
DROP TABLE IF EXISTS `logistics_member`;
CREATE TABLE `logistics_member` (
  `uid` int(10) unsigned NOT NULL auto_increment COMMENT '用户ID',
  `nickname` char(16) NOT NULL default '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL default '0' COMMENT '性别',
  `id_card` varchar(100) NOT NULL default '' COMMENT '身份证',
  `contact` char(10) NOT NULL default '' COMMENT '联系人',
  `wechat` varchar(50) NOT NULL default '' COMMENT '微信号',
  `telephone` char(11) NOT NULL default '' COMMENT '手机号',
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
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of logistics_member
-- ----------------------------
INSERT INTO `logistics_member` VALUES ('1', 'shexie303', '0', '131128198911296612', '', '', '', '/Uploads/Picture/facade/2017-04-01/58df1a91bef87.jpg', '', '/Uploads/Picture/license/2017-04-01/58df1b8d7882c.jpg', '1', '1491494400', '1499356800', '120', '121', '0', '1490319959', '2130706433', '1494139099', '1');
INSERT INTO `logistics_member` VALUES ('2', 'shexie33', '0', '', '', '', '', '', '', '', '3', '1492617600', '1503158400', '130', '60', '2130706433', '1490321384', '2130706433', '1493726690', '1');
INSERT INTO `logistics_member` VALUES ('3', 'shexie44', '0', '', '', '', '', '', '', '', '3', '1492617600', '1503158400', '20', '13', '2130706433', '1490582865', '2130706433', '1492312574', '1');
INSERT INTO `logistics_member` VALUES ('4', 'shexie55', '0', '', '', '', '', '', '', '', '3', '1492617600', '1524153600', '20', '2', '0', '0', '2130706433', '1491039189', '1');
INSERT INTO `logistics_member` VALUES ('5', 'shexie66', '0', '131128198911296613', '123456', '1333333333', '13333333333', '', '', '', '3', '1492617600', '1495209600', '50', '35', '0', '0', '2130706433', '1493736606', '1');
INSERT INTO `logistics_member` VALUES ('6', 'shexie67', '0', '/Uploads/Picture/id_card/2017-05-02/59087022ca5f4.JPG', '塔克拉玛干', '213', '13334566543', '', '/Uploads/Picture/driver_license/2017-05-02/59087028c39e9.JPG', '/Uploads/Picture/license/2017-05-02/5908702ed680d.JPG', '0', '0', '0', '60', '3', '0', '0', '2130706433', '1493726325', '1');
INSERT INTO `logistics_member` VALUES ('7', 'shexie77', '0', '', '', '', '', '', '', '', '3', '1492617600', '1508428800', '30', '4', '2130706433', '1490608386', '2130706433', '1493733004', '1');
INSERT INTO `logistics_member` VALUES ('9', 'shexie99', '0', '', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490670123', '2130706433', '1490670123', '1');
INSERT INTO `logistics_member` VALUES ('10', 'shexie98', '0', '', '', '', '', '', '', '', '0', '0', '0', '10', '2', '2130706433', '1490670236', '2130706433', '1490670317', '1');
INSERT INTO `logistics_member` VALUES ('11', 'shexie97', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670500', '0', '0', '-1');
INSERT INTO `logistics_member` VALUES ('12', 'shexie96', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670715', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('13', 'shexie95', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1490670829', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('14', 'shexie94', '0', '', '', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490671091', '2130706433', '1490672004', '-1');
INSERT INTO `logistics_member` VALUES ('15', 'shexie93', '0', '', '789', '', '', '', '', '', '0', '0', '0', '10', '1', '2130706433', '1490671422', '2130706433', '1490671452', '0');
INSERT INTO `logistics_member` VALUES ('16', '李二蛋', '0', '/Uploads/Picture/license/2017-04-15/58f1cea124349.png', '李二蛋', '13333333333', '13333333333', '', '', '/Uploads/Picture/driver_license/2017-04-15/58f1ce9a03259.png', '0', '0', '0', '40', '11', '0', '0', '2130706433', '1493733170', '1');
INSERT INTO `logistics_member` VALUES ('17', '二蛋', '0', '131111111111111111', '12314563xx', '123sdf', '13302134562', '', '/Uploads/Picture/driver_license/2017-04-15/58f1ce9a03259.png', '/Uploads/Picture/license/2017-04-15/58f1cea124349.png', '2', '1492099200', '1499961600', '100', '35', '0', '0', '2130706433', '1494135243', '1');
INSERT INTO `logistics_member` VALUES ('23', 'shexie777', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `logistics_member` VALUES ('24', 'shexie667', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '2130706433', '1493651097', '0', '0', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_pay_log
-- ----------------------------
INSERT INTO `logistics_pay_log` VALUES ('2', '66837239298008686269686760860866', '0', '0', '17', '3', '1491790908');
INSERT INTO `logistics_pay_log` VALUES ('3', '34066882868400566959625989462140', '0', '0', '17', '3', '1492153845');
INSERT INTO `logistics_pay_log` VALUES ('4', '71442825005285565650320555628856', '0', '0', '17', '3', '1492154901');
INSERT INTO `logistics_pay_log` VALUES ('5', '81666404688891784149006447126668', '0', '0', '17', '3', '1492156390');
INSERT INTO `logistics_pay_log` VALUES ('6', '68220086645782796897882859846532', '1', '300', '7', '6', '1492666864');
INSERT INTO `logistics_pay_log` VALUES ('7', '68398048945864549546312106926606', '1', '100', '5', '1', '1492666905');
INSERT INTO `logistics_pay_log` VALUES ('8', '85546214685843760628555148674656', '1', '10', '4', '1', '1492667016');
INSERT INTO `logistics_pay_log` VALUES ('9', '84955395181587048622212346623864', '1', '290', '3', '4', '1492667075');
INSERT INTO `logistics_pay_log` VALUES ('10', '93563686262037646209262422845686', '1', '120', '2', '4', '1492667129');
INSERT INTO `logistics_pay_log` VALUES ('11', '30390226222242024268625216047004', '1', '588', '4', '12', '1492667173');

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_picture
-- ----------------------------
INSERT INTO `logistics_picture` VALUES ('38', '/Uploads/Picture/id_card/2017-05-02/59087022ca5f4.JPG', '', '912fc7e29ddcd92ec056abd74626268d', '61b78bb52a1d39ca69b08e4696b6d5bab48c9388', '1', '1493725218');
INSERT INTO `logistics_picture` VALUES ('39', '/Uploads/Picture/driver_license/2017-05-02/59087028c39e9.JPG', '', '8248396b5e60dd3e357153961018d046', '7d5ceed5d23460217c65e4332513e426d3c7f11c', '1', '1493725224');
INSERT INTO `logistics_picture` VALUES ('40', '/Uploads/Picture/license/2017-05-02/5908702ed680d.JPG', '', '4f73a195691463246051825cace0dfea', 'd2d8458904910d90df71feacccfd959b41ac5b5b', '1', '1493725230');
INSERT INTO `logistics_picture` VALUES ('41', '/Uploads/Picture/cover/2017-05-02/59087151928a9.JPG', '', 'd835cf173812908604a6aa1806b6a96d', 'a407c67048ed1652ff7ec74f72a35c0ba00d717e', '1', '1493725521');
INSERT INTO `logistics_picture` VALUES ('42', '/Uploads/Picture/cover/2017-05-02/590871dd46daf.png', '', '45e71d09946ad8edb9af61b0b031321f', 'baa8ce18c646b04af1dbedc51b32921adc0bfdbb', '1', '1493725661');
INSERT INTO `logistics_picture` VALUES ('43', '/Uploads/Picture/cover/2017-05-02/5908722263e58.png', '', '94d635367e8c3804e3e32a94db5aca7d', 'a36089c42df45cf664bb074276b2c53e38b69869', '1', '1493725730');
INSERT INTO `logistics_picture` VALUES ('44', '/Uploads/Picture/ad_img/2017-05-07/590eb8a85e3af.jpg', '', '5aa2d69a142735e5b5353f6373a90cfe', '8c0a41243a9baa915d8ddd846d638f6c34be0ad8', '1', '1494137000');
INSERT INTO `logistics_picture` VALUES ('45', '/Uploads/Picture/ad_img/2017-05-07/590eb967f1443.png', '', '687d42a54384b72f9fe38523ad78e2f0', '1bb153edaf1a11612417d4604f29a9da5489509b', '1', '1494137191');
INSERT INTO `logistics_picture` VALUES ('46', '/Uploads/Picture/ad_img/2017-05-07/590ebd145c887.png', '', 'd6432a28701f4e352b2d19b6c29c7216', '21e3da8bbe648fbf1ed71e12285ce6e629a5cb15', '1', '1494138132');
INSERT INTO `logistics_picture` VALUES ('47', '/Uploads/Picture/ad_img/2017-05-07/590ebd27f1fa0.png', '', '1a7c7c150c7570309d9abec0e780aeb5', '0a27cb848dcffc70a4d09ad68a44b88f62b74655', '1', '1494138151');

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of logistics_ucenter_member
-- ----------------------------
INSERT INTO `logistics_ucenter_member` VALUES ('1', 'shexie303', '74512fad441da1d65478e0698d82386a', 'lc@qq.com', '', '1490319959', '2130706433', '1494139099', '2130706433', '1490319959', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('2', 'shexie33', '74512fad441da1d65478e0698d82386a', 'lc_php@126.com', '', '1492595010', '2130706433', '1493726690', '2130706433', '1492595010', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('3', 'shexie44', '74512fad441da1d65478e0698d82386a', 'asd@qq.com', '', '1490582797', '2130706433', '1492312574', '2130706433', '1490582797', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('4', 'shexie55', '74512fad441da1d65478e0698d82386a', '112@126.com', '', '1490604355', '2130706433', '1491039189', '2130706433', '1490604355', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('5', 'shexie66', '74512fad441da1d65478e0698d82386a', '123@qq.com', '', '1490605123', '2130706433', '1493736606', '2130706433', '1490605123', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('6', 'shexie67', '74512fad441da1d65478e0698d82386a', '1234@qq.com', '', '1490605165', '2130706433', '1493726325', '2130706433', '1490605165', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('7', 'shexie77', '74512fad441da1d65478e0698d82386a', 'sadfwer@126.com', '', '1490607882', '2130706433', '1493733004', '2130706433', '1490607882', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('8', 'shexie88', '74512fad441da1d65478e0698d82386a', 'lewis@126.com', '', '1490608463', '2130706433', '1490608482', '2130706433', '1490608463', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('9', 'shexie99', '74512fad441da1d65478e0698d82386a', 'asdf2@126.com', '', '1490669878', '2130706433', '1490670123', '2130706433', '1490669878', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('10', 'shexie98', '74512fad441da1d65478e0698d82386a', 'asdf22@126.com', '', '1490669942', '2130706433', '1490670317', '2130706433', '1490669942', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('11', 'shexie97', '74512fad441da1d65478e0698d82386a', 'adsf234@126.com', '', '1490670500', '2130706433', '0', '0', '1490670500', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('12', 'shexie96', 'b5a62f0af732f0d6d01c497d71940fb0', 'AD@126.com', '', '1490670715', '2130706433', '0', '0', '1490670715', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('13', 'shexie95', '74512fad441da1d65478e0698d82386a', 'ADd@126.com', '', '1490670829', '2130706433', '0', '0', '1490670829', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('14', 'shexie94', '74512fad441da1d65478e0698d82386a', 'asdfasd@126.com', '', '1490671091', '2130706433', '1490672004', '2130706433', '1490671091', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('15', 'shexie93', '74512fad441da1d65478e0698d82386a', 'df234@126.com', '', '1490671422', '2130706433', '1490671452', '2130706433', '1490671422', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('16', '李二蛋', '74512fad441da1d65478e0698d82386a', '123@22.com', '', '1490949511', '2130706433', '1493733170', '2130706433', '1490949511', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('17', '二蛋', '74512fad441da1d65478e0698d82386a', '123@123.com', '', '1491792443', '2130706433', '1494135243', '2130706433', '1491792443', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('23', 'shexie777', '74512fad441da1d65478e0698d82386a', '', '', '1493536930', '2130706433', '0', '0', '1493536930', '1');
INSERT INTO `logistics_ucenter_member` VALUES ('24', 'shexie667', '74512fad441da1d65478e0698d82386a', '', '', '1493651097', '2130706433', '0', '0', '1493651097', '1');

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
