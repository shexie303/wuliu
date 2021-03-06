<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

    protected $city;
    protected $user;

	/* 空操作，用于输出404页面 */
	public function _empty(){
        $this->_404();
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置

        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
        import('Vendor.Mobile_Detect','','.php');
        $is_m = new \Mobile_Detect();
        if($is_m->isMobile()){
            $this->assign('is_m', 1);
        }

        $city = I('city','');
        $cook_city = cookie('city');
        $city_info = '';
        if($city){
            if($city != $cook_city['pinyin']){
                $city_arr = all_city();
                if(array_key_exists($city, $city_arr)){
                    $city_info = $city_arr[$city];
                    cookie('city', $city_info, 604800); //3600*24*7
                }else{
                    $redirect = logistics_url(1,'city');
                    send_http_status(302);
                    header('Location: ' . $redirect);
                }
            }else{
                $city_info = $cook_city;
            }
        }else{
            if($cook_city['pinyin']){
                $city_info = $cook_city;
            }else{
                $redirect = logistics_url(1,'city');
                send_http_status(302);
                header('Location: ' . $redirect);
            }
        }
        $default_city = array(
            'id' => 131000,
            'parent_id' => 130000,
            'type' => 2,
            'full_name' => '廊坊市',
            'pinyin' => 'langfang',
            'hot' => 1
        );
        $this->city = $city_info ? $city_info : $default_city;
        $this->assign('city_info', $city_info);

        //主导航
        $nav = getNextCategory(0);
        $this->assign('main_nav', $nav);
        //模块名 方法名
        $this->assign('CONTROLLER_NAME', CONTROLLER_NAME);
        $this->assign('ACTION_NAME', ACTION_NAME);

        //用户信息
        if(is_login()){
            $user_info = session('user_auth');
            $this->user = $user_info;
            $this->assign('user_info', $user_info);
        }
        //友情链接
        $href = D('Channel')->where(array('status'=>1))->order('sort asc')->select();
        $this->assign('href', $href);
    }

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}
    //404错误定向
    public function _404() {
        send_http_status(404);
        $this->display('Public/404');
        exit();
    }
}
