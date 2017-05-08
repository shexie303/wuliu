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

        $http_host = $_SERVER['HTTP_HOST'];
        if($http_host == C('WWW_DOMAIN')){
            $city = cookie('city');
            if($city){
                $redirect = 'http://' . $city['pinyin'] . '.' . C('DOMAIN') . $_SERVER['REQUEST_URI'];
                send_http_status(302);
                header('Location: ' . $redirect);
            }else{
                $redirect = 'http://' . C('DEFAULT_CITY') . '.' . C('DOMAIN');
                send_http_status(302);
                header('Location: ' . $redirect);
            }
        }else{
            $city = cookie('city');
            $host_arr = explode('.', $http_host);
            if($host_arr[0] != $city['pinyin']){
                $city_arr = all_city();
                if(array_key_exists($host_arr[0], $city_arr)){
                    $city = $city_arr[$host_arr[0]];
                }else{
                    $redirect = 'http://' . C('DEFAULT_CITY') . '.' . C('DOMAIN');
                    send_http_status(302);
                    header('Location: ' . $redirect);
                }
                cookie('city', $city, 604800); //3600*24*7
            }
        }
        $this->city = $city;
        $this->assign('city_info', $city);

        //主导航
        $nav = getNextCategory(0);
        $this->assign('main_nav', $nav);
        //模块名 方法名
        $this->assign('CONTROLLER_NAME', CONTROLLER_NAME);
        $this->assign('ACTION_NAME', ACTION_NAME);

        //用户信息
        $user_info = session('user_auth');
        if($user_info){
            $this->assign('user_info', $user_info);
        }
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
