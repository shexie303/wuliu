<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace G3\Controller;
use Admin\Model\AuthGroupModel;
use Home\Model\MemberModel;
use User\Api\UserApi;

/**
 * 用户控制器
 * 包括用户中心，用户登录及注册
 */
class UserController extends HomeController {

	/* 用户中心首页 */
	public function index(){
        if(!is_login()){
            header('Location: ' . logistics_url(2,'login'));
        }
        $this->display();
	}

    public function account(){
        if(!is_login()){
            header('Location: ' . logistics_url(2,'login'));
        }
        if ( IS_POST ) {
            //获取参数
            $uid        =   is_login();
            $password   =   I('post.old');
            $repassword = I('post.repassword');
            $data['password'] = I('post.password');
            empty($password) && $this->error('请输入原密码');
            empty($data['password']) && $this->error('请输入新密码');
            empty($repassword) && $this->error('请输入确认密码');

            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }

            $Api = new UserApi();
            $res = $Api->updateInfo($uid, $password, $data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
        }else{
            $this->display();
        }
    }

	/* 注册页面 */
	public function register($username = '', $password = '', $repassword = '', $contact = '', $telephone = '', $wechat = '', $group = 2, $title = '', $address = '', $content = '', $category_id = 0, $cate_id = 0, $c_id = 0, $verify = ''){
        if(!C('USER_ALLOW_REGISTER')){
            $this->error('注册已关闭');
        }
		if(IS_POST){ //注册用户
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 检测密码 */
			if($password != $repassword){
				$this->error('密码和重复密码不一致！');
			}			

			/* 调用注册接口注册用户 */
            $User = new UserApi;
			$uid = $User->register($username, $password, '');
			if(0 < $uid){ //注册成功
				//
                $member = new MemberModel();
                $arr = array(
                    'nickname'  => $username,
                    'contact'   => $contact,
                    'telephone' => $telephone,
                    'wechat'    => $wechat,
                    'status'    => 1
                );
                $info = $member->create($arr);
                $info['uid'] = $uid;
                if($member->add($info)){
                    if(!in_array($group, array(2,3))){
                        $group = 2;
                    }
                    $group_obj = new AuthGroupModel();
                    if($group_obj->addToGroup($uid, $group)){
                        $core_arr = array(
                            'title' => $title,
                            'address' => $address,
                            'uid' => $uid,
                            'content' => $content,
                            'contact' => $telephone,
                            'category_id' => $category_id,
                            'cate_id' => $cate_id,
                            'c_id' => $c_id,
                            'type' => 2,
                            'model_id' => 2,
                            'status' => 0
                        );
                        $core = D('Document');
                        $res = $core->add($core_arr);
                        if($res){
                            $res_content = D('DocumentArticle')->add(array('id'=>$res,'content'=>htmlspecialchars($content)));
                            if(!$res_content){
                                $core->delete($res);
                            }
                        }
                    }
                    $this->success('注册成功！即将跳转登录页面', logistics_url(2, 'login'));
                }else{
                    $this->error($this->showRegError());
                }
			} else { //注册失败，显示错误信息
				$this->error($this->showRegError($uid));
			}

		} else { //显示注册表单
            //省份
            $province = getNextPca(0);
            $this->assign('province', $province);
			//生产厂家分类
            $cate = getNextCategory(6,0);
            $this->assign('cate', $cate);
            $this->display();
		}
	}

	/* 登录页面 */
	public function login($username = '', $password = '', $verify = ''){
        if(is_login()){
            header('Location: ' . logistics_url(2,'user'));
        }
		if(IS_POST){ //登录验证
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 调用UC登录接口登录 */
			$user = new UserApi;
			$uid = $user->login($username, $password);
			if(0 < $uid){ //UC登录成功
				/* 登录用户 */
				$Member = new MemberModel();;
				if($Member->login($uid)){ //登录用户
					$this->success('登录成功！',logistics_url(2, 'user'));
				} else {
					$this->error($Member->getError());
				}

			} else { //登录失败
				switch($uid) {
					case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
					case -2: $error = '密码错误！'; break;
					default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
				}
				$this->error($error);
			}

		} else { //显示登录表单
			$this->display();
		}
	}

	/* 退出登录 */
	public function logout(){
		if(is_login()){
			D('Member')->logout();
            header('Location: ' . logistics_url(2,'login'));
		} else {
            header('Location: ' . logistics_url(2,'login'));
		}
	}

	/* 验证码，用于登录和注册 */
	public function verify(){
		$verify = new \Think\Verify();
        $verify->setConfig('useCurve',false);
        $verify->setConfig('length',4);
		$verify->entry(1);
	}

	/**
	 * 获取用户注册错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0){
		switch ($code) {
			case -1:  $error = '用户名长度必须在3-30个字符以内！'; break;
			case -2:  $error = '用户名被禁止注册！'; break;
			case -3:  $error = '用户名被占用！'; break;
			case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
			case -5:  $error = '邮箱格式不正确！'; break;
			case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
			case -7:  $error = '邮箱被禁止注册！'; break;
			case -8:  $error = '邮箱被占用！'; break;
			case -9:  $error = '手机格式不正确！'; break;
			case -10: $error = '手机被禁止注册！'; break;
			case -11: $error = '手机号被占用！'; break;
			default:  $error = '未知错误,请稍后再试';
		}
		return $error;
	}

}
