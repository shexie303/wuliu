<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Admin\Model\MemberModel;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class IndexController extends HomeController {

    /* 文档模型频道页 */
	public function index($p = 1){
        /* 分类信息 */
        $category = $this->category();
        $this->assign('category', $category);
        //分页使用
        $uri = 'list-'.$category['id'].'-';

        $ext = array();
        if($category['id'] == 2){ //精品专线
            $zx = I('get.zx', 0);
            $this->assign('zx', $zx);

            $minor['name'] = '直达线路';
            $city_zdzx = getNextCategory(2, $this->city['parent_id']);
            $minor['data'] = getZdzxCityCount($city_zdzx, $this->city['id']);
            $ext['ids'] = getZdzxJpzxIds($this->city['id'],$zx);
            $this->assign('minor', $minor);

            //有地区分类则显示
            $local_area = getNextPca($this->city['id'], 3);
            if($local_area){
                $local_area = getZdzxAreaCount($local_area, $this->city['id']);
                $this->assign('local_area', $local_area);
            }

            $l_area = I('get.l_area', 0);
            $ext['l_area'] = $l_area;
            $this->assign('l_area', $l_area);

            $zx ? $uri .= $zx.'-' : false;

            if($l_area){
                if($zx == 0) $uri .= '0-';
                $uri .= $l_area.'-';
            }

            $ext['l_city'] = $this->city['id'];

        }elseif($category['id'] == 3){ //落地配
            $minor['name'] = '选择省份';
            $minor['data'] = getLdpCount();
            $this->assign('minor', $minor);

            $ldp_p = I('get.ldp_p', 0);
            $this->assign('zx', $ldp_p);
            if($ldp_p){
                $uri .= $ldp_p.'-';
                $ext['l_province'] = $ldp_p;
            }
        }else{
            $minor['name'] = '选择分类';
            $minor['data'] = getNextCategory($category['id'], $this->city['parent_id']);
            $this->assign('minor', $minor);
            $cate_id = I('get.cate_id', 0);
            $this->assign('zx', $cate_id);
            if($cate_id){
                $uri .= $cate_id.'-';
                $ext['cate_id'] = $cate_id;
            }
        }
        $order = I('get.order', 1);
        if(!in_array($order, array(1,2,3))){
            $order = 1;
        }
        $this->assign('order_type', $order);
        /* 获取当前分类列表 */

        $Document = D('Document');
        $list = $Document->page($p, $category['list_row'])->lists($category['id'], $ext, $order);

        $order_uri = $uri. 'p'. $p. '-';
        $this->assign('order_uri', $order_uri);

        if($list){
            $page = new \Think\LogisticsPage($list['count'], $category['list_row'], $uri);
            $page->setConfig('theme','%UP_PAGE% %LINK_PAGE% %DOWN_PAGE%');
            /* 模板赋值并渲染模板 */
            $this->assign('list', $list['data']);
            $this->assign('page', $page->show());
        }
        //banner
        $banner = getCateBanner($category['id']);
        $this->assign('banner', $banner);

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
        $info['url'] = urlencode(logistics_url(1,$info['id']));

        $user_model = new MemberModel();
        $user = $user_model->getUserInfo($info['uid']);
        $info['vip'] = $user['vip'];
        $info['vip_zh'] = vipZh($user['vip']);

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

    public function search($id = 0, $p = 1, $keywords = ''){
        $category = $this->category($id);
        $this->assign('category', $category);
        $Document = D('Document');
        $ext = array();
        $uri = 'search-'. $category['id']. '-';
        if($keywords){
            $ext['keywords'] = $keywords;
            $this->assign('search_keywords', $keywords);
        }
        $ext['l_city'] = $this->city['id'];
        $list = $Document->page($p, 1)->lists($category['id'], $ext, 1);
        if($list){
            $page = new \Think\LogisticsPage($list['count'], 1, $uri);

            /* 模板赋值并渲染模板 */
            $this->assign('list', $list);
            $this->assign('page', $page->show());
        }
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
