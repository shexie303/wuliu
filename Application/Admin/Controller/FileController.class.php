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
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class FileController extends AdminController {

    /* 文件上传 */
    public function upload(){
		$return  = array('status' => 1, 'info' => '上传成功', 'data' => '');
		/* 调用文件上传组件上传文件 */
		$File = D('File');
		$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
		$info = $File->upload(
			$_FILES,
			C('DOWNLOAD_UPLOAD'),
			C('DOWNLOAD_UPLOAD_DRIVER'),
			C("UPLOAD_{$file_driver}_CONFIG")
		);

        /* 记录附件信息 */
        if($info){
            $return['data'] = think_encrypt(json_encode($info['download']));
            $return['info'] = $info['download']['name'];
        } else {
            $return['status'] = 0;
            $return['info']   = $File->getError();
        }

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    /* 下载文件 */
    public function download($id = null){
        if(empty($id) || !is_numeric($id)){
            $this->error('参数错误！');
        }

        $logic = D('Download', 'Logic');
        if(!$logic->download($id)){
            $this->error($logic->getError());
        }

    }

    /**
     * 上传图片
     * @param  string $save_path  上传文件保存路径
     * @author huajie <banhuajie@163.com>
     */
    public function uploadPicture($save_path = ''){

        if(!is_login()){
            $return['error'] = 1;
            $return['message'] = '请登录后再上传';
            exit(json_encode($return));
        }
        if(!in_array($save_path, array('cover'))){
            $return['error'] = 1;
            $return['message'] = '非法路径,请联系管理员';
            exit(json_encode($return));
        }
        /* 调用文件上传组件上传文件 */
        $Picture = D('Picture');
        $pic_driver = C('PICTURE_UPLOAD_DRIVER');
        $info = $Picture->upload(
            $_FILES,
            C('PICTURE_UPLOAD'),
            C('PICTURE_UPLOAD_DRIVER'),
            $save_path . '/',
            C("UPLOAD_{$pic_driver}_CONFIG")
        );
        //TODO:上传到远程服务器
        /* 记录图片信息 */
        if($info){
            $return['error'] = 0;
            $return['cover_id'] = $info['imgFile']['id'];
            $return['url'] = $info['imgFile']['path'];
        } else {
            $return['error'] = 1;
            $return['message']   = $Picture->getError();
        }

        /* 返回JSON数据 */
        exit(json_encode($return));
    }
}
