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
 * 后台广告控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class AdController extends AdminController {

    /**
     * 广告列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        /* 获取广告列表 */
        $map  = array('status' => array('gt', -1));
        $list = M('Ad')->where($map)->order('position asc,sort desc,id desc')->select();
        $this->assign('list', $list);

        $cate = getNextCategory(0);
        $this->assign('cate',$cate);

        $this->meta_title = '广告管理';
        $this->display();
    }

    /**
     * 添加广告
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function add(){
        if(IS_POST){
            $Ad = D('Ad');
            $data = $Ad->create();
            if($data){
                $id = $Ad->add();
                if($id){
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($Ad->getError());
            }
        } else {
            $cate = getNextCategory(0);
            $this->assign('cate',$cate);
            $this->assign('info',null);

            $this->meta_title = '新增广告';
            $this->display('edit');
        }
    }

    /**
     * 编辑广告
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function edit($id = 0){
        if(IS_POST){
            $Ad = D('Ad');
            $data = $Ad->create();
            if($data){
                if($Ad->save()){
                    $this->success('编辑成功', U('index'));
                } else {
                    $this->error('编辑失败');
                }

            } else {
                $this->error($Ad->getError());
            }
        } else {
            /* 获取数据 */
            $info = M('Ad')->find($id);

            if(false === $info){
                $this->error('广告位不存在');
            }
            $this->assign('info', $info);

            $cate = getNextCategory(0);
            $this->assign('cate',$cate);

            $this->meta_title = '编辑广告';
            $this->display();
        }
    }

    /**
     * 删除广告
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function del(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('Ad')->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }

}
