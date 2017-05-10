<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace G3\Controller;
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
        //
        $city = I('city', '');
        $c_city = cookie('city');
        if($_SERVER['REQUEST_URI'] == '/'){
            if($c_city){
                $this->city = $c_city;
            }else{
                send_http_status(302);
                header('Location: ' . logistics_url(2,'city'));
            }
        }else{
            if($city == $c_city['pinyin'] && $c_city){
                $this->city = $c_city;
            }else{
                if($city){
                    $city_arr = all_city();
                    if(array_key_exists($city, $city_arr)){
                        $this->city = $city_arr[$city];
                        cookie('city', $this->city, 604800); //3600*24*7
                    }else{
                        send_http_status(302);
                        header('Location: ' . logistics_url(2,'city'));
                    }
                }elseif($c_city){
                    $this->city = $c_city;
                }
            }
        }
        //主导航
        $nav = getNextCategory(0);
        unset($nav[6],$nav[7]);
        $this->assign('main_nav', $nav);

        //模块名 方法名
        $this->assign('CONTROLLER_NAME', CONTROLLER_NAME);
        $this->assign('ACTION_NAME', ACTION_NAME);

        $this->assign('CITY', $this->city);

        if(is_login()){
            $user = session('user_auth');
            $user['vip_zh'] = vipZh($user['vip']);
            $this->assign('user', $user);
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
