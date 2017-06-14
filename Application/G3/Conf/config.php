<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.thinkphp.cn>
// +----------------------------------------------------------------------

/**
 * 前台配置文件
 * 所有除开系统级别的前台配置
 */
return array(
    // 预先加载的标签库
    'TAGLIB_PRE_LOAD'     =>    'OT\\TagLib\\Article,OT\\TagLib\\Think',
        
    /* 主题设置 */
    'DEFAULT_THEME' =>  'default',  // 默认模板主题名称

    /* 数据缓存设置 */
    'DATA_CACHE_PREFIX' => 'wuliu_', // 缓存前缀
    'DATA_CACHE_TYPE'   => 'File', // 数据缓存类型

    /* 文件上传相关配置 */
    'DOWNLOAD_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Download/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //下载模型上传配置（文件上传类配置）

    /* 编辑器图片上传相关配置 */
    'EDITOR_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 2*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Editor/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ),

    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
        '__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/images',
        '__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/css',
        '__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/js',
    ),

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'wuliu_admin', //session前缀
    'COOKIE_PREFIX'  => 'wuliu_home_', // Cookie前缀 避免冲突

    /**
     * 附件相关配置
     * 附件是规划在插件中的，所以附件的配置暂时写到这里
     * 后期会移动到数据库进行管理
     */
    'ATTACHMENT_DEFAULT' => array(
        'is_upload'     => true,
        'allow_type'    => '0,1,2', //允许的附件类型 (0-目录，1-外链，2-文件)
        'driver'        => 'Local', //上传驱动
        'driver_config' => null, //驱动配置
    ), //附件默认配置

    'ATTACHMENT_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Attachment/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //附件上传配置（文件上传类配置）

    'URL_ROUTER_ON'         =>  true,   // 是否开启URL路由
    'URL_ROUTE_RULES'       =>  array( // 默认路由规则 针对模块
        /*列表页开始*/

        /*列表页精品专线二三级分类开始*/
        '/^([a-z]+)\/list-(2)-([0-9]{1,2})-([0-9]{6})-p([0-9]+)-([1-3]{1})$/' => 'Index/index?city=:1&category=:2&zx=:3&l_area=:4&p=:5&order=:6',
        '/^([a-z]+)\/list-(2)-([0-9]{1,2})-([0-9]{6})-p([0-9]+)$/' => 'Index/index?city=:1&category=:2&zx=:3&l_area=:4&p=:5',
        '/^([a-z]+)\/list-(2)-([0-9]{1,2})-([0-9]{6})$/' => 'Index/index?city=:1&category=:2&zx=:3&l_area=:4',
        '/^([a-z]+)\/list-(2)-([0-9]{1,2})-p([0-9]+)-([1-3]{1})$/' => 'Index/index?city=:1&category=:2&zx=:3&p=:4&order=:5',
        '/^([a-z]+)\/list-(2)-([0-9]{1,2})-p([0-9]+)$/' => 'Index/index?city=:1&category=:2&zx=:3&p=:4',
        '/^([a-z]+)\/list-(2)-([0-9]{1,2})$/' => 'Index/index?city=:1&category=:2&zx=:3',
        /*列表页精品专线二三级开始*/

        /*列表页落地配二级分类开始*/
        '/^([a-z]+)\/list-(3)-([0-9]{6})-p([0-9]+)-([1-3]{1})$/' => 'Index/index?city=:1&category=:2&ldp_p=:3&p=:4&order=:5',
        '/^([a-z]+)\/list-(3)-([0-9]{6})-p([0-9]+)$/' => 'Index/index?city=:1&category=:2&ldp_p=:3&p=:4',
        '/^([a-z]+)\/list-(3)-([0-9]{6})$/' => 'Index/index?city=:1&category=:2&ldp_p=:3',
        /*列表页落地配二级开始*/

        /*列表页货源分类开始*/
        '/^([a-z]+)\/list-7(-)?([0-9]{6})?(-)?([0-9]{6})?(-)?([0-9]{6})?(-)?([0-9]{6})?(-)?([0-9]{6})?(-)?([0-9]{6})?(-)?(p([0-9]+))?(-)?([1-3]{1})?$/' => 'Index/index?city=:1&category=7&location_p=:3&location_c=:5&location_a=:7&destination_p=:9&destination_c=:11&destination_a=:13&p=:16&order=:18',
        /*列表页货源开始*/

        /*列表页除2、3、7分类以外的三级分类开始*/
        '/^([a-z]+)\/list-([4-6]){1}-([0-9]+)-([0-9]+)-p([0-9]+)-([1-3]{1})$/' => 'Index/index?city=:1&category=:2&cate_id=:3&c_id=:4&p=:5&order=:6',
        '/^([a-z]+)\/list-([4-6]){1}-([0-9]+)-([0-9]+)-p([0-9]+)$/' => 'Index/index?city=:1&category=:2&cate_id=:3&c_id=:4&p=:5',
        '/^([a-z]+)\/list-([4-6]){1}-([0-9]+)-([0-9]+)$/' => 'Index/index?city=:1&category=:2&cate_id=:3&c_id=:4',
        /*列表页除2、3、7分类以外的三级开始*/

        /*列表页除2、3、7分类以外的二级分类开始*/
        '/^([a-z]+)\/list-([4-6]){1}-([0-9]+)-p([0-9]+)-([1-3]{1})$/' => 'Index/index?city=:1&category=:2&cate_id=:3&p=:4&order=:5',
        '/^([a-z]+)\/list-([4-6]){1}-([0-9]+)-p([0-9]+)$/' => 'Index/index?city=:1&category=:2&cate_id=:3&p=:4',
        '/^([a-z]+)\/list-([4-6]){1}-([0-9]+)$/' => 'Index/index?city=:1&category=:2&cate_id=:3',
        /*列表页除2、3、7分类以外的二级开始*/

        /*列表页一级分类开始*/
        '/^([a-z]+)\/list-([2-7]{1})-p([0-9]+)-([1-3]{1})$/' => 'Index/index?city=:1&category=:2&p=:3&order=:4',
        '/^([a-z]+)\/list-([2-7]{1})-p([0-9]+)$/' => 'Index/index?city=:1&category=:2&p=:3',
        '/^([a-z]+)\/list-([2-7]{1})$/' => 'Index/index?city=:1&city=:1&category=:2',
        /*列表页一级分类结束*/

        /*列表页结束*/

        /*搜索页结束*/
        '/^search-([2-7]{1})-p([0-9]+)$/' => 'Index/search?category=:1&p=:2',
        '/^search-([2-7]{1})$/' => 'Index/search?category=:1',

        /*搜索页结束*/
        '/^wechat-([2-7]{1})$/' => 'City/wechat_jump?category=:1',//微信跳转页

        '/^([a-z]+)\/([0-9]+)$/' => 'Index/detail?city=:1&id=:2', //详情页
        'city' => array('City/index'), //切换城市页
        'gps_city' => array('City/check_city'), //切换城市页
        'login' => array('User/login'), //登录页
        'register' => array('User/register'), //注册页
        'user/account' => array('User/account'), //帐号管理
        'user' => array('User/index'), //个人中心
        'logout' => array('User/logout'), //注册页
        'verify' => array('User/verify'), //验证码
        'getNextArea' => array('Index/getNextArea'), //pca
        'getNextCategory' => array('Index/getNextCategory'), //pca
        'publish' => array('Index/publish'), //发布货源
        'kefu' => array('User/kefu'), //客服
        '/^([a-z]+)$/' => 'Index/index?city=:1', //详情页
    )
);
