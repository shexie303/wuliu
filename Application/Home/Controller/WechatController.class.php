<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class WechatController extends Controller {

    /* 文档模型频道页 */
	public function index(){
        include_once dirname(__FILE__)."/Wechat/wxBizMsgCrypt.php";
// 第三方发送消息给公众平台
        $encodingAesKey = "kR2BvaMx2FASjAvnILB90QlICMrFOAgFhEbFD9DmRUn";
        $token = "shexie303";
        $timeStamp = $_GET['timestamp'];
        $nonce = $_GET["nonce"];
        $appId = "wx6a7d132784390325";
        $text = "
            <xml>
                <ToUserName><![CDATA[oia2Tj我是中文jewbmiOUlr6X-1crbLOvLw]]></ToUserName>
                <FromUserName><![CDATA[gh_7f083739789a]]></FromUserName>
                <CreateTime>1407743423</CreateTime>
                <MsgType><![CDATA[video]]></MsgType>
                <Video>
                    <MediaId><![CDATA[eYJ1MbwPRJtOvIEabaxHs7TX2D-HV71s79GUxqdUkjm6Gs2Ed1KF3ulAOA9H1xG0]]></MediaId>
                    <Title><![CDATA[testCallBackReplyVideo]]></Title>
                    <Description><![CDATA[testCallBackReplyVideo]]></Description>
                </Video>
            </xml>";
        $AppSecret = 'a326758dc37435de4c6602197555f052';

        $pc = new \WXBizMsgCrypt($token, $encodingAesKey, $appId);

        $encryptMsg = $_GET['echostr'];
        $errCode = $pc->encryptMsg($text, $timeStamp, $nonce, $encryptMsg);
        if ($errCode == 0) {
            print("加密后: " . $encryptMsg . "\n");
        } else {
            print($errCode . "\n");
        }

        $xml_tree = new \DOMDocument();
        $xml_tree->loadXML($encryptMsg);
        $array_e = $xml_tree->getElementsByTagName('Encrypt');
        $array_s = $xml_tree->getElementsByTagName('MsgSignature');
        $encrypt = $array_e->item(0)->nodeValue;
        $msg_sign = $array_s->item(0)->nodeValue;

        $format = "<xml><ToUserName><![CDATA[toUser]]></ToUserName><Encrypt><![CDATA[%s]]></Encrypt></xml>";
        $from_xml = sprintf($format, $encrypt);

        // 第三方收到公众号平台发送的消息
        $msg = '';
        $errCode = $pc->decryptMsg($msg_sign, $timeStamp, $nonce, $from_xml, $msg);
        if ($errCode == 0) {
            print("解密后: " . $msg . "\n");
        } else {
            print($errCode . "\n");
        }
	}
}
