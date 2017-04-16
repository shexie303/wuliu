<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;
use User\Api\UserApi;

/**
 * 用户模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class MemberModel extends Model {

    protected $_validate = array(
        array('nickname', '3,30', '昵称长度为3-30个字符', self::EXISTS_VALIDATE, 'length'),
        array('nickname', '', '昵称被占用', self::EXISTS_VALIDATE, 'unique'), //用户名被占用
        array('contact', 'require', '联系人不能为空', self::EXISTS_VALIDATE, 'regex'),
        array('telephone', '/^1[3|4|5|7|8][0-9]\d{8}$/', '手机号格式不正确', self::MUST_VALIDATE, 'regex'),
    );

    public function lists($status = 1, $order = 'uid DESC', $field = true){
        $map = array('status' => $status);
        return $this->field($field)->where($map)->order($order)->select();
    }

    /**
     * 登录指定用户
     * @param  integer $uid 用户ID
     * @return boolean      ture-登录成功，false-登录失败
     */
    public function login($uid){
        /* 检测是否在当前应用注册 */
        $user = $this->field(true)->find($uid);
        if(!$user || 1 != $user['status']) {
            $this->error = '用户不存在或已被禁用！'; //应用级别禁用
            return false;
        }

        //记录行为
        action_log('user_login', 'member', $uid, $uid);

        /* 登录用户 */
        $this->autoLogin($user);
        return $user;
    }

    /**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
    }

    /**
     * 自动登录用户
     * @param  integer $user 用户信息数组
     */
    private function autoLogin($user){
        /* 更新登录信息 */
        $data = array(
            'uid'             => $user['uid'],
            'login'           => array('exp', '`login`+1'),
            'last_login_time' => NOW_TIME,
            'last_login_ip'   => get_client_ip(1),
        );
        $this->save($data);
        $group = D('AuthGroup')->getUserGroup($user['uid']);

        /* 记录登录SESSION和COOKIES */
        $auth = array(
            'uid'             => $user['uid'],
            'username'        => $user['nickname'],
            'group_id'        => $group[0]['group_id'],
            'vip'             => $user['vip'],
            'last_login_time' => $user['last_login_time'],
        );

        session('user_auth', $auth);
        session('user_auth_sign', data_auth_sign($auth));

    }

    public function getNickName($uid){
        return $this->where(array('uid'=>(int)$uid))->getField('nickname');
    }

    public function getUserInfo($uid){
        return $this->find($uid);
    }

    public function update(){
        if(!empty($_POST['password'])){
            $pass = array('password' => $_POST['password']);
            $Api    =   new UserApi();
            $res    =   $Api->updateInfo($_POST['uid'], '', $pass);
            if(!$res['status']){
                return false;
            }
        }
        unset($_POST['password']);
        $data = $this->create($_POST);
        if(empty($data)){
            return false;
        }
        $status = $this->save(); //更新基础内容
        if(false === $status){
            $this->error = '完善资料出错！';
            return false;
        }
        return $data;
    }

    /**
     * 更新到期会员状态
     */
    public function updateOverdueVip(){
        $where = array(
            'vip' => array('gt',0),
            'vip_end' => array('lt', time()),
        );
        $data = array(
            'vip' => 0,
            'vip_start' => 0,
            'vip_end' => 0
        );
        $this->where($where)->save($data);
    }

}
