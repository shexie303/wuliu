<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Image;
use Think\Image\Driver\Gd;

/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class FileController extends AdminController {

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
        if(!in_array($save_path, array('cover','id_card','driver_license','license','ad_img'))){
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
            if($save_path == 'cover'){
                /*添加水印开始*/
                $image = new \Think\Image();
                $thumb_file = $info['imgFile']['path'];
                $image->open('.'.$thumb_file)->water('.'.C('TMPL_PARSE_STRING.__STATIC__').'/images/water.png',\Think\Image::IMAGE_WATER_SOUTHEAST)->save('.'.$thumb_file);
                /*添加水印结束*/
            }
            if($save_path == 'ad_img'){
                $size = getimagesize('.'.$info['imgFile']['path']);
                if($size[0]/$size[1] != 6){
                    $return['error'] = 1;
                    $return['message']   = '请上传宽高比例为6:1的图片';
                    /* 返回JSON数据 */
                    exit(json_encode($return));
                }
            }
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
