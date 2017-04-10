<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台用户控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class UserController extends AdminController {

    /**
     * 用户管理首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        //更新到期会员状态
        D('Member')->updateOverdueVip();
        if(GROUP_ID == 2){
            header('Location: ' . U('User/recharge'));
        }
        $nickname       =   I('nickname');
        $map['status']  =   array('egt',0);
        if(is_numeric($nickname)){
            $map['uid|nickname']=   array(intval($nickname),array('like','%'.$nickname.'%'),'_multi'=>true);
        }else{
            $map['nickname']    =   array('like', '%'.(string)$nickname.'%');
        }

        $list   = $this->lists('Member', $map);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        $this->assign('_list', $list);
        $this->assign('_now', time());
        $this->meta_title = '用户信息';
        $this->display();
    }

//    /**
//     * 修改昵称初始化
//     * @author huajie <banhuajie@163.com>
//     */
//    public function updateNickname(){
//        $nickname = M('Member')->getFieldByUid(UID, 'nickname');
//        $this->assign('nickname', $nickname);
//        $this->meta_title = '修改昵称';
//        $this->display();
//    }
//
//    /**
//     * 修改昵称提交
//     * @author huajie <banhuajie@163.com>
//     */
//    public function submitNickname(){
//        //获取参数
//        $nickname = I('post.nickname');
//        $password = I('post.password');
//        empty($nickname) && $this->error('请输入昵称');
//        empty($password) && $this->error('请输入密码');
//
//        //密码验证
//        $User   =   new UserApi();
//        $uid    =   $User->login(UID, $password, 4);
//        ($uid == -2) && $this->error('密码不正确');
//
//        $Member =   D('Member');
//        $data   =   $Member->create(array('nickname'=>$nickname));
//        if(!$data){
//            $this->error($Member->getError());
//        }
//
//        $res = $Member->where(array('uid'=>$uid))->save($data);
//
//        if($res){
//            $user               =   session('user_auth');
//            $user['username']   =   $data['nickname'];
//            session('user_auth', $user);
//            session('user_auth_sign', data_auth_sign($user));
//            $this->success('修改昵称成功！');
//        }else{
//            $this->error('修改昵称失败！');
//        }
//    }

    /**
     * 会员充值
     */
    public function recharge(){
        if(IS_POST){
            $user = session('user_auth');
            $data['vip'] = I('post.vip', 0);
            if(!in_array($data['vip'], array(1,2,3))){
                $this->error('vip参数错误');
            }
            if($user['vip'] > $data['vip']){
                $this->error('当前会员级别高于所选会员级别');
            }
            if(!UID){
                $this->error('用户不存在');
            }
            $data['uid'] = UID;
            $data['vip_start'] = strtotime(time_format(time(), 'Y-m-d'));
            if($data['vip'] == 1){
                //试用期会员默认为3个月
                $order_number = random(32, 1);
                $month = 3;
                $type = 0;
                $money = 0;
            }else{
                $month = I('post.month', 0);
                if(!in_array($month, array(6,12))){
                    $this->error('月份参数错误');
                }
                $order_number = I('order_number','');
                if(!$order_number){
                    $this->error('抱歉,请您先支付');
                }
                //todo 验证订单号的有效性
                $type = 2;
                $money = C('MEMBER_VIP_MONEY.'.$data['vip']) * $month / 12;
            }
            $data['vip_end'] = strtotime('+'.$month.' month', $data['vip_start']);

            $pay_log = array(
                'order_number' => $order_number,
                'uid' => UID,
                'type' => $type,
                'money' => $money,
                'month' => $month,
                'create_time' => time()
            );
            $log_id = M('PayLog')->add($pay_log);
            if($log_id){
                if(false === M('Member')->save($data)){
                    M('PayLog')->delete($log_id);
                    $this->error('操作失败！请稍后再试');
                }else{
                    $user['vip'] = $data['vip'];
                    session('user_auth', $user);
                    session('user_auth_sign', data_auth_sign($user));
                    $this->success('恭喜您，操作成功');
                }
            }else{
                $this->error('操作失败！请稍后再试');
            }

        }else{
            $user = D('Member')->getUserInfo(UID);
            $this->assign('user',$user);
            M('PayLog')->delete(1);
            $this->meta_title = '会员充值';
            $this->display();
        }
    }

    /**
     * 完善个人信息
     */
    public function info(){
        if(GROUP_ID == 2){
            $id = UID;
        }else{
            $id = I('get.id', 0);
            if(!$id){
                $id = UID;
            }
        }
        if(IS_AJAX && IS_POST){
            $res = D('Member')->update();
            if(!$res){
                $this->error(D('Member')->getError());
            }else{
                $this->success('资料已完善！',Cookie('__forward__'));
            }
        }else{
            $info = D('Member')->getUserInfo($id);
            $this->assign('data', $info);
            $this->meta_title = '完善资料';
            $this->display();
        }
    }
    /**
     * 修改密码初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updatePassword(){
        $this->meta_title = '修改密码';
        $this->display();
    }

    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitPassword(){
        //获取参数
        $password   =   I('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = I('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = I('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api    =   new UserApi();
        $res    =   $Api->updateInfo(UID, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }

    /**
     * 用户行为列表
     * @author huajie <banhuajie@163.com>
     */
    public function action(){
        //获取列表数据
        $Action =   M('Action')->where(array('status'=>array('gt',-1)));
        $list   =   $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     * @author huajie <banhuajie@163.com>
     */
    public function addAction(){
        $this->meta_title = '新增行为';
        $this->assign('data',null);
        $this->display('editaction');
    }

    /**
     * 编辑行为
     * @author huajie <banhuajie@163.com>
     */
    public function editAction(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑行为';
        $this->display();
    }

    /**
     * 更新行为
     * @author huajie <banhuajie@163.com>
     */
    public function saveAction(){
        $res = D('Action')->update();
        if(!$res){
            $this->error(D('Action')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 会员状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        $id = array_unique((array)I('id',0));
        if( in_array(C('USER_ADMINISTRATOR'), $id)){
            $this->error("不允许对超级管理员执行该操作!");
        }
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map['uid'] =   array('in',$id);
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('Member', $map );
                break;
            case 'resumeuser':
                $this->resume('Member', $map );
                break;
            case 'deleteuser':
                $this->delete('Member', $map );
                break;
            default:
                $this->error('参数非法');
        }
    }

    public function add($username = '', $password = '', $repassword = '', $email = '', $group = ''){
        if(IS_POST){
            if(!in_array($group, array(1,2))){
                $this->error('用户组不存在！');
            }
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User   =   new UserApi;
            $uid    =   $User->register($username, $password, $email);
            if(0 < $uid){ //注册成功
                $user = array('uid' => $uid, 'nickname' => $username, 'status' => 1);
                if(!M('Member')->add($user)){
                    $this->error('用户添加失败！');
                } else {
                    if(!D('AuthGroup')->addToGroup($uid, $group)){
                        $this->error('用户添加失败！请稍后再试');

                    }
                    $this->success('用户添加成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        } else {
            $this->meta_title = '新增用户';
            $this->display();
        }
    }

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在3-30个字符之间！'; break;
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
            default:  $error = '未知错误';
        }
        return $error;
    }

}
