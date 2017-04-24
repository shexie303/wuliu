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
 * 文档模型控制器
 * 文档模型列表和详情
 */
class IndexController extends HomeController {

    /* 文档模型频道页 */
	public function index($p = 1){
        /* 分类信息 */
        $category = $this->category();
        /* 获取当前分类列表 */
        $Document = D('Document');
        $list = $Document->page($p, $category['list_row'])->lists($category['id']);
        if(false === $list){
            $this->error('暂无信息！');
        }
        $page = new \Think\LogisticsPage($list['count'], $category['list_row'], "lists/{$category['id']}/");

        /* 模板赋值并渲染模板 */
        $this->assign('category', $category);
        $this->assign('list', $list['data']);
        $this->assign('page', $page->show());
        $this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0){
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('参数错误！');
		}

		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}
		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->display();
	}

	/* 文档分类检测 */
	private function category($category_id = 0){
		/* 标识正确性检测 */
		$id = $category_id ? $category_id : I('get.category', 2);
		if(empty($id)){
			$this->error('分类不存在');
		}

		/* 获取分类信息 */
		$category = getNextCategory(0);
        $category = $category[$id];
		if($category){
            return $category;
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}

}
