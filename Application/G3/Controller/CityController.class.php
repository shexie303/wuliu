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
 * 切换城市
 */
class CityController extends Controller {

	public function index(){
        $pca_p = getNextPca(0);
        $all = array();
        foreach($pca_p as $p){
            if(!in_array($p['id'], array(110000, 120000, 310000, 500000))){
                $p['child'] = getNextPca($p['id'], 2);
                $all[] = $p;
            }
        }
        $this->assign('pca_p', $all);

        $hot_city = getHotCity();
        $this->assign('hot_city', $hot_city);

        $all_city = all_city();
        $zhixia = array($all_city['beijing'],$all_city['tianjin'],$all_city['shanghai'],$all_city['chongqing']);
        $this->assign('zhixia', $zhixia);

        $this->display();
	}

    public function check_city(){
        $res = array(
            'status' => 1,
            'data' => ''
        );
        if(IS_POST){
            $city = I('city','');
            $data = M('Pca')->where(array('type'=>2,'full_name'=>$city))->select();
            if($data){
                $res['data'] = $data;
                $this->ajaxReturn($res, 'json');
            }else{
                $res['res'] = 0;
                $this->ajaxReturn($res,'json');
            }
        }
    }
}
