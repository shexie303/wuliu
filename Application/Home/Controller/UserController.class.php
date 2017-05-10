<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
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
		
	}

	/* 注册页面 */
	public function register($username = '', $password = '', $repassword = '', $email = '', $verify = ''){
        if(!C('USER_ALLOW_REGISTER')){
            $this->error('注册已关闭');
        }
        if(is_login()){
            header('Location: ' . logistics_url(1, 'list-2'));
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
			$uid = $User->register($username, $password, $email);
			if(0 < $uid){ //注册成功
				//
                $member = new MemberModel();
                $info = $member->create(array('nickname' => $username, 'status' => 1));
                $info['uid'] = $uid;
                if($member->add($info)){
                    $group = new AuthGroupModel();
                    $group->addToGroup($uid, 2);
                    $this->success('注册成功！即将跳转登录页面', logistics_url(1, 'login'));
                }else{
                    $this->error($this->showRegError());
                }
			} else { //注册失败，显示错误信息
				$this->error($this->showRegError($uid));
			}

		} else { //显示注册表单
			$this->display();
		}
	}

	/* 登录页面 */
	public function login($username = '', $password = '', $verify = ''){
        if(is_login()){
            header('Location: ' . $_SERVER['HTTP_REFERER']);
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
				$Member = D('Member');
				if($Member->login($uid)){ //登录用户
					$this->success('登录成功！',$_SERVER['HTTP_REFERER']);
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
            $refer = $_SERVER['HTTP_REFERER'] ? $_SERVER['HTTP_REFERER'] : logistics_url(1, 'list-2');
            $this->assign('refer', $refer);
			$this->display();
		}
	}

	/* 退出登录 */
	public function logout(){
		if(is_login()){
			D('Member')->logout();
		}
        $_SERVER['HTTP_REFERER'] ? $refer = $_SERVER['HTTP_REFERER'] : $refer = logistics_url(1, 'login');
        header('Location: ' . $refer);
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


    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function profile(){
		if ( !is_login() ) {
			$this->error( '您还没有登陆',U('User/login') );
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

}
