<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台热门城市控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class CityController extends AdminController {

    /**
     * 热门城市列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function hot(){
        /* 获取热门城市列表 */
        $map  = array('hot' => 1);
        $list = M('Pca')->where($map)->order('id asc')->select();

        $this->assign('list', $list);
        $this->meta_title = '热门城市管理';
        $this->display();
    }

    /**
     * 添加热门城市
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function hotAdd(){
        if(IS_POST){
            $city_name = I('city_name', '');
            if(!$city_name){
                $this->error('请填写城市名称');
            }
            $map['type'] = 2;
            $map['name'] = array('like', '%'.$city_name.'%');

            $city = M('Pca')->where($map)->find();
            if($city){
                if($city['hot']){
                    $this->error('该城市已经是热门城市，请添加其他城市');
                }

                if(false !== M('Pca')->where(array('id'=>$city['id']))->save(array('hot'=>1))){
                    $this->success('新增成功', U('hot'));
                } else {
                    $this->error('新增失败,请稍后再试');
                }
            } else {
                $this->error('没有【'.$city_name.'】这个城市');
            }
        } else {
            $this->meta_title = '新增热门城市';
            $this->display('edit');
        }
    }
    

    /**
     * 删除热门城市
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function hotDel(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(false !== M('Pca')->where($map)->save(array('hot'=>0))){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }

}
