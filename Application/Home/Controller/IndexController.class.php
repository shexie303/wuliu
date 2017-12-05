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
            if($zx){
                if($ids = getZdzxJpzxIds($this->city['id'],$zx)){
                    $ext['ids'] = $ids;
                }
            }
            $this->assign('minor', $minor);

            //有地区分类则显示
            $local_area = getNextPca($this->city['id'], 3);
            if($local_area){
                $third['name'] = '所在区域';
                $third['data'] = getZdzxAreaCount($local_area, $this->city['id']);
                $this->assign('third', $third);
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
        }elseif($category['id'] == 6){
            //二级分类数据
            $minor['name'] = '选择分类';
            $cate_data = getNextCategory($category['id'], $this->city['parent_id']);
            $minor['data'] = getCateCount($cate_data, $this->city['id']);
            $this->assign('minor', $minor);

            //二级分类
            $cate_id = I('get.cate_id', 0);
            $this->assign('zx', $cate_id);

            if($cate_id){
                $uri .= $cate_id.'-';
                $ext['cate_id'] = $cate_id;
                //三级分类数据
                $third['name'] = '选择小类';
                $third_data = getNextCategory($cate_id);
                if($third_data){
                    $third['data'] = getCateCount($third_data, $this->city['id'], 'c_id', $cate_id);
                    $this->assign('third', $third);
                }
            }
            //三级分类
            $c_id = I('get.c_id', 0);
            $this->assign('l_area', $c_id);
            if($c_id){
                $uri .= $c_id.'-';
                $ext['c_id'] = $c_id;
            }
            if($category['id'] == 6){
                $ext['l_city'] = $this->city['id'];
            }
        }elseif($category['id'] == 7){
            $province = getNextPca(0);
            $this->assign('province', $province);

            $l_province = I('location_p');
            $l_province = $l_province ? $l_province : '000000';
            $l_city = I('location_c');
            $l_city = $l_city ? $l_city : '000000';
            $l_area = I('location_a');
            $l_area = $l_area ? $l_area : '000000';
            $d_province = I('destination_p');
            $d_province = $d_province ? $d_province : '000000';
            $d_city = I('destination_c');
            $d_city = $d_city ? $d_city : '000000';
            $d_area = I('destination_a');
            $d_area = $d_area ? $d_area : '000000';
            if($l_province > 0){
                $ext['l_province'] = $l_province;
                $this->assign('location_p', $l_province);

                $location_city = getNextPca($l_province, 2);
                $this->assign('location_city', $location_city);

                if($l_city > 0){
                    $ext['l_city'] = $l_city;
                    $this->assign('location_c', $l_city);

                    $location_area = getNextPca($l_city, 3);
                    $this->assign('location_area', $location_area);

                    if($l_area > 0){
                        $ext['l_area'] = $l_area;
                        $this->assign('location_a', $l_area);
                    }
                }
            }

            if($d_province > 0){
                $ext['d_province'] = $d_province;
                $this->assign('destination_p', $d_province);

                $destination_city = getNextPca($d_province, 2);
                $this->assign('destination_city', $destination_city);

                if($d_city > 0){
                    $ext['d_city'] = $d_city;
                    $this->assign('destination_c', $d_city);

                    $destination_area = getNextPca($d_city, 3);
                    $this->assign('destination_area', $destination_area);

                    if($d_area > 0){
                        $ext['d_area'] = $d_area;
                        $this->assign('destination_a', $d_area);
                    }
                }
            }
            $uri .= $l_province .'-'.$l_city .'-'.$l_area .'-'.$d_province .'-'.$d_city .'-'.$d_area .'-';
            //货源联系方式是否显示
            if($this->user){
                $contact_res = hyContactLimit($this->user['uid'], $this->user['vip']);
            }else{
                $contact_res['goto_login'] = 1;
                $contact_res['contact_show'] = 0;
            }
            $this->assign('contact_res', $contact_res);
        }
        $order = I('get.order', 1);
        if(!in_array($order, array(1,2,3))){
            //货源默认排序按照时间倒序
            if($category['id'] == 7){
                $order = 3;
            }else{
                $order = 1;
            }
        }
        $this->assign('order_type', $order);

        if(!$p) $p = 1;
        $order_uri = $uri. 'p'. $p. '-';
        $this->assign('order_uri', $order_uri);

        /* 获取当前分类列表 */
        $Document = D('Document');
        $list = $Document->page($p, $category['list_row'])->lists($category['id'], $ext, $order);

        if($list){
            $page = new \Think\LogisticsPage($list['count'], $category['list_row'], $uri, $order);
            $page->setConfig('theme','%UP_PAGE% %LINK_PAGE% %DOWN_PAGE%');
            /* 模板赋值并渲染模板 */
            $this->assign('list', $list['data']);
            if($list['count'] > $category['list_row']){
                $this->assign('page', $page->show());
            }
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
        $info['url'] = urlencode(logistics_url(2,$this->city['pinyin'].'/'.$info['id']));

        $user_model = new MemberModel();
        $user = $user_model->getUserInfo($info['uid']);

        $info['wechat'] = $user['wechat'];
        $info['company'] = $user['company'];
        $info['vip'] = $user['vip'];
        $info['vip_zh'] = vipZh($user['vip']);

		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');

        //推荐同分类其他数据
        $Document = D('Document');
        $ext['id'] = array('neq', $id);
        if(in_array($category['id'],array(2,6))){
            $ext['l_city'] = $this->city['id'];
        }
        $list = $Document->page(1, 5)->lists($category['id'], $ext, 1);

        //货源联系方式是否显示
        if($this->user){
//            $contact_res = hyContactLimit($this->user['uid'], $this->user['vip']);
//            if($this->user['vip'] == 1) AddHyContactLimit($this->user['uid'], $id);
            $contact_res = array(
                'goto_vip' => 0,
                'contact_show' => 1
            );
        }else{
            $contact_res['goto_login'] = 1;
            $contact_res['contact_show'] = 0;
        }

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('list', $list);
        $this->assign('contact_res', $contact_res);
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
        if(in_array($category['id'],array(2,6))){
            $ext['l_city'] = $this->city['id'];
        }

        $list = $Document->page($p, $category['list_row'])->lists($category['id'], $ext, 1);
        if($list){
            $page = new \Think\LogisticsPage($list['count'], $category['list_row'], $uri);

            /* 模板赋值并渲染模板 */
            $this->assign('list', $list);
            $this->assign('page', $page->show());
        }
        //banner
        $banner = getCateBanner($category['id']);
        $this->assign('banner', $banner);

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

    public function getNextArea(){
        $id = I('id', 0);
        $type = I('type', 0);
        $return = array(
            'status' => 0,
            'data' => '',
            'info' => ''
        );
        if(!$id){
            $return['status'] = 1;
            $return['info'] = '参数错误！';
            $this->ajaxReturn($return);
        }
        if(!in_array($type, array(1,2))){
            $return['status'] = 1;
            $return['info'] = '参数错误！';
            $this->ajaxReturn($return);
        }
        $area = getNextPca($id, $type + 1);
        if($area){
            $return['data'] = $area;
        }else{
            $return['status'] = 1;
            $return['info'] = '暂无下级地区！';
        }
        $this->ajaxReturn($return);
    }
}
