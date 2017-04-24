<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 切换城市
 */
class CityController extends HomeController {

	public function index(){
        $pca_p = getNextPca(0);
        $all = $zhixia = array();
        foreach($pca_p as $p){
            $p['child'] = getNextPca($p['id'], 2);
            if(in_array($p['id'], array(110000, 120000, 310000, 500000))){
                $zhixia[] = $p;
            }else{
                $all[] = $p;
            }
        }
        //unset($pca_p[110000],$pca_p[120000],$pca_p[310000],$pca_p[500000]);
        $this->assign('zhixia', $zhixia);
        $this->assign('pca_p', $all);
        $this->display();
	}
}
