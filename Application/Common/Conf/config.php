<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /*域名*/
    'DOMAIN'      => 'yuanteng56.com',
    'SITE_DOMAIN' => 'http://www.yuanteng56.com',
    'WWW_DOMAIN'  => 'www.yuanteng56.com',
    'SITE_G3_DOMAIN'  => 'http://m.yuanteng56.com',
    'G3_DOMAIN'   => 'm.yuanteng56.com',

    //默认城市
    'DEFAULT_CITY' => 'langfang',

    //cookie 有效域名
    'COOKIE_DOMAIN'  => 'yuanteng56.com',

    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE'     => 'Home',
    'MODULE_DENY_LIST'   => array('Common', 'User'),
    'MODULE_ALLOW_LIST'  => array('Home','Admin','G3'),
    'APP_SUB_DOMAIN_DEPLOY'   =>    1, // 开启子域名
    'APP_SUB_DOMAIN_RULES'  => array(
        'm'         => 'G3',                //指向3G模块
        //'nxgsm'     => 'Admin',         // 指向Xiaoguotu模块的控制器
        //'jiaju'      => 'News',         // 指向Home模块的News控制器
        //'*'         => array('Home','city_pinyin=*'), // 二级泛域名指向Home模块
    ),
    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'NEIn$Kgm",]u?<VHC`%vJ1WQ)q/28OGkB7+hU:6&', //默认数据加密KEY

    /* 调试配置 */
    'SHOW_PAGE_TRACE' => false,

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 3, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数

    /* 数据库配置 */
    'DB_TYPE'   => 'mysqli', // 数据库类型
    'DB_HOST'   => '127.0.0.1', // 服务器地址
    'DB_NAME'   => 'logistics', // 数据库名
    'DB_USER'   => 'root', // 用户名
    'DB_PWD'    => 'root',  // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'logistics_', // 数据库表前缀

    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),
    /*vip会员一年价钱 2-推荐 3-vip*/
    'MEMBER_VIP_MONEY' => array('2' => 388,'3' => 588)
);
