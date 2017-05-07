<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 导航模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class AdModel extends Model {
    protected $_validate = array(
        array('ad_title', 'require', '广告位名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('position', '/^[1-7]{1}$/', '请选择广告位位置', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('ad_img', 'require', '图片不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('sort', '/^[0-9]{1,9}$/', '请输入优先级', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
        array('ad_url', 'url', 'url格式不正确', self::VALUE_VALIDATE , 'regex', self::MODEL_BOTH),
    );

    protected $_auto = array(
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
        array('status', '1', self::MODEL_INSERT),
    );

}
